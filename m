Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C73606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gQAw7RWa;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z9xoFFTe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=; b=gQAw7RWapQrWLR2zn4erFaqhol
	GVoeS1/eP1QCFYBJvCqvRMgdbNgbwxo3KLf/hAt+77zUbKV+KwtTYF0o0KYVES3Ln9O68wvjJsZdB
	mXDDV4vjs51VAYZQUwh9z+8mCxquvl7dXAk4s0SYFCkeKoCxot6mlAYhRXEZpAgxqCzLQcFpvM2Re
	3S4mxGJKnUPhXT7/prlh3NhE8NUH0QIr+lm/q+ngpZwr/FlR45u4SG7QF3wHPqyMn6n/aHAqec18O
	4f1I4q+IGZE1ySU7mv33SxG5xTjKHynePaZBa0+0aoSJTEUJBzAJ04Ewm+mfimVXgoBbebqZPvfKW
	BT4KshAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj1M-0000000DFft-4B0Q;
	Thu, 22 Oct 2026 02:59:12 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj1F-0000000DFY0-05YJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:59:07 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-35e37b4a43cso210644eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 19:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637944; x=1793242744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=Z9xoFFTewkTLM22PFys8qpfH3+AC6YM5dK7jdAeiJlmA1zP13Cvi6T0IxDENTHUTQV
         Em/MF7/qrgtIi6dcDbDbOCccIi5gbxy13GoOCT9dJd5e10raP1/wp1TY/O79uoN2x7GV
         Z+nU0U0GTwyFI7FEGANEAUE8mVHoUAUMwUG5BscdyTsIJtN7B41UuoJz8AoRaibHYOcQ
         jx3UPNgwjV72QrNxOPMI7u6wzrzLOD81qNEUtS2iePOXXuHQMhpaaQBI6Sl99r0i/nkV
         pivrrixHwmGMYg7gwavvuK4hXOcEu3b1PlO9IzuKmLUcVc+/zKw+KfoKLnwNtt35rZix
         5xgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637944; x=1793242744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XWEwn6v/542iwfySD79nms5PIwynC+fVLbCD6LA4gYs=;
        b=smmD7tDrRmAofA6gmZokLskkYsQPEsQg9EEpYFc6Xb5VrdwEjKVg6t1RqqjRgTR7w9
         86QWCiO8j8Yxp7xuni8tBqi5NgYojoxk8jBI3LhSsWpoq1OobhkpR7WNY0KuwsfIkX7s
         YHhHeHfOnDHgVKHP5DTPLHa9dC5JeaBxD9+XLRXNrUL565yRMlNSj8P5q+svaljRcWB3
         xGsixApXvMmVLWomYFFF1ntIK4UgqyALlhx5BcCJ3pM6JXE0Jgl5/kj00cq4HWo82RMt
         4r6QqZNmChBr6O5ulFiJUhWKVuClCXEWEcCt8dcN1uM7/6+UHO24rVHqOLhV9CP8rBqM
         lcpw==
X-Forwarded-Encrypted: i=1; AKwUvByvelnah606SX9KvKIZ2wO5cV0u9/vwXmlJZVEDW+clyleoKRHYKTsqAidboOuGkzpw/B59VIGO7+p0UTu+xyoO@lists.infradead.org
X-Gm-Message-State: AFq9FYKGcxoPTFlpqxnXaT/1QPASgBhNfZwpTB374DqYcuEuQkM0jgVe
	jHp3rHYHTp7z0Wrem0V9TuEPmnptmrHDVIuQTpDXQXcW4yJgOm37nso+
X-Gm-Gg: AYBFou1U57S/Byyt+Wi2WfTq4qLvxZ2pbAgypE2UGg0JLS+E8sz04YCFiCDqBwoEVUZ
	velXOgY4ecm/BVchktBB+ElCmld2+e2MzkZdpbkUUP579n+GKSJFZAftsd38H6uTffAlg7H8a5I
	H7vCvHDn4H2nyRRPD6UKFElrG+tUzpM8oYfty1aNsWYkiSAv2QeX7UDeWlRSD5Cd0aXGhpV58Qm
	tGesG7alcLvpDawyzr8tN/gQiF11o1dZNIFE+9RZbEl0bG+UfeaaZwACnom2mV4apnXeOBKX7iO
	+etOghZxTbwd5msre9ecirHBW4+HaiajbmqbAF67/cLf6mnlq603tgw4Jqst0MzP/PRNITR4/q/
	8cCro5A0DKEH41+1WdTxCPvaFZlc4fLmLUGijokHOd+GlNvMp7GZyABIxAGTgf2tqrTu/RoSg7f
	N6jeVqtlblMEbMuiGDN1jiFTXdDd2nU/BRMySlxrfjvLlKJkBOGLNqns2Dz8IfZzcGtb7tFaNCY
	RbDrAadAf1qY0msbKcS5tRha+SYoS/sb499KCT8wiO2vqMSnM5I/Q==
X-Received: by 2002:a05:7301:2b5:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-368af4a36bcmr1633520eec.10.1792637944031;
        Wed, 21 Oct 2026 19:59:04 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:59:03 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v11 2/3] arm64: dts: rockchip: rk3568-photonicat: add RGMII PHY LEDs
Date: Thu, 22 Oct 2026 10:58:43 +0800
Message-ID: <20261022025844.150320-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_195905_718128_038D1DA4 
X-CRM114-Status: GOOD (  11.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Motorcomm YT8521SC RGMII PHY on the Ariaboard Photonicat has two
front-panel LEDs wired to it. Describe them in the device tree so that
userspace can control and monitor them through the LED class.

Both LEDs use the "keep" default state, so the PHY's built-in LED
behaviour is preserved until userspace overrides the trigger.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..12ae9159bea87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -350,6 +351,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
-- 
2.47.3


