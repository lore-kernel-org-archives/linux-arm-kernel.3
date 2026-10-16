Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD06CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2rNZOnJYuelXIMlnfPNSAx4HvD3+zbeEhVvMC2ZyCc=; b=e85N8+ytHsHGsi7mMce8/i8D8x
	xim0SlARelU6E48sWgOt/ufl6dmrk/CMY8pyb3tiQGDHnkJfrukyAMfx6I04NqQnKylLTLQI3EoKu
	KhXukC8HG+pXiEji0a75YavLj5vRctJcIS43Uk1XqEKjcs+Qzy9azHbNpoRr7If4/QYOfvWSYTllx
	K4KZ70HOHcohDt+rGHnMWQGA8X53BONTkd8vq1jtoZ+q7tLz2O3rPV4uhvR1qM9y88rYmw5etymQG
	zZ0HVRXnTx26k2QIVrAqwU+l9kLucyVbgIwovQb6W1XGmHFgi8xiVpz5eKMuf7v1FlYuzXhbeu/Yx
	A25vJiNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY7-00000003XKf-3Hrn;
	Fri, 16 Oct 2026 17:16:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlY6-00000003XIJ-2MoM;
	Fri, 16 Oct 2026 17:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BD694424A;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0870CC32781;
	Fri, 16 Oct 2026 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792171014;
	bh=NNesoLElBUv09j/SE4YghbtNRl4bZejc+cTkcFayRsU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l4wjyq0y0CCj5Ej3wqmWhtxF8IxpQAJfdhaH5B04GNYJDeEXB7XJl+dBnmAvhO+53
	 lk1lCStn6TgCZ1hKpcg4iNoGf/g6YHiWzSjAE5Y0vZMZE4ir2N1ZY/sSWSsS7yrajg
	 tjYW5f9s9VhMpCv8Yy3zMtNkB2fTkqWkt5RhJQibBr9khPKBd2VXA5a99JCDNGk5ak
	 3t317KuAslkSdhgBLetTaUqBj4vgCwjC1WGFn1RJHViRIVLwz8ZPSkJVwWqQBit9fO
	 Evb6OgNWjCGMbRyaX+YreOL0fv/BIcrgbwoxmoO/zJmQHxdX14s5hDDhIEyeDw4jmn
	 TCfeaQysqPLiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DA6CCA490;
	Fri, 16 Oct 2026 17:16:53 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 16 Oct 2026 19:16:10 +0200
Subject: [PATCH v7 4/4] arm64: dts: amlogic: t7: khadas-vim4: Add fan
 cooling to thermal zones
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-add-thermal-t7-vim4-v7-4-6eede5450fd4@aliel.fr>
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
In-Reply-To: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=B2WWh69HSsHWgo7xf4TXcX+65d8XeYi4tsHrfwMtAdI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9alGCbhuMMxewSdHW5J/bTbm3vzxt4FD3qeyHybsE3D7
 kx7qpxuRykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRNGWG/ylXt64L33lEQSjl
 j37/lOztvFMqs+0lV507tvDzp4l6kxcw/OEU8A6WvNiz+s03MW7RlUFt9185qp37p8645SNnYtf
 tDTwA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add an active trip at 50°C to all six thermal zones and map it to the
khadas_mcu fan controller, using cooling states 1 to 5.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b4179..91f81f7949bf8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -256,6 +256,74 @@ xtal: xtal-clk {
 	};
 };
 
+&a53_thermal {
+	trips {
+		a53_active: a53-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&a53_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
+&a73_thermal {
+	trips {
+		a73_active: a73-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&a73_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
+&gpu_thermal {
+	trips {
+		gpu_active: gpu-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&gpu_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
+&hevc_thermal {
+	trips {
+		hevc_active: hevc-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&hevc_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
@@ -269,6 +337,23 @@ khadas_mcu: system-controller@18 {
 	};
 };
 
+&nna_thermal {
+	trips {
+		nna_active: nna-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&nna_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_pins>;
@@ -389,3 +474,20 @@ &uart_a {
 	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
+
+&vpu_thermal {
+	trips {
+		vpu_active: vpu-active {
+			temperature = <50000>; /* millicelsius */
+			hysteresis = <2000>; /* millicelsius */
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map {
+			trip = <&vpu_active>;
+			cooling-device = <&khadas_mcu 1 5>;
+		};
+	};
+};

-- 
2.49.0



