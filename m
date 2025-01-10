Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4AEE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlW+3pX1AlHUGlmbtep2OOoBUZqZJTmhMpc+E4CZgQY=; b=DT4mnoYrkzBKvm+7t45oOH8hSc
	PkyjYmAxyfZ8JlDjwfUnvsM1pRxQ/eDhQpVtZezd8e1n9PKWKmzYvePqXOOgVsKVfhkHxi5HvVTSY
	cZ0B7w7ZfVGi/rArU0faLSH14HbpJT6Eu/i4eOPQ3YUQvf7+37MVb6ybrp6K9uAz9fzCsvBQ8CraO
	nMKrll69edqvpZTkUFF1PYGcZS1qhz9J9dvCv7lI1DPf2cKkqVI2O+goyrqejvire5GPHThi/0hlY
	L5wFN8c/GhWrTmInb5H79W3Y67kHQOc7yKz5kGNHIjmcyglVfqN+wWRzG13XF58cjrrceN0UjD0Vr
	IZrKI2NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7li-0000000E3kd-04LB;
	Fri, 10 Jan 2025 05:41:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7kT-0000000E3H5-1tLV;
	Fri, 10 Jan 2025 05:39:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35E5E5C5756;
	Fri, 10 Jan 2025 05:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ABCFC4CEDD;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736487595;
	bh=XzOfiDgkMjifLw0j32157TgV2yYy1gXY1ZnOupVfgIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sc2x/Vkb8y5tPZZ38WgG44kN429vGnw/58lCtqSlMXDAEkTc1dVsdDPjFTG3u7t+x
	 +QwmVOIiiSifGvhSOJvnsuYEnaSMMFPKyudVb1rrrqBKjHL4HV9bhgBlVQ025H1BrO
	 dDpYvng24oRFwQ4xD8VqEaLgy/r6H5VV72mkwIoXsPkj3jBoopUSssh5LWMH0sNpTL
	 8G7xxdElbBoivCB/ZyUabaDZzgx4fDaGYQljS6D/2k33pVJ7BIbJzE/SoH6tEWs+M8
	 Ppw2Vp6nUd1xan9FoYMRe6dlrMtXoMeL/ARCndsJXq+MoK/gLXJxBU+Bb0ub8U+Y07
	 /P0Y4cYcsqmqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A068E7719C;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Date: Fri, 10 Jan 2025 13:39:51 +0800
Subject: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=876;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=/06xHmC2myfGLoM8tpTANbPOABYZF56wo8NJNiKgZ5A=;
 b=J74TFdNjfeuf4xmz4NKNLHVau7fIMmNSUihqIqgeyFjm92lB/udlEzM3roEpMg+hkQ+N4X7s8
 UeGx5QN1XU3Di8eU0SCdOogQj+QOImkjRWWthXzpVE0fDQoU6NLI3e7
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_213957_541554_54BFAE07 
X-CRM114-Status: UNSURE (   7.69  )
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
Reply-To: ao.xu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ao Xu <ao.xu@amlogic.com>

Add devicetree document for S4 HDMI controller

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -55,6 +55,7 @@ properties:
           - const: amlogic,meson-gx-dw-hdmi
       - enum:
           - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
+          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
 
   reg:
     maxItems: 1

-- 
2.43.0



