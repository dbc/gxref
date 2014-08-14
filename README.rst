=====
gxref
=====

gxref updates off-sheet cross references in gEDA gschem schematics.

When a design consists of multiple schematic sheets, it is desirable
that signals which cross pages be cross-referenced to the other sheets
where they appear.  This script automates updating these cross-
references.

Requirements:

- gxref expects to find one 'sheetnum' attribute on each sheet. 
  It will complain if it finds none on a sheet, but will 
  silently ignore redundant 'sheetnum' attributes.
- 'sheetnum' attributes must start with 1, and be contiguous and
  non-overlapping.  While somewhat over-restrictive, this
  is a robust sanity check.
- gxref expects to find component instances that serve as
  off-page connectors.  If a component has both a 'net'
  attribute and an 'xref' attribute, gxref will assume it
  is an off-page connector.  There are no other requirements
  for the component.

Results:

- gxref updates the 'xref' attribute for all components that
  it identifies as off-page connectors, using the associated
  'net' attribute to build the dictionary.
- If a 'numsheets' attribute is encountered on any sheet, it
  will be updated to the maximum sheetnum. 

Typical usage: ::

    gxref *.sch

Notes:

- All of the sheets must be processed in a single invocation
  of gxref, since the cross-reference dictionary is not permanent.
- gxref creates a backup of the old .sch file as &lt;samename&gt;.sch~
  to guard against file corruption.
- See the 'symbols' directory for some example off-page
  connector symbols.  Any symbol with both an 'xref' and
  a 'net' will work, so it is easy to make your own.
  There is also an example title block with 'sheetnum' and
  'numsheets' attributes.
- gxref is unaware of hierarchy and has not been tested
  on hierarchical schematics.  The result would very likely 
  be amusing.

