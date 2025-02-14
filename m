Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 04:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=; b=q62CsGAH0Kt6rTmyMvQ8arArdH
	4rox3kXCMgEQbzX1Kkji/bPNgJdmouqkB+KkNLmQC8wUZDt90+E92ZiJFeVr4vN125hWJOPqIgWp4
	I0I7xmb32blRqCdCmcW8QolsHEtQmgkOltNzC6Kubd8CJY7hcFt9/G6OgWN+EN/5WNxH8gGi0m5tY
	KeiNXFvyGZxY7WeiEkvRpb0FInavdiaGJKXggYomGuJPCOzriOFei1mQH7HB2nigLHVDMtXdUUugW
	UUZx0JKNE+5yFQqsWVIFt5md+Vp0tPxxgv+0US+oVE3I9q0TTfel/sANj8iWdq9y6TPvCNo/3xoaa
	+EkvDJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timxH-0000000DYs6-3L5D;
	Fri, 14 Feb 2025 04:05:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1timvp-0000000DYZS-3WJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 04:04:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-220e6028214so18419565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 20:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739505840; x=1740110640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
        b=VdvonEZkUGyurp7C7qbSJeaSpbb4goOZeMia5J3sowYUNHJTL/uqNeWSWfRKMuP9l0
         LFcQN70osPATbERAcPGwPa3vCzVqt1+UbkfHTAfiAfuzamfAHS8nk3P+kdi7KMjXM79F
         rsbw97NEqtW9AMICpqylsqysAfW7cqEJ2WdvL3CyTStSOk3p7tJqHMen7hgEjs9oJrRR
         06a5mCFyGGK4Cj+G6zyhqBpqWHKWzIq1GD/toecxbHSI35/1VqIRNsdxkq2DwNhpJYTp
         EOXikB03FkwAMzhCOZOyaeL1cHUkDXZ4807/vnU66r0nM5JJ2bUfeW9DdlpFyuyyVWuq
         UFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739505840; x=1740110640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdpJvmwnLmBjouVPztYUe8jkPdTKUze0SWAyHKT6rno=;
        b=wpIF6s+M3+qf1JS/FEehEii2fS3Q2EGSjsIx8lWfjn1/YPK9gOh/Zmf+Tb3wKpXEgu
         bGMltWa8ajZlxz5t2PQLR2zPeh7/ausevJ88Nga8HNzUZDTLt1PuIvi/zCMemM8FvlLP
         19P/1NSppmc0Zg+vlmhjb4qB2XoXfzs/hQGmULAQFt0ehe1U4v8+77WaobaeE7M0FEu4
         uArTY7e2FtvO0DvsTFvVavX80qZIflZXkHtW8L1FNC3potB3VkfGT0m2Mv0c4N1jsNsP
         v6P5zT6B8Ck1IthraR9kS3rVHDRggEAxq6BB1jCDku8UzQ2FqYBeQUTWZdc8AWr/x1+m
         mGcA==
X-Forwarded-Encrypted: i=1; AJvYcCX7wsIiXggDOtOs8Gn6t8vIbLkYD+OwEy/SQVvAyp77v6/Q3C62T/tL2X259yJEg2hWpvtIGC68ysdwKU/OiCoj@lists.infradead.org
X-Gm-Message-State: AOJu0YxoPnCFTUEMGUEHbtWHeTrDQNavSWePM0R8gfV8e2GhnLC4xbpz
	ARTSf+q9x3nVrpUmTF56bVfik/L9E8vdsDr5MmE2hb7kLdZP23bB
X-Gm-Gg: ASbGncuwn0dMPFoajDdtrylJc2R5s1u4BvmXWA9l44GBqMqUoKjgS2FXKZ8XU029uuO
	/E5BbAm4T5Esg0ekKkK2UvCu38eLvxL+eiQjcQVwq7LZgyLUH5tmR1GF1zcYImT6/c9GPt5rSgc
	eK/lzB3g7Oy0rpWhY/lgLTyRW9C+b2rHCZ0Dk8JMUmcmsB2lzgkK/0hgByiXw6WtnW15ziDjHWl
	VMrHNwwZIDheiaZZ+SjRqc0G+jGl9sCHTTpnoudzWtnoCqR7FJKe/MeQvtMuL1ryX8yz4l5+u4+
	d7nUdEcElSg1p0M=
X-Google-Smtp-Source: AGHT+IG/lvp3REMuEs1TqSkR5QKUuTnGFxemCOEmduTyXWx0aA8kwUQQ7GuOdHz5MXhdcM3OB4TycQ==
X-Received: by 2002:a05:6a20:c998:b0:1e1:b12e:edb8 with SMTP id adf61e73a8af0-1ee5e666792mr17049651637.30.1739505840029;
        Thu, 13 Feb 2025 20:04:00 -0800 (PST)
Received: from nick-mbp.. ([49.130.17.220])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7324273e3e7sm2181227b3a.91.2025.02.13.20.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 20:03:59 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 0/3] Apple DWI backlight driver
Date: Fri, 14 Feb 2025 12:02:11 +0800
Message-ID: <20250214040306.16312-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_200401_879196_5D3F2676 
X-CRM114-Status: GOOD (  16.11  )
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

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v5:
- Remove default y from drivers/video/backlight/Kconfig

v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmail.com/T

Changes since v4:
- Change type to BACKLIGHT_PLATFORM since the driver does not directly
interface with the backlight controller. The actual backlight controller
can be directly controlled via i2c and is not the same on all hardware
that supports the dwi interface.
- Rename file to apple_dwi_bl.c to better match config option.
- Rename driver to apple-dwi-bl to better match config option
- Indicate that the backlight scales linearly

v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmail.com/T

Changes since v3:
- $ref to common.yaml in bindings
- (and then additionalProperties is changed to unevaluatedProperties)
- Use hex everywhere in bindings example
- Use sizeof(*dwi_bl) instead of the type of the struct when doing
devm_kzalloc()
- Use devm_platform_get_and_ioremap_resource() in driver
- Fix sorting in drivers/video/backlight/Makefile
- In drivers/video/backlight/Kconfig, move config to right after
BACKLIGHT_APPLE
- Explain this driver being completely different from apple_bl

v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gmail.com/T

Changes since v2:
- Add missing includes in driver
- Fix file path in MAINTAINERS

v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmail.com/T

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan

---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
  backlight: apple_dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  11 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1


