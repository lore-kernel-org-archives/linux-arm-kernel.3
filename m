Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA72C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=618xhx9nBKTrfv5kHWmdQu6I8UjyXvV+9EXwcY0YbYs=; b=mSKYPD5++bw7qykLVR9WdopStz
	AYEYV7pa58+Wb/o/xjhGcK8Ct+sI/mhwjpTWoOx/Gy9Pnh7nRGjDfMTgeX5ay35RcpPJEPwgdS6rD
	wtQ8Jbype+NpEL5yWJ8cs3S5s4gJF/wxqfBxIh2RBgXrTfh6HS/nPg8aDPX1N91lrDnRADKnZAs2+
	4n/DrUc69tnV7Tw1VBV9GLFxlWH1nCofEGlpdc49CdH3H7hLgiSZemDMYupU17EmRl+E0aheBdr//
	dvY6FrMOnK+z/YJtbPisyBpGBRkqNsd6HEq2ucBF1b4FCvNVgBTkO4auzBKHjLGicZ6fnjdE+nblo
	20TWsK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFh-0000000H0o1-0m8g;
	Fri, 24 Jul 2026 18:04:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFJ-0000000H0Hj-00gK;
	Fri, 24 Jul 2026 18:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916210;
	bh=k0eRRol0juQKDRwk26Fz36sBhpAIKfOBZOjBCwiTCgw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z4tYIXtLBgykTFgd1YNkYuDAu3rwogXwWDRSMxAZW1oOfMgN3OZElnqnAoDcGQFgf
	 nccChafMcV7AG8vUpeykstApL3TevMb50kXKm28NwGY012W+IsTt/4kOJjq09+DxUh
	 6/D6I9HUjgJNvS7GZX5OJT15kRLgLpZPWhycY3dYxXGy0aIAcF8b0rP24bBjviL0kI
	 velivcYDH3uYMIMLGeZ8ibTXe7qDoFCZ/UEDiI3jRY9sT6A6epfltlEBgI5FMSa3u1
	 PgBW4NC/kflUwM5fpEeY8P23AxhxN+1ZKVJDwrejykfX0eVESNSr5gmcYJo5eJPqEM
	 ukqBP95U2dqeA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CEB3717E0349;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F23FD480055; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:37 +0200
Subject: [PATCH v6 15/16] dt-bindings: display: rockchip: dw-dp: Fix sound
 DAI cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-15-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k0eRRol0juQKDRwk26Fz36sBhpAIKfOBZOjBCwiTCgw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPCSqLY2GABk9WoqK2OjQYGOwzMwTN0Ir
 7aiihJYzbTpXIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qaNNQQAI7p07oMo+PBu8Z/Z4EHWkQ7XyjtbSTff5wOmERUnmDsv/dEWrKIRaXMU6quCJH7TR6
 cwWgBlPbDbv8WDH5IAv3O3tv3ZOY+aS/jx4HkBff5zgfB024qBuvct0Hm9sxdtg8CrRmQqXp89f
 jzyX4/KrawkjwI5N3RMauMfH9yNpCAb+UaXpzjcKCjVUqE5B7Mon8EKL+gq6C1x+4xyhzJCpyYZ
 yBTwdw1Epb3V2awm67P/lrlzoImjanTl0NS7q0VQLQBEgVqxPmQWsfdMSDtdLuskcqB+5QtuB0M
 gKhhoBp37kQb0HKpaW9fap20YagWUkj7hY3LcLG29+z1xf7JMZX6AA0rerDaK0YJ9U3VrFW/z71
 gCpLXxA88hopTOD4fqT8Y3q2HLBgv37ePB1hYX2ZVWBCMV04U8viEi5EbU+sZI8ZTSgUzTZ7e3g
 6dzrs9H6LZrDLyP+/NhcZKjkFme2MpjT8PF1NOyW3urIWE1LpJhA7psnXoUtY0Ri1truTWFyKsz
 wJnOanv0ATDqgUH7Kea8HxFNFrIKi9VJ7DsqhzkiQMvuptqzLY3Z1sDabWtnLtXMYk2QQkq2WnC
 8ioLh/HAJuqUhbdzX3EPYUhywEtiT+2RtlRJsBlHj/QJvYaeu+tt6mxkYIuzwWVCtX0gwaY/Qd2
 sY24Qb6eO9mkUQ2PeptQyQg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110341_212088_1E46E4AE 
X-CRM114-Status: GOOD (  19.45  )
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


