﻿```   ____     ____     _____       ______     ______      ____     __     __    / ___)   / __ \   (_   _)     (_  __ \   (_   _ \    / __ \   (_ \   / _)  / /      / /  \ \    | |         ) ) \ \    ) (_) )  / /  \ \    \ \_/ /   ( (      ( ()  () )   | |        ( (   ) )   \   _/  ( ()  () )    \   /    ( (      ( ()  () )   | |   __    ) )  ) )   /  _ \  ( ()  () )    / _ \     \ \___   \ \__/ /  __| |___) )  / /__/ /   _) (_) )  \ \__/ /   _/ / \ \_    \____)   \____/   \________/  (______/   (______/    \____/   (__/   \__) ```Copyright Since 2005 ColdBox Platform by Luis Majano and Ortus Solutions, Corpwww.coldbox.org | www.ortussolutions.com----Because of God's grace, this project exists. If you don't like this, then don't read it, its not for you.>"Therefore being justified by faith, we have peace with God through our Lord Jesus Christ:By whom also we have access by faith into this grace wherein we stand, and rejoice in hope of the glory of God.And not only so, but we glory in tribulations also: knowing that tribulation worketh patience;And patience, experience; and experience, hope:And hope maketh not ashamed; because the love of God is shed abroad in our hearts by the Holy Ghost which is given unto us. ." Romans 5:5----# Welcome to ColdBoxColdBox is a conventions modular MVC development platform for ColdFusion (CFML).## LicenseApache License, Version 2.0.>The ColdBox Websites, logo and content have a separate license and they are a separate entity.## VersioningColdBox is maintained under the Semantic Versioning guidelines as much as possible.Releases will be numbered with the following format:```<major>.<minor>.<patch>```And constructed with the following guidelines:* Breaking backward compatibility bumps the major (and resets the minor and patch)* New additions without breaking backward compatibility bumps the minor (and resets the patch)* Bug fixes and misc changes bumps the patch## Important LinksSource Code- https://github.com/coldbox/coldbox-platformContinuous Integration- http://jenkins.staging.ortussolutions.com/job/OS-ColdBoxPlatform%20BE/Bug Tracking/Agile Boards- https://ortussolutions.atlassian.net/browse/COLDBOX- https://ortussolutions.atlassian.net/browse/WIREBOX- https://ortussolutions.atlassian.net/browse/LOGBOX- https://ortussolutions.atlassian.net/browse/CACHEBOXDocumentation- http://coldbox.ortusbooks.com- http://wiki.coldbox.org (Legacy)Blog- http://blog.coldbox.orgOfficial Site- http://www.coldbox.org## System Requirements- Lucee 4.5+- Railo 4+ (Deprecated)- ColdFusion 9.02+## Quick InstallationPlease go to our [documentation](http://coldbox.ortusbooks.com) for expanded instructions. **CommandBox (Recommended)**We recommend you use [CommandBox](http://www.ortussolutions.com/products/commandbox), our CFML CLI and package manager, to install ColdBox.**Stable Release**`box install coldbox`**Bleeding Edge Release**`box install coldbox-be`**Simple Install**Unzip the download into a folder called `coldbox` in your webroot or place outside of the webroot and create a per-application mapping `/coldbox` that points to it.**Bleeding Edge Downloads**You can always leverage our bleeding edge artifacts server to download ColdBox: http://integration.stg.ortussolutions.com/artifacts/ortussolutions/coldbox/## CollaborationIf you want to develop and hack at the source, you will need to download [CommandBox](http://www.ortussolutions.com/products/commandbox) first.  Then in the root of this project, type `box install`.  This will download the necessary dependencies to develop and test the core.  You can then go ahead and start an embedded server `box server start` and start hacking around.  For running our test suites you will need 2 more steps, so please refer to the [Readme](tests/readme.md) in the tests folder.--- ###THE DAILY BREAD > "I am the way, and the truth, and the life; no one comes to the Father, but by me (JESUS)" Jn 14:1-12