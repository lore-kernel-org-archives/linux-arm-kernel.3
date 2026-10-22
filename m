Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D29606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O5kV7bZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=; b=O5kV7bZ3TNCgTV
	4S05MR+F2YEiRkhLNCvfn/V7rDDzMmT64+RUAdJ6TB/fCvNRJTMP62RSwb/tRoGwth0pr/IWmgKjr
	DnnlNXlMGRnC8/1+Wtagfy5uHZF+sEV1Iq62Ij9YAocSGl4gCqh8tyJ1nxHs1HPMqZ7WPr+Exz54X
	ymMlgrLrwCljhu3P2gu2HzafSZTkgS22yPTRT5pW5GBfJnfO7eI7HZKBXxCOAWNmzgmncOQC7Fm/F
	pmIWBuZP94V7YsSm3y2bzrCP1eNgX3WPlkax/dC7EAlVE/bzpunkde5aTmND3J1zmQH8V9/xwr6CY
	ZwX6mVcU+gsYtstkBVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz40-0000000EtEi-1gJZ;
	Thu, 22 Oct 2026 20:07:00 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3t-0000000Et53-25iF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:55 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so1742145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699611; x=1793304411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=jGHF9ZJgkQLwAMC5qeILedxvI8H0BH4mBh9p/2iQoQsATPsJi59dRQnvAQEkwBskgQ
         kMQZtxQLGlGkOeMtmELp5oppvyJiZ4Ns2cAXrW4B1ojDz2xVN6dBxxGusR63tHuoIsDw
         x5EV72mwhYVMiGwXVYmryziGhm/Ny1d2OducZQ8PXiWeWrG2NzT1IRZgh3Fwlx1HJEfF
         uA7HsiSgrgxwJFdQg9UbztgH1pn3sYae5g7/xZrte+1GXSgs42dj0eTKbxfaJBvKVoA5
         oEfYGBZWHm+txvLHRDJX93PvuX1be5dWo2hgoWOhJEFiEmGSHuVKihTIrWdDy6FjlL7M
         h3Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwLcRF0Ee6+QaNJgVO9HpPvjk+weGUNmWwYnrTpZjdJdDNWT+XQy7I9SjsZT8nnf9xUWcnIdJNxmFOi0R8dOf+e@lists.infradead.org
X-Gm-Message-State: AFq9FYJhK6uZIfR4b6WP3kwCQl2Jhd5foXwfNH/0Y1zlc1Cv7wsrpCl+
	wn1o5vY2NMsEZU3tIL2HGEnpuAwQUUuhDOLyGxobu8b6n9FqKL3nEveD
X-Gm-Gg: AYBFou08lCN6rOAQeutxcB0KI6ferXpxmLSVkaoSchoW86O7tucq/qzzhzSWiy7PIRl
	JqUdIKJmGPE6Uu20h0w7FwQR/UE/vgt1o7oVctf65tv9awyvc8+w96aP0BEYIPyfUaPkneOD1AJ
	aQP9+q/9alDYU7vZjns9eENRoaEI+/TzoWEzrGQhP+e1JXBW1OC2X5u7q+T98De/mj9cnkUuTji
	YEkkcwB0Uc/csdOpNxvdI+iS6roWQrE2/bqKixJdex3TRWueKywruAKHZ73xkaKdKBLEE/hKSy7
	/H2bNNbSzlpUaAh+GcRvlZpeav4RXeVnvsYOoTh2iBU6a7t6/LC0KOjYdClcOX5ed3AmzBQaJFU
	tlf3IFaysBi2/tDwN0sXs/c2F8hqG0vor81zzCxvtfJ7XtCvQVWEAL/6uXVil6A3dPp0i4tVhOh
	g86Vm4jPYHaT5jW7VryV7oRulzFxVH/v+UAkfupOWq7VU7BS3mtTw9w6ZXR4kdw3T4RXojvfFp1
	l+mYZyJbksaP+A/HAgnOcs4hjC9S1ucEx47yFUOnJVqSt8LSXDX0Pcf5NP6Gtq+Rs3BpcO1wd/Z
	7P/zfXAScBhgv47HF7wrWfhWY1uMMyTuqEUz
X-Received: by 2002:a05:600c:1d0a:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a211f08fedmr1687545e9.24.1792699611517;
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
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
Subject: [PATCH v4 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu, 22 Oct 2026 21:06:38 +0100
Message-ID: <20261022200640.3101932-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130653_672547_7C715620 
X-CRM114-Status: GOOD (  10.96  )
X-Spam-Score: -0.7 (/)
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


