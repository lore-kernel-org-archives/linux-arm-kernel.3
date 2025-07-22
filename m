Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBA8C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iA+c5Pv9/CEehwhoCiWsw+/fTrurkwoLP7xmk75QXCk=; b=uHN+Dl5iqYv9Jp4btztOmpEJuv
	kGpOMa090NI7EzSGLpmN6LpZGJY3QvIemQVcwx/KjcPtMtFpRldDTM+/lmMY8M994/gg7gublbjMc
	U9yr+5PE5oCif2c/J4XIMBIs21CP+xmLSNX0e2NsOjyP+L6CCPQKzQ5gPP/5xYmUbjVWmC+lw5aux
	mBKv1AETeocgSoS950mTDUHRvcFL2nzSndfS7I02CDa/HnqRXFfmyzQcJuWlrP1UvDJbU8cKvGK7L
	7aW1ska7USvUj3W2OV51S08fXMofVEs5bZ51sayt4Zct6n8Pr669w4+Ftnj0kX2ONNSAr5mKak2fe
	fV75/QgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDDJ-00000002ZeV-2aXB;
	Tue, 22 Jul 2025 13:39:25 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCGh-00000002SFf-20uV;
	Tue, 22 Jul 2025 12:38:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a522224582so2673461f8f.3;
        Tue, 22 Jul 2025 05:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187929; x=1753792729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iA+c5Pv9/CEehwhoCiWsw+/fTrurkwoLP7xmk75QXCk=;
        b=OAZnUMh6Of5QA7ltbn96jnH4pL7V5LkWit+fcZS3s6af4HGJYQFqnC1HTqwcsKjrlM
         YLe8Z7ZccefcZIE0ObXN3h99HzgRmk8olhE7T4MwqZ9cdt72DhzZzlvcZh8VJfowdBJP
         QtadmBH5cCwUWwDFSjyWb/3gmBqlkt9h2fsbcsMmz4466hsTStlXi/mhro6ZEnIHkraA
         mClX4kr6YBoi6q6GtSszA6b1UaXWQSLwyOQmEWDCDBmi842cGKhJmPVWS1OmlSLkUrHh
         BLODCfRhSqGSnguPIvnafJNMdIpu+2RPL9//esBMihBPDwl2xj154OL7yX4VhOZuXTzV
         M/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187929; x=1753792729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iA+c5Pv9/CEehwhoCiWsw+/fTrurkwoLP7xmk75QXCk=;
        b=lXqfQ4ixNWXWLeayI2Qh/8RCzQ9cukA6agPKOvLYs6cNf3OncnwXTYHKrJRMIfCB1p
         q9qq5t1vea/i0vn0AAnjfzVbITwNxov75kpeHSn6TPfmZFnpTMqSg7EWaKgv+5UUjw7k
         z8+aBIO7ii5zjSPSyQa/puKpEnOpnbOQ6kwT7DcnLbJI5piekf44+RkFy37ye4ZYIuiK
         5npS7jxo5gHABRak5sxuhaUUNmIbOMQQhS4KF+6mF2WTRflmn9gN2FMfNN7HmsuA+TlE
         HUY52zOr3/9jZUYXMWRUImDRyGTqzqD7ftCeUkyGU8o4FMAjFMjbJb3Nbw/IXME6HTE1
         yOiw==
X-Forwarded-Encrypted: i=1; AJvYcCWURF/PwCxP8UBP35Ydx5BuG81s6nhCYry3nSLwlS2/NMhTLITRFoz5ilFimrdrtG+8eQ4SUfZ57M4BZPt5HKqT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw59HdyylvDqCla0n3TD3Ej6XY3j661yhhnU1OgAUtom/ZVsoFF
	e8FFQsK01rbTqNnPTvSlZTN1i4JNm1m+vUrZZTIHcUqMn5KriAaHizAJuUTsqkhg/HKrEQ==
X-Gm-Gg: ASbGnctaW3RyCwmpDGu+IKLCR4dJqq43V8MV4KqAEe0FvG/x+4uETWbw+D6IuPW7gy1
	VtcNkfuzul87RXgE+2YO5slDxwKSXflQSj93mJfmyHai2Vbkj/3Y8SeqJb4e8cIFJklNMdfF6Fo
	LC3LaIWUHxB2Uc2u+U3e33Ozmby7e8PEe3Z5bY1CEx6y3eGnRvkIoThIaJLJ1RogZi4l31x7jaZ
	62/r/jfiDHoF6YxLNahIcV3ggmtK7zMkHNLuMlKfVsS5gDezI5586s2xErcFeV2zYW8OQfUYgHy
	k0lOGI3SKv71r6RmVJCNnoycjh+y8VvjbxWI31uQ230tf5gSFVTL1mbmLDoibK4JLAs7QjwmFwh
	xNVEh2iIHCdxcn2zcLklRLH0VUgk=
X-Google-Smtp-Source: AGHT+IFGeyK+QeZM1N0c07OjUQkxi0BPV4rB9krjYHbqPUETa+tP2IlFN/9f5P/Sb+JdAB4YU44LxA==
X-Received: by 2002:a05:6000:2c06:b0:3a4:ee40:6c85 with SMTP id ffacd0b85a97d-3b60ddc61d8mr19147649f8f.54.1753187928796;
        Tue, 22 Jul 2025 05:38:48 -0700 (PDT)
Received: from tearch ([46.104.48.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48c40sm13525197f8f.58.2025.07.22.05.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:38:48 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v2 0/5] Add Khadas MCU and fan control support for Khadas Edge 2
Date: Tue, 22 Jul 2025 15:38:10 +0300
Message-ID: <cover.1753179491.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053851_521371_10FF829A 
X-CRM114-Status: GOOD (  13.99  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

This patch series adds support for the Khadas MCU and fan control for Khadas Edge 2 board.

The first patch updates the device tree bindings to add new "khadas,mcu-v2" compatible for Khadas Edge 2.
The second mfd patch removes unused nvmem code.
The third patch adds the Khadas Edge 2 registers to the mfd driver.
The fourth patch adds support for Khadas Edge 2's new fan control registers to MCU thermal driver and the last one adds the Khadas Edge 2 device tree node for the MCU and fan control.
And the final patch adds the Khadas Edge 2 device tree node for the MCU and fan control.

Changes in v2:
- Added a new compatible "khadas,mcu-v2" for Khadas Edge 2 instead of cooling-levels property in old variant.
- Added Khadas Edge 2 registers with KHADAS_MCU_V2 prefix.

Muhammed Efe Cetin (5):
  dt-bindings: mfd: khadas-mcu: add new compatible for Khadas Edge 2
  mfd: khadas-mcu: drop unused nvmem code
  mfd: add Khadas Edge 2 registers to khadas-mcu.
  thermal: khadas_mcu_fan: add support for Khadas Edge 2
  arm64: dts: rockchip: add Khadas MCU and fan control nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  5 +-
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 58 +++++++++++++++++++
 drivers/mfd/khadas-mcu.c                      | 56 +++++++++++++-----
 drivers/thermal/khadas_mcu_fan.c              | 20 +++++--
 include/linux/mfd/khadas-mcu.h                | 32 ++++++++++
 5 files changed, 152 insertions(+), 19 deletions(-)

-- 
2.50.1


