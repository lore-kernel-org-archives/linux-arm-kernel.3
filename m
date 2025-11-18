Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93405CED247
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLkOuRXSvJqb8AkzYVZPYylT0vrl0RqNN2txvnV5ACc=; b=P7rasXhJHhk0/2AD4Ym/MelHC/
	bTQXzwVaJ+kbnTpu4BDxIcxSUkldCr8IMJS38nOX1kNZwwrBo+RyshRKHcNo3xctyJrLX7QCNkT1M
	KE3PNNhR3c6VStfed38JXiMgtrgOgNknCPkBVyRpmCbymJh02z6/p1rYGg6tVPXd25S5BUNqstIzT
	cMgu+obXWk0a3JyR1XnPWcLlNWpjm0lNS5/Sy/mG64SlS2weAyPWmnctu14X/bfekKGGZ2JnOgQlW
	EIbPQOihpvt3pSFmH6fe6LhIv1JewTaopDaGgQ9Pb4YpVhVu57nkHDQ8kT6Vawud9LIV64Q1HTrSN
	/90Ps65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEkF-0000000HSHo-3bAC;
	Tue, 18 Nov 2025 05:59:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk6-0000000HSD3-1RAo;
	Tue, 18 Nov 2025 05:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67F5A601A9;
	Tue, 18 Nov 2025 05:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7130CC2BCC4;
	Tue, 18 Nov 2025 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445544;
	bh=93XnuD8OKydVSI/DK2r4MME+7UjXY/gqTm0Hz7nSjyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XrorHZpIbkIObOhik3tY2uB/yHC7HcDdBlkj/ByubV/qB/PZZnrD5xfwPiHD33Zd6
	 woPp6y7E1ltG+4n9JVt7eiPp6Jar0p8LiOqKEvFtnmhMK8qBlbTWVo85xzb4Exhmn6
	 8CVNIihx2FRpd+/gBpLPqTTlfVqG6yZMIeyQ30FaiYLUcOgqetDJap1vhF8wGvPTkW
	 pc6MKHUB4xlg6VDUodt9VL4V8+PrjlCeNSVHR8E3xwq13SXho5x+wF9PhTIcyGhaAE
	 VKUSJNhi0kydWvyFsKqDOBnBotikLQ85qzmhR4pXd23YTedSfI1KkYSjRqp5RHpOcX
	 hIuQqYUYOkZHg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78031CED24D;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 18 Nov 2025 13:59:04 +0800
Subject: [PATCH v2 5/5] arm64: dts: amlogic: s7d: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-5-38e2b31a88d1@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=862;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=H+K4E15iswq/do49khTt9ccxoAu/8Vn3bdBkB4g+s84=;
 b=Grf6DQoOin45f+OEHqR7HGs3XKJxSXgN2zqeVwRh3Fv2qVgFLE+BkSlT2ASranK1EZgAFmnDi
 XAadOSLc76YDK0+9m8LQE3CkGVfBqPvmKX4R6slLD4S+gWMXMzwRhOm
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
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index f1c2e91ec6c5..e60167af0390 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -194,6 +194,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s7d-ao-secure",
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



