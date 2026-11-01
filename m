Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2BB60A260E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=31/EhUvd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2OvA7wB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=; b=31/EhUvdXzhcrI
	qdEiOzlxkeHBg3zOZjYfxTmJvMvhrvITqn6zfW3ytX67SIbAyNyQEhP0uEdx1isskLb1Nvx8gE8KB
	y4a53R2TPwL1KJ47L9C7wH4M/YPOnblkgOZ3jmDDTEkZiDr6UT8T3jF2QAxUrZ1wspO+BVfTvYOLP
	jHC8i/+EofwFN6wPuNrKd8sCPcj/QtAwipQI+WWERAWg55R0CrQGNuaF32UZjaGyeAjc4tcu1aK2Y
	APbKLZZ30hsn58FzJuYoWmnFcIbPTV730oeUNbzVqQYT3H6zDtAKurR1g6brt9gnSaauqhNVmwkKc
	h57qw31NgxNluQNH99uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFU-0000000Eond-1oon;
	Sun, 01 Nov 2026 19:29:48 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFS-0000000Eokz-2tGn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:29:47 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1059225eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561386; x=1794166186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=x2OvA7wBDd+htpqdaoRM54uULJFTzgo3V/OycM+y7eKGCtT9k5TadqBlCSJmTTImY/
         53Ct4mqq1oozC910YAYgeo9YyGc9V6omtjPSoDn9ihQ5nogXyZyTKffTDyaFzsc3izo7
         y0ZgzB5BAl1cgrFGfHZUxlzsF/IaG7zCQbcW2wsZXLDdRZcDqQ22irkppniljjl6MO0D
         p5CwopN6KI82RYszzyOyhR3BdlwI2u+PjXvwc298I4H8oZ/sNBfOHwoKRFugEnjHlOf6
         oKN9gTGyez4Imq8ROXiNb+yfsw58/rnJDzhm7qjrWQjlXEA0BDhnZUnzaVrpL4n9gE0H
         FW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561386; x=1794166186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1QXiP0o5CtQwTzziGzPYfpYOgoBAHOCYb3Fgk/Di0Jw=;
        b=KF9jsiWDlRToxKTq4UQ8BWS5aC1EAfxQzlPZmIh02DCeKJ74NxAGJzxPGTAlPvyj5M
         ygDCFw65iAXRDppgOrt8rJgRuHJ4cluQT3J4DMrat4jSynrIYGzxr+h/+x8yLwG1ZG7F
         aC862dI8PJQzyRTdtBEv5HQ4qx1/skBtp+JGwAdQKup8BzHE8TYLkIJKPV0OMEJLU6Ne
         hDzO97do37cPAFhlFtwF60bZZfVG+PAXLbKIFMEncujkWXS2MTWnKs8PIk/1v7xqrbY6
         /7/WYOHPqit41H72wMzuyHsm9x0Bu1iAC2bz5OXLCWFp32DoqkGn+PWGbI2kBlUrffzA
         5ESg==
X-Forwarded-Encrypted: i=1; AKwUvBzGodAxE/0dfdA5XZTP7iODx/C+hdNE6LIXlDASIiw9YFlYFhujAH1je+GusvlPguhmztiia2WjsgFnKksTiGoJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/LrUrhqtt6ghFq4Vi/93/Gm7QEcfTd0WmmEbWo8BuvP15Z0QH2
	iDeb8WD1x2aDY6UDKoWKnqHJ3DVRZSREfQVFZtocLnsLgPsy8KLiHsfY
X-Gm-Gg: AYBFou08CBymld0RqDABDZ8CPxP+M2h5Ls7zph4TMiGSdLW2gHtAV7LlUtp5sMmGeDK
	2Y9eywnUbySv9Bf4e7Dyssw438h3HGiebHwKS35DkT2Map1wlvZcUEZvVCfHslY7a68H9/ABB7O
	aMVQ+tT12IOAgLTvt7GuLoQhheMf046iia8M1vWd6JaT13rqZPwLBermnnyzjzLBS6geYWKzs5F
	1GIoHk//FN5zqb4uv8jipq7MQ2YwSenyP2/GpYkaSGHCLK6OhMWvo4KcSnSTVWRsE5Dlcsa/peL
	mfFzYEpbm2kRGP9dYNTB3KB8XhzEOr9n+cjHStjrid3Xb2P6OitoDA0HVrDU5xV4R+SEJHfDs0b
	OIwANl2IctnnvItKrLzZMrs6g4nBa6vAEL73xBCAjM/sCdNJU7rrKb3kccZVdu281L/IWdSRzw3
	+aOl+jbmpa+uNkoE6ZprXQOxzug7P1377dLzuVGo3jO3s69bjMdGeq1IrAmof8YAjnQGCDkomRr
	b/2Pn7KcePyCuIj4oEFb8vh55EpM9aUhwRHFjga+Jv2+mWcVvKhOKgXiaArQOuM7hejC1blgrfG
	RsxRrqoJ6MqHL8XnzwmW9aRyx9o=
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr13721930eec.31.1793561385680;
        Sun, 01 Nov 2026 11:29:45 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:45 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: rockchip: fix GMAC clock setup on BPI-R2 Pro
Date: Mon,  2 Nov 2026 03:28:05 +0800
Message-ID: <20261101192807.897562-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_112946_729159_99C56F37 
X-CRM114-Status: GOOD (  13.88  )
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


