Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A1EC88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URIpbMJfCXSfu2fCsU8nZeVa+T330OFxkgZkw90cYgk=; b=nWctPcGa8/7oiljkch345KxBBw
	V6KAjfaVze+rqDf1Lcw910JzJXOHUjmBXaHnbyhkI8Qnq98W58bJh+qBmySCSLux2aXgpU2pq6MDh
	l4Dxd6N2+LMY0pxatY7WMcT7nhesWj2aFzBhZquTB6QuPWPdZtrEW+1PJacTkjpKZVIV1oq4khBd5
	qbyQt2kl+E53syoq+BGbxnDEAHEBAG1B+o5XyvJ/kS0eOeKRtwFoX5nbQv9sDtGfrGR9PldSZVSnB
	wYTuGXH9YSd2kmIBcPyg8APgPRHVBWFpjWzVIoVG+yNx9uPb4Sr2JBmS/pie41ar1klCKBb3IspEv
	sjgWScfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnK-00000000NCH-2n8F;
	Fri, 11 Sep 2026 23:36:34 +0000
Received: from mail-pf1-x464.google.com ([2607:f8b0:4864:20::464])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amq-00000000MqW-1A20
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:05 +0000
Received: by mail-pf1-x464.google.com with SMTP id d2e1a72fcca58-86a25369f16so1206484b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169763; x=1789774563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URIpbMJfCXSfu2fCsU8nZeVa+T330OFxkgZkw90cYgk=;
        b=GuOnJ4kBYeq8VvvbCosflebEZzzKFUkdSx85lPbdxRi0iECxrJZlf7NY8uuuk2yyOa
         MEcNzGOdxtDzV8fjDaGeYT2VYvQyCvzqDabGLJfR04sT4UMa2JpzVNwQC5fMHVHHdbUH
         pPxdyDjZia3tTKD82qPn/SoKpBKMmXmQjRweGdV4xJxL2pu29rf57iA2w0oQs3265vsW
         cYeyK9GPSqjwPaRI84c7bfSkx6+eVC0NpDpVfY2Q0h9NheSqbIEaXoqSokIlOBLel9/c
         i83wmJ9Yqld9nICpiEEOoA2JJ816szJN+Vz5gCPbdU5bY1So4gJIhjqB+/xPI78PNvJ9
         p7+g==
X-Forwarded-Encrypted: i=1; AKwUvBy1FVUlB/KVux7HmZgJIgbhQmp6GB2EAzfwnCNiVYqIYRGHWMi+ZAsgygS3q9Ncb0dLawxWHaKZ2xsNAnGS6jsY@lists.infradead.org
X-Gm-Message-State: AFuF++kEASYh/MgL6uTZOY16hv2K3HhQ6ikz16UZkRQem04oylpb+zYc
	EyLmPPk4uAx+lPBQI9t7VCMWF//Gj3Li+gRMq2Zzh0ZTR0XQLiiHJAmkRG7f5XjztkYohCGo0po
	++lMqvVM1D/kO2duDWCoNUeIggIwbnA7pGpcKmrIs4VTPpNMK+XpZFnPmQ6DxernZwP2X98uN9+
	pPMJtmGExst0vYgDY8ZShKzHcxj2swyFtwAqC7j1MGT8OaemmWGfS+4nGE8mbdeZGRVTD76heiK
	zJhdIyyZRogaeSEcAPsPYk1CenWlCI=
X-Gm-Gg: AYBFou0QXoy4eQgoT+qWrNpUK/96fELK7wJbdQ8lxHQpxzPT3D+II1uSJJpnAssdMRa
	Y1WdQBTgvD3YNFIz2zEiAbuHaf17dnL4H68xPaCoLFPTH+v31KRdmIe2vw04bmZTSGFTfIc2kKc
	YXtlFqEPfm8TD+7DFuzEs6xsYwC2zc8b54r77Tag5hlY62tKFWhc58AEPlMXTleHMX/onTctP25
	iiPUBpSjxToyWA0bLuECgrWxeWNqqKzt6+Bd7E6VUtHLjQx0S0EsfP3XmBj1yO7LElfvs8H+7NB
	AJscjDpYMxFI7tQF/ERE/VDjqa1AOhADJdNMON6a6Z7xRcZPYE2oq1vfSBsq/zDXotjVlb0BGuJ
	aT9LcGMaCTgI8hYL+WN+XLiUFTQ/eUz5vTjga+b59npCameWIRKUU2Q7K0JCXJ3FQm949eWHjKD
	cOs3vw9gVRuYh6okFSmpk8N46Fot2Pt2oT8w97G6M=
X-Received: by 2002:a05:6a00:7710:b0:86b:43f6:67c3 with SMTP id d2e1a72fcca58-86b43f66ff7mr8985045b3a.18.1789169763377;
        Fri, 11 Sep 2026 16:36:03 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86b27dc0f73sm1001376b3a.5.2026.09.11.16.36.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:03 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91214e93c2cso14949046d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169762; x=1789774562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=URIpbMJfCXSfu2fCsU8nZeVa+T330OFxkgZkw90cYgk=;
        b=eE1kJbjZMXsUxKUDrs6j8nhbng3ozyQ0/6nNsxPrM3vhGXSYGq/3N1QwyFrfMl0ZC7
         7VvTRrCpr8fvnlsh6KSe1QGQLVuBDYHNP7GQrVLvdvfPVh2h4rNDjgXX3gZWbdIhmSWJ
         NDnY/6iZlKxedwoPc3A7Dq5/GbAtNPQuLSE2c=
X-Forwarded-Encrypted: i=1; AKwUvBxJxyk3/YRA62ziRnBGFMOsR/Az3as3XEvfAHfHieCA7t04qZGr9a0IlqjcAJIDso+wyJMDRTSmVMmsEt4d6G2U@lists.infradead.org
X-Received: by 2002:ad4:5e8b:0:b0:910:63f9:29f9 with SMTP id 6a1803df08f44-91212086712mr89710806d6.10.1789169761776;
        Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
X-Received: by 2002:ad4:5e8b:0:b0:910:63f9:29f9 with SMTP id 6a1803df08f44-91212086712mr89710446d6.10.1789169761388;
        Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
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
Subject: [PATCH 08/13] PCI: brcmstb: Declare and assign quirk NO_RGR1_TIMER
Date: Fri, 11 Sep 2026 19:35:33 -0400
Message-Id: <20260911233541.1650895-9-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163604_324080_4361AA69 
X-CRM114-Status: GOOD (  15.41  )
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

Very few SoCs do not have an internal bus timer whose timeout value may be
adusted for L1SS operation.  Declare this as a quirk and assign it
accordingly.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index be414d346855..e2284e114241 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -294,6 +294,8 @@ struct inbound_win {
 #define CFG_QUIRK_OB_WIN_MAXSZ_128MB		BIT(2)
 /* PCIe HW can only access config space with 32bit R/W */
 #define CFG_QUIRK_32BIT_PCI_OPS			BIT(3)
+/* PCIe HW does not have an internal bus timer */
+#define CFG_QUIRK_NO_RGR1_TIMER			BIT(4)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1339,8 +1341,8 @@ static void brcm_extend_rbus_timeout(struct brcm_pcie *pcie)
 	const unsigned int REG_OFFSET = PCIE_RGR1_SW_INIT_1(pcie) - 8;
 	u32 timeout_us = 4000000; /* 4 seconds, our setting for L1SS */
 
-	/* 7712 does not have this (RGR1) timer */
-	if (pcie->cfg->soc_base == BCM7712)
+	/* Don't do access if there is no timer */
+	if (BQUIRK(pcie, NO_RGR1_TIMER))
 		return;
 
 	/* Each unit in timeout register is 1/216,000,000 seconds */
@@ -1971,7 +1973,8 @@ static const struct pcie_cfg_data bcm2712_cfg = {
 	.perst_set	= brcm_pcie_perst_set_7278,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.post_setup	= brcm_pcie_post_setup_bcm2712,
-	.quirks		= CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN,
+	.quirks		= CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN |
+		CFG_QUIRK_NO_RGR1_TIMER,
 	.num_inbound_wins = 10,
 };
 
@@ -2028,6 +2031,7 @@ static const struct pcie_cfg_data bcm7712_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.soc_base	= BCM7712,
 	.num_inbound_wins = 10,
+	.quirks		= CFG_QUIRK_NO_RGR1_TIMER,
 };
 
 static const struct of_device_id brcm_pcie_match[] = {
-- 
2.34.1


