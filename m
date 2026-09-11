Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4400EC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TL/+G3e3u5ILLrluIyCPB8J12Dl41Ws69Qu/dHBTdLE=; b=KU19oEhz5iQqHVqw3YSVTX9bBD
	I/7SJDcnWZahkWIw9nW/JUNdGcqsb1CTzU7qjRZsIlRW0S/Z3s6AC6Bf6E2AxQJLJktsYZ/d2Jdgu
	gR2dztq3GAJDOb0DnELIgtwLMBzZMIQB/XksZNhpvuGDQrQNEOyxgBuNnhciVQKCk3qp6eujqPfvc
	r3Z3vwVaRDEGR6bANuN7UwDfTdRWpZeyibK6KDz1aYy36MFDQ+KjMuMBSDchYVYAqWg8ew8R56Ax9
	ErFhdgjjQpNyoVtzvOjfLMBChFHlZhz/7uy+E1Wgxtj6mKYWrYIUufqVkrk9eI8+Kc/7zg7k+LZ6A
	VBsym0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amz-00000000MxY-3Rgr;
	Fri, 11 Sep 2026 23:36:13 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amh-00000000Mk8-2zup
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:35:57 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so1804389a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169755; x=1789774555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TL/+G3e3u5ILLrluIyCPB8J12Dl41Ws69Qu/dHBTdLE=;
        b=SBQf26js36L+5+eYoPCrb7K4YZrwTUMW+g+GujmNo0R8g8Vpu19+UY08aHsZw4a4IG
         Cnax9+OPsV8VMK2MKmQlSS7DEuBymaIBRsmI5DvNcOW9/YlKqutXDof1Ji2UTVN3SCTl
         1jPMDe73Wr2IUBWrfRpo2Z0p330uQgyb/+6SR0TCcoljRaNkRm2fBBTSgteVzsWbwfMX
         D1CC78A1KBOCbMmuV+IZk1fLVg/1kPSnWQJPllWqqJVE23F3GTxBk4RROj1W7WuN6ldf
         mbCUp/CPmQFxftJym/nl5NPLXey3faOP+g+QbqWcjWRqU7fabWg/GjO/5IeWuNw+EvqM
         td3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZ01f5Jmn09ZtvaXu0cdSfoEGhmZuwZYLskCmACsIRlkuiz/TWQB9gu0ZETRVD1zTyXzbtVCIbfNn+meR7j6wP@lists.infradead.org
X-Gm-Message-State: AFuF++ngxcIV09cVFiIN4TTf2uSn7L9ote5L4yX2EeURcy0gJ0FLN5iS
	cE4iNOyBuqom7sma8jPNId0itB0zkR+ECN7Gl+rFG1Bixq0Arbrr35I4lrNcDhHBE0+NZRcVhzn
	uX1NL9P2+RRvAZlHNnGg0Zj7xVVLBM4qHyg8klBmSHeTysu377hhFUrzYEdak16ELbgxqOiPaGa
	jyyG43WLmBJByq70lyKvk77dWh+5TrvH3ilv40KlULyJF8KLA57TSsYBwZ/tAdALUbRCciWhW3Y
	dzCuZTp/SjAVOddzdRu5RQAzRdVhIs=
X-Gm-Gg: AYBFou3YXoaTsBOkZ57ZhnmbOM/kyN0c8eDKWG6fy2U6fV2CedogLA6/bJtcKr4pjWL
	yVb0wcxuUrjWAIb5HQVpHoWL5/408D8RpTs+vywKvS5zWU7F3jG9ijfQ6aUe7bn/ojpRy07rtKv
	yH4vHK+8cksxtvFf/NZFJXycsXbJiHYps7r1cAnf/RWgJxMEGrZQbZJN40yR+boccqKuEvu9QAZ
	tbHDxYo+R1A44rF8DYSksaqf4Etj7SNTnHklKJHHKqdaDajXv7WG0Ze7PA2rcJkNX0PVaC+3Mp8
	dRzaKycKBkA7ajcL8u5/vvQKNMKJYsAA99TAopilFm8zw/4XJ+FQBLmk/X+LqQ0xwzY0SGO7U+f
	kmha/sfalpPtXII2Ne0fD9zY+5XJ/3eXSdDqoX+ke9f8NyKRqiGNo6XAPjxBn3yR25y2W5QPPHV
	V2b9N+H5yxOUd0ZSJwc5IUcyKqclNtLd3BEncX
X-Received: by 2002:a17:90b:2dcd:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39dbc6f1139mr733976a91.21.1789169754749;
        Fri, 11 Sep 2026 16:35:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39d9d7d6e13sm341916a91.3.2026.09.11.16.35.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53033887f50so35250001cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169753; x=1789774553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TL/+G3e3u5ILLrluIyCPB8J12Dl41Ws69Qu/dHBTdLE=;
        b=QiQmA7KovzR8LvKvfrSlht9J1gOcPOdedVNHoPq6ih0y6m2zwSlu3iZiVu8cq07WqS
         RAVKCo61bX6bbQk7jPIOEs4w8YfEJJ0qNwZn2Vi/x50Rh1I9pFPXwZ7Swqv9TT/Yb+fQ
         9T9RBeu+Fau0mzhC7Yxu66nxeBNC18BsJZSUA=
X-Forwarded-Encrypted: i=1; AKwUvBw5KGhKAQg68EDabOjzas9+KsOLrqEeEaTwhygnAc9eqTzE2fx4SOkBzBM0i4UwJEmA4U2yNZF31BKUeek4H1s6@lists.infradead.org
X-Received: by 2002:ac8:6903:0:b0:530:cbf7:6bb7 with SMTP id d75a77b69052e-530e81f5bdamr6175131cf.49.1789169753253;
        Fri, 11 Sep 2026 16:35:53 -0700 (PDT)
X-Received: by 2002:ac8:6903:0:b0:530:cbf7:6bb7 with SMTP id d75a77b69052e-530e81f5bdamr6174881cf.49.1789169752856;
        Fri, 11 Sep 2026 16:35:52 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:52 -0700 (PDT)
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
Subject: [PATCH 04/13] PCI: brcmstb: Declare and assign quirk OB_WIN_32BIT_ADDR
Date: Fri, 11 Sep 2026 19:35:29 -0400
Message-Id: <20260911233541.1650895-5-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163555_753113_AEA96386 
X-CRM114-Status: GOOD (  13.63  )
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

Even though only BMIPs chips have this quirk, it is more uniform and
readable to define this specific quirk in which the outbound region must
reside in the lower 4GB region.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index bf002bcf6bd5..71ddd8a760af 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -288,6 +288,8 @@ struct inbound_win {
  * or a hang (AXI).
  */
 #define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN		BIT(0)
+/* The outbound windows must be within the 0-4GB region */
+#define CFG_QUIRK_OB_WIN_32BIT_ADDR		BIT(1)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -519,7 +521,7 @@ static void brcm_pcie_set_outbound_win(struct brcm_pcie *pcie,
 			  PCIE_MISC_CPU_2_PCIE_MEM_WIN0_BASE_LIMIT_LIMIT_MASK);
 	writel(tmp, pcie->base + PCIE_MEM_WIN0_BASE_LIMIT(win));
 
-	if (is_bmips(pcie))
+	if (BQUIRK(pcie, OB_WIN_32BIT_ADDR))
 		return;
 
 	/* Write the cpu & limit addr upper bits */
@@ -1995,6 +1997,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR,
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2003,6 +2006,7 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR,
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
-- 
2.34.1


