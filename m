Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27798C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZPUdMQ+HBavjfYhKEMnyLWMnsWpuuaQ9A5Q74lcIlU=; b=ITM3khGOfzANcDXbUdG9zBwKQQ
	7ksZEblxNCDoX7lR9P8/VI/o4m9/pD2paKr0SBQckW3XrpBvtJEq8cO6Dv7ud6vHgW3HboPOg+MzD
	RcF2NWHDyxd4uKFRe0+axB8LDjD3dDOnSnYKSDo96JlaiqrfhGlBMNhPmQ54j+iDZBy/7sEEyh+Sz
	UOO6nG/hPv/FYt6ShunPxsGmUVZFeuA5OcPPuymP2j+yzXOIDETLLsrvvUJSQzjSiRZpFHWmdjm3Z
	DPW5ND0I+fCcgHkdGwspuKXVaGNTDpPgRZ+HMJ9luSSLauooBvsbUEwEA6jh3DG0xPSdq2efHBWqU
	PHwDU9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnB-00000000N6c-1kop;
	Fri, 11 Sep 2026 23:36:25 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Aml-00000000Mni-3u7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:01 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1569891a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169759; x=1789774559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZPUdMQ+HBavjfYhKEMnyLWMnsWpuuaQ9A5Q74lcIlU=;
        b=hcnDDmVhfHLPBsvIXEy3Duvcv5JLI8ob5UV1C9D9Awki+38Na9uTkceN1kYuUJTZhm
         BDoc63flyWeSSfQOiQDM4Ngafb6cCJz+l2EN+2E7NmXr9GDNFYAGaQdxbqjdpYFcdqe4
         iLt/SrYL0Rzs7zUW7bH/uvwtu82bwTnODGFQDhmBjjxTllRPIwdjUjCRcKT/2YXcPmBt
         OkG1NQlfs01aeFjPHNfTe7sdT2ruevd4v+QJu9qior+2zdCZqkWmqGbFrXjIcERzaOrt
         laSiVHOkMGbDCLW83s6ixkEIvGREj/0AworSie2F1im/zXIvfDQXe1FhgJ+VXErwH1rm
         blBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2DBX39+WrczRizEpyKm57yUIqnLqUKumT6bHz5MwGHfRgwN0dp6sYDPDK0wnm0LdMveKbEZroBqMX4B9bhSW4@lists.infradead.org
X-Gm-Message-State: AFuF++nw69x6poxbxF+Gf86TQFSq6KMJaxHTosEacQqrfyDH4qHm5z1m
	k6WtoY6usE15pH27/luGbjb83WOOBemgt1nEmhr1ndJbnAZK/IlU8zLDiKyxrltMWCnR2BUxed3
	GaEj87nhA9hrId6Yyr7/o7t1z9Qz37KVWUJEtNOQfAtMVXNSQX8N4BqzyxvqPRH0HnCQtJ33PIH
	1FNA/rpuMIKwSvARJ8QFDmZO4GAp7X5XzmyijbAWlzOA3T5OdvZPX48kS5fA0fvmUFTjGqKXpCo
	+LyARJywrXVPms5ch6ZWFm072cKDHI=
X-Gm-Gg: AYBFou09MXhi9ioWiCkuc0Am+tgrDGhuWTL1uzZnlGP2ULyGI8eO5IzHLG4tMZikdwv
	Oba19+DNiKuW5EAfe94RPTHwu76QPkAgugci1E88fySJxy1MMwRSnOQJ9No6VOyvHulv76VGhfC
	DwGMeNI2tO/uvLt3fCYDLOw0b2Zv8gT6HyPL5Xu16ztCtBF4l2S4CWZHzAVmiSNZUh775CozH6C
	g2oRA8ZpW+eR+YxWBUPqZ0JxIU51O/z8R+ijMBEzTb3cxSky43yvkoDEEtQVzTXG5fcSCpewWj3
	4/lqRM2VzpTsYYGXAvh54kUqCNvpeKAXYEcJE346XIsorggw4BiJ66wePtnoDFtFEZuu08X++wo
	C+Ez/gvKBQSZV4kd6VuFbjWQ9bYfmxADOpWYnsLNN98/8v7XC1TSHUnV+0Ed+llLN5T7sDJs6NM
	8qEAH9tp8d+STSCM9cl+WkzoLI6r3U27b9RvmA
X-Received: by 2002:a17:90b:39af:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39d9bc0cdcfmr10203525a91.2.1789169759193;
        Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39da8eb7240sm1248590a91.4.2026.09.11.16.35.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cddf4f59eso24871966d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169758; x=1789774558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZPUdMQ+HBavjfYhKEMnyLWMnsWpuuaQ9A5Q74lcIlU=;
        b=Mg7lB5q6/IN6/03vV/z93nH+mXBEyga4A5A0igru2imzqD9L+coMWVUkl0gl/fhvZl
         6XhXIGFIzrEwy4Zhxo40aWMNkLTS864RuOXVYRDUHSe79kL1ioGkBjgs/umKXlfnLV6+
         4N/exK6Wco0bPCsSdjw+EKpMxZQurehyX3hMw=
X-Forwarded-Encrypted: i=1; AKwUvBypF0x8jhdP0bvJtieI8j3cLzF2plCrrfu+6L5mM8z2PB9V0Ke38T6YFq1YQtW+aIGpbEHvoKfJvFwW6rPNQLDJ@lists.infradead.org
X-Received: by 2002:a05:6214:d4f:b0:910:3453:66e with SMTP id 6a1803df08f44-9121210d369mr86980076d6.32.1789169757910;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
X-Received: by 2002:a05:6214:d4f:b0:910:3453:66e with SMTP id 6a1803df08f44-9121210d369mr86979786d6.32.1789169757456;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
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
Subject: [PATCH 06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
Date: Fri, 11 Sep 2026 19:35:31 -0400
Message-Id: <20260911233541.1650895-7-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163600_030094_275B6B76 
X-CRM114-Status: GOOD (  15.23  )
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

Eliminate a function that evaluates SoC chip IDs and instead declare and
use a flag that indicates the SoC employs a CPU with a variant of the
MIPS-1 ISA.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 401898d04d52..8927d1d97f4a 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -300,7 +300,8 @@ struct inbound_win {
 #define CFG_FLG_HAS_PHY				BIT(0)
 /* The SoC PCIe HW can dump to the console PCIe error info */
 #define CFG_FLG_HAS_ERR_REPORT			BIT(1)
-
+/* SoC uses a Broadcom variant of the MIPS-1 ISA */
+#define CFG_FLG_IS_BMIPS			BIT(2)
 
 struct pcie_cfg_data {
 	const int *offsets;
@@ -361,11 +362,6 @@ struct brcm_pcie {
 	spinlock_t		bridge_lock;
 };
 
-static inline bool is_bmips(const struct brcm_pcie *pcie)
-{
-	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
-}
-
 static int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
 {
 	unsigned long flags;
@@ -1176,7 +1172,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		return ret;
 
 	tmp = readl(base + HARD_DEBUG(pcie));
-	if (is_bmips(pcie))
+	if (BFLAG(pcie, IS_BMIPS))
 		tmp &= ~PCIE_BMIPS_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK;
 	else
 		tmp &= ~PCIE_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK;
@@ -1189,7 +1185,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	 * is encoded as 0=128, 1=256, 2=512, 3=Rsvd, for BCM7278 it
 	 * is encoded as 0=Rsvd, 1=128, 2=256, 3=512.
 	 */
-	if (is_bmips(pcie))
+	if (BFLAG(pcie, IS_BMIPS))
 		burst = 0x1; /* 256 bytes */
 	else if (pcie->cfg->soc_base == BCM2711)
 		burst = 0x0; /* 128 bytes */
@@ -2001,6 +1997,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
+	.flags		= CFG_FLG_IS_BMIPS,
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2011,6 +2008,7 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
+	.flags		= CFG_FLG_IS_BMIPS,
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
-- 
2.34.1


