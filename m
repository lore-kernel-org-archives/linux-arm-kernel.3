Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6178CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mek+Cd+nMSRi3Fz7aCpPRgu8R7ZfoCVNHQDnn5kdoCw=; b=1Ul/YYwvVeKE5Zqdn30ICHK6/j
	Fyw40yTx1AM9u0F9TKxwbjBAT+vLiCQm2H3cN9PB8XYAdTdfJl/FQy0caX7lDo6pgFfhutDpOJcWZ
	+13rTyFaCxUPyCLUZrV6lAb6EYMoiZVnlPlASzvxY6uZLCxWnAULDHVoBmUmP7nv+3qtGl9hXFxzC
	clDWH4yTR3cXiOMcj/910sRt+ENH10mZCCZ7T0JVtnibIa66Zeh7E0PmaejgYHl+kJD003r5yAMSD
	HOfZmuwIMrzIgUzUeIeeKt1/kthsf7OPv95pWNVD/7nJsBoliGVmwfM2jsf8mxvm5w8RoMsx8DKNd
	YQl+/0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk8-0000000HSEl-0Hfk;
	Tue, 18 Nov 2025 05:59:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk5-0000000HSCC-2VEz;
	Tue, 18 Nov 2025 05:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06D9860158;
	Tue, 18 Nov 2025 05:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3103BC2BC87;
	Tue, 18 Nov 2025 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445544;
	bh=qkadhoVgwtKGC7dxnnB7hY1uWxAE7LIEZwUFdYKyPa0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wdg4zMlTLDo6PAT7CZFniOKbF7NfHIZI5CUSv3aLXpU+JzpLl9lU2OdyhEWk3o7Np
	 4nDTrrtabWQTKZN+7h5Mp0ERzKEtKP3xRY1WH4tzZ8x7htSPjD4VY5XmtvavVlVw7T
	 iJ78493lii2Onua1XYd1oG13W2SnPQaXmUp7vq0StnHHiaYe5Qg8W4Pw9hs4ogGhZ1
	 GEj0+G+GHSFyyUiovTt6eemk7SSF76wQr78iltx7FZy58HRXT7TD0vLNitxE2DFVYw
	 uoqxKK+bcOptNcnELmakY6LqsNHq5Y6AGDtesjBPgEcwkhSHixYp0rQWy68UXDyjel
	 BZAH1OcOIySgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C06CED247;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 18 Nov 2025 13:59:03 +0800
Subject: [PATCH v2 4/5] arm64: dts: amlogic: s7: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-4-38e2b31a88d1@amlogic.com>
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=jgUllk/cZ9b+GQwFjhTwGDyXMhwvUcYN6gknLaho5G4=;
 b=eDFAefrmRxqtUqUBcmCUro0E3fc87mJP+OA9n2hkjFQxuy9jzWsFQLJvhh2YULC3UZOvQvlos
 6A/9KYnM+ncBq43gG4CD36eCjYp5I0rIAalfIi4Qg6SqXvHyTiY1/YQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Add node for board info registers, which allows getting SoC family and
board revision.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index d0b63d3fc953..dd7e3de2a53d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -221,6 +221,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s7-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1



