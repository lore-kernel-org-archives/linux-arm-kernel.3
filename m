Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A93C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01J08lZtsLSrVAWFDp4F6uPNfHcjLK4OohuQpvctuYQ=; b=yDxn3kOFmHPJ0KA+cKCU50uWZo
	YWgaN4zZ6mvro5MyhIrZi05FspdfkbNNPwYLr9e6wlScBhnLdSdtDbdySrZ6VjClDVXIQPCWRgbG5
	jpBUMQLTVCE5Fo8PA2kp3zcND+FtK4zR8DbwYbGoRrjaeO1+5g26fW9tWcnOQLZc2NuxWJ31SsiIo
	lVosb1AiK2oNNqiqeCwOfP6Gi/Vkd9CbE5B/PYYbhLBOfkjJMi50KCPqupeE4KgVXmhPbpJhNh39i
	iTyzDG4aMjjR7s+KVT36hgczNiozAiFebjMROJGOn5HlpZAYJYMIiN+ES/zeHbsfvdcigFz48YfnC
	06IaHPaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq1gV-0000000DtfL-3jQP;
	Sat, 01 Aug 2026 04:50:55 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq1gN-0000000DtcK-0Jc1;
	Sat, 01 Aug 2026 04:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785559841; bh=01J08lZtsLSrVAWFDp4F6uPNfHcjLK4OohuQpvctuYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zRmLWFvQaKz9jVLSb1JN8Y8I8xW8vuFMiy3IVY726Djn7jCifMTbdzA+OuIlsmI+6
	 6vKTW6dTxINiJ59PU2uDXGlbMANVDyHJilthEly09xBULGYbpSZYT6c9rC2mZyKqNM
	 5J7PFYAdSU5dd023XwK1QTyml1ZCkxqqna0Im5/w=
Received: from AERO17.taila7786d.ts.net ([112.43.117.189])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C9E2EA5C; Sat, 01 Aug 2026 12:50:30 +0800
X-QQ-mid: xmsmtpt1785559832tox0udywq
Message-ID: <tencent_567D8D8018183B13498C4150634540C9C206@qq.com>
X-QQ-XMAILINFO: NT7uTz3cNku23ItSfLE6jgMbokTqZAISMlxNh2psrK3tefVjeRIkLB8w5pkINd
	 QU18R26sz80qamcZWtIOmnVSWRLeX3HVPkOlH56OGO8hCvgB+O5/cMaHvVfWpw8cU9wPeYJp5Vl/
	 by6vh+X+GaW9xExk6ZfQRwL+0AowevGrb6iiTCyRw241/m1iGwNTO0ktpHR8VKwStDwQGbSI6f45
	 y658IOvlSQeSU8iUn7ATrWDFiUTjrQMwFaGPIIYidORgEpFWkt1dGBLxkCasNijpd9snbtKBNIfD
	 wRTgvB5fosxAGSN8YmArfvNUIdVKqhPHDOPDGNO6MhhXoNsSukkWnRIZHUf8qZ4HDvtd5fDKC/l2
	 a1gqSThGskjdcCSimGktfvL7L+9W42SIkPpsKHlyqPPsCgRmqCyMvhx+jIXLP96ZhCX+tyoSQLP9
	 7OpvcsW42w2+eRApfNbxjYPIwAMffcf0KOUZxFAoTPNHfiWAaYKXo/nJGakd8pcIy+PMVT94iIjL
	 H+Ap1mvW7jg0Uje78lUEUR9h+JZ0RCIEG+ei5cJkwo1K90zKKUUKzJfUS4/l/yc11/+38mr28N4B
	 8P5GKi2ETrwn+kcMlMRjWSclC0AzRnHdHBvKxhH2E+TZcP18/F9roCcO3TOuYbhAEB0TYnUtnIMu
	 6qBPbHpwrsWjIuCUGr77KVzHZEsfyUMfxiycUeN7mhR4LSzz0WCqsGlj1GjV3CZWvYnpH+tYOk8o
	 m0uXEqOr7xQBCYJ9U10z5cyX9LRY0QK4CfWQV25yBiuY8rmRDORGhQmSckXJt2Y2fsfdk/ZkJMdO
	 tPWfJnSzMUVPEgqwvM+GehQpvZC8gBvsnuN1rEDnMlyXeU4U7T9FYHbjfx3MH7yOB5at0qMSmD2G
	 YIjWwgOF2dHiCNtyOBwHr3IlwkuDFal92y0KV82A0lejIJLyA+xpQoyp5+2RHGdrplpmp+K9X5ci
	 KU0bnFi8uIHFdi79Pnc4Pei4XxDSKXE70ykG43YyqaGwio1oIAe5Fwp0bcjhzifvRANRBIfa9kga
	 zi9ub3Eq+rnkQqLQd9Kvb/ItW1/jjnMCh0FQER0iQvHuxjoY4X5gRf23HgJ7g0kyCHQ5PHOQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: rockchip: Fix fan PWM period on LubanCat 4
Date: Sat,  1 Aug 2026 12:50:23 +0800
X-OQ-MSGID: <20260801045025.67512-2-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801045025.67512-1-2254650260@qq.com>
References: <20260801045025.67512-1-2254650260@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_215047_640141_994C11B9 
X-CRM114-Status: GOOD (  11.63  )
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

The LubanCat 4 fan header drives a 2-wire fan by chopping its supply with
a MOSFET, so the fan sees a switched 5V rail rather than a PWM control
input. With the 5000 ns (200 kHz) period the off-time is far shorter than
the discharge time of the fan's internal bulk capacitance, so the rail
never drops and the fan runs at full speed for any non-zero duty cycle.

Measured on a rev 20241026 board by driving pwm0 directly over the sysfs
interface, comparing 30% against 100% duty:

  period       frequency   result
  50000 ns      20 kHz     full speed at both duties
  100000 ns     10 kHz     slightly reduced, audible coil whine
  1000000 ns     1 kHz     reduced, loudest coil whine
  10000000 ns  100 Hz      all four cooling levels distinguishable

At 100 Hz the fan is switched on and off outright and the rotor inertia
averages the result, which gives proportional control without exciting
the windings in the range the ear is most sensitive to. Cold start was
verified down to 15% duty, well below the lowest cooling level, so no
fan-stop-to-start-percent handling is needed.

Fixes: 6d9430d58714 ("arm64: dts: rockchip: Add EmbedFire LubanCat 4 board")
Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 586741ae7363..bf413de979cd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -119,7 +119,7 @@ vcc5v0_usb30_host: regulator-vcc5v0-usb30-host {
 	fan: pwm-fan {
 		compatible = "pwm-fan";
 		cooling-levels = <0 100 150 200 255>;
-		pwms = <&pwm0 0 5000 0>;
+		pwms = <&pwm0 0 10000000 0>;
 		#cooling-cells = <2>;
 	};
 };
-- 
2.55.0


