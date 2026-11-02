Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CD606D812
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mj/MLb8J;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8ZE9/Wd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=; b=mj/MLb8JuWa1Xf
	FD+0NEjEnj9nf+Lbn/JplBs/WrW545XbuKp/IY1qhvR7Fnb6ZMzqDxPYGa1aR/DbJ4VFuvwOskENY
	rtnD08WuYNpdLMEbqBGy76mc7NoPFOvqIIx8Phkn9fJeYhYPXKdtA8dC0fXYbaUSEFTRMwBg4OeYr
	A5yGCX6oqrkMjSjFyFmfYE3pS9ChF+C+10A/pem3GcOwHpVprNmjLrNlaaqifzxL6W9kONNtCCCOW
	Gss2XLZXnTTmSZmNZhPJz42Guq36+KfKS4JxWcmZvwf9pzmXFXhsM3zqb86Hdj8VYW3UPQg+e/NzD
	Fir7sI0cyaXxZ1tqOSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5m-0000000HVFE-26Lc;
	Mon, 02 Nov 2026 17:45:10 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNw5k-0000000HVDI-0yDH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:45:09 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3537f63c9e6so1335128eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 09:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641508; x=1794246308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=l8ZE9/Wd5Ev9V+bAv+5pVkC5hciyY1qOH2XbAzCF6C9Ze2pBxJjqSW051ElLONhzuz
         cZdOPO252dhz145BmDEGl5PCJ0tDhuD89co3K27/GXGzWKJTKcKmjm6w7ZXlMP3SURB1
         c0ntdjtrl+wXnv3U3NWngx01KrK70oeIv3GXQFvIXJjQfnls/njV938XjQNw3J6bmozV
         a9gZpKBi754n6QenMVKt9v/1T71CQW0jN6xmlghdwXriYBEz19QeK9jOvwPCL5Qkai9U
         3t1QtvFAShj3utXk3i/tn9utMNcL0ZDJFbhjWvber4sDbq2t1oi++xzKRV+VPL7LVxQG
         +89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641508; x=1794246308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCkJXdrsAlr6UgG3VN+uF/+sPVvDnFNnW/1WCxoAQCA=;
        b=ca3ZiU+YdYnQyyyhBMnBVy9QwK4nvl8gscXl6dEHfzXvZJmB1qnhOS1fij3X9+X1if
         vfOcuGcfzk3qZjBqP6pFq0eDNUcfCZQazrOnL2n9CteE1mFJ+YtAjJp+RvRZgvWmmnRD
         ofCDhRG9vpjvUQkXrnQjoiAJiENyLiuKqFR/+u2pqJ/fcPxm1yLUGwYmLJi4alcov+oL
         OWD3qoMNK1GRsjXxkNhSUdCRxFaR/owjHywfeV9CmF9q93Ps6EPRyV6Vw55d1baJd6KM
         rlWnPRodevsKT69QS2PNdKBBdIBRuQQAk1bUu11zGQHTj65YESfZjOYZ1YHLTNq+RNAV
         /e/w==
X-Forwarded-Encrypted: i=1; AKwUvBwlmzLg1HRGMOlQLFaN28OiKECoBVI5dfGVeKhr8H9NsZRwJQ9deUcq+/UQhJUJwhm03NCldiYddLUKljv4P/Te@lists.infradead.org
X-Gm-Message-State: APuU4Z+De60OMq0W0rZQC0QT1ynJqLEdBJ/3PUXSRRuQ/GW68f2xppNI
	noqGSyta7AG6SVn+2nGOqoz9TVBH+qc1udkTQXKoOJ8aDFTxS+ZPJn6B
X-Gm-Gg: AYBFou1q2Cp6hh4gsQpnpJW0O2LzCcmICm0X5+Ak486rSv7/h1NoAPO5mtojFlWDYxZ
	QDm5lOIq7jmOp7ZKgKOqE6srvdQ6xRdzbKku39ysaRPa63LpJQtLOYHQ1X203b9/pLofFkOxzAQ
	zKCVx0bBWS22NhtQYWDBa5+UExiurllgerqhEA0CcD3l8tIafW2xIh674ZZ9MSSCWwf+xdfy7MH
	awFveBeLSIY4S8Bx7GcAqxydPanTdx/Qtg6JWN2fwomN+nhFA6SQb44WNhWU864geAEI4XI0uKC
	N7eN3X8YzcvWKBI4FP0wq7tfCtsSS3R7If4qlu0W++UCvT4Fqu/s0fw5tr99SU10m14XoL2seMd
	xTw6OirpenQyYXfk26GJHKatb4VZrLNwKiA9uIWSocFExpkqVJnZc+hKPL9MKGQNj++SnvgDe/E
	JzfhDQVzCYk/hz9hnqCdTXrGQk7C3zaYKZHNG31lC5Ji8STdff3YXp2D2qJ36mMsDF8qMA9f0v8
	iT9xsieeIbQNLVraLWW+mBVPYQF/BBsKJV1ri7ayYYiJS9aFW5v/SNH77+5OXMHW/b0tfKXuWQw
	55W4PtTcUmj1g0KyG98tNYA6q5M=
X-Received: by 2002:a05:7300:ce0c:b0:36a:1732:1e5 with SMTP id 5a478bee46e88-36a4243b307mr15860843eec.37.1793641507395;
        Mon, 02 Nov 2026 09:45:07 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:06 -0800 (PST)
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
Subject: [PATCH v3 2/6] arm64: dts: rockchip: fix GMAC clock parents on Graperain G3568 v2
Date: Tue,  3 Nov 2026 01:44:46 +0800
Message-ID: <20261102174450.3000397-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_094508_269413_1CFEADE4 
X-CRM114-Status: GOOD (  14.26  )
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


