Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A8608762B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aL34OaHD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YMM7/68V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=; b=aL34OaHDdqQVsZ
	VNtl0fWZlKaZiO2EpsKUgwmqRVDzltg1nLd6SiQdI6I97TRFUjbiEOWJU3Ywh8J9UHr8DbkndlgXB
	y+vB7vp8MVXqIlvIkHlbbtLYHp/r/RUAPEsKZHLoKJf12BPd7127362ykprz999qkJ26sdvSHR1dw
	Y2Dkptw+pjfrx/9bQgU8iu3sBYfKwiZi9/Drb7ZTnCKVxEAXDCvQFOaW0M9nFN9hCepOfWybkyGmT
	7LGZnhKfqmR5vRtaW8/Ml5cD12Z25FhLV+98ajLJec56TN/zzd6a9wNm85Pp4ZwQzkewziKxcLaR8
	OkopzE40AorFXVRByNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvgd-0000000HQj2-3ybI;
	Mon, 02 Nov 2026 17:19:11 +0000
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvga-0000000HQeB-1nWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:19:10 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-36a6ce64b95so694298eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639947; x=1794244747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=YMM7/68VbT1UEh3KlbI+eoAMet5menRrfPuOuMua9ChWmWdj5u9BXOcqiZsAkf1+Mj
         cOLQsqV7nZmmZAB88SjX+ptve3lwMQ+jAmpr23yl0f2upPFG2gakoOsbAF5dgbtHSghq
         WjmnaILoHEpSNXdf4JuWTC9MEPrd8LH68eiHI7TbJaIRFQSYd3yU1P/H4DaSXUkE2BPe
         psJ98a88S8ISuyCDWlzhv2Z4RxfNrzOydXLQTkDYVBZUUxLNcbnaKgCyVNKfRwLkkBfr
         dDCvvV07wAqacUIPTUik5w+0Q6eYKXjTeWm0yWHT1RmabjFDRfGu196zFToR0bDqFKc9
         7pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639947; x=1794244747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=SOYZNFDgscUZ5c/bQLUnxSLEcbtt1Etie606Ywc9kZaHjyr7t+w9x5N/4CchLO6UKJ
         ztLeyGdvBl4a3o6cp/GFVnLL26QQhmeJxDhr09w9wwOUIJ7L3wa07DYHJDJFc2Wtsxko
         x/DztTxh6ApD1FwlE+08HTWQhRBurQDUiTsS76fhgScjvznZC1zQ6wYCs9CiTxfbehGf
         5ZyPbniA+7r3p7n/ttI96kvEFWVTUQRwGs0zcqkmxWBOjdxIApP2ymceVD70RZji0gvk
         xazEveSCoU1WV6pOeLrEm4BRnX8hFbc7j6/WGOXyONrt1rzwMhvlVs97AG4sciThl38W
         7MOA==
X-Forwarded-Encrypted: i=1; AKwUvByPbizlBjEaaxiISD3PLIBos8cesI19pMYeOoji/opjwycD+rC5jiLbjqGF90Nq6KK47ybaaitECpfO+jj5f3gy@lists.infradead.org
X-Gm-Message-State: APuU4Z/mdW8hRrsPnQ+ZoJRemnXpNvw6d5ETZG9nDzNctgNWPsEgiIW6
	s0tUuYHkMX7W7hgBgo0AWK8vkxJVzUBybaekf2QbR/cegjJ2nz1wng4S
X-Gm-Gg: AYBFou1RiLAjz1KWWoTth3ndgZoufa8oA8cUGnjPtsfvswcg9TABu9i0upOFF0L7rBk
	TvN1X/4GUIInw16SvPaE5rkvr3DJ2rDQaCuIEy8ZPzHEyrMMU/vAubwZ8yQcqKlGKIbr2lryOt8
	JGFhtL2+06WtKoP/PodeXMwR9cWMg2F9Sfe452Uc7Xe8oBzkjaqDrRis1k7RyyttdDh0ra2L10d
	GOGc6asTGIYS2oMiqsXFoODaW7d+gv3CKYcKhcjT0VjgKHsNsfIlC8tm7Tw/XdneEjFBBhbWrmf
	OWiSfqEd+mgteeRUj6G03EscFWkImrK9SkA9upNPpEGPcK1NDKRxgPnX7Q3mhlqfqmmStPblzWC
	AABkvQLGpq7MaOoDiF0Vf5MxN2NJwgJ2W3/SLOK9oty6dUQ9UQJoULeFfd52HHj2/E/fn0HhRP4
	ykhx11GdfMfF6uF4yiftz1D78YSXTO1aFmBhn7MOyKxdvG6R6q6X2hsCSRSkYqjLVA/AfVhze/f
	FvYD0Ixfi2I6XBjmMlqvggmlP7LkrOVWKBBDOh+3gmPQtwg0eXqNfM7ddKmJf4aUkIDNa5oVDXU
	RXnmkW/c/PU0kwL4H/3N2wrfW3c=
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr15445128eec.26.1793639947326;
        Mon, 02 Nov 2026 09:19:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm36978047eec.19.2026.11.02.09.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:19:06 -0800 (PST)
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
Subject: [PATCH v2 3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Tue,  3 Nov 2026 01:18:35 +0800
Message-ID: <20261102171838.2958552-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102171838.2958552-1-coiaprant@gmail.com>
References: <20261102171838.2958552-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_091908_469128_06D43AFF 
X-CRM114-Status: GOOD (  14.04  )
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

Both GMAC nodes rely on the internal 125 MHz GMAC main clock, but
neither pins its rate explicitly. Add assigned-clock-rates = <0>,
<125000000> so SCLK_GMACx is fixed at 125 MHz instead of whatever the
bootloader or the hardware reset left. The RGMII speed clock
(SCLK_GMACx_RX_TX) stays at 0, since it is managed at runtime by
rk_set_clk_tx_rate().

For gmac0, also switch clock_in_out from "input" to "output". The port
uses a fixed-link, and there is no external 125 MHz clock feeding the
MAC, so "input" described a clock source that is not wired up. Note
that on RK3568 clock_in_out does not change the hardware clock routing
today (rk3568_ops has no io_clksel masks), so this corrects the
description rather than the behaviour.

Fixes: f901aaadaa2a ("arm64: dts: rockchip: Add Bananapi R2 Pro")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
index 4d3ebe50b90ba..677b6261a3a1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
@@ -206,7 +206,8 @@ &combphy2 {
 &gmac0 {
 	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
 	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
-	clock_in_out = "input";
+	assigned-clock-rates = <0>, <125000000>;
+	clock_in_out = "output";
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_miim
@@ -232,6 +233,7 @@ fixed-link {
 &gmac1 {
 	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
 	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru CLK_MAC1_2TOP>;
+	assigned-clock-rates = <0>, <125000000>;
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii";
-- 
2.47.3


