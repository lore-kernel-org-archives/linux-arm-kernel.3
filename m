Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07DBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gTpTddyuKctNUEYfO0rxSs6K3yAM4P9q5YKhBPu/tHI=; b=ENlQlhhz1iHV3IGBUhqpgbNGfr
	+XrdXz3uLRUsXbiMaaWI2IN4iJAkhKLHuWcbwc+35XoXrjJhEkkBPfUP2b7nCiQ2GXrz8WUKwMgLZ
	upHd7jE6yFeQtaTbIDOUqmkKYAToTJUCMpdKz4DsWV67sQAYn6sOjipr4/skhjspe678KvU+ZHwh3
	eYQQ2I3ou4FKRtPtDLXuKH4uduz1N4makxDxPKamQAR3dA9L0zkmsHbUkfHvGFnSveGUB/iUKKjt3
	5tA/kjfEs82rDMZ8oCA/+T4yYv0DcDynSTZnZAcWKvHUvmNtvcBMGKraV2l7WXyoK3KL3lQ3AusjU
	2O5KqbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejc9-00000006DmH-2ip4;
	Thu, 24 Jul 2025 00:15:13 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZb-00000006DIv-22nL;
	Thu, 24 Jul 2025 00:12:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-235ea292956so3357805ad.1;
        Wed, 23 Jul 2025 17:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315954; x=1753920754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTpTddyuKctNUEYfO0rxSs6K3yAM4P9q5YKhBPu/tHI=;
        b=e8FVe9AnP6BrRORSxGgzgtaMLCEHmveWVQwk2xfIrWmKKHNnFiNvtqXEoeOYcCh2D7
         ZGEQQM6sISJSMWbpLexY5kNdBpQ3Jt12cIyyeHHUrMlzXcxPIuKHrSI5ABzEFmIMBLv2
         JZgrezKy2fANntyW4xTkRmJfvypoUdGSW6dtTf96ya1TUwLq3YTdLuiqy0lnIQ/9xEWM
         LUE4jD9ZocBUA1oRxuGndguYQIaDiU4r2gL2m9RJry3lCq13cdfCuWZ+jLQQUEA5TMK3
         OHZwafm1zMoL4FFkVOgaszpmN0+BPvZR9mBt12+tgBkyIDfx/nClbgvLF+f7ImvGfz0N
         IbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315954; x=1753920754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTpTddyuKctNUEYfO0rxSs6K3yAM4P9q5YKhBPu/tHI=;
        b=JqnDmJjlR3khRrUHezCw8NilOEKsmyGkq1QmibLw7a3/bcK1I0TeP2LyWVxp2CBZCU
         Z6acS9WPpILzU/Om5YaNSR5Hk7XJfReMHa5F6BJ/BtKyoU09u2GTzfUXxrAme/qhqlmX
         BIxgWTHFfXPrz5EuCtNYSopRNzQ/Ed+rHS/JldqSEsPxEpeR9l/TlMNVsXto5cWWZ7NX
         lkm2nSFA9R/5eB23o98fOonM3B0XpnXbPQq3o9/kAUrBpBjJA4cvL5l4YJd87JlJj5Cf
         Kak2pJzIvBQazwiBKJiCmugno1QCNg9dMdeoXNs3zRx8Fln7woX5lTzFidgSARUt0Tac
         FHag==
X-Forwarded-Encrypted: i=1; AJvYcCU+ao8D0XWLZ0PU70Eta4uv7OH31VYJTtzpg66F4+R/lTXABJcxA5X2NvGx+JN+wf7z0akOcRyV9GZw2nG/MrE=@lists.infradead.org, AJvYcCUPjwXXwGpMuKGs4FHSPl/KFmhOLiucKbmFGH2rYbF+1AQ8tk70iOM/jfjg3VmgMgvi5CsBTicTR0ceYwGMU9bO@lists.infradead.org
X-Gm-Message-State: AOJu0YxcIZg2jyVbnPbnM6NbnQA27FhNtRoiohRfNJbc7tRjsf4b3xSN
	tZWiZ2xcrqqYvvX1EO5+cWkDxzfXTQnJa0/B1Dw7OGtbVpEro2NFUlbQSV12DQyr
X-Gm-Gg: ASbGncumdv2RKKtKFE9Qt4oD7TnYlIVn8z3mIeOfICaNtvMG2WG7ZO1aF8sjW/7lrKd
	xg/E4ls74mQ//ug3dB7RWScbNFFlxMgrV/BXF1i/wQrK4XrW0T1tYhDLBdKVvTcuJFwmDBgkqfK
	MedefoSt5Y6zeQlWFDDTQa5IPAbINjyLJkQfoUmCvBnLAsytlgocy+20z7ll1+r6G4JvymuCygx
	65LOb3xqG6C1cV7pihqKEk/mna2ZEcrxWzmw45yyMaXMrOzjTThZ6rO3xVRu6RzGvJJ6T4nYeAF
	5ZDaGkr8xan2goL2UoyWoM2sOw4NpZKBNY5g1v/K1vKi5JH/V+H9O++t2NEqSkC1QNRSFzki39L
	/p6qJc0FOAB1mgQ==
X-Google-Smtp-Source: AGHT+IGHLYMUv9LEcUD43PYfTGsYmU2avkpWaUUoLGqpbY/ygtaMwLuoC9g6d9Uoq4vQdntros2eGQ==
X-Received: by 2002:a17:903:198b:b0:235:e942:cb9e with SMTP id d9443c01a7336-23f9813ac30mr62978905ad.9.1753315954220;
        Wed, 23 Jul 2025 17:12:34 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv6 wireless-next 0/7] wifi: rt2x00: add OF bindings + cleanup
Date: Wed, 23 Jul 2025 17:12:25 -0700
Message-ID: <20250724001232.2275-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171235_547864_4717EBF0 
X-CRM114-Status: UNSURE (   8.80  )
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

It doesn't even compile. Added OF bindings, documentation, and other
stuff to hopefully this doesn't happen again.

v2: move all of 2x00soc to 2800soc. I didn't realize only two functions
remained for no good reason.
Fixed typos.
Slightly changed probe for clarity.

v3: fix wrong compatible in Documentation.

v4: renamed documentation file as there's only a single compatible.

v5: made clocks and interrupts required in the documentation.

v6: add missing Reviewed-by tag.

Rosen Penev (7):
  wifi: rt2x00: add COMPILE_TEST
  wifi: rt2x00: remove mod_name from platform_driver
  wifi: rt2800soc: allow loading from OF
  wifi: rt2800: move 2x00soc to 2800soc
  wifi: rt2x00: soc: modernize probe
  MIPS: dts: ralink: mt7620a: add wifi
  dt-bindings: net: wireless: rt2800: add

 .../bindings/net/wireless/ralink,rt2800.yaml  |  47 ++++++
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 ++
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   7 +-
 drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 102 +++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
 7 files changed, 156 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

-- 
2.50.0


