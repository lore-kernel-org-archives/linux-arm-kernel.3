Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB18EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yLptFqAMCqePRuk20SWKFsGYRWkZDJ2kBARfQHLQM5A=; b=2azwyNwQT2hzVQ5oRThWYm5U+i
	GzpF/C+wTi/QH4Z1/eHrhMTEZCOV26z0gl+Ady6VoAPqWzOJGKdHrEXqeV+qIYRJgD0CoJm+mr/3p
	eiOF+SXF7J8TOuTXlvpH4I5FRgFV/Q0PKeN+QdpbttNprvx7KWvEojOu5nPkcwdx9yYW+i96sA6TE
	+SNckaCHH0oSLxt1YcJNLeUK+SeYBElL1cLheQ2744tstwVTxvawTCBMUOeEWIIoZilK9PHXfrZp+
	tTxCII93PaqQlvbrrZlyuO0WTM0AtP0wIPkKxm1spknHsNel/4j/lRqJtc5R1H1AnEqUXpRsjn8b1
	CQhCcNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp64-00000009q8t-1Oir;
	Tue, 10 Dec 2024 01:31:32 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp50-00000009pqz-1k7M;
	Tue, 10 Dec 2024 01:30:27 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so40114956d6.2;
        Mon, 09 Dec 2024 17:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733794225; x=1734399025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLptFqAMCqePRuk20SWKFsGYRWkZDJ2kBARfQHLQM5A=;
        b=bADtMyJNLKlkYT8YlIHcblJ+YYTqtSc88eBjuO8dOLikEZT6jh9HZ5DFOPDdij+JYh
         WPBRNqOLo2OkgoW24TWnJHEbLiLlq2ynhqPf6DQl/xazg3xve5oCeng6SJuTt0h7SYL2
         ZVVZ1i00nHvo7EZX31Azt4EQB1AXDeiegt3WI6MZz7JvZcsZbtqy7B4ok5S5br+0G5A1
         0L5izhGQetIIemkEzIBHynoSg7Es9emHm9/liIp7JalJTlaPrC0Rq61m2KA3vHW8S7z7
         /QOeHrd/pLdRzvaabMHqWMoh9UFWYVBeaYT2Zxno3z0ANF0BhPBYSn1SHP51wQK4wGW2
         t7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733794225; x=1734399025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLptFqAMCqePRuk20SWKFsGYRWkZDJ2kBARfQHLQM5A=;
        b=pBlbkUeIJnYuLBc+mNrDg/mXosJhVQ7xujveH4jUjHOVv9Q3TKX4Qnj4yHPiNBjQRZ
         jEWajoTXJyq2cHOTCLv4E6P7VrJ5x0fxBVcfGL4kjxpqXPIrbnXSZ9WW4worn1EbrT4D
         6p/6KDM/4gXPLmp1IPMdDt3pc6Cq+v4NgeA8UbYPCfkTq8a77Mx1nMgkgzfOPpwEJV6A
         TGf1OK40iR77zIajKtyc+5vufwvNYX6KU2N4ndUJqsgU3dGlAt9KsPtkeEBoCNHabWP6
         X0rkV+GHHYQBvIciqnwIpfy1HwTVGOyXzrwZu6u21dr/y9Al22HgbflqGPqlSmIJCJwL
         hK1A==
X-Forwarded-Encrypted: i=1; AJvYcCXXVV0KFqHSPBQ2cOjUxZfQmva1mHIrIHtYPYoNxlq9ZVxMoHEokxbU8Al7/TPFumsv2lW0727OOQK8YV4xN2k=@lists.infradead.org, AJvYcCXeD9IesQIK+/MEpOnNCdPbftLGVgemBb9nav7CFNUipVCCJjkFMsQINnsHV0AgCHoKqIa63EjV4ufE1rmCuEdK@lists.infradead.org
X-Gm-Message-State: AOJu0YycdNtB1OzfcYawtjUelEF+gBojJDT1JFn681xSXcpaVaorHDNf
	foMcYiaiczeRdx2YvkcByXO33TUosC6RCsaiONmteBScrq7dUzPq
X-Gm-Gg: ASbGncuS70+MrFe5l/FYeXHCOJXkvANS7BEXev55tC18G/yuC8HhTiHytRrZYqsd6UQ
	fmK5eX7/pxuYaDP/a7xPLtYndW5ehqqCqD/w2c2cD1PQ1IA4lh6WMwh7weU1CqxGfDoaws+CyhC
	3Hi3pBmuYvBohABGsaFOU74zMpqrzRDSPU1S0z98q8rteMmTi95bRA2t6LzrIk+1FjenAL96zh6
	Pf/S6xDzFEP5I5CRBIxIXi0SR4Z8q7ILsrTw6PiE061OtnfZuJRneIKxb7rzCAPAQ==
X-Google-Smtp-Source: AGHT+IGl94+bcjaYHpUAJtAtPKM7ozTtuuRWPzM7fSjzKBKRwV5Bk+GTu1vmg7p1bUUPpYPUkPwp+Q==
X-Received: by 2002:a05:6214:e6b:b0:6d4:1dc0:2620 with SMTP id 6a1803df08f44-6d91e4465a0mr47573006d6.40.1733794224737;
        Mon, 09 Dec 2024 17:30:24 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm36834346d6.72.2024.12.09.17.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:30:23 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Geis <pgwipeout@gmail.com>,
	Alex Bee <knaerzche@gmail.com>,
	Caesar Wang <wxt@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kevin Hilman <khilman@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Levin Du <djw@t-chip.com.cn>,
	Liang Chen <cl@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	shironeko <shironeko@tesaguri.club>
Subject: [PATCH 0/6] rockchip: rk3328 fixes in preparation for usb3-phy
Date: Tue, 10 Dec 2024 01:30:04 +0000
Message-Id: <20241210013010.81257-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173026_450677_F1EE16E3 
X-CRM114-Status: GOOD (  13.03  )
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


This is a series of fixes I uncovered during my work on the next
generation rk3328 usb3 phy driver.

The first patch fixes the error handling of the pm-domain driver. I
don't expect this to break anything, but it is entirely possible some
driver code makes some bad assumptions on the fact that this has been
broken from the very beginning.

The second patch fixes the ref_usb3otg clock parent. This was preventing
correct reclocking of the usb3 phy.

The third patch fixes the ethernet alias that was accidentlly readded
during the rk3328-roc dtsi conversion.

The fourth patch fixes a race condition between power domains and clocks
being shut off during boot, which would cause an ugly splat on rk3328
during boot on recent kernels.

The fifth patch corrects the rk3328-roc fixed regulators and power input
map. It also cleans up the fixed regulator flags to be consistent.

The sixth patch removes address aligned beats and the redundant rxpbl
and txpbl flags from the rk3328-roc, which are unnecessary now.

Please examine and test these as necessary, especially the pm-domain fix
patch.

Very Respectfully,
Peter Geis


Peter Geis (6):
  pmdomain: rockchip: fix rockchip_pd_power error handling
  clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
  arm64: dts: rockchip: remove ethernet alias from rk3328-roc
  arm64: dts: rockchip: add hevc power domain clock to rk3328
  arm64: dts: rockchip: correct rk3328-roc regulator map
  arm64: dts: rockchip: Remove address aligned beats from rk3328-roc

 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 27 +++++++++++---------
 arch/arm64/boot/dts/rockchip/rk3328.dtsi     |  1 +
 drivers/clk/rockchip/clk-rk3328.c            |  2 +-
 drivers/pmdomain/rockchip/pm-domains.c       |  8 ++++--
 4 files changed, 23 insertions(+), 15 deletions(-)

-- 
2.39.5


