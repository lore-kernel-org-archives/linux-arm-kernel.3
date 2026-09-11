Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20276C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvxeiUifxpfQFpLPlhrwkJPg9MEHvf8vpcauDPPob84=; b=cJGN0hWJT6N+UDhTFRAvBZA2cv
	UycXhctX75efmnoeJp3f02FPU/x0RrbQYh9OkQchewIvKyL/kjjMZCua50RmnuZSMEv36hTU7iHuZ
	+iXU3Kndc5u+iK0ynfmJc1dMrm+GOObffSeaUW1qedzXmJX9kb44ZMi6K+K4eoJWlVCbJxQQ54J3p
	EnNTYJz7poHlpRV7Wgub2DSrL+sSXePhVIm23n0h1PO1CrsmUYWdr4dqO/3IL3DY5MqG3kEsKQ8fU
	ONbMiMlX79YqqhFerNUzQji+YpXgBIBNvT7+2U2eQHV3PKThU18PRI1T8alnMLYkHoiH38f0Wp69L
	jVABeA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnV-00000000NM7-1cqu;
	Fri, 11 Sep 2026 23:36:45 +0000
Received: from mail-vk1-xa64.google.com ([2607:f8b0:4864:20::a64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amu-00000000Mty-4BGG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:12 +0000
Received: by mail-vk1-xa64.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so1156119e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169768; x=1789774568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvxeiUifxpfQFpLPlhrwkJPg9MEHvf8vpcauDPPob84=;
        b=ZrC1JkY+UfL2KFNY4cvkViOI1oklKAB/SrihIAlzeMnsEAcGGNMqEc8a62R3R1jOCb
         hm+KmbuXAcIYRBzObKBsHBRvlOl6aVZEKukEljw+yy4T4uYRSkP0c0UJJe722pJj5ra6
         YiZ4rrAJ+TIvKAxdV5lbzTTOqYd6bi9M6XT/w+MGdRrYI3RcONsTMaE9rW8BcBvl3QNH
         VYnZsRDbW9B7SBAMKzWu5Fgmm6wdtN29c76+XciofoBE2JaLd1GW/K/beJryjqBmpke8
         6vec3JW9lV3+M74k/4xXMVu20zEj2PogSW3o29Miml4p4dvhlU+mRJQ8KScxthUsvpmg
         XXow==
X-Forwarded-Encrypted: i=1; AKwUvBxpLDWUmJrnkwNh7lVTfwBm862N828F65XWbEBcTri+R8oOsK48DvMOGZRt1MZbsi4u7RGPMV9gj4P4yHv8+Kmu@lists.infradead.org
X-Gm-Message-State: AFuF++lO3W5QwXL/ZNiFZLxKJ1ur39u3+7K8+Wox2d7yXAgv0ahVulne
	tcH2SREgq9xRhEPpomor5qw/iaaloTwaGiE/W6532vvkMsUnZ4F6cMdCvIfOelBtKAHU4ZOw7TU
	GGrbBWzUFFVr8WiBtLvX0cDqKGEMCGDAy0EN5GSQnvW+eWkatuBHbqnQhCf80la50+kmArEUwis
	/31BwxTGzWcFC/Duyqt2SYLNw/c42GeeX+LnBmBvfoTNuRYT5ye/gMuAK+G4+n7lz2g+KZOx5ij
	WNX7i7Jyk6GkoijxIfSt2J9+jh2DmU=
X-Gm-Gg: AYBFou0Q3+FfuUv+VUt7tCE4iw0GlE3HEtddxmhgKCsZacE5P9FuPu1cFTB48MjaWSB
	qTVEvPZ0y+6x/tgWrZ6f172p7V1BJM8wlySJqF5AWwLXd0YFv9BSw3ov3mnDSFtMJuArho5U5pD
	E/Atk/13MC3UDD8lZGbDCvBzygApCdHdPiuYu+BuZYHkuddYxyebi0KMiZgi0YGmvT9LTcIVWJN
	M+7SfoW7LZqEk/yFk8Kewfxrydr74wihEX5nGv/Rrz7AbQsuxb+QdSlL2vjgnr1K7K9hGePOOzH
	8prMrpUKYFaXP3z783tbDxBEBAQTTdO5QMvdx7J4u9y/Mrs8T/+RrnxT51oI45IjAxPvclawQUd
	ZXxmzlCikaTKuR47nc6LFfmSJAM+x6ylojnnis6D+g9yXOqEa6TVF8VA6SoQSufcXpB9jv0s5I8
	QeoOj95fWHgDI98F8n4unvOX2J7JNwahCCW+SD
X-Received: by 2002:a05:6123:a1:b0:5c8:2a47:b111 with SMTP id 71dfb90a1353d-5c965e8e6bcmr430000e0c.3.1789169768009;
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c84711b08asm1508459e0c.7.2026.09.11.16.36.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce21f2cc9so34371336d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169767; x=1789774567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvxeiUifxpfQFpLPlhrwkJPg9MEHvf8vpcauDPPob84=;
        b=Br1Oz7YudJrynv2y5mNclXLvwOwV481XuyxQjfdwyIhDfNuVJaJbVMdjMCC3wiM67R
         DNqOIIcHHo2q8Ah0AFIniER+7pN1r7Jqy2f5e/0WRBkGDjVgEzRMhlv/LUUptdk+7v70
         lflLoAKoHXmKiY9fuDWX0sjbCgOs6Y5tggVAA=
X-Forwarded-Encrypted: i=1; AKwUvBwVsTrby6Z6jV17p8kV8Wq0LLpSznyoy0iLfi4XkR10UeINCm5fTKmRRRtng9djl+KiNQhkyuy8rNkC7KGq8lvz@lists.infradead.org
X-Received: by 2002:a05:6214:3d08:b0:910:3453:505e with SMTP id 6a1803df08f44-9121dae180fmr10666406d6.32.1789169767430;
        Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
X-Received: by 2002:a05:6214:3d08:b0:910:3453:505e with SMTP id 6a1803df08f44-9121dae180fmr10665916d6.32.1789169767016;
        Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:06 -0700 (PDT)
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
Subject: [PATCH 11/13] PCI: brcmstb: Put max_burst_size setting in cfg_data
Date: Fri, 11 Sep 2026 19:35:36 -0400
Message-Id: <20260911233541.1650895-12-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163611_247664_2EF31882 
X-CRM114-Status: GOOD (  17.47  )
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

Rather than ascertaining the max_burst_size setting by comparing different
SoC IDs, specify the setting in the config_data structure for each SoC.
Also add a comment on each SoC's encoding of this field.

Note: Previously, the max burst setting used for the 4908 Soc was 2.
However, it appears that the setting of 2 is illegal for this chip.  Set it
to 0 as (a) this is the safest (smallest) choice and (b) the 2 was probably
interpreted by the HW as a 0 anyway.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 29 ++++++++++++---------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 047783e33ae4..8bca98e6f5fa 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -317,6 +317,7 @@ struct pcie_cfg_data {
 	u32 flags;
 	u32 quirks;
 	u8 num_inbound_wins;
+	u8 burst_setting;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
@@ -1153,7 +1154,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	void __iomem *base = pcie->base;
 	struct pci_host_bridge *bridge;
 	struct resource_entry *entry;
-	u32 tmp, burst, num_lanes, num_lanes_cap;
+	u32 tmp, num_lanes, num_lanes_cap;
 	u8 num_out_wins = 0;
 	int num_inbound_wins = 0;
 	int memc, ret;
@@ -1188,20 +1189,6 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	/* Wait for SerDes to be stable */
 	usleep_range(100, 200);
 
-	/*
-	 * SCB_MAX_BURST_SIZE is a two bit field.  For GENERIC chips it
-	 * is encoded as 0=128, 1=256, 2=512, 3=Rsvd, for BCM7278 it
-	 * is encoded as 0=Rsvd, 1=128, 2=256, 3=512.
-	 */
-	if (BFLAG(pcie, IS_BMIPS))
-		burst = 0x1; /* 256 bytes */
-	else if (pcie->cfg->soc_base == BCM2711)
-		burst = 0x0; /* 128 bytes */
-	else if (pcie->cfg->soc_base == BCM7278)
-		burst = 0x3; /* 512 bytes */
-	else
-		burst = 0x2; /* 512 bytes */
-
 	/*
 	 * Set SCB_MAX_BURST_SIZE, CFG_READ_UR_MODE, SCB_ACCESS_EN,
 	 * RCB_MPS_MODE, RCB_64B_MODE
@@ -1209,7 +1196,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	tmp = readl(base + PCIE_MISC_MISC_CTRL);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_SCB_ACCESS_EN_MASK);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_CFG_READ_UR_MODE_MASK);
-	u32p_replace_bits(&tmp, burst, PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
+	u32p_replace_bits(&tmp, pcie->cfg->burst_setting,
+			  PCIE_MISC_MISC_CTRL_MAX_BURST_SIZE_MASK);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_MPS_MODE_MASK);
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
 	writel(tmp, base + PCIE_MISC_MISC_CTRL);
@@ -1961,6 +1949,7 @@ static const struct pcie_cfg_data generic_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.burst_setting	= 0x2, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm2711_cfg = {
@@ -1970,6 +1959,7 @@ static const struct pcie_cfg_data bcm2711_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_EARLY_PERST_ASSERT,
+	.burst_setting	= 0x0, /* 0=128B, 1=256B, 2=512B, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm2712_cfg = {
@@ -1981,6 +1971,7 @@ static const struct pcie_cfg_data bcm2712_cfg = {
 	.quirks		= CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN |
 		CFG_QUIRK_NO_RGR1_TIMER,
 	.num_inbound_wins = 10,
+	.burst_setting	= 0x2, /* 0=64B, 1=128B, 2=256B, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm4908_cfg = {
@@ -1990,6 +1981,7 @@ static const struct pcie_cfg_data bcm4908_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_PERST_PCIE_REV_CUTOFF,
+	.burst_setting	= 0x0, /* 0=64B, 1=128B, 2=Rsvd, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm7278_cfg = {
@@ -1998,6 +1990,7 @@ static const struct pcie_cfg_data bcm7278_cfg = {
 	.perst_set	= brcm_pcie_perst_set_7278,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
 	.num_inbound_wins = 3,
+	.burst_setting	= 0x3, /* 0=Resv, 1=128B, 2=256B, 3=512B */
 };
 
 static const struct pcie_cfg_data bcm7425_cfg = {
@@ -2009,6 +2002,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB | CFG_QUIRK_32BIT_PCI_OPS,
 	.flags		= CFG_FLG_IS_BMIPS,
+	.burst_setting = 1, /* 0=128B, 1=256B, 2=Rsvd, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2020,6 +2014,7 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 	.flags		= CFG_FLG_IS_BMIPS,
+	.burst_setting = 1, /* 0=128B, 1=256B, 2=Rsvd, 3=Rsvd */
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
@@ -2029,6 +2024,7 @@ static const struct pcie_cfg_data bcm7216_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
 	.flags		= CFG_FLG_HAS_PHY | CFG_FLG_HAS_ERR_REPORT,
 	.num_inbound_wins = 3,
+	.burst_setting	= 0x3, /* 0=Resv, 1=128B, 2=256B, 3=512B */
 };
 
 static const struct pcie_cfg_data bcm7712_cfg = {
@@ -2038,6 +2034,7 @@ static const struct pcie_cfg_data bcm7712_cfg = {
 	.soc_base	= BCM7712,
 	.num_inbound_wins = 10,
 	.quirks		= CFG_QUIRK_NO_RGR1_TIMER,
+	.burst_setting	= 0x2, /* 0=64B, 1=128B, 2=256B, 3=Resv */
 };
 
 static const struct of_device_id brcm_pcie_match[] = {
-- 
2.34.1


