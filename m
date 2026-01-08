Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD719D232C3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 23:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7xMgEeVeBEbEp0ykOQ85578lDJEFg0b+2dNiORyGkNQ=; b=1Qg7v1UHz/lzd8tW8YLDVZ66+K
	/g3gJXczk5rBwtIE3VEkprJNJFWgNOQO+OcbZ68krp1Tgw8oRpaygLgOChsojTCCTLkfNQD4qlomx
	hJ65VdeZjR0gOJEjY2E4DIMEiHp/FctRLlq71GwxuKCnUFnJ7qcG1jg06Xh3KxiuLi+GHczgb4Z5R
	cnDagyhHnNih37kRvlPhgVpAs9y/iQe4H9PnhDeOGStWVVnlzIl7VopOeqoov/0imJ4GpMoiePbzV
	wuc6ExOF8CTcDntJ4PYHfJp+sGEHrl2uceXvBTUn4H1WiGZnebSBw1C0neSdBbVU2IryyAAegHL0Y
	cjnTfTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdz5C-00000000yV6-0LV1;
	Thu, 08 Jan 2026 23:06:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdz59-00000000yTY-3s6p;
	Thu, 08 Jan 2026 23:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 288EA434B3;
	Thu,  8 Jan 2026 23:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E699BC116C6;
	Thu,  8 Jan 2026 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767913579;
	bh=lpYcV9gaFVICm+OV5hThQh4LXmGP/93/zbRqYv5uQ08=;
	h=From:To:Cc:Subject:Date:From;
	b=RYv5fElyNvHhVN5pAP8GE9ju4c62b0sd/zx/OZCTn00GkCUWPpzDuribmTE8dbE7+
	 EvPRYKDZ89iGX2KwUEwKy/bAC0B0NMEaNb8LwiscunRlSfFCz46eerxHkBTIxYZYVR
	 jREPKDD3G43UVyVhOG6M2fAyuoMkDPgiqodCafmHhsmwOzGjGLi/vrrlktaSHQhTUZ
	 qE1flRsKz0XjDLPHVb8LWNty8uRSKnn3VEJIvOfZ8uXnt5COZUrACiAGuI8aSJPIw0
	 Un1qI1ovBrENtJq9aFx5xb590NNZLw/2fq1KkM8UkTLDvBnmY+Q0BAP8tXUT6Bk1jn
	 NX5SILHcPzC9g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: rk3326-odroid-go3: Fix pinctrl property typo
Date: Thu,  8 Jan 2026 17:06:13 -0600
Message-ID: <20260108230613.1349060-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_150619_984636_4CDDF43A 
X-CRM114-Status: UNSURE (   9.84  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

"pinctrl" is not a defined property name. The correct name is
"pinctrl-0".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
index 35bbaf559ca3..7f6f3c5040d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
@@ -14,7 +14,7 @@ / {
 
 	joystick_mux_controller: mux-controller {
 		compatible = "gpio-mux";
-		pinctrl = <&mux_en_pins>;
+		pinctrl-0 = <&mux_en_pins>;
 		#mux-control-cells = <0>;
 
 		mux-gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>,
-- 
2.51.0


