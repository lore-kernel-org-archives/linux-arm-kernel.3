Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704E2C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk3wF6DQQBSAA6bIf8xV1Q63Mkm6uA/5/hwNBw94cus=; b=TM8RUX35VNWWuPGszUfq0cpKK+
	oaV3lJytukQ/MMhRMx+XQpObcKgruPgAi9YNyI9T+wfF0HP9xX1NH3/ugDWgGNelqB6sILfunOdOV
	W1F83IHWpFc03HislDosjWkhUT6tojQ6glcLjesZ9+n3i3qc6B6Zu72DMX3P99IrNVtlY4Iu+/jLj
	MmcO3msBY/DMRY24gwGaoUS/RhXX1LIleu281Fde2Un30PnLvNbI2Yf7SQGSwQSpQY8zEazeDR05U
	0ovtJ3ttQXaprFvXE22naPgso0i+3kcbziakNmnDP+2rmExXv8ipYJTyFsNPiyBQ2w5+UkdJzcgay
	3ZlU8XaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtlhK-0000000G1ct-3yMR;
	Sat, 21 Feb 2026 12:02:58 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtlhH-0000000G1br-2vZ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 12:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1771675371; bh=+P2UmjjMj8fB1fckTddWUiRUs1ZIOtQl89FyWQY/oVY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eWHiGQttCqab0qbtNV3yYZ1r1hoiCRUjfyPQO8phOKwMB7IV/jc+EDV8LvQT2XUB3
	 nlIXcVEZO6Up1q3hCweUTcfewqPSWR9ZG/kL8f3H1SGJ7VxGHlgihmpI5rrWniZMr3
	 PcULoXr8Ulz+vrjyPHvsLPePAnR6Biaz0OeNn23aZwCNxZTTQsYR7/emxtsnpmoZ/T
	 Sr27UrsQGucxgt1t9aF2sIlkRol33ykTwTgtjEJOoMJYIux7egD8rKCKTzxdQ4eyq7
	 DEd0Wd6yLe9ERObuGEWvw5p01NINxhcUu3saXyjrN1MwebaJU3WT8Jd4qDIm+84stW
	 Dp2YdKSVqoRAA==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl [79.184.40.11])
	by ms.puri.sm (Postfix) with ESMTPSA id BECED1F6B9;
	Sat, 21 Feb 2026 04:02:50 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Sat, 21 Feb 2026 13:02:11 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage
 up to 0.85V
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260221-l5-voltages-v1-2-daa8aeedc86c@puri.sm>
References: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
In-Reply-To: <20260221-l5-voltages-v1-0-daa8aeedc86c@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=+P2UmjjMj8fB1fckTddWUiRUs1ZIOtQl89FyWQY/oVY=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpmZ7ocu5Hw1ObhHncLNhbzM94h2d1o9vFmz51o
 jRa7deANWqJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZme6AAKCRDo8jXPO9vD
 /yxdEACIASgj/eqaCUoHUUJzgkjBpEivCs37Kdd01+sc29Bl+YonBOPk6H4EbPdGU4BV4EQ6Enl
 GWpdyORS+rq0II85RUlrSmWIFe1Gur3wYUJ5Xe0Lrh/o8EQN5j+LcmGXTmn1zdq2gSCnUAsTob9
 ABXMB/QmwIAtCU0J41vTUwPEOD6eSa7X/exEnppChB7o4i8mF/s3QgeRnkliCBmfjpvY6HjnU8t
 kZDGO/VqlBMVpGCrOY6ibPjKtJb0hEjTwv+/6aBXGIdSVuDz2/uHrQQ64/iMMZqzzedz0L/Fo8g
 dSe7w6wy9/xZeHUnqdxIGD7RicQII/SY6cPxIOc9wNW7fcrPxU2XQiRT/TY6n7H0BFG+5myMZi/
 nGZl9VoX7Z22MTF9hr+mBM0ffV1CBkCtpPwnaZUvPep/aY6HnkFzDK+WMnzi/whoIXaeHQfY1wS
 RoypWrai/39O5MI2ReOi79roXVCLLwNd+voju6RYtDuvwLcqU6LJw9MeuQMszFApD0UsqeXXzW4
 QXcZZKin7KfFP/q1WeJbcWrGG9QKFWGenJyqLwaB5/e5cdVEHUqOHWu/AOybT2WnXr/40zfVpXS
 vqtthF/nEI6cf0omWhs3Pe+4R6e5UbRsl2MzWJEzBrYqyw4iOCLth2OhBj+4Wbe/tUhKokEpI34
 JbaFM0Jw+nxV+KA==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_040255_893778_04CB6504 
X-CRM114-Status: GOOD (  10.95  )
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

The minimal voltage of VDD_SOC sourced from BUCK1 is 0.81V, which
is the currently set value. However, BD71837 only guarantees accuracy
of ±0.01V, and this still doesn't factor other reasons for actual
voltage to slightly drop in, resulting in the possibility of running
out of the operational range.

Bump the voltage up to 0.85V, which should give enough headroom.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 7818d84f25a7..f5d529c5baf3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -882,7 +882,7 @@ buck1_reg: BUCK1 {
 				regulator-ramp-delay = <1250>;
 				rohm,dvs-run-voltage = <900000>;
 				rohm,dvs-idle-voltage = <850000>;
-				rohm,dvs-suspend-voltage = <810000>;
+				rohm,dvs-suspend-voltage = <850000>;
 				regulator-always-on;
 			};
 

-- 
2.53.0


