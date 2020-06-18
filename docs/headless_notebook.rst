Segment OMERO data using Fiji run headlessly in notebook
========================================================

Description
-----------

The following examples follow up on the script shown in :doc:`threshold_scripting`.
But, unlike in :doc:`threshold_scripting`, here, Fiji is included into a `Docker <https://www.docker.com/>`_ image and run in headless mode.
The scripts are embedded into a Jupyter Notebook. The Groovy language is used, which is very similar to Java and can be used in Fiji scripting. 

The first script shows:

- How to run a Fiji macro attached to an OMERO Dataset.
- How to save ROIs.
- How to save the Results back to the OMERO server.

The second script shows:

- How to crop an image in OMERO using Fiji cropping functionality.
- How to save the cropped image as OME-TIFF.
- How to import the OME-TIFF image into OMERO.


Setup
-----
Fiji has been installed in a Docker image using `repo2docker <https://repo2docker.readthedocs.io/>`_.


Resources
---------


-  Data: Samples images from the Image Data Resource (IDR) `idr0021 <https://idr.openmicroscopy.org/webclient/?show=project-51>`_
-  Macro: :download:`fiji-macro-segment.ijm <../scripts/fiji-macro-segment.ijm>`

Step-by-Step
------------

**Example 1: ROIs and measurement creation**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#.  Create a Fiji macro, for example by recording it and save it locally. You can for example use adjusted macro created in :doc:`threshold_manual`. See :download:`fiji-macro-segment.ijm <../scripts/fiji-macro-segment.ijm>`.

    **Note:** commands which can be run and recorded in the Fiji user interface *cannot** all be run in the Fiji in headless mode. 

#.  In your browser, go to the server address provided.

#.  Log in using the credentials provided.

#.  Make sure you are selecting your own data. Select the Dataset **A-Fiji-dataset**.

#.  Open the *Attachments* harmonica in the right-hand panel and click on the plus icon. Browse and attach the :download:`fiji-macro-segment.ijm <../scripts/fiji-macro-segment.ijm>` to this Dataset as File Annotation.

#.  Go to `analysis-training <https://idr-analysis.openmicroscopy.org/training>`_ or `run on mybinder.org <https://mybinder.org/v2/gh/ome/omero-guide-fiji/master?filepath=notebooks>`_

#.  Look under *Notebooks > Fiji* for *run_attached_macro.ipynb*.

#.  Select the first Step and click on the Run button to execute each step in turn.

#.  For the connection to OMERO, you will be asked to enter your login details when running the first cell under *Description*. Note that the connection itself happens only in the next cell, highlighted as *Connect to OMERO*.

#.  In the following cell, you will be asked to enter the ID of the Dataset onto which you attached the Macro file above.

#.  The code in the next cell is fetching the attachments on the Dataset and offering a dropdown menu for you to select a suitable attachment i.e. your attached macro.

#.  The next cell is asking for input about the types of data which should be saved back to OMERO (ROIs, Results or Images). This is of course dependent on the type of results your Macro is producing in Fiji. For this example, we select ROIs and Results.

#.  The script in the next cell will process all the Images in the specified Dataset, applying threshold, analyzing particles, i.e. steps which are captured inside your macro file. Further, it will save ROIs back in OMERO and create a CSV to be attached to each image in that Dataset in OMERO.

#.  Return to OMERO.web and open an Image from this Dataset in OMERO.iviewer.

#.  Click the *ROIs* tab to see the added ROIs.

#.  In the *Settings* tab, turning channels on/off will also show/hide
    ROIs assigned to those channels.

#.  Open the image in OMERO.figure for a quick publication by going to
    the *Info* tab in OMERO.iviewer and clicking on OMERO.figure in the Open with
    line.\ |image1|

#.  Click the *ROIs* tab to see the added ROIs. Note that the ROIs have
    been assigned a Channel index to indicate which Channel they were
    derived from.

#.  In the *Settings* tab, turning channels on/off will also show/hide ROIs
    assigned to those channels.

**Example 2: Cropping and import**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#.  Look under *Notebooks > Fiji* for *crop_image.ipynb*.

#.  Run through the notebook, logging in as previously and indicating the Image ID of the image you want to crop.

#.  In OMERO.web, refresh and note that the cropped image has been imported into a newly created Dataset *Cropped image*.

.. |image1| image:: images/threshold_script2.png
   :width: 1.89583in
   :height: 0.36458in
