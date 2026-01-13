Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D1FD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AL3AmhrXowuR2G2gwigOGPD7FLU1L7Qmmgu+Bu3T/hg=; b=iG8UsRr7uHsOkYGhhL5IxWZD9W
	/jhoW5wX7Go4K7AGLkQCal50gCUytkwSuKzNTOXmUsnoF5y0rKHuNDt2xRdHbDVS66q3qU68UuEYQ
	mQBZzB9C6pp+lQEVnYoSpoojNJ4zu5MtOZ9C1ZNtzzya7Gk2CUMfzU5jvz7eQfg0OwLrt79CuCodW
	GsqLfe2DDm0NmZRy4uWEUAtuo8FGiNmBquYVbPsHD+Ii5R9GJ8zdQI+hhK4v2WgnLHknUDoXJUm76
	vCbCFB9gWHkEd7LpNQmAJt74xlWOEalrI3fqOadnlBxDtr7Y+3cpMjygtPbh/kVmuPdedlmLwTbZp
	PlMgUSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaPs-00000006ohk-17Vb;
	Tue, 13 Jan 2026 09:10:20 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaPq-00000006ogx-1M8B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:10:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f2676bb21so62724135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295417; x=1768900217; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL3AmhrXowuR2G2gwigOGPD7FLU1L7Qmmgu+Bu3T/hg=;
        b=c6PxTrfpvoyC0MqHXXgPlecSVs4h9lvDVtDXohetEMJwU9rPfhvQAyr4hBfOLvTjnb
         FSgyb7nE5ro9PhoxbPPEn2qbsd5sYmNQQLQPegSZVqpreiN87gYp5oULPoUkswDFJdf5
         HvNDzd2Z0dG0l8zGopvIeXikyRFOOyDeqEfgXebpulwsaWY698GJDo/gy4taHdJwF+e4
         POGVgJb9yIpSQWYDKLfwR/+QAEh732yisBBy0/jiWiBJOYsqzZciKUlbRcUM3VHY42WA
         YUBuYdMwJUoaMEtf7O4si6FzLGRpgk4nRIFnb5eJYkeS7RcVBt2tiI4qMyrGX5KRq9BA
         hZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295417; x=1768900217;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AL3AmhrXowuR2G2gwigOGPD7FLU1L7Qmmgu+Bu3T/hg=;
        b=IhtSnZBDXSJsP67GS/TTxM8Sg64o10Mb2l64eI6ucU5m4fvgOMcQ8jIemxkkBksjrn
         Ksm0vgZundOPu0R7owcwK86R15CXysHnpJGnuZuemesHkYsh32meKBH6df2kUpZljh98
         806V20UCpdP7jUD/umDPH2JvflGhGHoWIybCpFj+0ElS2nnspwLwDKUz8AeVpf4Q45qI
         H3/CtXvXzKhZ+OxvGEKhjQDhmBE4D1dpCiRwA0yiId/DyLoeFclua1fG4hgj/4Ek5x3F
         tvQmIwK8Jm/WbLJVR91rD2VH4h8GumUCerPJR8Gca7eSgEPbc0bFbpmfurMDIb6r5Vpm
         sNaA==
X-Forwarded-Encrypted: i=1; AJvYcCV9zObG6cvHIouWOqt1wI1dQuz9vPeuVoR7WFC+ocRBJxu0Fmzhw4zFWJqLFlILrHB83+vqQROXMwasKLmoyL6q@lists.infradead.org
X-Gm-Message-State: AOJu0YxQQiqyzQSY1pIQpBmJui3KdKe5MsVfrTYTdqNx3qHWuyR96Z5e
	BZqtm/xxS6f8jEuNV3JqJ52+IwfyZzPZEBe/y5vgndic+YTmxRczkliM
X-Gm-Gg: AY/fxX5pRgiBxNPYel1qwwriYAFbkjibsFB0hh7lkxF5XtkjPmADPGNUD2SVUeW2cf8
	ynRmc7mBa7jT3qw1vdLsT4KrsFDV+DovmbycybISkjwXcC5LQOg3b8niLtfAGszPIckteDF3U7h
	v0nkH7slowu6YmeYP8afq5XSCqd2hMoxpuXSZxbzlvPH9rAgB0kPtjSAlJBUzwph7S/GLGW1Hob
	iAMy8C+L2HHJpzPVXLJxqlSoC4UJeTp6xviJAH2pQurwscONVTnlQ2fu+zcN7NLb9aCiXN7bgt9
	PqgQVUuMXzEDnbzvrf+BtuH0WEVHscjkPYPaS2wdJ8JVWh+W/MJeUCYK68ceTCcMfbWlFFnCWk9
	bKAXn33MiMnaWzK7b/1oHwBvY5NqDS2fHqSk0dOvt7Y+60VF3KS39rXtD55ZqSeS24Ikak4pqla
	/L6y74ufc=
X-Google-Smtp-Source: AGHT+IE1eZuFWYVL1uwHVIQ6oD0tCHFHyYCy5zhe0eIXjlwMHvn0V3kwTkAqzeYTgYzwyX866SYluA==
X-Received: by 2002:a17:903:2450:b0:2a0:d6d5:b342 with SMTP id d9443c01a7336-2a3ee491815mr172892915ad.37.1768295416821;
        Tue, 13 Jan 2026 01:10:16 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c0bsm15293915ad.31.2026.01.13.01.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:10:16 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@khadas.com
Subject: [PATCH v1 0/2] arm64: dts: meson-s4: add support for Khadas VIM1S
Date: Tue, 13 Jan 2026 17:09:49 +0800
Message-Id: <20260113090951.35928-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011018_363510_58D67851 
X-CRM114-Status: GOOD (  11.86  )
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

This series adds initial support for the Khadas VIM1S single board computer.

The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100 Base-T Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

The first patch adds the devicetree binding, and the second patch adds
the board device tree.

Nick Xie (2):
  dt-bindings: arm: amlogic: add Khadas VIM1S binding
  arm64: dts: add initial device-tree for Khadas VIM1S

 .../devicetree/bindings/arm/amlogic.yaml      |   6 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 191 ++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

-- 
2.34.1


