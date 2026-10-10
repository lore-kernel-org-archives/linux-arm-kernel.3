Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B5BCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQBX2EsGilW7uIgdk0tYqFZ4ZqmuLdnOK0NA9yKXMRg=; b=KgXB9Kly+LCl35Ye6zg7lTeoFH
	EQmg75JJM5liL7c0jmWxMIAnWsmiS0RmOrgKtsoUzQ1Elk9YXNfFWsA20jRRdTUvopJqQU0glvWk7
	V2y9BECeTmLX+ITk2VnJhJnp5NgRTEaiCYZ9/VF9ab/FTSimqG1NmxqlM7WskGP9AolhGwZrC6/N2
	Jpezes/jq0UK2v/ZWkZjoc8xff60UYcUvK8/llXDcLj2HT1MF2m8qLje5wIIB/Iyx40ZKoPgSMP66
	M54/nZB/LnbFQTr6kkLkNYVO5YGym55jnGgCkFO+jLrXkE7qQntTdGHB2+2QUDDJRDxYOnrZ5Io1n
	uHPHQ6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnR-00000007sIH-1lc2;
	Sat, 10 Oct 2026 10:59:21 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnJ-00000007s6J-1Syi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:15 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b02a2359aso467782f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629952; x=1792234752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBX2EsGilW7uIgdk0tYqFZ4ZqmuLdnOK0NA9yKXMRg=;
        b=BGfTcMAOrat14QkD8XBtT8RLH0WADnSoTSu0r503nJmKHy+HKX5bERyRFyR/h7qoBy
         Ao5eshmcLaUWZRNTdHA8L6DfcR+6pXoJ4EdWYuheGKwDTolYvvGfvVN1nMmhFUwzXMwN
         3ZqiqnBU8bH9BhLxr8iZAu5q/69y6tYt2UyJdlm/GLRwzhvHtkQJyWsY77aVASIP+kwJ
         YAOO/ziH8q6j++ZTIEFLlOvkGodvajz1hoa8it0TBym+DHDf7QHIqdCdGJCOvwG9hGg7
         jpTYUa0vIduOs2dbI70mfX4zhxfaaDXWz5qzVLJMNNlUQsW90TOqse5NUWbSEJ8o1D6T
         Iw2g==
X-Forwarded-Encrypted: i=1; AKwUvBzicFxCVOyKk63XvsO80lOSSqhW8PqNUxwDrgHld+V/Q28sXfIr+YBAD1Po0GrBkWq75UyQ9NCaRbfGsOjWFDwQ@lists.infradead.org
X-Gm-Message-State: AFq9FYKadHATHTyngA/LqWWr8Elh/NusWfbhzwnWxI0Ypz6oUh/qeQk+
	5pN8RVkiX9DMOldHCGeDP+Y/dJXJ5DNuga/pF2lgKK42UyNCUYEe/oJp
X-Gm-Gg: AYBFou2bCPzvh7/C/Kz1WXQcLXGlqWZTKvtA0aZXHAz59rqUME2TbRW6apfXcO+kvDf
	BNkRyKlj3d2t7wvCHXYW+SYseIhJeK1mFQ1OZIjhKdRxVam9+nuo3jBv6cQpb73FLVEhuJxbxj2
	5dJOLy+ONNHPwTuwTOCx/eY7FhP6QSXic2rkmV+5GY2U6Kawvdu7cAV0XrDfUakXjt0As3goXaw
	knT82JNV8vCPCLx33qIncBXSTuAfe7vCSqu2/W/vsn4DUl/Wuugm1Fwk8CMEJ+uZ3N2c3rVdZoV
	XOg+quoSVBgpc2T+qwQN03cJk8Q/+vgE1tD2GrqVf9FyFrFhdFL/df55jOm51bu7hWMuaGetWuC
	8fA6ogiPdLS99hjMyhgaIcbRrH2GPE1WkYURbXHEB4lbvINeBcjEvhseuDL6wmKpgrSNBxe6TXY
	9CUQmI564jqTWGxN3R5zitxlH4fhm5rTDumRKf7O4yJ9aWGxQEADadhliCZxiBFG9XIpylSNHQx
	3l4QWmBNzQg6iniF00dmULuHb5MeOoC2eE=
X-Received: by 2002:a05:6000:2306:b0:488:8347:a110 with SMTP id ffacd0b85a97d-48dba9e6163mr7697023f8f.7.1791629951651;
        Sat, 10 Oct 2026 03:59:11 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 7/8] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 10 Oct 2026 11:58:59 +0100
Message-ID: <20261010105900.247342-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035913_936898_D4E6999A 
X-CRM114-Status: GOOD (  14.00  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks, and on this board
both come from inside the chips, not from the board traces. The PHY
adds the one on receive. Its transmit delay does not work here, so the
controller adds that one.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..c18bde02ac40 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,25 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+	tx-internal-delay-ps = <2000>;
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


