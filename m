Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510CFD6B6D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d/u+gOzoI/Ju0naSJU7xEVGZdDUGJ7r27JpshygR/dg=; b=YCZ1GcS/CJg2TZpx+MVdy3Q1kc
	kSWe7tW8opBOqrFMIDenw3j24M7Wc5AOy6iArPWH4gsUQ2uBnKWY0cmJWHab+gwN62fsXqH+Vd/yH
	W5HGLXbLi9G66aYju8XW2yL1nOJ15MHpdQDOmAKkNjJ5KVu4Dn1wK7yhC7xSRv+n4LEqD9hhjXEJQ
	pjrYKbaA6xv1/hS/JGIiZHvC7wpk7FckalMOq+cWLc+WNsS4ej5dAKo2Uo2RFtByo08OqDvUNa5U4
	uKLZTGkB87+7lVAnMDGURo1grAU83Lg9CyWuzdTKfFmJwjHO/a+e0PVynAMPBNiBVBu0Ew+7DsGvL
	f9At3oBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FHZ-00000001f8F-3SOz;
	Wed, 30 Oct 2024 20:27:09 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FFt-00000001eif-2mpP;
	Wed, 30 Oct 2024 20:25:27 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e4b7409fso252868e87.0;
        Wed, 30 Oct 2024 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730319923; x=1730924723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/u+gOzoI/Ju0naSJU7xEVGZdDUGJ7r27JpshygR/dg=;
        b=miIRqWRPYEPpxzyTfvu4W6Ri6dCTARE9wtZtbWCdpApfLn991UpIOvC4cPGYdjvBJJ
         pZF/Cd35LaTIz2qEZDO8ok93qLMllMlzGPwhXk5Qd/VZbMDsl8r5hu6OZdbMg7TpxLTH
         cx+/ktGlRDiogl9+nW7TRe1E1dZH3M/FEVTR99EcNSxYIVqWTqZJtfFPS+zi9a+9jDf/
         xsGU6BOe0E68tW3g2IRnY2tA6gp2dUI5kZIolotTNN7CtoxUF2IJXyLjAwArCyFrqfm3
         LZK3GlBr0MsJDoaLIkCvBgQ9h2yf6PRWoaPFNSZ0r+z72DugnG5qZXnAZmhtd6RD7DMF
         PjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730319923; x=1730924723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/u+gOzoI/Ju0naSJU7xEVGZdDUGJ7r27JpshygR/dg=;
        b=pMnBnZeOgn/K1ELKk/8jsquW/kaMz+5Gbxs2OFo1c/I0p7ZzlBeNH9SDHT6lhV0gDI
         o0Awvz4WJDTX8gat0Ykf65U0Qlrs1JmalSnDfYrdSZV1ENUGifjAH8R2Frgw9Lbsf2FL
         REUpZayYu+xZzSNtHkbPBGUs7Q3+07ScYYP5Hwr7t2Jkwwi32/08OX2k1jOtsYNgNJHU
         mKm7GuRB97rIPYk1o128+JkKr2zbPmMgY8STY6veSU4/x+2ZCZRQE/f47P37saWrrtYJ
         1sdUKaMwDdOQIEi9nCaSV2uli5NxAQOZZHmkjSqiGG0h8z1tr/rpSWBAEHwjNQLPDEfT
         6mNg==
X-Forwarded-Encrypted: i=1; AJvYcCUXmp2tZDdzJavNy2VdvGuSBd6JZgKYn+bhlDXKQc1AhreSyGePCH5xlesUuCwn5R8IJNE75/bG5qAIHVC99Kg=@lists.infradead.org, AJvYcCV92gd0ThnBe0QhGnnAyfRYbRiY2k1AWxeSJuFpnBki+Aol1qwdIMCKEAIvAG5oPSxawWlEPoxTI6l6w2sAL9x3@lists.infradead.org
X-Gm-Message-State: AOJu0YzUDqN2JUkpB06aTF2wOV+c4+2VzwkCYY5SqZDGTKgSmWwRNg5x
	Iv6KQFVbZWHZ9CMo/zOWnSRO8E4WmeUXGKbYhKU/0ZrPSgEpFarA
X-Google-Smtp-Source: AGHT+IGkxRIrT29z+dGSuMPxqZG2brU8VM3Jmu4a2uWHhYJfat89wSUyA2Q2OF2Gvtb67PHFl+cwZQ==
X-Received: by 2002:a05:6512:2808:b0:539:fcaa:d0ca with SMTP id 2adb3069b0e04-53c7bbe0907mr966e87.13.1730319922783;
        Wed, 30 Oct 2024 13:25:22 -0700 (PDT)
Received: from localhost.localdomain ([91.90.219.38])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bc0d6ff10sm334644e87.269.2024.10.30.13.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 13:25:22 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: add Banana Pi P2 Pro board
Date: Thu, 31 Oct 2024 01:21:42 +0500
Message-ID: <20241030202144.629956-1-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_132525_729382_2F3CD7E6 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series add support for Banana Pi P2 Pro based on Rockchip RK3308
(RK3308B-S variant) made by Shenzhen SINOVOIP.

v1 Link: https://lore.kernel.org/all/20241028213314.476776-1-dmt.yashin@gmail.com/

Changes in v2:
- Drop ASoC dt-bindings patch (applied)
- Fix excessive board naming by matching to other Banana Pi boards (Heiko)

Dmitry Yashin (2):
  dt-bindings: arm: rockchip: add Banana Pi P2 Pro board
  arm64: dts: rockchip: add Banana Pi P2 Pro board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3308-bpi-p2-pro.dts   | 362 ++++++++++++++++++
 3 files changed, 368 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts

-- 
2.39.5


