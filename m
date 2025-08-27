Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C67ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OlWIdPkGg4S2fo5kB16i5sKgEKgxu7PrfmJLsX5dU8c=; b=KgHdB4vrgUve8XjdNMTu5TY9mO
	RToMJblo/9hVUOvPPsdtSuJycsvzlgjuy6tK0xJY4PpQtOo9zBdNW3nZX6eU07HAsvSePWf80x/HS
	hSrwi7Zr6FtFJ30Wn67vaMhyzyxg5ty2KjSVbDVGgdFKM2EYECX6iUfgsk/l5QaqdxeaIegZZc2i6
	44Z2YQF/J/pHTTMomyVLl9irKKOkVxb6R/5IBwhAAJ5iVwq8nvRRJBEWgqo+qdW4zmtjvsHeD4muu
	EXWCMIXdQOsT5UCaiRN2v4kHrG3v4MwxNns/z8vRgxyUj92uFG52u9A3MhKGpoBzV8o+Yxyaba8pz
	DWeeOsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJ0X-0000000GBMX-3OBi;
	Wed, 27 Aug 2025 16:28:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urH7G-0000000Fl5G-1BPm;
	Wed, 27 Aug 2025 14:27:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso36720135e9.3;
        Wed, 27 Aug 2025 07:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756304828; x=1756909628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlWIdPkGg4S2fo5kB16i5sKgEKgxu7PrfmJLsX5dU8c=;
        b=KnYva5N1V7XvUc3Ja1q+CY0KP8jIpL/HG4UHr+LkwimLlFFuI95fM2OqVQHd/fs8LU
         OcFaLw4JEUvMSyu2NkCCzf8zs3IsfPh+wUPxW+w01Fwscs1iRxyALr+2cLMmlfVmUKZf
         EBrwiseqOE7rb1bkv35/ETtiioYzU1VHahn33kuq+a8NxmzE0RyYobFISIvHQxPSdOw7
         XQCDJhPfMR6br6AmQeFznl/t3OW8DzljBXgLgIpBFoJj8i2VuFrMD57fwMYL2aHclgGD
         jsKmEUqsABFmGc5GzBx/4yn0EJTH7ciWiBaDvZZi0QlURG7kOCR7zc3Ha5zVo5KoyL1U
         mkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756304828; x=1756909628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlWIdPkGg4S2fo5kB16i5sKgEKgxu7PrfmJLsX5dU8c=;
        b=qV1n6JHghrjApz3+mUvC1m9dnIJIY0vfpLI+FyyEN8MeE8lfYbIWAhZruTKACkvzJa
         ItLVaiW9l0M+YcgK0Uip2e2jev5gnX16pt/8BSKHhhDev64dMETfzzHMf4LrfdQrZHXG
         91fHELLSoXZkQLqLkf01qvfB9ffj13ulxlQ6/SFin/d4i7/XwgtSdEf47XG4PIaIVAm6
         srBy95bzxNzidmYgmrkvOQN8HfkbE1YFZuH8Mu/xRMLc48EXibM+aL3wZpRMTw8xOHcD
         4CNF2sakaRn9z2OqHyxSP52D2rewneVqgLxFLfvNGU0frQc73fKAgARpZ9Ayb2WG6gQT
         VetA==
X-Forwarded-Encrypted: i=1; AJvYcCUYbcrMt0GCnwy18V+39P6QZe4Q7DYL3L6Ju2sX1MW5fZj4Ju3F9hIJhGR1IGcSfAJTgGmyX04a7XL49NZoHGMG@lists.infradead.org, AJvYcCVBDkin7fM/m2jiTzMXIBmkS773IoazKKX4rfQkzJbMY/2xqPhiIPgNq7FC61bs3sd9awN29n6fsWEMVbh7R/c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxINcR5463l49EXiNMJvPvljg4Zqwuja+fvl5rXhC9tUu8X98hL
	vfBhJq3LL0WE5AlMYsf7ZdkfefzFavScJ7gFSoICmiDiuNEK2JWTy84Wu3rrQF6+
X-Gm-Gg: ASbGnctP95pjQwAHRhPND84Dldt1tt/1QmYwlTspMrXNlxIzW4aa10op6ARK/3rT9eF
	zlwlIDaKn2EvatQOon3m04xKjw5XtzcAb3IQzbF963liWzXN5NyAS/gGVl3ILCbDQ2qReZYwpGf
	EFoRIH8BhXvKT/g3GzfZ+0/GOx2la4BhYph64Q0OVekttTgIRY25mJKUigFaTslUEpsqEKa1t+O
	5d+bkOq0hI+Kq98q9peREdaFJZf0Qpl+GM0oMr8ey1V7S6Y12MOWhUWfX/sCD/IvbCYoKYRZPd3
	69EgHjF0tkyC8t+P0WwPyi+ESeNYvyG7NKeOmblcR6POj+EUOFStHtu5f+JqQV+2vwbcyFaE1/F
	urdrzJiC3SQw1J3GGkCPkUbVy0y91oZ8hANrPXtPtCkB9AgH8yQG3s6LmhLGaOLx+Ieoz0NAER6
	ZKkjhs9aFvfM+UY3+nwHtqtt88eKOGsK/FGck7CHVSq6aCU+a3RsCh
X-Google-Smtp-Source: AGHT+IFNCwrMfbz7LD21TXZtyQIGGdT67AQlxP0BxYWJyMfjYOfyk6JYYh10ZJLjj2OlUZIF5cWMxA==
X-Received: by 2002:a05:600c:1f8f:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-45b517b9a7bmr143052535e9.22.1756304828087;
        Wed, 27 Aug 2025 07:27:08 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm22735499f8f.14.2025.08.27.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 07:27:07 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on Pinebook Pro
Date: Wed, 27 Aug 2025 15:26:57 +0100
Message-ID: <20250827142705.1644267-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_072710_332071_9F8E9A6F 
X-CRM114-Status: GOOD (  12.01  )
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

As described in the pinebookpro_v2.1_mainboard_schematic.pdf page 10,
he SPI Flash's VCC connector is connected to VCC_3V0 power source.

This fixes the following warning:

  spi-nor spi1.0: supply vcc not found, using dummy regulator

Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index 5a8551d9ffe47..b33a1509a8e93 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -959,6 +959,7 @@ spiflash: flash@0 {
 		reg = <0>;
 		m25p,fast-read;
 		spi-max-frequency = <10000000>;
+		vcc-supply = <&vcc_3v0>;
 	};
 };
 
-- 
2.51.0


