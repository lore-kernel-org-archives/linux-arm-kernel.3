Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FCACCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X85nZt7p7vb/qD/lGUHggKCAt1bAVU7uPQtEmAjo2co=; b=GBbjdeglG86ug/YkUtjHbe38HV
	h8oibmdCrCaS/yIEY4wMucDRo6wt8YLWNwfAKJghqmFCzdtgU/yg4z6tIYVDLKnIor2KBLgq2toOG
	1mCncmehpoirqhHs5h8zcQSlRNKRd++QIGsPDkncSNXuRKUhj4Oxq1K/FuxTFKfVs5BLqvRlD1vxf
	ruLSP6aXAx1fpq2ZJPWcggPBBIVD1P2axO0umtbNNvl5DRchaVMQqh2d8RR0FQL0E1m9vP5Pkf/TJ
	gUUonbcVStu1XcWlo2Hcrmj2B+TAl71xoj2LQuO6RVnsOFtTkf8w/RHpJXoxOjqkq/NHBVVzseCaA
	EkLVJW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6P-0000000DPhj-2MUR;
	Wed, 05 Nov 2025 09:46:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6I-0000000DPZU-1Pez;
	Wed, 05 Nov 2025 09:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B6A744AAE;
	Wed,  5 Nov 2025 09:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4703C2BCB0;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762336005;
	bh=QF6T53HtbrDYtFNe4R0219yVnnRMyuYxyu6D6l67B/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Im9zw4yyP0agTF6oZLK6adt3b6YKbJJv8hbWRRBpncWjbFFYqoZQOnHmGC7kIltCM
	 xbtIcGZeWWMcEwADOiM50ZUrnEFbGB0lxyA0J9H5GdbIYmewhNLkuXd946QhUD29BW
	 fvg22q82VkHnSQNupJ8PG9EP605uL3Mzgv6rzKGZQWPIHQO1PLtkccTTWbwLfZmHu3
	 K7dfk+dl8HDLvvGNrdinBbU5L1ONxRRnYKtT/u9Lnpezcw+RVI+vpCQfNkiRsjA+vt
	 pZl3IzYVjPfaigC3pPMnp7S30lHzz5Wtvb0JRJNg8rmxnJh1qz5sGv5CIDE3vGIQJD
	 P5hRqi5xYGOfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB53BCCFA0D;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 05 Nov 2025 17:45:36 +0800
Subject: [PATCH 5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-irqchip-gpio-s6-s7-s7d-v1-5-b4d1fe4781c1@amlogic.com>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762336003; l=922;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=2AYFwRRhMKaUI5x+oJaokYbcjNo1luvhZzq4ySuPuPs=;
 b=+EosMo/CxCiQsNno/KnRUjzh/vq1pZfPr6Q1/RpifdI+hS7YvwZOYvznaTxnMv5sjiqBthCgb
 IxDWULNQCA3BjPo4FyxUUr5oujNzZ8hXdcJW25GrzOhkH6eZye74rjR
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_014646_400202_FF925805 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add GPIO interrupt controller device.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index f1c2e91ec6c5..74f98fae7dac 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -194,6 +194,16 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			gpio_intc: interrupt-controller@4080 {
+				compatible = "amlogic,s7d-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0x4080 0x0 0x20>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts =
+					<10 11 12 13 14 15 16 17 18 19 20 21>;
+			};
 		};
 	};
 };

-- 
2.37.1



