Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3566BC02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=; b=0KQFGaTFINwASFGd8bHSd3/clu
	yaWf5149HjZPtIOJeqzwGisiWAVVjDaSUvn4ZibtyNB0RzijzDxFUiz6b8rWZR7B+ApWbUHlkUrOA
	hsg/9273TIW+lbrzWwSCKp5nDGTll1JygTFdftCFRyXydNuSl1sCJunb9P487466aOL1P5KkM9b1w
	itfBXmnooC5HkfHGg+m3hPBtlxYjv1Vv1y7dW5C9K4DzcTQTeMK/6QR5d9qXP3/k5u1taVrZTawyE
	midQQRDuSekpUF25ca25MmZZfJda4DuaGwIpkDnCtZF9RHsjAv4FZoUZM/fatRlB1omUQITTKGDZg
	1RqscIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevtk-0000000FPxO-3hRm;
	Mon, 03 Feb 2025 12:49:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsQ-0000000FPbd-3RB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21644aca3a0so99901155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586914; x=1739191714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=;
        b=m2Wy2PZrtGS9Vre2LNRQ5/8DiyQ0X0wdSGrdwME0wzXXjfBfB9edRDeb7N3vv0k/ow
         KBYW7QyiIZQnBoZfJSmlDIdTuxzr0+Yec7xlrafM2F5NKLws1LxE8LSjweHPu5Lzlpw6
         E2YQWafREHmoyJn34O40q8NETQlLfdFodyt+qRs4oQROyXosuTed/LOEEG2fff+MH/Dn
         MfcGiF+Lp/EJTM99Bpvni4dNsBsacCjoilVx8Sc55NMjkU8pDs9P+wPzRUw6sGgcA+oe
         U2zO9F2jrGrZ9bcWic+kWfgAHzUYem0y6tx6yvHIE8i00+EyizB1YzOyyXS1V9REVxi8
         IsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586914; x=1739191714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=;
        b=IJiOHy+ACRs8I/kZjcGnmBUs/bM0xkEvYHjClphXldEj9cGdnWJGCJoFV798txPN6o
         sCKQn28pGBEcEy6yGBgBGC7boNBFINvk+Nmx6An6qFQC40uEEhL0SZjKwZWPJ49BQzl9
         2P///YTrLmFnukB4hOnrgqiQjYHggCqD9KN73CtZWE1AnuhrVsVwlHXB35JNU4sfN6Pa
         ACdZcD1XWdf/lvjlBkOeydt5uqG46EetDylp9NF+FTQkg9O/7nG7q0dc81gK1KufQeWf
         E5v4Ni1YveCzpEGPmdHsk2TZ3SxtVN4MkyqW+rlaHlrroYSRJapxnWkqQhDkV26zGNcJ
         EOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgDGdM+fZzVZRDqUyopjCq9PlM8gXrpF77LGPO6Bs4zC1xK17vjYMY72PgQgFQ3RFz+j/9jRZGS4LG/eF7s1Qq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9l9qO+Phsod/sFpWDalD5DbBlhSRmSBRyLFZHt+MT+VlctpJf
	+dkDShYA9R5xpvT0iSQ5QgLiSCuc1ULsBVTmpcSoGlp8fvWkPMpC
X-Gm-Gg: ASbGncuCYE+kWIdtAsiYBFX6/cK09bGxKOr1wPr5bBQQrRMMzr2RSjbzXaIruughixk
	+9WZ6ZQ3WCkIqSbnB3/CyM5HaoQjZv0LgrdtxoaijkUrJhpKXvLn/y7Bu7vhZfuZ+INRELy5Pqo
	JM6dwvojaFa0OpNofVzTrLdiq9U6yhPq3ydUOhdbejuDXFc1r+eZwGPrQcZteAOLnUD5zDQG+kE
	/FpjCHk1MULy/9mcV5rRa8aouZG8PzBhiFh0ZQzerRpmqzLXM/cCKLK9ps5z/zEMZ2iiFEHRW+1
	tNmJX9aJ7SZccrJz
X-Google-Smtp-Source: AGHT+IFkG16Fy+xKUEcl7Zhyfj8sYFQhncAIzcxpAp+kKdyRiKIyPZxsk0Bgs26S0+b7QvEEARtYmQ==
X-Received: by 2002:a17:903:2a8b:b0:216:3c36:69a7 with SMTP id d9443c01a7336-21dd7de0fc4mr329572215ad.45.1738586913809;
        Mon, 03 Feb 2025 04:48:33 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:33 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:39 +0800
Message-ID: <20250203124747.41541-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044834_875961_8FBF0EF2 
X-CRM114-Status: GOOD (  11.37  )
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

This series adds performance-controller and operating-points-v2 cpufreq
nodes for Apple A7-A11, T2 SoCs.

Dependencies:

- arm64: dts: apple: Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) SoC devices
https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T

Note, this will have conflicts with Apple A7-A11, T2 PMGR nodes [1] due to
both of the series adding things to the same part of the .dts files, they are
unrelated, so keep both of additions.

1: https://lore.kernel.org/asahi/20250203121831.36053-1-towinchenmi@gmail.com/T

Nick Chan

---
Nick Chan (9):
  arm64: dts: apple: s5l8960x: Add cpufreq nodes
  arm64: dts: apple: t7000: Add cpufreq nodes
  arm64: dts: apple: t7001: Add cpufreq nodes
  arm64: dts: apple: Add cpufreq nodes for S8000/S8003
  arm64: dts: apple: s8001: Add cpufreq nodes
  arm64: dts: apple: t8010: Add cpufreq nodes
  arm64: dts: apple: t8011: Add cpufreq nodes
  arm64: dts: apple: t8012: Add cpufreq nodes
  arm64: dts: apple: t8015: Add cpufreq nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
 21 files changed, 773 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi


base-commit: a14d9039c2aea103eeedc5602ebab731ef3eb73e
-- 
2.48.1


