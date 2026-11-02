Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC89F6070CAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMb7Uk9k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mr8NRHZf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=; b=rMb7Uk9k/7qCVb
	mgdh41n4Om6aQdkoGCnFe0PyJD6KcDYmupD+ANSkQVtGDvj9jLez8I00/LOkFjR66lam4vXWiWTwR
	O378RBVdsHm25o+fYtmyWlxDEXyYhVu3RE+yvXHPF+efy8vtQARazSR9pYD9qIo+tA1gilUdQ211F
	6CmMXz9fTuI9ZbDyFkFyV986kINwPO4OhjUe1nkBJ3yhNXZbO/Bcai+kDhBM45/vugu3r72tHI//Y
	u3Q41RSFxLH4xd60psDxtvWPn+4MsLRjiZuGewJYfwJqsHw6IP9uYM3tECt0n6msseP2U1BIi1d4P
	aSdcGvR9fSKUjQfusBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5q-0000000HVJK-3DGE;
	Mon, 02 Nov 2026 17:45:14 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5o-0000000HVHP-2hJo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:13 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-36a2551d7b5so5367826eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641512; x=1794246312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=mr8NRHZfBYXEAvvFYN02pfiJk0JfsSFLkXNz9rZHP8gyMWWqfGny1DPR1Iy7mEK0B7
         dXKEmzWiZYf++fq0OrRibPbEVBToJr7R8eM4+EjWQSVjEahiVPx4xppIih9UmzrHA7Cz
         VI+9hc1NhkGPd0Hk9BNDuSGuqbW6RaBr/EX/oAxDFvWT6gbzZBXI141ZCvXIay1ICZap
         Zkt8KR4BKpR6+x7uj93gKvcYzVEyETO3RFbpvYSSSFvIbgRAIzmU8aHNHiR0VM5OjdYD
         gNIvzawmLzItfx7omDVyFjBAXhBjMM3ZmOzKAbJP+G5R+alFnKG6OvNOp/ZoIFRepbMH
         FqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641512; x=1794246312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=1S2QB4Nmdoi1aSIzkFzVV6Fj1bLqqJoQq/s3VWY7cghRFXvrjHY350FqMznpfL91iI
         izf1c2LW5mtvpIw2LCznWv+evhyuORUFRlF/G8L4+Y+ux5rG81Pxnibg8halkLSEhDQy
         7G4Tt55ReTq9hzj4nR7KJqyvKbWi9u8rFNC1+BQu5SOONJMsQC6SggO4FhcjZ9vIoXJf
         YEJ/H13cfYH0ecoBMFB5XZQtufCIUbWFECuH1JFQ/gMI9C8WHlNW0dqO4L2AJHGN+ZEu
         rpR9cUM45Yn+iawfkQ+0MvRuPioE/8OYO46EQwQMjVmkWqGDNCRkOVpVGT1eICryqqOu
         nxJg==
X-Forwarded-Encrypted: i=1; AKwUvBxV+xS0Q1g9qkZJ9xbAdToVOhA5LINN6aVm/YSMNHo9TrX9KNzIZw8+XnuHzb1oxc6o2w2WaYsIv0+fyH7j1XfS@lists.infradead.org
X-Gm-Message-State: APuU4Z+F10y7uQVmg344Zc7SMVTjGlTrsmKwV8xFVG0PzVVSSNJ3V7Wa
	HwVzlp3FZfMRN+gt4iX+M1sSkIj7U86m3wpq4vEJsF/ra6GkaAdurPPK
X-Gm-Gg: AYBFou3uVVYFk/a3lgqnKOjeNb78wkeaTKjl1pkZ/r2k8vKaTIqYfU5r9pzvr5dmp3r
	HVfCzZz0wF09C0oMQuZe0yx7fJRraK1MSDfAMmGufwI2Tcw0PmZtLXSJwAPw8EbAcW9swohRoHm
	pbM7eoSVGP9E9oGzKk0RTqYRBFBzvxpymhAwJMNN2wwSgb/hKaAFR6rnSLpZRDZiUuPzZelo3/h
	VKleNzycsqSpPGT3oV+mqXaHt4PhlBwLMHiFCQ9cx1TfjkJdUIO/b8LtzVj8bs0WPlOd/I3uoLI
	0stFjpuCNFioV9qez///OtudZTk73ds2n9IM7AhfEX1nj7J5It3OGZIR3LmPjf9ZNEydzjJuHBw
	9x/vHnfLZtty9Agqbcov2T7Z67G96KmMzXi1OB5tECo8z/EwAy1SjZofGblKZnoG1wtFMTdSUr2
	F2PBmmWRJlk9Zxs6ip6VN5d3PsvsSMHxlpeJh5nBImmdEDdhEtR5flK7NE3BAN68aDBZ8GALdhf
	8qw7xn6PbAEPX+z4uPK5Dzy98mbF7XAaSJW6mwQv6AQGjaYKMI7MGAjfHjv51W+WfDlCI78OQkd
	aM+I0KLUTMwfurTKGdBk1KEFGbY=
X-Received: by 2002:a05:7300:cd91:b0:369:f231:b98f with SMTP id 5a478bee46e88-36a300084d3mr26330619eec.4.1793641511478;
        Mon, 02 Nov 2026 09:45:11 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:11 -0800 (PST)
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
Subject: [PATCH v3 3/6] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Tue,  3 Nov 2026 01:44:47 +0800
Message-ID: <20261102174450.3000397-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094512_703001_87921E8D 
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


