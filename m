Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F2606D837
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s5Ag+Qne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=; b=s5Ag+QneiKUdOW
	krAV/9OnPuHX36yYAYnjMp/RhAWYVRpkJLJZfEaaQzxZKqFIz3vITyGiG9Skn3A+VvfMxO4toyq1t
	sAKJh/N71eOLLOLK0i7gjg/wzsO8Mb4WxNAi4ivGaeAsUhyK67JCFYGlsdy2oihHkjhTb59H/SKGs
	NtRKDPP/jE/m9XZ55bJxw+W2t+/LVcCjWhfkvO1alaFYcKTix5aeGTum4TSa5yaSXNHSRWiOV1yBI
	soGXjBzIx5ckumRVSHP7afb6xxtrHuad0TJ8H3G0nDoc1XR5FMjezdqdsaWg8lytJIEfkGlGVAKAr
	jndj5etbEia3U6AVhF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVr-000000039kN-3uIX;
	Tue, 03 Nov 2026 16:37:31 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVk-000000039WB-23Nm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:25 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so599797f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723843; x=1794328643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=UlY+HWr/tPwuY24mN0eXPpHzFZPLL2Vu3mnUZCpfWl/p0nKHENQH2IRv+uGXxaU9ia
         /mWyWNe6oToIosRRUjjrBPoalfYZFCyfhegDRsvHjpigNLs55YLAAzKP75MbHwMUgnO8
         AuHzoHwnOgo7/tIgY/E2km8e/hcRFeHQPNzhjlia/gcPH5HxfpKuhPNe2f+wzgBUAh0l
         jyICwJEt4/h48KgXYcpQ7+w0m1CxOdGFw5JinRfE8Wsc1PCcWTBP2LpeCglN2DT1lPWA
         ftiT+BhAEweaWAcRble8el7EDzjmYmmozJP9+gOJxhIZVOXVQ55aKOZ7kn3eRQLbLcMF
         fajQ==
X-Forwarded-Encrypted: i=1; AKwUvByDpXnAOw0KI6BoEqNxE9YkYUEXnI0i8x07EC5Y9ijSERd8YvIHCHMbi87iGmb8E8BYmYuRL+HviiLAmolxPWVg@lists.infradead.org
X-Gm-Message-State: APuU4Z/LcL3ofBtXWNmX27KyAzuS+Oa/f29kqKg4FY4yd6xhAkRTIwP7
	OUNsgoEqGPI2Sr40/fsV+HAfNgKJF8W5eCO9/xAfOj7UC6moP08SERiv
X-Gm-Gg: AYBFou27drQn1lC4Bwif5o/DCb3wxt5loNNXHhLKT7plDyd3OMrEy4PBNuZqx/jUM1Y
	FuL+0mmbe+dDhDpLO8QxxXjc4EN10O6z4oZvDyLlLBpOwdnQHDWPslm104+/XJASu0eCrqLlIqF
	GixX2ragUdc63bOpZ9jRxbeagJ3//wEi+HrrC33EMrPWO8+yXKGu3IT22isdUFigl9biukVJkKW
	yyIvapGfNdV/rGkvn8wV0MI76MDy+3OEe9XIzf3GSd6TlxSWfE9oGB9HcTwO4baBgv651yJkLxQ
	IfL9XhVaK6CElry3Sc7xGrmqZAvDhVBFNRH3f+FjDrSKpxzImd8lYeKaBW4Sm9Ivr76fJjE254R
	PAzHHnwl00Gx8wAXd6/WuJ9Kqa4PnYRfd27HRl/cau6OecC1vz2iUbdEtxoOFH6ca6Q/f4ihlun
	+0yUf28/Okw99NaHuU0z9+gpOWASYQw9VI8juxlCIHTz5zG37bQl+RRHrRvSgaqIPcBYlWzvy6M
	pgykmLJ7u8kvmsAohXh4+0MLAL2TdhPdZORW271YzYJ7h1i3Ee2qoS/X3zu96EKkq+NbpevIPfb
	aLuyUdP9TaIj73H8XMthRSVbb6T2hUvYIOAh8RfPP02jWUmyv6KZRgjAiZOm452aeKYvap8JPMU
	Hn6Bf+lUSoaoUigW/WrXD4fucwA==
X-Received: by 2002:a05:6000:2c0d:b0:48e:661e:8766 with SMTP id ffacd0b85a97d-48e661e88c5mr40422568f8f.17.1793723842657;
        Tue, 03 Nov 2026 08:37:22 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:21 -0800 (PST)
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
Subject: [PATCH v5 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Tue,  3 Nov 2026 16:37:13 +0000
Message-ID: <20261103163715.385394-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083724_550225_38BFD2BD 
X-CRM114-Status: GOOD (  10.86  )
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


