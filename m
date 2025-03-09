Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B7CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUXPbCfIsepDY+Mn7pTqtiR4N56X9o4JrkeUo/O+gyc=; b=z9VCDD17SQFJx0t3O4JjovTxWA
	MkRjw8YcVaLvjreJO7OA1w5fZ/V9fbJKv1TyEje439+fcxGsZ7kEhyYOWmaxopyIZtUCNLTjX3aaf
	ENOkY/cavk/4rtQs6ob0ciNombqBegJCviPg24egj93jvh82EBUFvwfTamfqu7aGzjTAY7/5SgWwQ
	DJQoqIIhvxK5T28wF6OQ+ANjrqKEvz141jlLlL+OlFoSJ04oFJVlLnUbWRPpFhj4OwSK73s2k+yG9
	UF8NrGcFdbGV6+FkuczHXB2+3hIkPFq6CxJZN18rn/16QWkrYhl+GI6GXkLdOIjSlYklYyfsZCgtQ
	iytsKRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trH6K-00000000dMY-3yhn;
	Sun, 09 Mar 2025 13:53:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGk8-00000000aY9-3Kyc;
	Sun, 09 Mar 2025 13:31:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39143200ddaso267664f8f.1;
        Sun, 09 Mar 2025 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527059; x=1742131859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUXPbCfIsepDY+Mn7pTqtiR4N56X9o4JrkeUo/O+gyc=;
        b=WBjh0BugRF97k1PMEW5Bwyp+IrTR/gZOj/NcODG1KhdNkJz10GG6hECM4t05+XojFy
         0EV/1+Z0KBXlOfLaPspPjKAOx1NqLmQHjfJyUG3BbM3udTqlc3Lhvilv84SBD73WnAyk
         pdmbG1NxG4lgOI+aHKZJrj018KtRgYcu50Qchs7MaQNHI6JqInk/FFiCnmNy57iVQ7Aw
         nbar1cJTTCL+FoTF4DSWqinwYRiaRtqo5v5U1EMFF5aCmFu6jfQEkj456ONh1qdEMBpw
         ggXC6d+v3DpQCMpDf+4jc95rD7HYi+IGO6+qPVYa5P1gm0smFJny/ks9qbqww3C4oMph
         v1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527059; x=1742131859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUXPbCfIsepDY+Mn7pTqtiR4N56X9o4JrkeUo/O+gyc=;
        b=sRiws4EPezvfDQyFpjenUU+rG+xh5/rAxdsqQbZDGqMMx8TeoQaWKuEaTNuQRO5JrV
         6CrVQn7mJA99YsdRoEg0NEifkslkPvvKOGULpTG0uRbmv9JeY7IEOAFLFLOawhbXxV85
         Zz5Eypt1Y5sHuvSfMudILWAg6+bGVK9zrRDkIi6je9+ulhajosirjr0EJSADmXXO/pjX
         86qc1d3J2LvNQozn7/e6pEskKphvgccg5R99ZLuFNzf/zgksPbSnmPJqDOkw18oILAjc
         P95+P/OWdhHrk9KiyaKu2j/X2bpVgalU0s2k9T2AZXpVU89ETechQEjteodBFAsVRkyY
         qs/w==
X-Forwarded-Encrypted: i=1; AJvYcCVvQfCcOrtBCDOJITt6770LEfKBTQyXXvUyOuRYP4Pq8c714/E1nXGRpC02I5ZsAyjEYWfkohFz0xDIVXP33E1y@lists.infradead.org, AJvYcCWdUWHQG94SA9cmrtv1H7FO02f5sAB8fqYsNNPUpoTSa9JG6z7s25rtLe3kFIecYCenwFkHYfT0jnlL18hRlMc=@lists.infradead.org, AJvYcCWiULmjlj43zhzIEIiC0tq1lgkFrpITQeXtAZOMSjjtc2bqoGcSyZmSzEam9JSBRxEhwHVXAgqHGyxo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+dyvFJxz0JHkjsvw5MYpCHXKFr3Uf2RpDs0mST+bOdCqORioW
	EsPM7/Pl7CAP041vGuZ/jhCFMVRsO2MaN1xRzc0yWmZRGMeTDO+M
X-Gm-Gg: ASbGncv5N0wuiWNzW31ytC8Sg5ssEttPuMEnm209xC+vLlbfperjUTbhJkHyk8YdfmN
	+Lk2A3lzID5AanL8I+p2hIrE7iKpdHTXLD1FKygfsICiRwRLS21q44mNI2RXt3keEMkjM0HSzGL
	HYKjH+4E/axmulFC2frC+bZGTN3hayr6MFvEXWp/hz7q4r9IBHsifsQ5+DG93zv5BFwux8LbfpN
	X0RSDcL3fk0Hu0Jawvz5+FwZhv7EPolVqqzzndX3jMeXEu4XC62NAr3/Jg37KTBfCcng4eCFZck
	6sWdZI5xay6li2w5ohoA1WIcXHqIWgDtFPhS+3GWqBGM3zRhIgLXlapVVN1IITATFUyM4qTNMgM
	XSeLOYEoypfr8Wg==
X-Google-Smtp-Source: AGHT+IHb6GE+RdsoNUn0+3sL37pgWMjh5/VzLN7RX2rS7tVvUpl9i16EKbDnFhvFgXvM+UgMM2DmzQ==
X-Received: by 2002:a05:6000:1846:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-39132dd6afcmr7499960f8f.39.1741527059081;
        Sun, 09 Mar 2025 06:30:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 13/13] arm64: dts: airoha: en7581: add USB and SCU SSR nodes
Date: Sun,  9 Mar 2025 14:29:44 +0100
Message-ID: <20250309132959.19045-14-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063100_831460_59F340B6 
X-CRM114-Status: GOOD (  12.43  )
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

Add SCU SSR and USB nodes required for USB support of Airoha EN7581. SCU
SSR node is required to read and configure the current Serdes mode of
the USB PHYs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index dfc12fa99748..5975da11ace0 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 
 / {
@@ -183,6 +184,10 @@ scuclk: clock-controller {
 				#clock-cells = <1>;
 				#reset-cells = <1>;
 			};
+
+			scu_ssr: system-controller {
+				compatible = "airoha,an7581-scu-ssr";
+			};
 		};
 
 		uart1: serial@1fbf0000 {
@@ -200,6 +205,62 @@ rng@1faa1000 {
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usb0: usb@1fab0000 {
+			compatible = "mediatek,mtk-xhci";
+			reg = <0x0 0x1fab0000 0x0 0x3e00>,
+				<0x0 0x1fab3e00 0x0 0x100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+
+			phys = <&usb0_u2 PHY_TYPE_USB2>, <&usb0_u3 PHY_TYPE_USB3>;
+
+			status = "disabled";
+		};
+
+		phy@1fac0000 {
+			compatible = "airoha,an7581-usb-phy";
+			reg = <0x0 0x1fac0000 0x0 0x10000>;
+
+			airoha,port-id = <0>;
+			airoha,scu-ssr = <&scu_ssr>;
+
+			usb0_u2: usb2-phy {
+				#phy-cells = <1>;
+			};
+
+			usb0_u3: usb3-phy {
+				#phy-cells = <1>;
+			};
+		};
+
+		usb1: usb@1fad0000 {
+			compatible = "mediatek,mtk-xhci";
+			reg = <0x0 0x1fad0000 0x0 0x3e00>,
+				<0x0 0x1fad3e00 0x0 0x100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+
+			phys = <&usb1_u2 PHY_TYPE_USB2>, <&usb0_u3 PHY_TYPE_USB3>;
+
+			status = "disabled";
+		};
+
+		phy@1fae0000 {
+			compatible = "airoha,an7581-usb-phy";
+			reg = <0x0 0x1fae0000 0x0 0x10000>;
+
+			airoha,port-id = <1>;
+			airoha,scu-ssr = <&scu_ssr>;
+
+			usb1_u2: usb2-phy {
+				#phy-cells = <1>;
+			};
+
+			usb1_u3: usb3-phy {
+				#phy-cells = <1>;
+			};
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.48.1


