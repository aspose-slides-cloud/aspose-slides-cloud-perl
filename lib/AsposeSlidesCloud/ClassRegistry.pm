=begin comment

Copyright (c) 2019 Aspose Pty Ltd

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

=end comment

=cut
package AsposeSlidesCloud::ClassRegistry;

use strict;
use warnings;
use utf8;

use JSON;
use Scalar::Util;

my %hierarchy = (
    'AddLayoutSlide' => 'Task',
    'AddMasterSlide' => 'Task',
    'AddShape' => 'Task',
    'AddSlide' => 'Task',
    'Base64InputFile' => 'InputFile',
    'BubbleSeries' => 'Series',
    'ColorScheme' => 'ResourceBase',
    'Document' => 'ResourceBase',
    'DocumentProperties' => 'ResourceBase',
    'DocumentProperty' => 'ResourceBase',
    'FileVersion' => 'StorageFile',
    'FontScheme' => 'ResourceBase',
    'FormatScheme' => 'ResourceBase',
    'GradientFill' => 'FillFormat',
    'HeaderFooter' => 'ResourceBase',
    'HtmlExportOptions' => 'ExportOptions',
    'Image' => 'ResourceBase',
    'ImageExportOptions' => 'ExportOptions',
    'Images' => 'ResourceBase',
    'LayoutSlide' => 'ResourceBase',
    'LayoutSlides' => 'ResourceBase',
    'MasterSlide' => 'ResourceBase',
    'MasterSlides' => 'ResourceBase',
    'Merge' => 'Task',
    'NoFill' => 'FillFormat',
    'NotesSlide' => 'ResourceBase',
    'NotesSlideHeaderFooter' => 'ResourceBase',
    'OneValueChartDataPoint' => 'DataPoint',
    'OneValueSeries' => 'Series',
    'Paragraph' => 'ResourceBase',
    'Paragraphs' => 'ResourceBase',
    'PathInputFile' => 'InputFile',
    'PathOutputFile' => 'OutputFile',
    'PatternFill' => 'FillFormat',
    'PdfExportOptions' => 'ExportOptions',
    'PictureFill' => 'FillFormat',
    'Placeholder' => 'ResourceBase',
    'Placeholders' => 'ResourceBase',
    'Portion' => 'ResourceBase',
    'Portions' => 'ResourceBase',
    'PptxExportOptions' => 'ExportOptions',
    'ProtectionProperties' => 'ResourceBase',
    'RemoveShape' => 'Task',
    'RemoveSlide' => 'Task',
    'ReorderSlide' => 'Task',
    'ReplaceText' => 'Task',
    'RequestInputFile' => 'InputFile',
    'ResetSlide' => 'Task',
    'ResponseOutputFile' => 'OutputFile',
    'Save' => 'Task',
    'SaveShape' => 'Task',
    'SaveSlide' => 'Task',
    'ScatterChartDataPoint' => 'DataPoint',
    'ScatterSeries' => 'Series',
    'Section' => 'ResourceBase',
    'Sections' => 'ResourceBase',
    'ShapeBase' => 'ResourceBase',
    'Shapes' => 'ResourceBase',
    'Slide' => 'ResourceBase',
    'SlideAnimation' => 'ResourceBase',
    'SlideBackground' => 'ResourceBase',
    'SlideComments' => 'ResourceBase',
    'SlideProperties' => 'ResourceBase',
    'Slides' => 'ResourceBase',
    'SolidFill' => 'FillFormat',
    'SplitDocumentResult' => 'ResourceBase',
    'SvgExportOptions' => 'ExportOptions',
    'SwfExportOptions' => 'ExportOptions',
    'TextItems' => 'ResourceBase',
    'Theme' => 'ResourceBase',
    'TiffExportOptions' => 'ExportOptions',
    'UpdateBackground' => 'Task',
    'UpdateShape' => 'Task',
    'ViewProperties' => 'ResourceBase',
    'XpsExportOptions' => 'ExportOptions',
    'BoxAndWhiskerSeries' => 'OneValueSeries',
    'BubbleChartDataPoint' => 'ScatterChartDataPoint',
    'Chart' => 'ShapeBase',
    'DocumentReplaceResult' => 'Document',
    'GeometryShape' => 'ShapeBase',
    'GraphicalObject' => 'ShapeBase',
    'GroupShape' => 'ShapeBase',
    'OleObjectFrame' => 'ShapeBase',
    'SlideReplaceResult' => 'Slide',
    'SmartArt' => 'ShapeBase',
    'Table' => 'ShapeBase',
    'WaterfallChartDataPoint' => 'OneValueChartDataPoint',
    'WaterfallSeries' => 'OneValueSeries',
    'AudioFrame' => 'GeometryShape',
    'Connector' => 'GeometryShape',
    'PictureFrame' => 'GeometryShape',
    'Shape' => 'GeometryShape',
    'SmartArtShape' => 'GeometryShape',
    'VideoFrame' => 'GeometryShape',
    
);

my %determiners = (
    'ApiInfo' => {  },
    'ArrowHeadProperties' => {  },
    'Axes' => {  },
    'Axis' => {  },
    'BlurEffect' => {  },
    'ChartCategory' => {  },
    'ChartTitle' => {  },
    'ChartWall' => {  },
    'CommonSlideViewProperties' => {  },
    'CustomDashPattern' => {  },
    'DataPoint' => {  },
    'DiscUsage' => {  },
    'Effect' => {  },
    'EffectFormat' => {  },
    'EntityExists' => {  },
    'Error' => {  },
    'ErrorDetails' => {  },
    'ExportFormat' => {  },
    'ExportOptions' => {  },
    'FileVersions' => {  },
    'FilesList' => {  },
    'FilesUploadResult' => {  },
    'FillFormat' => {  },
    'FillOverlayEffect' => {  },
    'FontSet' => {  },
    'GlowEffect' => {  },
    'GradientFillStop' => {  },
    'IShapeExportOptions' => {  },
    'ImageExportFormat' => {  },
    'InnerShadowEffect' => {  },
    'Input' => {  },
    'InputFile' => {  },
    'InteractiveSequence' => {  },
    'Legend' => {  },
    'LineFormat' => {  },
    'MergingSource' => {  },
    'NormalViewRestoredProperties' => {  },
    'NotesSlideExportFormat' => {  },
    'ObjectExist' => {  },
    'OrderedMergeRequest' => {  },
    'OuterShadowEffect' => {  },
    'OutputFile' => {  },
    'Pipeline' => {  },
    'PlotArea' => {  },
    'PresentationToMerge' => {  },
    'PresentationsMergeRequest' => {  },
    'PresetShadowEffect' => {  },
    'ReflectionEffect' => {  },
    'ResourceBase' => {  },
    'ResourceUri' => {  },
    'Series' => {  },
    'SeriesMarker' => {  },
    'ShapeExportFormat' => {  },
    'ShapeImageExportOptions' => {  },
    'ShapeThumbnailBounds' => {  },
    'ShapesAlignmentType' => {  },
    'SlideComment' => {  },
    'SlideExportFormat' => {  },
    'SmartArtNode' => {  },
    'SoftEdgeEffect' => {  },
    'StorageExist' => {  },
    'StorageFile' => {  },
    'TableCell' => {  },
    'TableColumn' => {  },
    'TableRow' => {  },
    'Task' => {  },
    'TextItem' => {  },
    'AddLayoutSlide' => { 'Type' => 'AddLayoutSlide', },
    'AddMasterSlide' => { 'Type' => 'AddMasterSlide', },
    'AddShape' => { 'Type' => 'AddShape', },
    'AddSlide' => { 'Type' => 'AddSlide', },
    'Base64InputFile' => { 'Type' => 'Base64', },
    'BubbleSeries' => { 'DataPointType' => 'Bubble', },
    'ColorScheme' => {  },
    'Document' => {  },
    'DocumentProperties' => {  },
    'DocumentProperty' => {  },
    'FileVersion' => {  },
    'FontScheme' => {  },
    'FormatScheme' => {  },
    'GradientFill' => { 'Type' => 'Gradient', },
    'HeaderFooter' => {  },
    'HtmlExportOptions' => { 'Format' => 'html', },
    'Image' => {  },
    'ImageExportOptions' => { 'Format' => 'image', },
    'Images' => {  },
    'LayoutSlide' => {  },
    'LayoutSlides' => {  },
    'MasterSlide' => {  },
    'MasterSlides' => {  },
    'Merge' => { 'Type' => 'Merge', },
    'NoFill' => { 'Type' => 'NoFill', },
    'NotesSlide' => {  },
    'NotesSlideHeaderFooter' => {  },
    'OneValueChartDataPoint' => {  },
    'OneValueSeries' => { 'DataPointType' => 'OneValue', },
    'Paragraph' => {  },
    'Paragraphs' => {  },
    'PathInputFile' => { 'Type' => 'Path', },
    'PathOutputFile' => { 'Type' => 'Path', },
    'PatternFill' => { 'Type' => 'Pattern', },
    'PdfExportOptions' => { 'Format' => 'pdf', },
    'PictureFill' => { 'Type' => 'Picture', },
    'Placeholder' => {  },
    'Placeholders' => {  },
    'Portion' => {  },
    'Portions' => {  },
    'PptxExportOptions' => { 'Format' => 'pptx', },
    'ProtectionProperties' => {  },
    'RemoveShape' => { 'Type' => 'RemoveShape', },
    'RemoveSlide' => { 'Type' => 'RemoveSlide', },
    'ReorderSlide' => { 'Type' => 'ReoderSlide', },
    'ReplaceText' => { 'Type' => 'ReplaceText', },
    'RequestInputFile' => { 'Type' => 'Request', },
    'ResetSlide' => { 'Type' => 'ResetSlide', },
    'ResponseOutputFile' => { 'Type' => 'Response', },
    'Save' => { 'Type' => 'Save', },
    'SaveShape' => { 'Type' => 'SaveShape', },
    'SaveSlide' => { 'Type' => 'SaveSlide', },
    'ScatterChartDataPoint' => {  },
    'ScatterSeries' => { 'DataPointType' => 'Scatter', },
    'Section' => {  },
    'Sections' => {  },
    'ShapeBase' => {  },
    'Shapes' => {  },
    'Slide' => {  },
    'SlideAnimation' => {  },
    'SlideBackground' => {  },
    'SlideComments' => {  },
    'SlideProperties' => {  },
    'Slides' => {  },
    'SolidFill' => { 'Type' => 'Solid', },
    'SplitDocumentResult' => {  },
    'SvgExportOptions' => { 'Format' => 'svg', },
    'SwfExportOptions' => { 'Format' => 'swf', },
    'TextItems' => {  },
    'Theme' => {  },
    'TiffExportOptions' => { 'Format' => 'tiff', },
    'UpdateBackground' => { 'Type' => 'UpdateBackground', },
    'UpdateShape' => { 'Type' => 'UpdateShape', },
    'ViewProperties' => {  },
    'XpsExportOptions' => { 'Format' => 'xps', },
    'BoxAndWhiskerSeries' => { 'DataPointType' => 'OneValue', },
    'BubbleChartDataPoint' => {  },
    'Chart' => { 'Type' => 'Chart', },
    'DocumentReplaceResult' => {  },
    'GeometryShape' => {  },
    'GraphicalObject' => { 'Type' => 'GraphicalObject', },
    'GroupShape' => { 'Type' => 'GroupShape', },
    'OleObjectFrame' => { 'Type' => 'OleObjectFrame', },
    'SlideReplaceResult' => {  },
    'SmartArt' => { 'Type' => 'SmartArt', },
    'Table' => { 'Type' => 'Table', },
    'WaterfallChartDataPoint' => {  },
    'WaterfallSeries' => { 'DataPointType' => 'OneValue', },
    'AudioFrame' => { 'Type' => 'AudioFrame', },
    'Connector' => { 'Type' => 'Connector', },
    'PictureFrame' => { 'Type' => 'PictureFrame', },
    'Shape' => { 'Type' => 'Shape', },
    'SmartArtShape' => { 'Type' => 'SmartArtShape', },
    'VideoFrame' => { 'Type' => 'VideoFrame', },
);

sub get_class_name {
    my ($self, $name, $data) = @_;
    my $descendant = $self->get_subclass_name($name, $data);
    if ($descendant) {
        return $descendant;
    }
    return $name;
}

sub get_subclass_name {
    my ($self, $name, $data) = @_;
    for(keys %hierarchy) {
        if ($hierarchy{$_} eq $name) {
            my $descendant = $self->get_subclass_name($_, $data);
            if ($descendant) {
                return $descendant;
            }
            if ($self->is_instance_of($_, $data)) {
                return $_;
            }
        }
    }
    return "";
}

sub is_instance_of {
    my ($self, $name, $data) = @_;
    if (!exists $determiners{$name} || !keys %{$determiners{$name}}) {
        return 0;
    }
    my $data_decoded = decode_json($data);
    for(keys %{$determiners{$name}}) {
        if (!$self->value_exists($_, ${$determiners{$name}}{$_}, $data_decoded)) {
            return 0;
        }
    }
    return 1;
}

sub value_exists {
    my ($self, $key, $value, $data) = @_;
    if (%$data{$key} && %$data{$key} eq $value) {
        return 1;
    }
    my $lckey = lcfirst($key);
    if (%$data{$lckey} && %$data{$lckey} eq $value) {
        return 1;
    }
    my $uckey = ucfirst($key);
    if (%$data{$uckey} && %$data{$uckey} eq $value) {
        return 1;
    }
    return 0;
}

1;
