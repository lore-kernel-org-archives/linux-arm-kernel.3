Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91308C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehkMFoWgqIg1ow9atROFZYSGr7YDspw2tJRq5+hr+pc=; b=QiVjf5VVeUCSBepl2sUzhBTXFr
	BQXk7s8WYoqmYoqHAdF7uN3ysjEAR8mwQRx+XfdSRZ4V1ITr1ovJwXuCdFTuYARJA82Y7p/SHJNq0
	+cyn2a94Z/qDaFIVLorFDilxAX9PVSzcQopr3EWQfcXieXf2BOc9AUPPpPD8ZVkJwrEH2sT0gTiOY
	4efwUsJrCL4yVTyJW2deQp0gEdEfPleeBUgZFdAQI+cUXCcaij2TYas6kYo3NpBJ2fVb3OvyEAVP2
	LFCEUHhCFjFYKYYbbae98dPOlzFp1m6eG6AGh1QfYf8F8nmLKU20XhqoDLZA3+ymlT5thHikd+K0t
	UFwurY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwW-0000000D8AN-0zis;
	Tue, 14 Jul 2026 19:37:24 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiwL-0000000D82M-3WRc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:37:17 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e6128bd9b3so2401618a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057833; x=1784662633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehkMFoWgqIg1ow9atROFZYSGr7YDspw2tJRq5+hr+pc=;
        b=f38mrf/Rd7soPhRyRj4NJzbwZ7nCQxTfeYJ1KJKOFEVMcgTUjkF4HCa/xSHjIJ0cZ3
         e56utRQzNG7Lx+LreL7vROLq3CBUGvFRnVyYX8dtK8oF0pWUdw9H3CpJ9lBibVs0GJaO
         MSkFw5E086YxalMjUwvSB0bltBwPZEQ2pXjrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057833; x=1784662633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehkMFoWgqIg1ow9atROFZYSGr7YDspw2tJRq5+hr+pc=;
        b=JIExl2a71FWcB6inK4YAqRS2Uo2yHEr4uV83AR4Z74RjpW9D6QUEX3Op+uXaWgXt1y
         iclGLait9ICI1qXt294nZinVUIq+u//ywwQZDdxlDNCzvUFk1LbiZZhLhrCUzAGaTwSq
         vT9WNMnvO5CbQjEAO5xdRk8nD1KiF2HwULfwVqyT1/Rr5Z5AZ+jqnQdChXuvUEYH1Ie5
         y0VuN7uqxLvrfLGid0HeCwRY9V2aN0lkZOHd7GN6UWx+NyHXxEP5jpISAwyw7T7ffuIz
         nfqY1Z2oFcz/vK33TSVerzdwRPRheHknlJ3j5TL9tRgrfzBmPCH4GxrioL+2h8JpMC9X
         kPhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jWzrrwzhgrM24+G2yJlhchaIofjFicgH4230Kir0pwWoQLVeANfho6d9MJrjkjtoBbY58aihVNTtUTzjAnCoI@lists.infradead.org
X-Gm-Message-State: AOJu0YwsNCROwXEFw2LojuEG6a/eIzM1FOHcAzOCKWZfPIdCuR/YCp1e
	ZZQ1BURZ58DoUbczS1IOw3oa1+mnwDuCYYFJv3ocg/8ag0gaeB2Jyt0DrbECds9i8Q==
X-Gm-Gg: AfdE7ckYglhrIR3gx/xypaDbkl9oKmGEV8g/9YPKyoasjynKAre+fJV3AVPoIDuCV+l
	SNgNuQOvpGPq5mWw7XhLHvcc5kSszfpmO7lBMIw7VwsBWn1bok6GQy6gesP8tO3MEuNfjP8G1Gy
	44nl3FSeyWeTsCko/mm2uVcUDSoXdVvPvQ68Br6Jrip6ErmPL+WbfJiJ1vs27Cl84CLBUqWiWrq
	5KebF2pe9ZbDUtxKXnM71t8rFqw0wg1rNuSXgs+Xd1lBssVjNHHU+/6HJ+LP8Yb85rY4ik6m0pE
	oeH5PnkmZEqQvn2lr/yRMRkZ/rSKuNHh+/0vSajHnVYDCTrYnHqxllvRewjFpRcCjHCUrSo0ZjT
	G+0IgYNoVo1BQFYXHg53bULClVhN7qVPiyiMzF8lmP/Y7TRlJ48Nh5osMp5tED+dGMZoJxMHiXl
	YgggYGwhs=
X-Received: by 2002:a05:6830:3805:b0:7e9:5de:cb93 with SMTP id 46e09a7af769-7ec59d40cb0mr9721a34.18.1784057833072;
        Tue, 14 Jul 2026 12:37:13 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf742e1sm16004026a34.8.2026.07.14.12.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:37:12 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: soc: rockchip: grf: Add RV1106 compatibles
Date: Tue, 14 Jul 2026 13:36:40 -0600
Message-ID: <20260714193656.2196447-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714193656.2196447-1-sjg@chromium.org>
References: <20260714193656.2196447-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_123713_942894_93D6B9E1 
X-CRM114-Status: GOOD (  11.77  )
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

Add the compatibles for the general register files of the Rockchip
RV1106: the main GRF, and the per-bank GPIO IOC blocks used by the pin
controller.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Drop the grf-cru clock-controller child and use the syscon-only
  group for the main GRF, since the CRU now provides the MMC phase
  clocks
- Use a single gpio-ioc compatible for the per-bank IOC blocks in
  place of the ioc and pmuioc regions

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2cc43742b8e3..fd9235ac1334 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -64,6 +64,8 @@ properties:
               - rockchip,rk3588-vo1-grf
               - rockchip,rk3588-vop-grf
               - rockchip,rv1103b-ioc
+              - rockchip,rv1106-gpio-ioc
+              - rockchip,rv1106-grf
               - rockchip,rv1108-usbgrf
           - const: syscon
       - items:
-- 
2.43.0


