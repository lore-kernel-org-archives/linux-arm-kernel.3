Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8433C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsR21IG9GkhkXFxkByd8Q5sMNxfEXtOVC73TP3sSjXM=; b=NkE/hS6XAYcpr41Gd58/0MLxU5
	LbUF4WnIpTsY3M9Wz2J/HHcDAOUwo1+aKKljT3nwSvroggHwGkOzfuFhe4df2LbOFxTNwOqpqkKT1
	cqr6Z2eX2qCiiMCgyytgIP6cYEhaH9MFDBOHnJidiV7ZpLdFq4PoGVlTCoINFwPjMpho+hUy//Z9H
	hyvA1AS7Fc5sr8NMgoUuZBLHwUyScr+sWFpdPc+SV/ZGSewz7isRBe6AW47VpCtmaPXhxa0/MuHVU
	Z+E2mtJjyL141XjN4AgATBRdSPMy6E8XP5dWFNikvzl3/QEOLA884lK0J29RrXxiBD/lZAxnlaWx7
	eBWVnMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnV-00000000NMh-2hS5;
	Fri, 11 Sep 2026 23:36:45 +0000
Received: from mail-pl1-x664.google.com ([2607:f8b0:4864:20::664])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amy-00000000Mva-1Oxj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:14 +0000
Received: by mail-pl1-x664.google.com with SMTP id d9443c01a7336-2d9201076b3so6720235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169772; x=1789774572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsR21IG9GkhkXFxkByd8Q5sMNxfEXtOVC73TP3sSjXM=;
        b=Au3/IOy37vxVdHhNjSjBU5SGp5QdWCZt6fpkJug4i520b7QAJCze6zlSjtgBg7yeGp
         TzjTjf1lIoxCI5LFkh/UOxheMMdrv6cF8bvm9uddPBeesy041AWBUwyTTaWUOiIRNy7F
         PQUPwhwY0KzZ522lTci2cUKHn0yUb8mpSRAcMGACanlf2J3IlzDYjdftV/cyOSxGV7yG
         LeoiCLNmTgacbTaVDQOpm7zcDrAbuAWQjvwMYfyLjk+DI9C+cR05BPpXKLcnUlVJ2Nmg
         AzkciOhphWBzg0/OGh+YbZrgS4RyEcNwS2sIJKXua1LaHGsSUlkzpSIFZotjABW71mtE
         QTcg==
X-Forwarded-Encrypted: i=1; AKwUvBzAtsBElxnhHTiNgp1JR9sGdtbsWC1VmE7NVBh3qAWfuqKn4MGXA3RaMoVQa8FT7aVP0ldOq1sdHnheIx23n7wa@lists.infradead.org
X-Gm-Message-State: AFuF++mZelILY6K9J604n4FZ2mGc1Y62GtZnOar9IsK9QHnnaFwVBLIy
	A4dDthkeq32sMxkFCQjNMvKQnGvlh4J8tNLbky+mwzrAuVJ9kkdQiPwDuTay80U0fXXAe/TsBkY
	0N/mK+KJpb5lmqYp8k6MB/jzcJilHyyAh1JuWaFqsq7soqqZbObXvJaiAZfkNjXAOn2BiL+3o+V
	61jAYtA9iBiO72DYiT4pcsv7JcVUE1sKUiqtljs62cQ9MsB/qme/rO6mhBD9RhQA10SbSnNve6P
	8H6tefw9gCep8KqAg8ybSjqyrGkBkI=
X-Gm-Gg: AYBFou30+9eyOvBzt6L1ouPFY/Ie2A9bnThcJ/eRxhWg22QH1T5RtHMcJa2FYz8c06S
	r7uA0dUcfSlzwazpG7X7TN50ZmiHdam2dCu+fDiqlDtkzw3yiKhvVUUJ/bxC13POYXtmq7ijNh1
	qc4DSK0/ElD16Fz3kGFnuN7fmVYsTIadMnIs8/zRu6aNk3jxULIQjfs7mhAiuaukWLs8B0A4Z3i
	N6Hp5IUIwupqo6/qFrmRx3gQdwk0qYOru0jpbsLS6FFVGuS/SwaSN5bbq6rtPIXzP3rDE0rB1Gl
	RqAvH6KX7qJkmX8xculerRV2ivvuUgf1ajs7KUfocGoDYE4nwQkD+UKbQ/KoUN6rK2ykU+AmNuw
	icvPnjCefQjZCU3WgdN1y5LguyFOt7qqjXWYVcEX7Avhi1gnX5If5woVlDUYZehbjJYBRcy8yLW
	g3f9gymoI3Hyqy2JAy1AXGELSdIhsG2mG1oCWg
X-Received: by 2002:a17:902:dac5:b0:2d9:2fc9:5706 with SMTP id d9443c01a7336-2dd2a1c6757mr116143485ad.2.1789169771623;
        Fri, 11 Sep 2026 16:36:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2dd2cfcb322sm1954605ad.13.2026.09.11.16.36.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e8135d7eeso23263136d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169769; x=1789774569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsR21IG9GkhkXFxkByd8Q5sMNxfEXtOVC73TP3sSjXM=;
        b=UyVmIDjJIXaeHx98XST3tMhLYjL9vSOlG340QI+jg9Cf+3wSFgNESbgaRPNeezjS4n
         mWSOHalaBN6UpqwrXFDSFjBMdLsaizFRzngqZIra5kv8fSV4Sl553SgXO22C2Rz3/5A1
         Htgo1yh+0h/lAI1j7YT4NWENeP0XliH3eTcmM=
X-Forwarded-Encrypted: i=1; AKwUvByRAT/iGiHEg8KBeF4Vd34UR0Xyd35HD+xZ6y84Jfwgrqw2xOnS0/4PZXBxTc9G3dOZNREEAvM+j5HeFcYShVGV@lists.infradead.org
X-Received: by 2002:a05:6214:daa:b0:910:321e:2ebb with SMTP id 6a1803df08f44-91212086571mr95943086d6.8.1789169769059;
        Fri, 11 Sep 2026 16:36:09 -0700 (PDT)
X-Received: by 2002:a05:6214:daa:b0:910:321e:2ebb with SMTP id 6a1803df08f44-91212086571mr95942566d6.8.1789169768577;
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
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
Subject: [PATCH 12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR window array
Date: Fri, 11 Sep 2026 19:35:37 -0400
Message-Id: <20260911233541.1650895-13-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163612_609002_520F3F05 
X-CRM114-Status: GOOD (  19.60  )
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

The register names for the inbound BAR registers use order-1 indexing,
e.g. the first is BAR1.  The code followed this nomenclature by not using
the 0th element of the inbound array.

Undo this approach and use order-0 indexing.  Also use a struct pointer
variable in two functions instead of array indexing.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 49 ++++++++++++---------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8bca98e6f5fa..53984cfa2c96 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -954,8 +954,8 @@ static void add_inbound_win(struct inbound_win *b, u8 *count, u64 size,
 	(*count)++;
 }
 
-static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
-				      struct inbound_win inbound_wins[])
+static int brcm_pcie_get_ib_wins(struct brcm_pcie *pcie,
+				 struct inbound_win *ib_win)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
 	u64 pci_offset, cpu_addr, size = 0, tot_size = 0;
@@ -965,13 +965,6 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	int ret, i = 0;
 	u8 n = 0;
 
-	/*
-	 * The HW registers (and PCIe) use order-1 numbering for BARs.  As such,
-	 * we have inbound_wins[0] unused and BAR1 starts at inbound_wins[1].
-	 */
-	struct inbound_win *b_begin = &inbound_wins[1];
-	struct inbound_win *b = b_begin;
-
 	/*
 	 * STB chips beside 7712 disable the first inbound window default.
 	 * Rather being mapped to system memory it is mapped to the
@@ -980,7 +973,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	 * SoCs.
 	 */
 	if (pcie->cfg->soc_base != BCM7712)
-		add_inbound_win(b++, &n, 0, 0, 0);
+		add_inbound_win(ib_win++, &n, 0, 0, 0);
 
 	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
 		u64 pcie_start = entry->res->start - entry->offset;
@@ -997,7 +990,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		 * two.
 		 */
 		if (pcie->cfg->soc_base == BCM7712)
-			add_inbound_win(b++, &n, size, cpu_start, pcie_start);
+			add_inbound_win(ib_win++, &n, size, cpu_start, pcie_start);
 
 		if (n > pcie->cfg->num_inbound_wins)
 			break;
@@ -1081,44 +1074,44 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	}
 
 	/* Enable inbound window 2, the main inbound window for STB chips */
-	add_inbound_win(b++, &n, size, cpu_addr, pci_offset);
+	add_inbound_win(ib_win++, &n, size, cpu_addr, pci_offset);
 
 	/*
 	 * Disable inbound window 3.  On some chips presents the same
 	 * window as #2 but the data appears in a settable endianness.
 	 */
-	add_inbound_win(b++, &n, 0, 0, 0);
+	add_inbound_win(ib_win++, &n, 0, 0, 0);
 
 	return n;
 }
 
 static u32 brcm_bar_reg_offset(int bar)
 {
-	if (bar <= 3)
-		return PCIE_MISC_RC_BAR1_CONFIG_LO + 8 * (bar - 1);
+	if (bar <= 2)
+		return PCIE_MISC_RC_BAR1_CONFIG_LO + 8 * bar;
 	else
-		return PCIE_MISC_RC_BAR4_CONFIG_LO + 8 * (bar - 4);
+		return PCIE_MISC_RC_BAR4_CONFIG_LO + 8 * (bar - 3);
 }
 
 static u32 brcm_ubus_reg_offset(int bar)
 {
-	if (bar <= 3)
-		return PCIE_MISC_UBUS_BAR1_CONFIG_REMAP + 8 * (bar - 1);
+	if (bar <= 2)
+		return PCIE_MISC_UBUS_BAR1_CONFIG_REMAP + 8 * bar;
 	else
-		return PCIE_MISC_UBUS_BAR4_CONFIG_REMAP + 8 * (bar - 4);
+		return PCIE_MISC_UBUS_BAR4_CONFIG_REMAP + 8 * (bar - 3);
 }
 
-static void set_inbound_win_registers(struct brcm_pcie *pcie,
-				      const struct inbound_win *inbound_wins,
-				      u8 num_inbound_wins)
+static void brcm_pcie_set_ib_win_registers(struct brcm_pcie *pcie,
+					   const struct inbound_win *ib_win,
+					   u8 num_inbound_wins)
 {
 	void __iomem *base = pcie->base;
 	int i;
 
-	for (i = 1; i <= num_inbound_wins; i++) {
-		u64 pci_offset = inbound_wins[i].pci_offset;
-		u64 cpu_addr = inbound_wins[i].cpu_addr;
-		u64 size = inbound_wins[i].size;
+	for (i = 0; i < num_inbound_wins; i++, ib_win++) {
+		u64 pci_offset = ib_win->pci_offset;
+		u64 cpu_addr = ib_win->cpu_addr;
+		u64 size = ib_win->size;
 		u32 reg_offset = brcm_bar_reg_offset(i);
 		u32 tmp = lower_32_bits(pci_offset);
 
@@ -1202,11 +1195,11 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
 	writel(tmp, base + PCIE_MISC_MISC_CTRL);
 
-	num_inbound_wins = brcm_pcie_get_inbound_wins(pcie, inbound_wins);
+	num_inbound_wins = brcm_pcie_get_ib_wins(pcie, inbound_wins);
 	if (num_inbound_wins < 0)
 		return num_inbound_wins;
 
-	set_inbound_win_registers(pcie, inbound_wins, num_inbound_wins);
+	brcm_pcie_set_ib_win_registers(pcie, inbound_wins, num_inbound_wins);
 
 	if (!brcm_pcie_rc_mode(pcie)) {
 		dev_err(pcie->dev, "PCIe RC controller misconfigured as Endpoint\n");
-- 
2.34.1


