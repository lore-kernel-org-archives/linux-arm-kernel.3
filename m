Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F6CE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=; b=kjEWKfTtXu4tfHtsfWSQGGQ1p1
	RUPRhvrssUlkTXhDtVM9mpb5WrshKk794oA2GQ8+c2twMqgIYyRiCYrhf4fDp/JU8cSaSqXGCKd8w
	4DNFBdlfGWI3u+j3AL2CtFDa59/Uti2jA7SOVK1w0hNcXtFFyj7JYSWTvToPcH7/2tFuTXU5lq9t0
	AoHX9SA2T5o5hKgz0D+lVMRIMf6HW7j5+JduykxaI92Au5mxD9lUIf0QZVwf6Cv9AyacjJfY/Cy3G
	wHgS0vybH7ct7r/EvpmtJZ9MVqX6rECF1xgu2lXYC4NXKNbZtnhzdbimom6CTncWEZ7FNPsrDmlty
	xTdGZxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYh4-00000006oIX-1SQ7;
	Mon, 09 Dec 2024 08:00:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYfz-00000006npN-3ijx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:59:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-215ac560292so39506225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Dec 2024 23:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733731170; x=1734335970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
        b=d6NyOAW9qvd1G5vhP8Jc5myEIAUg34GkI8AsNKutNQTp8z76I7JsQA+La7Gj2aiwW3
         9BXltmf1xor/d9zhcql8Qg9BmXdSJKzlyvYeyFYgh65X9mR9qkbn8hgCayXAcBKuHKMS
         F079V6x9W7kDnQ552kR4E/zSgoBTwEqEWBAI2lWzWTXPEwb2/GRxTDXL6InmiO6tS6wb
         ZQHCRCmOGP2NsH7DUL2S3Vm0vQaSQSDgihF2PojeOzAOYOexDDINSZIhJ3Ff9MCbza/l
         1K50MTcZMCzhRbODf+5hWy9+HraUpnjZmn/b1EcsspXpP86/WBpv4vCPXEVYUYsMHsWu
         /85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733731170; x=1734335970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gbsMKce0iUUWg86NGcSWuqSJewGWtF9btgnRLQtZXw=;
        b=YTJOVMrHFCTFnl7OH2884VMi8MJzvl5ACwoTNEnI117ioHZi7oy/yxhQG3KR2dpA/k
         ij8vnHU1l2LgFCh0O7hQ6+IN4XluUvXfDwEHpLX/e2oiu6ZleKAQvfGa0eL+EUSpj7WG
         shMukCWWODO7hemL10aQGatGy62x8QgyUtzK/Zf0+Ks0apjC+o3RtA7ErbdInztd+h2D
         cy2j72mx6K391DlMsp/c1UlIKyxFFKRqG3+MS9um2g+wpF7rg1h2WXiQ6R+tjMS0zqmj
         5aJxa/5jUhhjdss/ZC7dFasCEtP4yK0ofqpS7AdmMGdZqazvaZPGxPT1H81Ewtz9LrY9
         R1Og==
X-Forwarded-Encrypted: i=1; AJvYcCVvw6CniYF4Z9jZs1ekkPrLXHZlCzmscdT7fAuBofY7j6svTKqhhoMh/UUiT1/Gce3fOWcu6RmYXxsrO1Egm81B@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbwi+FwZrSZoceg6rCiboY60Qc+Mk0fPe888xCqlBz5jfmofQk
	fepNBR68Q/+QhCbtMhIUIxURPikjEFvhMsxbBiUNVVXW2gFNBJ6L
X-Gm-Gg: ASbGncvu/SwqYl0f3Q5VwdHu01f3pDHemZ31QhfAJnzZ/Y8sP3NCzBruD1xNqOoIWPu
	OtNNZvsioHT9AzPq5XUsVpWcgDy9iUccItFtxK8x5yVG7MWqVEWDrxtxK9K1P1wHeLmDYS0gVim
	AFK3BVLGdlxA6t2JRwRCUXA4Ijg6WxOrVjbFY0bnTnxVHQMPqXaPXcdQjoaoZs1NpY7jwGgZlZP
	zGngVf48hi+Js6VsRThbJek5+KwjuRzjilHzWNnXEoa9bIfXNahpD8qm1ZPM8LQtA==
X-Google-Smtp-Source: AGHT+IGoeeJoIHfFKB8IHGMMHXOwW3xF5w1b+OPf6OpYRt5GQUeN2r72qeeit1SjjCo03L5SijScYg==
X-Received: by 2002:a17:902:cecc:b0:216:1367:7e48 with SMTP id d9443c01a7336-21613951f65mr187686175ad.0.1733731170459;
        Sun, 08 Dec 2024 23:59:30 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628b6588csm36508025ad.235.2024.12.08.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:59:30 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Apple DWI backlight driver
Date: Mon,  9 Dec 2024 15:58:32 +0800
Message-ID: <20241209075908.140014-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235931_930361_C8C620FB 
X-CRM114-Status: GOOD (  11.97  )
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
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 126 ++++++++++++++++++
 5 files changed, 195 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1


