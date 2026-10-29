Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivULLceu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MprXq4RW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=; b=ivULLceuGa1iyv
	DgdCG+ah0GAfOdB5lQzeWxxBoW0PPARHIfy5oYhPpYDGUFXDnS8NvC8z/CxOXmMzkPlEddXMiQxxj
	PsFxlW3refHOVyEAOkH0uLSwDuS/DStpcqyWljcLaMBrhlyydtxHtd4DW7RLLWdO0Gr5xl6vhHCNU
	HjT9Lj8c0GESOPshz43dnO9nFwiWjvToSCW6f+cupgy/Cg+KyzBqQLKy+JPKqDW8bZZ63o/7Ho2Q4
	vcfRkYCVBpSuaO8BX2UABhXhytQ00m+JVjrjzh9n2QNnpLA4ygxrJBWCPNJWh2ShU3Qor3qsT1riW
	HqJ7hlZKRx3Y8Fna3Xjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTrD-00000009xs5-2Xk6;
	Thu, 29 Oct 2026 17:24:07 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTr8-00000009xmk-0JVl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:24:04 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-7cc0892f92cso853149137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294640; x=1793899440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
        b=MprXq4RWUmmLmzzEcBOKSVzosphkhi89sTVG+q5pAshSs3RJOCIsrFL1t8ooeAqTK5
         aDG37O6USBN3jVYnF+HiRfn4jT1JBnq3s8cQBojXPEzNrUZNZN5mQz+JlGDJ8dR8CWrj
         RFWZdF+du9pma0Tk5qHRbz40ppL+X/2IJ0CncRJao4d5t/iUIkTIsQRWQoXQJH4Cjlh4
         eDI7u9Ars5D5UUsn5Unyx3EujoN4TmVbGH2+X3x2vE7pAX/f9gtoEEMPNE4AMBHl5lRG
         k9ItVH+h0gGQTRIDtE4Tep6PlnpRGS7p6XmvjqvZjWCeysdk0y19RXDQGEo6YSPe8ENe
         jJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294640; x=1793899440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vlmh38oDhVKFUzUtt9cRV3aHc0FM1WeWFLP0ZtSzi/k=;
        b=gapFjq51qWCm+Q2sc0NiImkal/Enq7uQuvQ0lCszSbsvUF0YWmfafJGLmbe4XOGjJp
         nVIZQ+kpJoBFrA3u73O1bcxdlme4yMBAfyvS77+BI9lGzYmK57AepCTlJair5EuqdVoz
         +pub9PULm9Q/Bl6QMZAXsm8+sAMG/NX9dFrdls6N8XtFuiQSNTkID1S67zvKFJLu6S5J
         wuWUEnv1Gn/qo+QCc65P1VDaLSWSbThpi/WOq0MQyDJF3kEa+GCNNwrAbRn0O57+PiRN
         O26fst1zE329etKfCsbFrhFyuFaHnacAnsOB2ul6TX/Dg7ZFbQwrUKgNtQ6oFC6/kyjC
         gvMw==
X-Forwarded-Encrypted: i=1; AKwUvByJFP5dmgqxKm2rkvm7dXlBgGPUdvQ761GfbIfWdHhSQmkF1XyeNp2V9BZglUibbtfl3VjvjD87o3PMp5z5dWVC@lists.infradead.org
X-Gm-Message-State: AFq9FYL58fSfuCDpVTS8IYydjP2sdVtt2e/4sCbztmSAZPUDlUxl1kF0
	HgEnO4SRyWwGavOw8eoGNDw9MST76zRqps9ocZd9/J3w3HcfXSSW5bNO
X-Gm-Gg: AYBFou29UOfSnQkwY23c9Gr/vG3+ijxA/q9bvBLKYUJaqa1w47m7K5XAS68lPyL81cw
	fZjaWTVssDSdZveXixfeywkE0cAVmV0PL0rh9gkkm5aZEQD5ql8gw+rfhpqxWG85BplcWTci4oU
	mNz/LpTFcbUxq0wIQg939tDWp2iaF9Y2F8wMbttkl10JIes0GEOZoXtbKvMzeDh2kTxALsDnLoX
	jChhRLUXUhX+tcqs8WWpoDJjKNrdmFRyV/B/hXaBaHVoGlTn21r8sr/Sw3AQnsT2JaTvHnwzVjk
	sAI/lz+tUlRinSygLzz2N52FPAvIcRSIIwSyY9YjigqUh6HxHFwDuOKh/X8TCIN+M+KV1utlyC+
	A53kJwmlewrfNenc0l38ix7ovWexYn2w5+oxuZ8jr5Ln9ngc6w9GV8XBE75OqJ1obQTxCspU5pQ
	bF6V/BdyywjldFDYUgKGjFzGU9EX6kK1VWXH2OQByGyuerLgPOW87dbumDQCaufDVzyVysX0spm
	9d1mLV1mXKrNktaw5APa4Z3rSXs5DUxAIXMzN26ENnn66KVPxuHZwssi5s471/gMOHIy9220357
	eedIW/byXWVXCKpBB0RJCkTAKa9DMEWzRQGbufxGzBfkHU/lByAX2u2fvXfo0OOzK4RDvdRXTvE
	dfQuY02SjkEABw+EI6ubSq5di7h5x69V/0dCf
X-Received: by 2002:a05:6102:3e8d:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7d03a50a85cmr2383203137.7.1793294640169;
        Thu, 29 Oct 2026 10:24:00 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:59 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: sun4i-usb: clear SIDDQ before the PHY reset on A733
Date: Thu, 29 Oct 2026 14:23:25 -0300
Message-ID: <20261029172325.3425046-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_102402_682839_0E0AEECA 
X-CRM114-Status: GOOD (  19.30  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sun4i_usb_phy_init() deasserts the PHY reset first and clears SIDDQ in
the PMU HCI_PHY_CTL register afterwards. The order comes from the H3
support and the reason for it isn't documented.

On a Cubie A7Z (A733), the Wi-Fi module on USB1 sometimes came up
at full speed on the OHCI companion and failed enumeration with -62.
This happened in 3 of 40 warm boots with a separate local PHY tuning
change applied.

With that tuning disabled, the current order failed once in 31 warm
boots. Clearing SIDDQ before releasing reset had no failures in 60
warm boots in the same interleaved run, or in 10 cold boots.
Why the order matters is not understood.

The vendor BSP clears SIDDQ while the PHY is still in reset, in its
common host path.

Add a config flag for the early clear and set it only for the A733,
whose config is otherwise the D1 one. The other SoCs keep the current
order: the manuals don't specify one and they weren't tested.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 35 +++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 839856c09e30..4d067d97c5a6 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -105,6 +105,7 @@ struct sun4i_usb_phy_cfg {
 	bool phy0_dual_route;
 	bool needs_phy2_siddq;
 	bool siddq_in_base;
+	bool siddq_before_reset;
 	bool poll_vbusen;
 	int missing_phys;
 };
@@ -253,6 +254,19 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
 	writel(reg_value, phy->pmu);
 }
 
+static void sun4i_usb_phy_clear_hci_phy_ctl(struct sun4i_usb_phy *phy)
+{
+	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
+	u32 val;
+
+	if (!phy->pmu || !data->cfg->hci_phy_ctl_clear)
+		return;
+
+	val = readl(phy->pmu + REG_HCI_PHY_CTL);
+	val &= ~data->cfg->hci_phy_ctl_clear;
+	writel(val, phy->pmu + REG_HCI_PHY_CTL);
+}
+
 static int sun4i_usb_phy_init(struct phy *_phy)
 {
 	struct sun4i_usb_phy *phy = phy_get_drvdata(_phy);
@@ -270,6 +284,10 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		return ret;
 	}
 
+	/* Some SoCs want SIDDQ cleared while the PHY is still in reset. */
+	if (data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
+
 	ret = reset_control_deassert(phy->reset);
 	if (ret) {
 		clk_disable_unprepare(phy->clk2);
@@ -321,11 +339,8 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		clk_disable_unprepare(phy2->clk2);
 	}
 
-	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {
-		val = readl(phy->pmu + REG_HCI_PHY_CTL);
-		val &= ~data->cfg->hci_phy_ctl_clear;
-		writel(val, phy->pmu + REG_HCI_PHY_CTL);
-	}
+	if (!data->cfg->siddq_before_reset)
+		sun4i_usb_phy_clear_hci_phy_ctl(phy);
 
 	if (data->cfg->siddq_in_base) {
 		if (phy->index == 0) {
@@ -1013,6 +1028,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun60i_a733_cfg = {
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+	.siddq_before_reset = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1029,6 +1053,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun60i-a733-usb-phy", .data = &sun60i_a733_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.43.0


