Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E05C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 04:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hFrDEnXQocfpBgfH+Y9XXbJ4Ou1K3JsIGRRmEG2wyto=; b=DXzjZge1F6IZJqVvj0lS8LJdX/
	Y3blAeFAro1J7nA0QD534J4GJBvDNJ46+hjgl3LP8aOoreARR7FzJLFEPhW7eMnTV44A2/wjl10Rx
	boMOPzjI0VKUwuIGI6GW25hEt4ALkn03yirBsjjoz9NFPzvb29uPWxCf43ThMztZbQCymReDiqn2l
	mBktAdqF3+h3QnqCcs4BxZByuqVJYPzry0Yi1qzUt/1i5ygJJpS8BIPcyhyxINZn7HvLYQLSYdR4R
	PZ+Dz3xrSiUxGlmH0BWXTS7HFIJ879eUawhW9AjMA+92nRejHv+YeesTcHbmm2K1hvOspOlu5e/2d
	dMGoy6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vxs-00000000rAD-0sEk;
	Mon, 21 Sep 2026 04:49:16 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vxp-00000000r9m-0Ea8;
	Mon, 21 Sep 2026 04:49:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: ABI: TMR manager: use literal blocks for console I/O
Date: Sun, 20 Sep 2026 21:49:12 -0700
Message-ID: <20260921044912.97843-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use literal blocks so that the console commands and their output
are not joined together on one line.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Appana Durga Kedareswara rao <appana.durga.kedareswara.rao@amd.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager |   14 +++++-----
 1 file changed, 8 insertions(+), 6 deletions(-)

--- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager
+++ linux-next-20260918/Documentation/ABI/testing/sysfs-driver-xilinx-tmr-manager
@@ -3,14 +3,16 @@ Date:          Nov 2022
 Contact:       appana.durga.kedareswara.rao@amd.com
 Description:   This control file provides the fault detection count.
                This file cannot be written.
-               Example:
-               # cat /sys/devices/platform/amba_pl/44a10000.tmr_manager/errcnt
-               1
+               Example::
+
+                 # cat /sys/devices/platform/amba_pl/44a10000.tmr_manager/errcnt
+                 1
 
 What:          /sys/devices/platform/amba_pl/<dev>/dis_block_break
 Date:          Nov 2022
 Contact:       appana.durga.kedareswara.rao@amd.com
-Description:   Write any value to it, This control file enables the break signal.
+Description:   Write any value to it. This control file enables the break signal.
                This file is write only.
-               Example:
-               # echo <any value> > /sys/devices/platform/amba_pl/44a10000.tmr_manager/dis_block_break
+               Example::
+
+                 # echo <any value> > /sys/devices/platform/amba_pl/44a10000.tmr_manager/dis_block_break

