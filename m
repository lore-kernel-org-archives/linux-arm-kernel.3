Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D160A2600
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Re+G/rzE;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jm7ze/eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=; b=Re+G/rzEkDAqyg
	PYt7llhh34/s6+eGPiRoUH+hRPHyl3iRmk1d6LsAXzLSehUbWr4CekS9ZZGj6kSiltjej/qK2mINH
	0Pg15qQzudMcEnC5D2TXJCUYUSKs6p+LRXcuxaNYfy4Fsp+6v7KmuWc8xqZNVbZwUNZUn+VN6G/Lh
	pMnkBVh2b8+MBbU9ONLjB1XGxL+ian/IhiVCIpkYC1z8Sz1XC48960HPJkUfqsdsKZSY8658ZbeAa
	zyoewtgVrgD+J3E6n8G6hElTaL+pXuEeg69HZzgVMxu5uTOBrESqNGqBXyocN7NEasUrlx9FX8hma
	2Gu+sXYuTeApF0p1J4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFQ-0000000EoiF-0p1b;
	Sun, 01 Nov 2026 19:29:44 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNbFO-0000000EogH-1Dxq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 19:29:43 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so3884848eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 11:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561382; x=1794166182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=Jm7ze/eu0IipLz9NQrA5WAR3vtiMcb4KD4cT84hBzztxiRrtGyM8QAucgjYjeSyqzn
         6qYvg14DyRxklrXHo4Fn7mhsWoXLPLt4IJNNuR3y33GbdjLxLU0cumhL7KR8SGJctbES
         hLxHmWfRsfdjTgBytamUhgzONmC8yjYQHy5YDQkX/TqS87t4pL5YJHOI/QowY2glQN2B
         UeZL6ybWoO5S3j8MmjtvzrlIcIfJs8RcjGsp8UN31ERE22CqAqqKGGFDj/DiDy+lL1xT
         TTcl8bDqJly5UDTNCZuQyG7aAEdp+xSA2ObKVy5WxG4ycPl/Oa4tpLa7dpQoe9QrmXW2
         GsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561382; x=1794166182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=aY5hCEr7FmtHZb1TULGJ1UII7AwMGxK2F+PcOZZzHG8b3c2Qg+Q8fhel3yJy1hzNeG
         jYmN3VdoPxYdoAW8cly2SMMSEI2wKzqu+3dXX1BqWrdGip6K6HKmQLbczE6PBta+f46y
         OAeThLxBz7dYxjIUWRdbZ914gqZLqC/+QLtKr38FnKFf2sZlLJHZRSCMEEcj+f6JtH2l
         fgIGc/4N2GLfQ17aGC0Qk1j4Px6bxYlg1J/q1Q+o08SoGZQan0oqoLUfjumvR/eXDDk3
         CxZlmG4Vx+7N0eIYEyxs5eGJs3EBA0DDTttS6IeLqQidpk62FUlP7y/EfY4fAqzHbWaV
         XBIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4DFcwgVRvKNWAHw/Z2AFL7WziI0hSVYQP3nEx+1J+D1M2w8tLK2ZmI8JLeYWHX/GgJBOttP+E7V3VlpB8pSc8@lists.infradead.org
X-Gm-Message-State: APuU4Z8GF7CeDro/p6FC7IJHoh01gC68ZOfqNXkSJj/flM9f3VKDZoSJ
	d+DVqn7eW47uXnT4vKOFcJv1L6GKPEuQwJGkMnG197BO1f8SEejy+2QT8R/Bx9UM
X-Gm-Gg: AYBFou3YILy8D9VQoJzK+oZHeIeMnM3EZkmAqKjhLpiTtLxqnlmNSQbiwAEazvIaoV2
	jcmigfK1KFyVMzbjqtwpZV3WVzcFGnlkpLp9xHWdlykP83iO/ISLtmaILTKZyQB9rVY+5AyOPfC
	RG/N9T7dnzcv8FQaEyvqDaulYmiaPJP+iiNnPgtpZ1HGxl1gciu9vvyh4CAFl76qs+qsvqcEls2
	AN7PPBj4BXY26oD9Jj7udeat0a7inLNUGw9V2I1nDARZGZBCUnXzqEFR+tyELI2QvYEyMPvR22H
	YmWV74KM55cAt41VCSrMxhk+rPj98EhSzyiXhyd1rma1IOPD7OJSdIZFSNCCqPGWFNHmc+SeNRV
	7K0UKGpAEj/FwQeQXPr9YiQa5LWdf4JCnRkRUcwCUnKv7VQ0Ho7RlWARxwQT9dles7F8PNsComH
	Up03fmKeYZpHrvJzl77UmD5V+hjvBMIFzrSVuFEJokOzFu1Vl2IhjQvEDBZceK834Ip1mTau1Ep
	Vb7XQ8qCTBrzmGU7Gf6BQilnvcxKG6SREUb3j9WVfSnZlN+z2fyU4A3JxuNl6T65WBuIz9kNTv0
	wORzgI1/WQbYkCXtR6Q8tu2EOts=
X-Received: by 2002:a05:7300:3b1a:b0:351:52ec:60ee with SMTP id 5a478bee46e88-36a423f04b7mr19592157eec.28.1793561381531;
        Sun, 01 Nov 2026 11:29:41 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:41 -0800 (PST)
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
Subject: [PATCH 2/5] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Mon,  2 Nov 2026 03:28:04 +0800
Message-ID: <20261101192807.897562-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_112942_339819_A31341DA 
X-CRM114-Status: GOOD (  14.28  )
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


