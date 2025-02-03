Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0748C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=; b=IG51VUTu2uBH3TqdXCKoMsymFW
	IKFG96c+g7hR4+hAwjDBJug44rRPyqcytQkY526xKyGN8xY1RMDYVH2y5Ttb5kB6WHP40sHmrc89M
	XARvW9bNS5/cCgVOhlsFEZjOaDXyp5amPDP9RsJIRTDj4DmVWwLrwPJQgVsaxcS8EhUHsCrm2naS1
	64MtuQNWP7YoLKmNzwIgVIBauN18RmN7Ryw/XbSMrlSL9RVox+FdVFBppK8iYm1g8TT8Li7plXiPM
	IIUq8qeEQzkX/tqxZEJlUnRjXSMmzmz/3ThAkBmISBh+CLb3S4fwU19xpRe4zAVJBvBf0Q0cAzD33
	IOx6AExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev1Q-0000000FHw0-3BDW;
	Mon, 03 Feb 2025 11:53:48 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev06-0000000FHhR-0Ntp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:52:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166360285dso68697405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738583545; x=1739188345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
        b=PIDSPZxMUdopn85VXHe6BI5cilOOE/i2AveBx8r1eX2HrUEJKPl2tH8ss8TrB7R+Vn
         bzf+PQJ7h7HLa89ezciopqWRXNnnH3oFJ9jsIx3qo7apkcWywGNR+Sx98md6AOolbkBq
         mwDpEJKLrVpoqGWxd3Z/1/5pNTy5fUKiZdvAfyL/z6Fpr2rfL5tMz7DK853B/SV1mclP
         s93lyw1mfy4nfT8l1/CpW8b+cob64ptCYoMVnHi0Do154TfksXSXTYytnLhpADHAindN
         LuES4T0WgO65+85eTSLYpdubpN6r1NpMsp64LtpIG/jOGL0WCHDm2IIn/AnhDnjdmvH7
         muDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583545; x=1739188345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jYkeisHGPl8xCM2BALIkYlLxiAy1FJOgyAKUDrZR0g=;
        b=Upqte2G4EWZESJVhFrz+I0wPxLQkxi7nKizZpjgwnCgANB/i93tD6lR8lFNm56iMX3
         R8V6A544F7SGu1p2KidhNF91E0GIp5sZbB6mIegzn+Jsy+3/RqAI8ZkzJ3z4M9sbXeZh
         6wc3PMoamsIYR5eCsKJZCdQuz2wVXRWAMV9dvVYqZrBNozFq8BuEtS9vPxgAiNwBqRIj
         pcO36KYTaLtUsudIEi9L46bTMaHwQR03cQ04PvsrmDkf096VsfZPt0nR36OPSoLwJqH1
         +HOEthomjrKwo/WSWDVXIHQB5EcEcSYal5CWPVRn9nsCCJpU4GzhblOoXOz3bv65dkKv
         WR9A==
X-Forwarded-Encrypted: i=1; AJvYcCVSi6nxzoK+WLoxsfMONv4VxxiR3hVpHe78MJ/2jt3Dir7dHZDyK0HZFMJYga6m5Pk4H779QDclPOdbOqKymXfl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxahwld7tfbfB/MxEFUNVDgtu90rG+PjgelslB/fnYlevDCCUyt
	F19Wj9dmj1Z27/CABeNzO3U/UsX0Du/PRay9zBIg8D6iUFVpHonB
X-Gm-Gg: ASbGncswRVdm0hZpOr452gVcOrWsZr0eL49Spqu38WL8CU/3Ls1eeQlmssE4bqq8nQu
	LeHqufrV4NJYjy7iv9P4aQpaCBcMjzDw0+fTawpXgy7GjwXW/latXDPQXWeQ3x1OqDeNedTxses
	+v/NSe4ZyBbgsoQTMEEMyz0MEWR/3Lfaf+VfWZJ5t+iJZPzycXVBjl9tntQwi/lkiLthiDwezxl
	bA4BnXH7t7YqpGvMwyxgeSxnw9Hju3m49rd2m5HU3dMTQY+cPG3SxC9Fsr0mTOegj+q0HNWmw11
	kmch+9oLrhfMdNfG
X-Google-Smtp-Source: AGHT+IEdhLM08AT2wmM/NO7irAEic85WuehISVFGzdIXsWFirVgVJJVcaDE2suDIVnMIJ/r8VGZqsw==
X-Received: by 2002:a05:6a21:998a:b0:1d9:3957:8a14 with SMTP id adf61e73a8af0-1ed7a5c22a1mr33704475637.1.1738583545121;
        Mon, 03 Feb 2025 03:52:25 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe631c039sm8262408b3a.25.2025.02.03.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:52:24 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
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
Subject: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
Date: Mon,  3 Feb 2025 19:50:31 +0800
Message-ID: <20250203115156.28174-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035226_128012_6A8682EA 
X-CRM114-Status: GOOD (  16.45  )
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
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/apple_dwi_bl.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1


