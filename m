Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E288B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mlcjvmS0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=; b=mlcjvmS0QvAehq
	dzxR9BNJW4E3wdbgeVeiLiMVPa2v0G/M2UnnZT8l002GKznVaoRNcvWr6Khwf10ujY43V6Sy/aA2n
	c93kTIwYfDWG4BxXiJ3PXJDUVm8zp8jjhNS9JhmgyHcQTk2C5hEja4zEWRODtuXmjPq0akOrQJbEM
	5Rm9SDKO6irElwlUv/dIbgJMRxaWMpJjCXeIxSQdS+8DG2DN9aS/BUzZt4VFLpLiP2YoOxccBXJIk
	TyDc2IUj5rNL+byTiRsXVmMwK5OJIaSz1eg64mieJMBJ9A/gHVpD1aPCh0s7dfggZp7QDgUcuYLcr
	E8uTG3JmTF5qM+5ILB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz44-0000000EtML-1zDu;
	Thu, 22 Oct 2026 20:07:04 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3v-0000000Et7H-0Mne
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:56 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1324205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=;
        b=bSz7q7/P7hwuEULW7Jld2yyqVW7vJuqAObUABcCpotRYq6oaig/6jwh4LGiSfXzQcV
         O4mWkzISNZmi3ZPk5Y9xQ3UlTLsIJ0nt/W/n/82Z1bAzYE9cziDyzkzjuJElor+3Lvgi
         Z6+aS3nAVc3jc7ORNxqL/RH95SCsW4id5j7jnjaR5SyDVyEXmYQXpBJeqKgIiMNRp3G2
         6KpCeskIv9VWRV9jX2flGY0xMnATgXl9OqLeQ/HQOBuuSEYcqCo7eL7UaUA2371GWMY6
         hNBmoQQdrfoSt6jQus9r2TxJ1+r9jNl/XPPnvY8tdeohsokj6MymiCaS4xhefnH9LiDM
         slaQ==
X-Forwarded-Encrypted: i=1; AKwUvByAimuw1KKEehDBD3eLgJdUES2WijGRKHB6gMunRZMyJb+w/+4aUsRq7BahTttLDG1VaLo6VZDBhWsqwOjIr7UI@lists.infradead.org
X-Gm-Message-State: AFq9FYLHBsc+O5dfljEOj2TchtMGQucPbyrM1wj+PMDFFgEt/ZsHr/+z
	xkMhbP2qnFz4HYgbq0AUApw6mvaSAQ/KvZ7Zims+raMwxhEFTxCB81FB
X-Gm-Gg: AYBFou1r8+XU1d5kNy7JyMfBJrT/jru+36ryortHeXzn2cPgGOUhDLLCVEIqndG6gkn
	0gvamFoa/r8CMdg7NWP7KHD107D1zhgzhM/RRtvoB1Wyd2oT1GdRN9e5ytpWIcip7IB0jmr1YJ/
	9eiQTTJWdXjq0biydYxN877Z7R0uV82i9pdLOz5CWsFktfUkwWrQtqQGmr/Kshg3Z1Wk4fmgPM3
	vMzhjfLV9G9G1Dr0dF8j6lCMd3+O6VIfZWFV513myQi3y0tAPh+DIUFx0iXRqCPqHJH6nYrbQW9
	kGXlOvVxwBa43/+L2s2U1WLXiDWZnwj9VJ31LzChm8cXMMO8QrorUrztQuyRwu2x6JlT6GC8jXj
	3fuEiKMfN0egbfWGRN1qyaZwl0kwNNKlemQ3EDjmf6X49ZymMjS+wCN6yErNHlreSlIadJvVLwI
	jD1eVK3E8IOyStkTt0mt7cMNUPLF+hCD8QewahGjEbp8ubxue+fBmy8UjONH1nfRUeK9xmJ+Unn
	2Yu2GeNLkVdUpNwAIgT0u4hPxYP4e5R3JuF/hyX8QlGScjdU3HOGsigApO5sjHo1In7U1dVGJHm
	bTBF28PeLeL34KQ=
X-Received: by 2002:a05:600c:3b0a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a211c869d9mr2350165e9.16.1792699613390;
        Thu, 22 Oct 2026 13:06:53 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
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
Subject: [PATCH v4 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu, 22 Oct 2026 21:06:40 +0100
Message-ID: <20261022200640.3101932-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130655_301349_728917B6 
X-CRM114-Status: GOOD (  12.16  )
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4914b0dff8a8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,24 @@ xtal: xtal-clk {
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


