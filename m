Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD1DC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3SnnjQ2kzL235/6CJf8lAWttCVovoEfu585meMFTts=; b=teqBahkK3+cR0KlN+uqovCtr8Y
	r2pFFRtK9yWvBilo6pcgalAueCDwhoF3xN2QtToDXKpPraOdJylSh9S3rIUGMw00D7iDicH1bluic
	DFlsv2gCYdckha1qDfJRw+sfvUUydwCjk5L4/jKQz9CvN5JB8I47GWAQI25E/a8Yjue19pf96XS/M
	/BsakZjte3VDxxuVGq7quKSxoZwFUDC6pP6iBPJLEWg+zpFDVZnt8hXsTbCYcrtUh7j92cdU/EVyV
	V73ZklEQsH7rYvYLx4pxDLkqJStlV+8QGXIIIl0tX2+RZduo+RZu6/Vr4+pvPCL5gRDmBxC91YHkl
	/P0qrTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Anh-00000000NXr-0KLt;
	Fri, 11 Sep 2026 23:36:57 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amz-00000000Mws-2w0v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:15 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1672538a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169773; x=1789774573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3SnnjQ2kzL235/6CJf8lAWttCVovoEfu585meMFTts=;
        b=VEftAAzUo/Bu1zYrGkTXUXjCg4rGtmCOSEcxgNtVo9SK9NSA0mnTbhQDmSZ37tkHMe
         tcf6VQl9k8z0ATtVEJBRT+OY/n2WeuB07uVyH3syVClDwTWrxguognEgTjM4rkOeC62M
         9+TeSwq86Gl2hjXXGxyfLHoTpe8vVKdMZnliyH2/lDJnvXYq8LYyRjgPhUOuTsWW/qnC
         qaBSseb3bd7JE7Cqywa7cDd/oqdYuyNl+bDNAayRZ+ach94MQfrMnokiymyHeilrkUEa
         NBbOcIQ19tKESLdZmdvs0L2W2OLjRChyyvPaT0JTKuuJ2MAXhAeeHqUikdOafj0N04Ml
         vnTQ==
X-Forwarded-Encrypted: i=1; AKwUvByIDNyxIibSyLim58o715eVAj3sLDxtgF+EkBYIMaLNo/L0stiV1ARPXh9bPCtgAUid+NyVY8zYy95J9YwiN1PY@lists.infradead.org
X-Gm-Message-State: AFuF++lmgI92QijpnnhRIaWboR+RJt/xIFGzowVuQbPpnEcCYApsrs1g
	Fvj1dX8C+k2m0XdGneJ/9QMHc8q+o5wbc6ZKpcZRNb2Jk2u42wo+WVJQmEiQUwByHbMtTeeK9lt
	59tLamn/WdJG9zoGCgoP/wJa/62xwURZSxX/3LfnliZjShn8d4myxlLGEVUI2p2dBG8vOGPZSK1
	08vDhx416Gw8cpOHvA686NblJncZmn8fWnj0mYl9haHJbUXs7MwOBapJt4Zl9viRkvtwWLfGi9F
	XFAQbvrE/EnEY9UJf/UxFUraTMe31c=
X-Gm-Gg: AYBFou1c3miB64vpndoD3pFk3IMU6zzZKUVD2Z6d3rBw7OOJsAu9xXngN/c4RwU01p/
	VPqsGYng7Ar9uYb9Z+bByyLDAi9kugQt8b56j/ZVI/wxDT1mG4G1HXf6T3b6Qk9OAoqQkdCPhvw
	OdvpGc//kHl+VLW9Ub+CVYKkY6UupxZLfMAsdPRU9ApNPMg7FjAUNTah5I3DZ+tOwmzJDAKs7zX
	b3Q0ldobFGVUmDA+s2s5DwhI1t4PjURGfHr0fl3/s6jfZUeI3Lu/ODFolH9D/c39qv+TbyDaKt4
	ggqDkSLwD3H0FKGkRBCghA1D4poRyYUPAlULGt4aJKxw82ObBwfiK66r1ytWBAY11ORCNvBTsXU
	Z6xSHc/3WHHzrxOuBqrH61Bf4HmoX/l/4G0gtD5O9nGWM4VerxZJutYuwqGTheqnDKTG4J0+IWq
	utuIApqHJ37KbN8m0LtIEBnj+4zJxp2WWzgsUt
X-Received: by 2002:a17:90b:28c7:b0:390:84db:888e with SMTP id 98e67ed59e1d1-39d97f34734mr6094008a91.7.1789169772755;
        Fri, 11 Sep 2026 16:36:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39d98e8ffa3sm2140311a91.6.2026.09.11.16.36.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52fc16ac179so31271141cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169771; x=1789774571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3SnnjQ2kzL235/6CJf8lAWttCVovoEfu585meMFTts=;
        b=FM6DJsqzOBEgAXXuJk5/idda7XisibELmFrUGRA4yXNXHE4CkHey1wiPmxoFxVWIKT
         mK5A9prRjw19Y7E4wZGSdkRJz3yXYkGtZLJB0M3oI+AGZnCqrcakQLCxarEohXukHDFE
         H4SpA+ssKxlQ4FzPnvGJFdy3ZY3/SAYCB7zGk=
X-Forwarded-Encrypted: i=1; AKwUvBxUtjK+XHDWgLagrujfHiXefHLSP2pr6D66QiQLowbHFRUuzuWovPVoRn1Bjchh7280C5ve8LAmLJBK9LKgxklR@lists.infradead.org
X-Received: by 2002:ac8:598a:0:b0:530:4773:1140 with SMTP id d75a77b69052e-530b3639755mr143682481cf.30.1789169770839;
        Fri, 11 Sep 2026 16:36:10 -0700 (PDT)
X-Received: by 2002:ac8:598a:0:b0:530:4773:1140 with SMTP id d75a77b69052e-530b3639755mr143682141cf.30.1789169770357;
        Fri, 11 Sep 2026 16:36:10 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:09 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 13/13] PCI: brcmstb: Split up complicated function into two variants
Date: Fri, 11 Sep 2026 19:35:38 -0400
Message-Id: <20260911233541.1650895-14-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163613_746958_3C305BCE 
X-CRM114-Status: GOOD (  28.70  )
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

The function brcm_pcie_get_inbound_wins() is abstruse.  Most of
its code is used exclusively by older chips, where the PCIe HW employed a
baroque internal inbound window mapping scheme which was an artifact for
when the PCIe would be configured as an endpoint.

Create two variants of this function, one for the newer chips and one for
the older chips, and assign them using the config_data structures.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 105 +++++++++++++++++---------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 53984cfa2c96..45e8a9e030d4 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -321,6 +321,9 @@ struct pcie_cfg_data {
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
+	int (*get_ib_wins)(struct brcm_pcie *pcie, struct inbound_win
+			   *inbound_wins);
+
 };
 
 struct subdev_regulators {
@@ -954,8 +957,58 @@ static void add_inbound_win(struct inbound_win *b, u8 *count, u64 size,
 	(*count)++;
 }
 
+/*
+ * This is used by newer SoCs. It configures the inbound mapping windows
+ * in accordance to the values of the dma-ranges properties.
+ */
 static int brcm_pcie_get_ib_wins(struct brcm_pcie *pcie,
 				 struct inbound_win *ib_win)
+{
+	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
+	struct resource_entry *entry;
+	u64 size;
+	u8 n = 0;
+
+	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
+		u64 pcie_start = entry->res->start - entry->offset;
+		u64 cpu_start = entry->res->start;
+
+		size = resource_size(entry->res);
+		add_inbound_win(ib_win++, &n, size, cpu_start, pcie_start);
+		if (n > pcie->cfg->num_inbound_wins)
+			break;
+	}
+
+	if (!n) {
+		dev_err(pcie->dev, "DT node has no dma-ranges\n");
+		return -EINVAL;
+	}
+
+	return n;
+}
+
+/*
+ * Originally, the Broadcom STB PCIe HW played the endpoint (EP) role.  As
+ * an EP, one of its goals was to present system memory as a single
+ * contigous PCIe BAR.  So if there was two regions of system memory, say
+ * 1GB@0GB and 2GB@2GB, these two regions would be presented as a
+ * contiguous BAR that was 3GB in size and started at a PCIe offset that
+ * was configured by SW.
+ *
+ * Then the same PCIe HW was modified to also play the Root Complex (RC)
+ * role and the same internal mapping strategy was employed.  For any SoC
+ * that uses this scheme, each "BAR" is an inbound window and the PCIe HW
+ * is internally mapped and hard-wired to system memory regions.  Even
+ * though the code of the function below uses the dma-ranges properties, it
+ * is unable to configure the CPU region that is covered, but it can set
+ * the size and offset of the PCIe side of the window.
+ *
+ * Newer SoCs use the brcm_pcie_get_ib_wins() function have the freedom to
+ * configure mapping windows from any CPU region to any PCIe region,
+ * provided they follow the rules on offset alignment and size.
+ */
+static int brcm_pcie_get_ib_wins_internal_map(struct brcm_pcie *pcie,
+					      struct inbound_win *ib_win)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
 	u64 pci_offset, cpu_addr, size = 0, tot_size = 0;
@@ -965,33 +1018,15 @@ static int brcm_pcie_get_ib_wins(struct brcm_pcie *pcie,
 	int ret, i = 0;
 	u8 n = 0;
 
-	/*
-	 * STB chips beside 7712 disable the first inbound window default.
-	 * Rather being mapped to system memory it is mapped to the
-	 * internal registers of the SoC.  This feature is deprecated, has
-	 * security considerations, and is not implemented in our modern
-	 * SoCs.
-	 */
-	if (pcie->cfg->soc_base != BCM7712)
-		add_inbound_win(ib_win++, &n, 0, 0, 0);
+	/* By default, disable the first inbound window */
+	add_inbound_win(ib_win++, &n, 0, 0, 0);
 
 	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
 		u64 pcie_start = entry->res->start - entry->offset;
-		u64 cpu_start = entry->res->start;
 
-		size = resource_size(entry->res);
-		tot_size += size;
+		tot_size += resource_size(entry->res);
 		if (pcie_start < lowest_pcie_addr)
 			lowest_pcie_addr = pcie_start;
-		/*
-		 * 7712 and newer chips may have many BARs, with each
-		 * offering a non-overlapping viewport to system memory.
-		 * That being said, each BARs size must still be a power of
-		 * two.
-		 */
-		if (pcie->cfg->soc_base == BCM7712)
-			add_inbound_win(ib_win++, &n, size, cpu_start, pcie_start);
-
 		if (n > pcie->cfg->num_inbound_wins)
 			break;
 	}
@@ -1001,14 +1036,6 @@ static int brcm_pcie_get_ib_wins(struct brcm_pcie *pcie,
 		return -EINVAL;
 	}
 
-	/*
-	 * 7712 and newer chips do not have an internal memory mapping system
-	 * that enables multiple memory controllers.  As such, it can return
-	 * now w/o doing special configuration.
-	 */
-	if (pcie->cfg->soc_base == BCM7712)
-		return n;
-
 	ret = of_property_read_variable_u64_array(pcie->np, "brcm,scb-sizes", pcie->memc_size, 1,
 						  PCIE_BRCM_MAX_MEMC);
 	if (ret <= 0) {
@@ -1123,13 +1150,8 @@ static void brcm_pcie_set_ib_win_registers(struct brcm_pcie *pcie,
 		/* Write high */
 		writel_relaxed(upper_32_bits(pci_offset), base + reg_offset + 4);
 
-		/*
-		 * Most STB chips:
-		 *     Do nothing.
-		 * 7712:
-		 *     All of their BARs need to be set.
-		 */
-		if (pcie->cfg->soc_base == BCM7712) {
+		/* SoCs w/o fixed internal mapping can remap the cpu_addr */
+		if (pcie->cfg->get_ib_wins == brcm_pcie_get_ib_wins) {
 			/* BUS remap register settings */
 			reg_offset = brcm_ubus_reg_offset(i);
 			tmp = lower_32_bits(cpu_addr) & ~0xfff;
@@ -1195,7 +1217,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
 	writel(tmp, base + PCIE_MISC_MISC_CTRL);
 
-	num_inbound_wins = brcm_pcie_get_ib_wins(pcie, inbound_wins);
+	num_inbound_wins = pcie->cfg->get_ib_wins(pcie, inbound_wins);
 	if (num_inbound_wins < 0)
 		return num_inbound_wins;
 
@@ -1943,6 +1965,7 @@ static const struct pcie_cfg_data generic_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.burst_setting	= 0x2, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm2711_cfg = {
@@ -1953,6 +1976,7 @@ static const struct pcie_cfg_data bcm2711_cfg = {
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_EARLY_PERST_ASSERT,
 	.burst_setting	= 0x0, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm2712_cfg = {
@@ -1965,6 +1989,7 @@ static const struct pcie_cfg_data bcm2712_cfg = {
 		CFG_QUIRK_NO_RGR1_TIMER,
 	.num_inbound_wins = 10,
 	.burst_setting	= 0x2, /* 0=64B, 1=128B, 2=256B, 3=Rsvd */
+	.get_ib_wins	= brcm_pcie_get_ib_wins,
 };
 
 static const struct pcie_cfg_data bcm4908_cfg = {
@@ -1975,6 +2000,7 @@ static const struct pcie_cfg_data bcm4908_cfg = {
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_PERST_PCIE_REV_CUTOFF,
 	.burst_setting	= 0x0, /* 0=64B, 1=128B, 2=Rsvd, 3=Rsvd */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm7278_cfg = {
@@ -1984,6 +2010,7 @@ static const struct pcie_cfg_data bcm7278_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
 	.num_inbound_wins = 3,
 	.burst_setting	= 0x3, /* 0=Resv, 1=128B, 2=256B, 3=512B */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm7425_cfg = {
@@ -1996,6 +2023,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB | CFG_QUIRK_32BIT_PCI_OPS,
 	.flags		= CFG_FLG_IS_BMIPS,
 	.burst_setting = 1, /* 0=128B, 1=256B, 2=Rsvd, 3=Rsvd */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2008,6 +2036,7 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 	.flags		= CFG_FLG_IS_BMIPS,
 	.burst_setting = 1, /* 0=128B, 1=256B, 2=Rsvd, 3=Rsvd */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
@@ -2018,6 +2047,7 @@ static const struct pcie_cfg_data bcm7216_cfg = {
 	.flags		= CFG_FLG_HAS_PHY | CFG_FLG_HAS_ERR_REPORT,
 	.num_inbound_wins = 3,
 	.burst_setting	= 0x3, /* 0=Resv, 1=128B, 2=256B, 3=512B */
+	.get_ib_wins	= brcm_pcie_get_ib_wins_internal_map,
 };
 
 static const struct pcie_cfg_data bcm7712_cfg = {
@@ -2028,6 +2058,7 @@ static const struct pcie_cfg_data bcm7712_cfg = {
 	.num_inbound_wins = 10,
 	.quirks		= CFG_QUIRK_NO_RGR1_TIMER,
 	.burst_setting	= 0x2, /* 0=64B, 1=128B, 2=256B, 3=Resv */
+	.get_ib_wins	= brcm_pcie_get_ib_wins,
 };
 
 static const struct of_device_id brcm_pcie_match[] = {
-- 
2.34.1


