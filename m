Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D19606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2E6CBBim
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=; b=2E6CBBimVLYDJY
	aROJSo1xgekBT0swC+vNbrbJikPrkKUSWjMnEA1d+YGaTJUnI7Hkkw+K4Vk8c2Xeez72yuTJ7lvEx
	2XNoa6ILu92XX6hTnUhuWzDM+Wh74hF760fOCdevPfG3rXmHpvwPu0R6mNVs3ILCYD2Vv/uncuAu3
	xALgs+CFa+POpws/eq+7KTrt0dJ2moYJ7IVik/tvgon0oBusZg94riZ97ml2k5WpGcoSlni07Ja1y
	BcQYf3qosKvSGM7f0Uvmxbh3+LtIKnmTo7cdxfhYyw9kIhUktRhXN87/iz66FtKQVed4irANmISVe
	lFFIy7O0JjStuAvEgC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuK3-00000008OeM-3iMz;
	Thu, 05 Nov 2026 10:03:55 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuJk-00000008OHe-0BXy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:03:38 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso17336315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873014; x=1794477814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=VorIVKJu/5GLcX0O5dgJj1K5TbGxuq9IXIH9sBXkp31cMbqcHO5DU4dwXBBCDdUSXI
         cAKesOElk3LwZUYdE/+0j+sjlM+R5/Br00UeIh5vbcFD23vQcoAXSGHy68Ot6VOWtynw
         fuh7Yxo5fQe43civ5UT6/TaILju6WkUd/mzYiWVx/WG2jk9Xcc318FO0b/Lf38GoNWzT
         cchcOmDbAmQR07XyAe6cvxhqlrQCZehryY12PaR7eihuYGdD5XMM1OmHMkz/l2P7+pF7
         ayw/sWYe8sO+iiEQEqsfJc+CiTgr0QdYoo15NUsUKpwCD5UdijCK8CiHlKJ0WvJEWos7
         pskA==
X-Forwarded-Encrypted: i=1; AKwUvBwkOIItqAxOM2Ed0jOwenu0s6BttgEndV9SkeigEGZkpL+spoe5Cvm/p3K0kwuqIRHZB3Lyu90GaJQsTqHseeDP@lists.infradead.org
X-Gm-Message-State: APuU4Z+/NeMOfJx9YBN13XSlUhFya7JbK+l9PoZ0nF4JCxF8U1974cRR
	n3RBrt22vBzOwSaJ56NpT3QoFUO13Vx/ZQ9uiAZva3BZDXja1ySFvUjj
X-Gm-Gg: AYBFou0g0V7+e1GCuCNEE3FDgwGYH35c82OCkN6q4emgo8Oc8LCfdXAc6jlC+I6Vq7C
	STuibzuGLHgVTlnpdCLUkGbOP4yllkkxzpGS6JGn8XYPu2EgJ5On4jdkF+B/2jRU020DBdsr+To
	MYaMJpOROOE5los5H1Q5A2MNY2i6Bkh9O9PUOBwQFcWckj1HXXNSZVA5llRaqVa1beA2Hqk1VKR
	S+Ex0oXg9egP1btEysqCoLasnZAcuqDG9Uw3GSWnN76bapHCV00ouDjm9s8PgScj13IpMruageJ
	Yz1T5tH+eTLzFLi8CEM+gcRxWBuvIBXzlhx32uQa+SrPC8jWjqiOTBcSBVSETHl7Xo49m+e+FUU
	NrcjG+pqOFDYY4yJ/565W081I39NEyQQJBhmGsO3/piPqKAxz1pKE49UoNXdJvJlPKmZ/MUUvES
	rxTjYaU15kn4yyDLZuZKQxh/7hlug7c3g4Q2YGcZa59buRfe4ySgW8joDljehkWoO8374Kq5WD5
	aOuUWDQUzi0lPMsHXmF8ZaT8isb+QlWt3Qpw5CgmRz5nkmASogCoGAODjCN9/fOyYALiUxhN1xW
	l73lqIpOov/0D/Y5wv7AvJtXQ5A3bWQvb0yNIUISov8DD98tZmRI1Jb4cvwk4RVaZg1YXIS7RpL
	NURFOH0QP+RufenUTZld0lR+xhQ==
X-Received: by 2002:a05:600c:3ba3:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b52c7265a8mr45793945e9.5.1793873014390;
        Thu, 05 Nov 2026 02:03:34 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:33 -0800 (PST)
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
Subject: [PATCH v6 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu,  5 Nov 2026 10:03:22 +0000
Message-ID: <20261105100322.37816-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_020337_000403_35797BC7 
X-CRM114-Status: GOOD (  12.42  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0


