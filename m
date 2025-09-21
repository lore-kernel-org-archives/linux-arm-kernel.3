Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCB5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYoxaZ7nPMcXZs34Fqlnlon76OF2bPiaqqy4qm7YDc=; b=cfQOmXbcGrudZ/Ed9TbkQGgAu1
	2UG9+lpf/SH6PYAX3JaA5UOBwVCpGvVaGtYEiLi2kLEg42EyG3OaxmWGeisNd2Rit17bCjgWTp3mw
	J84EMkvIzvfXG/zSYPu6tZ9sJmfl0E1FwQoRuXVpiHNPo8KdTYyNZ5fn64WV/a72qVsfZWDeHG68o
	Al/3mE6A1IbSgopdOo0kT9SeG8IplrdUPAnnlw7w7c6xAOUJyzoHWA/xTevG3z7O1vXPK3576oebQ
	HCCOlFrJbRr5wUmHDrTvFwHZC/8Bh3t2zrVdYXNEqC6iUKnrhm4X6x61Hx3thdz7KYCxk9Jhiy/N1
	EKMkK0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0F3i-000000071qL-1go0;
	Sun, 21 Sep 2025 08:04:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0F3V-000000071fZ-1kAu;
	Sun, 21 Sep 2025 08:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB21344D73;
	Sun, 21 Sep 2025 08:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB08C2BC86;
	Sun, 21 Sep 2025 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758441860;
	bh=uBKLNDOkooe/3vuqO/OZ3y3mvA6lc9G0GfI+taewNvA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ratRWKWWb+DWNVvN9W0Lqg3txh4a5owIcUV0gHR2MBiqDFh1ytbg71XEnh8QZznwh
	 V8yIiHsUmcwAhbhmFJ/4iQk+9WtW1S0K1AvEBdI9SLk1FzTcxl5dQ6c7HdYC4FDIjw
	 zSH6SRj/gCHTesOSRGHxhJfthRpxUnGjs8an8k3oB4v5uNlwnlGsQ4lXq+sZcsKcWs
	 lbaBq9MVpqAV7zKAziPia58szmqY/63qx/5T2eivYJLeGkR6SVI+/O9ILgHl5mN8W3
	 OGoeU8FYqFHOWlB0xg9+HFV7StDP35i5pgmd92lU5JfaGPactzTj5SspvQinckbn2S
	 Paf/XcSgnmvfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F72CAC5A7;
	Sun, 21 Sep 2025 08:04:20 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sun, 21 Sep 2025 01:04:23 -0700
Subject: [PATCH v2 5/5] arm64: dts: rk3399-pinephone-pro: Fix voltage
 threshold for volume down key
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-ppp_light_accel_mag_vol-down-v2-5-e6bcc6ca74ae@gmail.com>
References: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
In-Reply-To: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758441859; l=918;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=b2Y2d/HCInz27ts/XaKTXbc5Q1Z/myeoiVLoN5Pgsog=;
 b=zJ/SzjGEcWe22uQJE+V9sjp5PXkhwQeIOk1uEMMei9LIVJsw8MEP2dCoehW2P0vj0nHOUnqp9
 Tqa0iwC1miiDnAsbiHldOuFHjezVTSNzLslQEBZVOFBc+3/M0EhLJAG
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_010421_553388_1893B9B3 
X-CRM114-Status: GOOD (  10.85  )
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ondrej Jirman <megi@xff.cz>

U-Boot and Linux use different algorithms for determining voltage ranges
for comparison. Pick value that will work with both.

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 0a4121b05d36c5a7e05eddbd3514a11ae4f7d3eb..4e6df664d780ed4798015db6b2fe79bf7c4e4c00 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -46,7 +46,7 @@ button-up {
 		button-down {
 			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
-			press-threshold-microvolt = <600000>;
+			press-threshold-microvolt = <400000>;
 		};
 	};
 

-- 
2.51.0



