Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366DECEE356
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3WaOTYkNf4AAodARHlFM7h9L1Nb98ZH6Is6DPGp4RE=; b=cjT5hWzHEdBSuZs0vXLwKkZYyu
	hUgDaTprm7B0G1OvsXqcvNMx+7qV4kjQTGnSxVnc2RxsB1gSVVkCYaA90Lv0oCfWcGiCaGnhZjjlg
	z0wpjeUskT9LV/8c3jJPV9IG0XW+JhjWB+GiLZMFmAr0TfxD5NKc8G4CUhw01C0zZB4qeZBF1h0li
	QMWmqQ6mi+sPI/aswLUbJav15kiSDqPN0JIWd8U+bw5JuwPPyKnDP/xyn/45MdDNFa0x8/aCoewuP
	r4sJkhp1uVlY+2GGPM1zCYp0gZiwqrjThBUQTe3RhXyuFI9Kpoc0AApdMdb58RNjI6BKnCno42jLc
	iJ6qnXEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ3-00000001Pez-3NDX;
	Wed, 19 Nov 2025 02:52:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ1-00000001PdP-3CLt;
	Wed, 19 Nov 2025 02:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8129601F0;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46EB7C2BCB8;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520746;
	bh=KFGyrQh93ivdhVyvrOG6wXqJIaFFQnK/RBZGtIK0bf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MqwETRBRk5sHmRufIPnx15j7+h8yl1Rcbv54ztf/Q2pmrFxvm1g9VjJlqMdWxdB3t
	 EIiUbVdr57FnW6proG7NgBLfXYUX6pdAzxqaPtiLr3OvJQQFzFbTmubY8wiEBY5GKZ
	 dvSDDD8wIMAK/SO6R4C7+H4V7IUcmAp3ilSJ3FhATMLeYpPoTRtaVruydMKY4sYtp/
	 RNHrYe4/mr2xPYISzji+OrkYdXAgTqMv8b/BuUEXkkvm8l9nHAt0J4BVIVF1YW642a
	 maP8ofNJIt+KrWdNX1ehGVe5Kt1DAQgnHCDwrgQXya5ogbQl80PEiIHuAmUopTRmLX
	 6z8akzELcZ3cA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E49CF256F;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Nov 2025 10:52:24 +0800
Subject: [PATCH v3 3/5] arm64: dts: amlogic: s6: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-soc-info-s6-s7-s7d-v3-3-1764c1995c04@amlogic.com>
References: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
In-Reply-To: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763520743; l=913;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Radwg8hYK+TMvojVUY9r/2XXC2WELdJKWA4Bk2N59s8=;
 b=MGnG/vtgtGjQCDohwEB4pkdfIDdx3n/2tFmD+oKhf8/tNiMYcFZ0HzlC0grUIPf1MMXkTKcwd
 30KL0EfV1D3Dfq1aB+9lnh1SXQXtKhd/Y80YHX1ZLIqcT+ahZBugiph
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 0dca64a2ef9e..da3e607aea85 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -199,6 +199,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s6-ao-secure",
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



