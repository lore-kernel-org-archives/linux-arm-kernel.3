Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A2606D814
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=somw+38u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=; b=somw+38uOIhlLz
	/F9mRTesvkn/lPDgQD9eEg0bRQp1VIrXKpXcT6OUQPCzUIpKz/wbZvjEExof0xBbhKHvKBI91dZoe
	6lvfWamJkyoZEMtatc0XMPf96orD6NKUDvgIadFCenH0EEnCZTJLUJSYR/RT8SyKxZB2n/g+ZuOHh
	p/+Q/u+Y5TRrV7boGfvTNblQQMbxbttqGQzUQ/naWvH/tCJ1DxljewEeL/webv7bXHpN8nzM5MEaf
	iLnrRVnuoKJ6PYQb7/gLwxGu+8384/pfbCfGEfXHeecpJ/RNGXzmzDRu8mgiTVo40y5bBWJeAwMG8
	xJ17VH7jPfUTjohBk07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJv-00000008OU8-0vGV;
	Thu, 05 Nov 2026 10:03:47 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJh-00000008OCr-11yr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:34 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10056335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873011; x=1794477811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=OGMrw9bW+f2wYJwl/xn0oPJThp7TxSO4UEqtHB4k+s1EIlFWy6k4JTxXGFrIWi7VYZ
         qxRmFEyDShT/tsq4zhLHUUFLn+CQWOTNaa/rtDGLoPRI8At2Rf39hPKkPsK5PjZvv7Bs
         xZSr/W6I7lj8ix49S+/URt5cBE7U2T519WFCxgeRZ8L88kLENDzCtbEW1Xho2GnpYS/1
         Iwjiec8VfPJblDapnKfAeyDkoZyiy8PW+MOh19CI0hhOULlCFZ08zY0lGQD6bSYmVgcn
         kr2hpz3//1ixTfsudoLZdv2UsrP6OljzMGOQRvlbYgVhL5RZMjY15sS472K/IMKq7uyn
         gl+g==
X-Forwarded-Encrypted: i=1; AKwUvBzOHaGWpOzQAh6yYhfeJ+5pdTDxYiUBbwl0VoAd02JBTH0NjbdL2LEZs2PV40CxjgxNy7fOqyTvc+esQavKmkpV@lists.infradead.org
X-Gm-Message-State: APuU4Z8RlRk0KSF0f3rHFUVAs2y0IKaw2MAqk2FL6X9v3PkveqbQR0YB
	yCQR/nUJjdcR8+GGoVm6tTudVkfuXohO7lDI3t0ItgUAMg8iuKXYIglE
X-Gm-Gg: AYBFou3AcRnTPzzXNCYa2fuI+cDBBHogXiWLekyiw9uwFTWKluLJlbZtyAdFn29NTbm
	YEe1Hw67lPlP+jt0+gktfTDscP8s2UVjN1e5NiPXYJxqWfTfnddhPt/58xznotYrEELAb562i0Q
	usTriVVDiMs0glNVFA3GGrnJcpeHnbpAXNSHl3kXnRQEUFKitzKgOqTE95YoiWHNLXVjHa1IMHI
	2OeIz5HWI38rWQ/pETM7Pv19hO8NytgIuXSPsLDQHnixWeyDFWLSQgSY3wgIbEpBknun5JLcXYK
	8voVt39HlzWDObxsIVCqnOnYwS30bdoZzqWtRcSkYvBjQaDGKQf1+Tj1u3GGqR/YoIvFFKy6Dv4
	/ORDNQuiABV2GdMlWKXZ47dU8Zhm4fX+EzBhUt9Q6LK+OUGaYG5R09BLI3EvFsv31QBusuwBdgp
	VdntW4ZrhdCjB/2o6Gp4Mpg6sYfjWqmLY7SknRHMl3BYGgbrxXCkEjhmRdXWspbRdVjpsF68H27
	faUXktB1WnNVWSjMV2qvJm65nYKbw9yAK1GQvLp6/MBatTTbOrJmkj21TMhn6Lj8SNowMs5DhsC
	JeB0r363ncyytwaEoYtRSuMf9N3qBsptgdHXrikYoeqFWC9WKGPF1L2LBK7UlJX1cVBikJM0dIU
	nbbLJCDQPTvrrY+G7ePQFQu0Z0Q==
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr430949735e9.13.1793873011464;
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:31 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu,  5 Nov 2026 10:03:20 +0000
Message-ID: <20261105100322.37816-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020333_317968_70F34166 
X-CRM114-Status: GOOD (  10.94  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.0


