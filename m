Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F4FC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 03:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0sqO7MiIV0YXGPtkWglkjANT8DnIPJIuGkD2RdPwzI=; b=oA7KoINitfVOIpDshO6SDGe6XS
	9brPeB6u8wPIRb2F2CeWsC6js99XmmAOPWKHSRtixmBSbjBTUgeiYqxrn2ym5X9sCcSSEzpjJSOCx
	A5VgcNVVWKZ29I8OvYKjPWdEgouApCC9sqB/hPQfpeqD2OVQguOPu3Q5h8+Scp4pXh8QIz06IFnfP
	FVfJhLbcYT8E/YoicU5KlMa/W3CxEF6ab92knKaPWTRoH4+VL1A+u5sUhXmzYew2DTwFDsl8Jd7lr
	HB9uY7mZ3M64POyGzvAZh/EfBMJD34D+Iz8SuUbRQwvIpxrx8rq1ks7LzpmNXxdZLiq6edBWh3Syi
	keWh6CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trq3h-00000004Uvj-2B1s;
	Tue, 11 Mar 2025 03:13:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trpyq-00000004UIR-1R0J;
	Tue, 11 Mar 2025 03:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70E0FA467EB;
	Tue, 11 Mar 2025 03:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D2A0C4AF0B;
	Tue, 11 Mar 2025 03:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741662510;
	bh=qXZhNxUy9y5s5LhZ9M7FyoFK7Zgj7Uh6fOjZphxmzps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OtjE3WsAVX93Kfi+2HoCjHhOcJ27AmcZwt3ppnX7OdBdiKINw0kvkAWxX3hjiKQ80
	 Rf6SydKIgqvgJykjLDe9wPNzruejDxMSR3HX3Byn8bzEUDX7qc2Q4tjUhTjcuMd3CC
	 20cFVRBbXZINoWaN+CbOuVjtBo8sPd40iWWnS/EJ8wag4SV3yO5KMIDU+WZsGjRqsq
	 ac+LuxbApCVBJI0j1uepMYZhlWPg+oljRRGX07Vlld9Sin7fxLuywK6nbYD36fMJlx
	 C7IFeoKd90lAzTBIMDTJtMisZHKNXsX14hJxch/BXKtm9ouDu9TlqP7pyGIZdcwK8i
	 i/UvkPb0bW9Cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D99BC28B2E;
	Tue, 11 Mar 2025 03:08:30 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 11 Mar 2025 11:08:30 +0800
Subject: [PATCH v5 4/4] arm64: dts: Add gpio_intc node for Amlogic A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-irqchip-gpio-a4-a5-v5-4-ca4cc276c18c@amlogic.com>
References: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
In-Reply-To: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741662508; l=835;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=+kt3Jevc/8KR/ZsMbFbD2TjHFreHkm3hzIePStnSOmI=;
 b=eLM/Fg5wgOWvIrSzv/pUKjogLQUlLKhAZf3PT9YVtWAK5FkKOLp0RACQSauS1ciE0UYl9a0Mz
 Ij0EYM0frGaBzdrNYdO1mOkwTSHZyLDePojzSAJbMs299zK8kH0EO2I
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_200832_446152_3C4769BC 
X-CRM114-Status: UNSURE (   8.12  )
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
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 17a6316de891..32ed1776891b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -48,3 +48,15 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	gpio_intc: interrupt-controller@4080 {
+		compatible = "amlogic,a5-gpio-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x4080 0x0 0x20>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts =
+			<10 11 12 13 14 15 16 17 18 19 20 21>;
+	};
+};

-- 
2.37.1



