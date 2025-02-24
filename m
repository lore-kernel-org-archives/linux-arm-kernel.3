Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A65CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dsclqQFCsZDMndtlLXiFjksSQ0t4bojzK3MB88KzrgM=; b=VZqfuizXf5JgACfTqByPhOn/fV
	IY1QM2BiHpLhj+dbrLoc4c7uiv19+WNRFnGw9sx9fPu2+Q/CnPkyDM+hxyUQK0gMtUJAIXpQNnrah
	4++EWtq56/CDDTHwujbNlqBEJb1zYCjClHGyqg+4zWukelE9mF3ELJVEUTsGWxM9pT7/DBPnP4cJk
	8y0Uk5eDwjrHMSz1gnzWfQK6ub6Wj+JEra2Jr/sgQZNaxW9ju4xObMF7Ddyzd9aAdDjKaDgoGTY6M
	6ChBj2I6hNn3OF0vXrOExS5CeTTsd47b/aoDGfVebQ99ubFzZH9zoc5cs/fIp4A9V8i/hePVgyxNX
	TJhFuUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcKl-0000000EdmU-0ANL;
	Mon, 24 Feb 2025 17:33:35 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcJC-0000000EdT2-1PBv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:31:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso6428067a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418316; x=1741023116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsclqQFCsZDMndtlLXiFjksSQ0t4bojzK3MB88KzrgM=;
        b=ilQsk3vCSkMgzh46ZhoAFXhGhTwoc0PtUbSthB9km2ZKJWA1s187rsI4l1Skw8JCVO
         GpQNA44ZE/GcNgD1irfxXTcwIKgbSC1ODsRXwMuKlLday6vnSHpTsUrF23B2qTk4qval
         He9ahE6dt0aZgLUodFXxNClHfUsoYcST3y89ViUdmEpiHhqb6KTl0ZGNDlP/5h6duY87
         unYqGLi7PiL0yf4n6b13PBa92GmaP6V1WFrAV0hM12a+f/XD/uy998PN/jfk19rhy1oW
         KzmNbWLwRJZBWKAAq9ItixibdF8iCSAghvMimpJNNpbBDWnwm7VrtbL3xI6fyhtR/lbp
         /QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418316; x=1741023116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsclqQFCsZDMndtlLXiFjksSQ0t4bojzK3MB88KzrgM=;
        b=s7WBO4GRJHTzABZDlPgM1rANmfktGBcnp5X6z+Fj4AsrJeXVP5fTkOefuOAIbykUDV
         hkHYS3EOwZY2vdJ+kTNtAHzp6a9HhGmiJFcSEBclAcWKHdZU7UQnZ2q1+00PW4TcIjPJ
         3ninl2UHmJ+xKR3/OEFzOgx6tsTTPnO6ElOSwKn1OxsLpFKnbHjoFONORk2uGVKMYmEm
         UK/+wgxGv1fc30NSbyJr2q91d41MmQ+XLY6l7HQJEJur6xM7XLCgCJ7QsM/xLrnyi65P
         5o6Jgasp3VzJ2kULFGz/41tYk7h8LQVWUWTbwM6YMZPo0NB2cyPyRxovloG+xNQy+FCr
         zolg==
X-Forwarded-Encrypted: i=1; AJvYcCXvOHDS8GFVXDMK+ka9XsGXyDUAzDKLFPLVJS6Fzl6q/xRfOshM3KJoY90/+k4Px38NNoRR6LmjmgV1UVyUpXrK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi/69duFzdpG5fJf+sanHypU+ue7b6/Cspjzoz1wmV3OQm+Wdh
	HgEkm4F6JG6EPUb0GjAsgvGTmSBtNVFWnXwKBU4cSvt8TvIEETkdvV/l7EFYF6E=
X-Gm-Gg: ASbGncvKR5G4ybd9AnLrGyCwOwLisNftOaivanjFsfu+n9qn32M7QCmZzMjGFCs6W1B
	bicg7+suCN0Cs2ZVMqJuPSzhuzaPNViQon3mR6ubZV4kOA67tQZeUaKTvRW3Ql80qS5CKxmOPdK
	WNSzEIXHKHcfj4zI+FRHsxzyE5SqK+WbkSiksFrBlrDYJiQOMte7+67et1B4YnNlWJuB7bem0A0
	An5/IaeI6p2pRt9rbt59Kp6KssPKeKy4b0AC+lCPkttM3xzVE37jIYp3m6BtcioL8KnSLrOpEOU
	gOcSty8ykpt0y980nzegOCRpjOUn0iY3qQEW7Pc2qNCuM4PA9a5Hd+M=
X-Google-Smtp-Source: AGHT+IE5P2Pc2ulD686tbXmldMuv37Ren86tZmw8hKdJojopByUms6FVwARmV7spLnl3u/zaSknl5w==
X-Received: by 2002:a05:6402:388c:b0:5de:c9d0:6742 with SMTP id 4fb4d7f45d1cf-5e0b70df001mr11915007a12.9.1740418316384;
        Mon, 24 Feb 2025 09:31:56 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:31:55 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/4] thermal: renesas: Add support for RZ/G3S
Date: Mon, 24 Feb 2025 19:31:40 +0200
Message-ID: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093158_471112_E09828AD 
X-CRM114-Status: GOOD (  15.05  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds thermal support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patches 1-2/4:	add thermal support for RZ/G3S
- patches 3-4/5:	add device tree support

Merge strategy, if any:
- patches 1-2/4 can go through the thermal tree
- patches 3-4/4 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v2:
- dropped the already applied patches
- dropped patch 2/6 from v1 as the devres_open_group()/devres_release_group()
  approach was implemented in this version (similar to what was proposed in
  [1])
- collected tags
- added a passive trip point not bound to any cooling device, as proposed
  in the review process
- decreased the trip points temperature
- convert the temperature to mili degree Celsius before applying the
  computation formula to avoid losing precision
- use int variables (instead of unsigned) for temperature computation

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (4):
  dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
  thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add TSU node
  arm64: defconfig: Enable RZ/G3S thermal

 .../thermal/renesas,r9a08g045-tsu.yaml        |  93 +++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  49 ++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 329 ++++++++++++++++++
 8 files changed, 487 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


