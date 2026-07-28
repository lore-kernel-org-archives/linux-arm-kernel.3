Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB384C54F4D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6aVM7ubP+FZEA269nwLXgM6JiG4zElE5w8pBOy3T60=; b=YOSCUofdOm5QJOmnxKUemUMY67
	HgZDWwOXmCXNeTT5Iw0XMGdA27Ae0R3U78AH/bWY72CDne8FbO0FHF25PRE7CnovosDde4s/oYoj3
	hyJmitSzNj4fI34uMMGOrwbtqRat+SDxgXFlW1IfE6u1KwzThAJS74GbXjyj6GysuqrcIRBaUONZD
	LpOA+dYMHAfbqD5hRLcsg2yYhfUY2ThXVUle1htQFB1d6v/xqTi0g7thlQkdZfMIwcv4161/MJqbo
	4IrTVA8KRaCMZfaLo0lX4TfkCcn4mUk7FbmmaR/ketp/JXRghI88+Y+LeZjncUQmPZ3Z+zkhGoiDp
	N9wKwTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnz-00000005zd0-2KRR;
	Tue, 28 Jul 2026 17:41:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnW-00000005z8J-1m8X;
	Tue, 28 Jul 2026 17:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=k6aVM7ubP+FZEA269nwLXgM6JiG4zElE5w8pBOy3T60=; b=Kj0a9X5ntsbdbb5H8ZvUDy4zmc
	HGNrM+4n143svi5ldvnb+EeXy5KveAAXJWHGrKNiS7fKEUHZaH0IpZpcxS7G3wJ0Rb2x8XqocvihH
	jrsvBRewnwr7bn2eZVJamJ6n9CNg88vZkDbT++q+UItdrsRGctPY0D18kONj78BhAUaoF0L1I0aeN
	1aiDF8COMpMm2bCwLL8U91fJ9vpRYIKGOCYGGj+XzSCLvSqb/rnD23uDj+81v6WnFzLj6UHs2jjkJ
	sfAm39/xFo+sL84aaYBUeuBGzfOS1608bmQVLHJ30AyQvQfBBSyiAHsbtKx9j+tRTe/iP4GP4bDW6
	SY3zX3Pg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolnT-00000005AT1-1UiC;
	Tue, 28 Jul 2026 17:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260447;
	bh=SwF3VHoRiI4Zsf33YHjX0UHR9rjLn/pkIELQ2nyar2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B5EBe5FihLvIicNcM4iAcjqZKN1kUjMkfAV+A6EVzyUlORR6ppVuzGz/vnH4KgseU
	 zCuCnt0eY+ClN21xZ5zwtcCxb4hIfq5f32KMIUvVXrFAEb2elYE6TXMByx0e7/qWq6
	 hic1/XYcXWOJU5iUS27dQcpnTjRPkrrlKYemCSZQbNG3R8cXPemdGFkaMoyb8LNIUq
	 Zl2uBDFRP0OIXPMIyhaHw7i1aZsnzG3m2bvL8o2VAuQEhHyWljGetVKpfV7fuVnxbw
	 06LZ4lob6EzY+CNz7KnqkZrWah2ztv1N9KglCHz/a626CLOMGXKoso38qRwbidg5oB
	 iW2zf4kzEz1zw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0765D17E07C0;
	Tue, 28 Jul 2026 19:40:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 216F3480061; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:52 +0200
Subject: [PATCH v7 16/18] dt-bindings: display: rockchip: dw-dp: Fix sound
 DAI cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-16-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=SwF3VHoRiI4Zsf33YHjX0UHR9rjLn/pkIELQ2nyar2c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z1DPBRXsvyKKFj4uJGkTN0AvgHH6j0vo
 oUgEQQGn+dvvYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qa56sP/2zQfTKswBVENVFpfQVxqwO1G4Sha2xSXzYZeUJqVzKbtnlXb9c7T4YaLhth46xKSHL
 UiqIvUyOZzFwESVSwHVAphccoDf0dYKuA1OBgpIlMv0oO21jTGE9XeewKfc2iOdqvwLDhjD8jjo
 4mkXTr/g9DQpXrvdCmad1vqLmOrKGONYk2nhi9FIPDA/XIpnaI5XzVbNAoC4relEYT9fVGUjfGN
 +eCukSz0AArFZN5f34Ng/Fi3pLzDbyDT0PVvG9oefs8hRiYZ9lCc5mmI0bj92evKXIylEeyTVMz
 V535N8EsB4Nhr1kRJuu4r9YS7/SJvVUHwqtH0Its9ncYPbSnR1cSY0mHjPt0wtqL03iWoZVEV6I
 jirIxToiT1ddWz9HcXnFMIsmKqN6VG3/tqCqmBjdQVUKNAa8MZ/pyufvOG6BNv4Q3rK3CDxHUhX
 T/jq0sCbuLa7OB3soShGcmlSxm2eQPtzRhuZxt+RE5y9zwH46/MXVpiFPg3ftF5DFvmtlNwfQbf
 9DRpRW1vVS5rfBkhMTvcelj19EOGqhzLQW8RY7UTkCH/Fdjz8ytA/p038Rwlj05hAvJYq/GMTiQ
 gJiYPSXkVL+DOPR8SuidMqO1eqh/yXkLmi2riLXJkE0H/kiVa/Da0MQtmSX42X2hOZI2Orq9Klx
 gXaSwTddSpcBj8hQ4vRAxTA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184055_646885_562DB4C2 
X-CRM114-Status: GOOD (  19.34  )
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

The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
to select the right interface.

In addition to that the RK3576 DisplayPort controller is configured
with Multi Stream Transport (MST) enabled for up to 3 displays and
thus has a total of 6 DAI interfaces (I2S and S/PDIF for each possible
stream). Meanwhile the RK3588 does not support MST and thus has only 2
DAI interfaces.

The binding update from this patch has only been tested with the simple
single stream transport (SST) setup as the Linux driver does not yet
support MST. Once MST support is added, the plan is to simply add more
numbers to the argument, so that it looks like this for RK3576:

0 = I2S on stream 0,
1 = S/PDIF on stream 0
2 = I2S on stream 1,
3 = S/PDIF on stream 1
4 = I2S on stream 2,
5 = S/PDIF on stream 2

As the arguments are not part of the binding itself the audio side
is also ready for MST after this change.

Switching '#sound-dai-cells' from 0 to 1 without keeping compatibility
is an ABI break. The rationale for going that way is, that there is not
a single known driver implementation for the current binding. It's also
unclear how the current binding would be used (only support I2S or
S/PDIF for stream 0?). The mainline rk3588 DTS include sets it to 0, but
does not have any soundcard using the DAI. This will be fixed up
separately. The RK3576 does not set it at all.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml     | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
index 2b0d9e23e943..c4f8959dd65d 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -25,7 +25,7 @@ description: |
   * Supports up to 8/10 bits per color component
   * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
   * Pixel clock up to 594MHz
-  * I2S, SPDIF audio interface
+  * I2S, S/PDIF audio interface
 
 properties:
   compatible:
@@ -46,7 +46,7 @@ properties:
       - description: DisplayPort AUX clock
       - description: HDCP clock
       - description: I2S interface clock
-      - description: SPDIF interfce clock
+      - description: S/PDIF interfce clock
 
   clock-names:
     minItems: 3
@@ -83,7 +83,8 @@ properties:
     maxItems: 1
 
   "#sound-dai-cells":
-    const: 0
+    const: 1
+    description: 0 for I2S, 1 for S/PDIF
 
 required:
   - compatible
@@ -144,7 +145,7 @@ examples:
         resets = <&cru SRST_DP0>;
         phys = <&usbdp_phy0 PHY_TYPE_DP>;
         power-domains = <&power RK3588_PD_VO0>;
-        #sound-dai-cells = <0>;
+        #sound-dai-cells = <1>;
 
         ports {
           #address-cells = <1>;

-- 
2.53.0


