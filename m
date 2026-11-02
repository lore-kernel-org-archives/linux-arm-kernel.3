Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC66087625
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pK1xeGfG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXIva0RF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=; b=pK1xeGfGdg7Kdp
	45IreHVI8Re2qLLZEQWpORGQAdy0/uHRvWw8RDg+tLvMUUFCqauy/hmjZWBvIM9wvbc0leJbUkYMC
	rNLWGXW1YA4mhS7NohzOUpgUvZRpR0OeaU+NpbBa4xs/Vs5lba3kIVr8R8cd/+Bo0spFes2P0g6Dp
	LhreWth5paYynslQ4c7o9+Q+kenXn2q5/5J1hv6OzgbThWgvtrD6Z6EsVb2B7K9RHjpBom+YPQGie
	Fs+dXuSVe8JGkpB4JsSsscFMQdZ3BKRgSv4b5+6Eo+YPqzhKGUp2c6tDDdUeik950rQaChVpoSjYH
	7hci8GFRm9c+WQ9BVllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgb-0000000HQfa-1YWk;
	Mon, 02 Nov 2026 17:19:09 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgV-0000000HQbM-39CK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:19:07 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-3535a54c09bso285639eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639943; x=1794244743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=YXIva0RFYlBD5DsEK1MdW9bJ8EELG+q4wG0qT45zpx3W9ntse1MGq9YaQxr/MRW9Sz
         Xblf+aGi3drXpCBCIp5WupddL+1UwDSS4ZcYd88j8XNkoHuB1KjBb18BMGU0XE0rr+8B
         CUkyNl0rrhaySH5ZmwQ01nnGO34EvBa3mk3s/io/cHzcXkgMD94eiHDtmPxFi925rbAD
         lcKWWh9IgPU2fJWSvtTJLOm89ups3wiwMWZ+NLyJ/tOG4lq5vn98j62ilEbaLcS/3N5X
         pJNOxRZtxRjbWgBlinesqzKcMGktk84MkTM9CzUjLp2MTxUk6JiI1mrbwrY5lSH0MLas
         HcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639943; x=1794244743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=Y1KAcfQfjG9NCk2Ow6ssfCks0CxoWJi2qyEDR9R2n+jOIyOdKbFkJyVCow/XBKjOE2
         o1BNVUeKb86LIM+ehB+/pPzOcetKj3snNqTbfHwsKnjV5jETX0NTqvVF/phq91UCL+3Z
         sYTptrc8ZC3qmJ1LUP21XqrJsrNYXfnLFWtLiJhn1ODKiYc6/uu4BeD2GhjUdeSs9xfk
         Mr9qlS+etWtbX39wV9P/jZfaaU8ZMRdQfZIXT3lyMsLt4dpsaBrnCysYZE2dJjMOTVF3
         tpzfkiEor2jXgNqJptdojEPu3QvHyp8+kBTn/zbWsfXgmENYajokWD9D/OQK0JLd9DzP
         yzqw==
X-Forwarded-Encrypted: i=1; AKwUvBzkh4+Egv5FXLBfcxwuvQW7h+bjGRReDWBW0b2XEpPI03q4pwReQ251GGP+IkiyZ+PTVw6l3nkhYX5yZkVh+BL1@lists.infradead.org
X-Gm-Message-State: APuU4Z8rY55VXjETDXsbP+Ruw07EHohtc/ijxVfbDrd55Y2gOkMyFJzU
	u/vXycGokm3FWHCjfDnz7ttuPVGwvLRb7slF42u2FMLDYllGrfX69pld
X-Gm-Gg: AYBFou3gyh92qn3VnxiHnBLr6nukOAkRMTh7q1D8MrhbeL3DMFTrh7F29ebqweXshBg
	UpvpSLp7pv7bGEVY0JuPa0DJv99VemwJnlusiO4xbEuNnRi+uzwe4x3WALwOyBZvl3OOq4IBAJU
	LAUvNBbQKfIXAgEswa1IQMzvO6Cz9VVyY5nNIza5wvvT/MEE4moWAxMpBSQoewKNXx/4u0TINzO
	kJkEf6+orkyZfwEGmWgT+NX2711bjUg41p8F/21xPm7BMMM34OG2a4+oDx8C6WgAZcG9GL3+R+/
	OMOkVcwdA/wM8fn0MjaFBGnxixek8peJ/m/0Vxm5Z7jX7nyQUCMmYJOV8N4Qk6BB9LhNrrdWaub
	zszyaibhnsoQEs9sswzq6zYK65HfApueMg8JWEX4yMcZVm2Hqketvqn8icuBGX/FrY4PB0kn02Z
	ZCRNCo/9ekvWEwVPRFmlR19nWydOItGMj6cztVtSakkg4cSNUNOeivBVmvS/r8JH69Fb3C+vRAS
	Gk6N7TgwB5ib05HLlLStBImCjVnyfOmPiHamSMDGzCMHE+XYbN7Unjf1/49OhzpY73g6aId5Nt2
	VB9cOfteIIgwEn61KMEr5Yux9Xg=
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id 5a478bee46e88-36a423bf83emr16230795eec.27.1793639942982;
        Mon, 02 Nov 2026 09:19:02 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:02 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v2 2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Tue,  3 Nov 2026 01:18:34 +0800
Message-ID: <20261102171838.2958552-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091903_873604_92AA1468 
X-CRM114-Status: GOOD (  14.27  )
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

Both GMAC nodes list SCLK_GMACx in assigned-clocks, but only
SCLK_GMACx_RX_TX gets a parent in assigned-clock-parents. SCLK_GMACx
therefore keeps whatever parent the bootloader or the hardware reset
left, which may or may not be the internal CLK_MACx_2TOP.

Add CLK_MACx_2TOP as the parent of SCLK_GMACx explicitly, so the GMAC
main clock always comes from the internal clock source and does not
depend on the bootloader state. The rate assignment is unchanged:
SCLK_GMACx_RX_TX stays at 0 (managed at runtime by
rk_set_clk_tx_rate()), SCLK_GMACx stays at 125 MHz.

Fixes: f296bb503a24 ("arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
index 4c55c7d211599..07cfc68b5f91b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
@@ -280,7 +280,7 @@ &cpu3 {
 
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
-	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
@@ -296,7 +296,7 @@ &gmac0_rgmii_clk
 
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
-	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
 	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	pinctrl-names = "default";
-- 
2.47.3


