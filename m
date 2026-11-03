Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F45D60A2600
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mympq2ud
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=; b=mympq2udt5Dm7b
	HCK4xmg3E+0j0vnZX20bpAmk4HLaTpcLa6LH9FVzaxNsTd6ohPATkONEu2/7qJM6tyPRARiLqgByD
	OpnKLfL8pEzhqkA5DrJTlli5x5c1TOd4u7lga8yz4ISQzk8q/RojcngUmFumW5YgpTlhBTnZof6pQ
	ByqeNsXhi88YiUPcO8sVqBKyimLriTE4XtTtDtLJfcVeZQXsRFKiDWBm8hSU86kegApr7Wwv6lstq
	tn6IqYK7QOHAPLRogoDuWIfskguX4CFL2qLPqgWExY9aiJ4+zQboHEo8bLnWh0bTkdxjLpo60t6Ks
	ix7FZQTgHpiLTzHmbrwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHW1-000000039sy-3dDj;
	Tue, 03 Nov 2026 16:37:41 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHVm-000000039Z8-3cxO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:37:28 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3802542f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723845; x=1794328645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=0NEsAXSrsGgfpK2gAMSYpkJQvOeKWRrBSaa6cn4c394qLVaiKnD4tG0+sKYoQWicvq
         icryL8G5TIbULxPsWh1Azz9INlg4LkimISNYaHUObPdu+etrNhyNCZREnb7tbJoMxaSl
         kospRQ0MuYXH7XIBW4Lg4kRRHRmPxf/zqUD3FXRCpuvPYrvDPL9HEmCc6xoypjVcu8E2
         xArKgf5p/cBGP6iYie4qkCM3zQOjimNy7mVcVNB885lwtYs+DkED4mAc8H4XahF8YGOC
         c9/5qBIgI5oWsFFNJPE8/r5ebf8gGGdZLFHddTF1oAwVUsnpTr+dSHvUPVB7My8jD48A
         GL2w==
X-Forwarded-Encrypted: i=1; AKwUvBx77vddqe7FiDOWyH4juE/ouI5Nh6YFt8VwCM9rDjtoj2dbON55Itf6HjE4RJdTSScsTXNEAYrR+MggWebkhl7U@lists.infradead.org
X-Gm-Message-State: APuU4Z8E0ox2itwx8dty2qm8qAB6XLKJzXa6gK+U8Xk1u4N+kImtbCbA
	rgBx8/EZBsLecbMXlX5PaGIPvrAGDomBl4dG9v1dWEGfRcGxO3FPvl+H
X-Gm-Gg: AYBFou30l7pTbxP8alHgWcLcAITgNwz3IRemWqM4t1OWdzRlX/tP+oPx62N5mmIRmbp
	7FD5BVizt3CCVmKUxmoJ+JWhNM0xIo9vwaHy8oNhxF62ZhwaVOH6XNwjwzbX97N2des+HlT84Bs
	79WQE6jpyE1VK1qYIiEaoiSwGA5CP5zsak0o57v23XVkbMA4w5cJj7XaFUvhGKdnZWwoSnUjGrV
	woaggwBLj7pDNNd2KtMqQ23mDJGJg0e9cbdvoapaHRiABYVrlJFxYhFyY9yZmm+bcJgODSRaAQf
	iwtQo44YmL/6MC4mYukRGIPhEzL21JJxpesTX/VcfvqJQ7+IttCrQAuHAxRNYqUVm89CtZQG3wG
	D9RCWI0Y52JvFG66AERLBy2uPxWCxuj59b/FUfOa89l8kGLLTWhiC3zUx4mOYlPl2C6J0aeHVjT
	3o/wAXNazmRDJ3k/d3OSz1/GAu0NwLRBH13GmdCrihX9baeAW+XZy8QvrUoNDyM3LCWO2mE01Io
	iXF7wsLhFmX+Mh0363SNJvn3+HvBV8vbOjXUa3hm4Ynu2fOTDSgDJSLbzjzAmYotKtRAI+OCvDO
	gGW61/mtQ2kS8KQQyK66OTm7IiC9VVE/PBEQMXrchFZgadnD4VPWc1mtnPWuYlP3fABF/0AEvSY
	lSkmgglFX1LR1kAcy5TzgHHL3HHRPyQwhZFaEKxiTZpG4ZcM=
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr28996710f8f.32.1793723844739;
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
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
Subject: [PATCH v5 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Tue,  3 Nov 2026 16:37:15 +0000
Message-ID: <20261103163715.385394-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083726_955483_FE672B32 
X-CRM114-Status: GOOD (  12.25  )
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


