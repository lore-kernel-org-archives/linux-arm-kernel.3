Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988EEC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 03:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qBz6oNG/36Qp57t3ZEunGGxMAR6zZhWKYud3RSOdL8s=; b=QhizNCVsvWtoaRjZ7u4WuYRkRt
	LIQA606mDuMP6dvx4YrkiUWjylq1cPK7UwXAd4fVku8vjxw8gwwdz8IbegIgj7/ckgrwIO0WodeaP
	1FyaLZpUBilpQJoYmnHj09YnVSwt6jjq8D14wXqbizHIDBraTRJglT1K2SaoGzzIOiDqqNaM6L0Vz
	gHlbkKKy1ILs9SIOIbzEAOwHsx9exu63a2St9wvy/m0q2tbzf/7c/G04e6UP5dFy2xqRefffoz3CA
	ppydfekFaEciILL6K2EEwpvrMX3roJH9s8m6JKc7G4mZI+TKnK8qEFOJkaG732FJGdln6C/pQ4pYN
	NSPZtciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBib-000000073og-2x8A;
	Fri, 07 Aug 2026 03:58:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBiZ-000000073oJ-03zy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 03:58:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-495437bb891so14244515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 20:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786075076; x=1786679876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qBz6oNG/36Qp57t3ZEunGGxMAR6zZhWKYud3RSOdL8s=;
        b=onxookITWZsNqWgnbul6clKvy4Y4SyE1/sSmrTOaqeUYH1S9Q8FQfSiZu9s205thLS
         4O2lhdymHOraMe7mlwHqPPYSds7ECZ+nzOvieHOYSed0lHfjLoGCJ+TMfqOYO6AIDPL2
         xM4XV1vl2xBP4ExNqsiwQWZ5MChOQeZF3S4RSEsxng8nnh+tKeyGkla+8jaQDdFMFEJC
         gicv78j2LWCrPI/kWitIIU94ElJHD27fjMTqGImhIHujVuwoqi5EKil0uH/idanVOdpo
         0DMWdYvCh+dxhSpxXQDSspd2TMpv7vw1hkLJ4JwxUKB9psQVZ0y1AloIV08hgCCBW6fN
         03sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786075076; x=1786679876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qBz6oNG/36Qp57t3ZEunGGxMAR6zZhWKYud3RSOdL8s=;
        b=ByliYSsUAcXS5QSsXcRbdaildP30AFOz0ouipmqQhFTzqLS7LhaXKjhOr64NmmbfKN
         NdocQD2f1pAkjfxAFKgi+3uwhuI6WiQceCVZyo4H4KQW+mArJ69hA/aOVE9F1TososlQ
         QkCjd+A2JDbpJFh6/fUSYtHxdSM2F8IQLJAqayT+57hJTxCjIN7s9owI7QjBZq0Ta1Wz
         hc+zo/yKX7gxeWgiOOqR733CVyEXTRfimPVT925uF+XtIALq3mDdCYIm0ZMMYoZacqcd
         yvc3pr0SAiqjeV2om1YpTlfaMW68zswVBL+TGJCnW/zR5CgVCRRt1+eKgisF0CNSEK65
         igFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVk1iuqgHfdUAK/uRSjcFQHp7JVN5YJvhJWIU5SpCsqPBz9xsPSBMRobyjbyQ1du+vxUf1bJeKTQMQGCiU3RqK@lists.infradead.org
X-Gm-Message-State: AOJu0YwemMdldyO83p4YkLKspfXctea0IZZ7coamnVgudTe8QATgc0QK
	AnAAGPChzAbdVnlLYIa1w1udgyOu412YshyMfux6Vbru+TL+T+hH3fo0
X-Gm-Gg: AR+sD12o+1acCoCX+hWCkgtuiZuuTPcWr1bq4jYBF9eKmAHQ4EWcZGVOCxGW9DjWduo
	CnFr255kc/t+oForCjYCJFAv59fGhNUn9OBs/ZEtoNe5cECwqqJfwD9jTTXIqnmFT1FYklhGjXV
	Tn8UCIK8W070NCxau4UIvuqpO8aFM6RN8QowlTLBOhiegiMWA1WoIXSdHj59/k+O/QvgXV/EJ4a
	2KRcGruRo9jqAYiEe33A+HKaUJPMelVxdqhB88LYD5QPXY31CbzNv8xm/hIpMix7Y8tX2xFXA4A
	rdRaspV+sIhzS00NHCiROKCR5t2slXCUVP0dVWK4FmcJK1v6MAHYNcGi0tUovibIheT0Qcl7+Rv
	xwoCbv8k8Hty/7TWX9AXDbfJ+IbOKM8BTreC/t1JdH+xe6kdKwPlZov78/1Y7StZX7Mg1mzdKtf
	gqMxAvShRarKmxJg9ly1kOgJFD0BI4jZb54jD2CvbOQzsPptol+rnwFh6M5oY4i7Ox6h0gloCX
X-Received: by 2002:a05:600c:a48:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-499553f4c4cmr105550845e9.8.1786075076143;
        Thu, 06 Aug 2026 20:57:56 -0700 (PDT)
Received: from SVR.localdomain ([86.106.74.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm1055165e9.1.2026.08.06.20.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 20:57:55 -0700 (PDT)
From: Semih Baskan <strst.gs@gmail.com>
To: lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rafal@milecki.pl,
	florian.fainelli@broadcom.com,
	arnd@arndb.de
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rosenp@gmail.com,
	rani.hod@gmail.com
Subject: [PATCH v2] PCI: iproc: Use the EROM outbound window on BCMA
Date: Fri,  7 Aug 2026 06:57:26 +0300
Message-ID: <20260807035726.387-1-strst.gs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_205759_086880_0E31C5F1 
X-CRM114-Status: GOOD (  22.62  )
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

The PCIe outbound window base on Northstar depends on the PCIe Gen2 core
revision. Revision 0x01 uses 0x08000000, 0x40000000 and 0x48000000 for
controllers 0 to 2, while revision 0x07 (NS-B0) uses 0x08000000,
0x20000000 and 0x28000000. Broadcom's own driver branches on the core
revision for exactly this reason.

bcm-ns.dtsi is shared by every Northstar SoC, so it cannot carry a value
that is correct on both. Commit 767012397976 ("ARM: dts: BCM5301X:
Describe PCIe controllers fully") gave the controllers a ranges property.
The commit shipped in v7.1.

With that property present, two things go wrong with this driver:

devm_pci_alloc_host_bridge() parses those ranges and requests them, then
this driver adds its own window and requests the whole list a second
time, so every controller fails to probe with -EBUSY.

When the DT window is used, it is only correct on core revision 0x07. On
revision 0x01 it points at an address the hardware does not decode, and
the first MMIO access to a BAR takes an imprecise external abort.

The enumeration ROM reports the correct base for the revision actually
present, and bcma already provides it as addr_s[0]. Drop any memory
window that came from the device tree and use that instead, requesting
only the window this driver owns. This makes the driver correct whether
or not the DT describes a window.

When a dropped window does not match what the EROM reports, print a
warning naming both. The mismatch means the devicetree describes a
window the hardware does not decode, and that should be fixed in the
dts rather than ignored silently.

The same commit also added compatible = "brcm,iproc-pcie", so these
nodes now match pcie-iproc-platform. With CONFIG_PCIE_IPROC_PLATFORM
enabled, which is the default on ARCH_BCM_IPROC, that driver binds them
first and this driver's probe fails inside devm_pci_alloc_host_bridge().
This patch fixes the configurations where the BCMA driver is the one in
use; OpenWrt builds that way, with PCIE_IPROC_PLATFORM disabled. The
platform path takes the DT window as-is and has the same wrong address
on core revision 0x01, so that side needs a devicetree fix either way.

Tested on an ASUS RT-N18U (BCM47081) and a Linksys EA9200 (BCM4709),
both core revision 0x01.

Fixes: 767012397976 ("ARM: dts: BCM5301X: Describe PCIe controllers fully")
Tested-by: Rani Hod <rani.hod@gmail.com>
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Semih Baskan <strst.gs@gmail.com>
---
v1 -> v2: print a warning for every devicetree memory window that does
not match the EROM window. Requested by Arnd Bergmann:
https://lore.kernel.org/all/d05ffeca-f289-42dd-b454-5a7c7741c6d5@app.fastmail.com/

v1: https://lore.kernel.org/all/20260727140939.389-1-strst.gs@gmail.com/
Applies to v7.2-rc5 and unchanged through v7.2-rc6; the file has no
commits in between.

 drivers/pci/controller/pcie-iproc-bcma.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-iproc-bcma.c b/drivers/pci/controller/pcie-iproc-bcma.c
index 593418c2b..06a471f4a 100644
--- a/drivers/pci/controller/pcie-iproc-bcma.c
+++ b/drivers/pci/controller/pcie-iproc-bcma.c
@@ -36,6 +36,7 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	struct device *dev = &bdev->dev;
 	struct iproc_pcie *pcie;
 	struct pci_host_bridge *bridge;
+	struct resource_entry *win, *tmp;
 	int ret;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
@@ -59,8 +60,22 @@ static int iproc_bcma_pcie_probe(struct bcma_device *bdev)
 	pcie->mem.end = bdev->addr_s[0] + SZ_128M - 1;
 	pcie->mem.name = "PCIe MEM space";
 	pcie->mem.flags = IORESOURCE_MEM;
+
+	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
+		if (resource_type(win->res) != IORESOURCE_MEM)
+			continue;
+
+		if (win->res->start != pcie->mem.start ||
+		    win->res->end != pcie->mem.end)
+			dev_warn(dev, "DT window %pR does not match EROM window %pR, using EROM\n",
+				 win->res, &pcie->mem);
+
+		devm_release_resource(dev, win->res);
+		resource_list_destroy_entry(win);
+	}
+
 	pci_add_resource(&bridge->windows, &pcie->mem);
-	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
+	ret = devm_request_resource(dev, &iomem_resource, &pcie->mem);
 	if (ret)
 		return ret;
 
-- 
2.43.0


