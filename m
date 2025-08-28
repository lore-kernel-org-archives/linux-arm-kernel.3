Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72660CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UuiNHpICi9Fji/fQ9rrN9zvOKJszsHimGcUCBamZ0/A=; b=csBv/tumbhox+QwjGPwDg2DsIJ
	RWW9cQcMKUySKtcPQ8tQhp6Ny/XYAeiDswFw+g9L0CWBGczU1ORklZPZfdNmfK7onxCz2VWC5tsb8
	6JJJr5rMAOX9MRP/O1d7Zt87S7OCC+KjrunfAR/voVa2AfHsNGyuMiMsCTufQiaXuFftOZ6I7evcr
	hKwVhQD+gszLLvS0V20CDaxx9qDHlBTt/ki1ws6+b8xENuzLzJv9NuqVsxKQNcMn6/qxCrE7YDISB
	2c0QGQmf4GleQaFYoHOnvwwra43pA29AhcCWybaIonVQ9mHErzqeQE4JX3XtZ5QFGyadV/+lHNv3r
	jh1lwMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgOB-00000002T9Z-248b;
	Thu, 28 Aug 2025 17:26:19 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcTM-00000001hJ3-26UO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:15:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afcb7ace3baso158345666b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756386923; x=1756991723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UuiNHpICi9Fji/fQ9rrN9zvOKJszsHimGcUCBamZ0/A=;
        b=cOzX6ZjlxxzybMziSYcICTJHuufFTTEX8Q4ns5BbOhpoYrDexpQ9dCy0ly0dphfifQ
         uepBXgR9U99v2BvLAFbkXZylpdap+eyw63xRnm+xj9LSw4gxpOWA7daDVewcCuweegkA
         nRPrz0cJkheAmVWsIDbVKe9UMDeYKQXQznhDqWpWboGdX2gupcUZaEczKWZiIcCLn0qx
         jCkbj6Q5nmtIUwKrr00Cp8dikSRJYQcq5CHdHBuuNCd5uyxRKGZl5jB9Zp6uqqyzASNn
         9kM7KJwZcm/eeW6sgZrPpSTy6/UCup/gV8MHNcvvuxrsvxZY4HVOYdBNnHlAs239qoQK
         xiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756386923; x=1756991723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuiNHpICi9Fji/fQ9rrN9zvOKJszsHimGcUCBamZ0/A=;
        b=KEmr7BKRDjXoKRGWh+FwoqNSRc66if792WHi26JoWvDC7LsBEP713Wn6nluyyMMTXj
         WVqCVy2AIaJoYrheLgBw1c8DfAp8T1qbCgT4ymHFlrQqtrY29h7+4cHRW4TbJRLkrlAJ
         hzMKG39yZNimm6n5vGF1xglxqcEYW/pExAcMmElBizP5yT7PyV94eqFzkeNwz49/2GUu
         sh2RMf7W56AxnifJ9H7vJ60DIU5RD6jRs9eRt2H8X45PP+W+VSyrOJsVJ+M12r0C9ibj
         2nRzBHcdYgx04ReDRNHtUQUhvs/r/c3edPVW9YiNgD2oLxTWi51RxXAl7pvn82lZdIps
         qJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0vjqJirA0UB+/FRaZffGH0DTD1jFYQOkYaNCi/LE9jHsXT4MgLTUEvh3RUf78fYyiIVsJkbsoHSb6Wu3zCKA6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2mPrMND90xo5J4tKZSLuiNDPSXDPrW3H/Z0vWu2DaClfWzM9V
	aUX1X+akvTWHrEU2iSGLac4KPCCQvumZiIUie8Lm1KZ/pi9SUOmuBnoM25BvbaUVsY0fdjDcYTj
	UUlevTx0=
X-Gm-Gg: ASbGnctcH95Bs6P+dH6ZhMn9qLhWHXlKBkTNKq4fG9dJXY6p+1QdeBLX09dejOtcEsj
	Kft6JnIJjMgLyFv1gCz7OAu55NcQCsbYnBpxNzGW/CCv65FtgcUqkvYTyLdIAnX8NNQFit/d6ji
	zB86p5e5cIKqYNpejKGnMehrOrgZmgpsLEgNI8ogHhJJ+EPsK9aUFW8UE1e8k6OrlUTdlvUSC6M
	KCGA89VoS3wyKwvM7XkPl5jUpCZgexIUqjFwGco3AB4jPdkciuv1n6P2XHAqi3gZho7+MQFe7Mw
	ZISRljFVm4YxqXGs11r/BqCiI25z/LEvJSTL8G1ERCHOvvmAgwLgiaHcSYrxmF5shg5vkTNYo+j
	kH5RiVwmkXlwtrC/tPUIbGX1S1j/b63pVoHiFRgqrz9h5a3ALQSxpy6VQRdfaPCyvHKlSEbNgjS
	xIdtq0Zn7HA1ZnuV1lRSJM9OSJngE=
X-Google-Smtp-Source: AGHT+IFlRXZ8/HbEmILGPaaFC7SuIScItZJp+ONwofS1lsM9bJRSD1VLJx+ZjAEGaQZGAUqEEvUm5A==
X-Received: by 2002:a17:907:2d0d:b0:afe:a615:39ef with SMTP id a640c23a62f3a-afea6154a04mr947914466b.9.1756386922803;
        Thu, 28 Aug 2025 06:15:22 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe7fd59b00sm872678766b.106.2025.08.28.06.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 06:15:22 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2 0/5] Add peripheral nodes to RaspberryPi 5 DT
Date: Thu, 28 Aug 2025 15:17:09 +0200
Message-ID: <cover.1756386531.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_061524_542671_466926F9 
X-CRM114-Status: GOOD (  13.04  )
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

Hi,

The following patches add a few peripheral DT nodes and related pin/gpio
nodes for Raspberry Pi 5.

- Patch 1: Amend the bindings to avoid DT compiler warnings.

- Patch 2: Adds core pinctrl nodes and defines SD pins as a first appliance
  for the pinctrl.  

- Patch 3: Wires the gpio-key for power button and related gpio controller.

- Patch 4: Adds DT node for WiFi.

- Patch 5: Adds Bluetooth DT node.

All comments and suggestions are welcome!

Happy hacking!
Ivan and Andrea


CHANGES in V2:

--- DTS ---

- bcm2712.dtsi: added a proper clocks node to the uarta serial
  in order to replace the legacy clock-frequency property. As
  a result, the following patch from the previous patchset
  has been dropped since it's now useless:

  "dt-bindings: serial: Add clock-frequency property as an alternative to clocks"


Andrea della Porta (1):
  dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
    controller

Ivan T. Ivanov (4):
  arm64: dts: broadcom: bcm2712: Add pin controller nodes
  arm64: dts: broadcom: bcm2712: Add one more GPIO node
  arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
  arm64: dts: broadcom: bcm2712: Add UARTA controller node

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  55 ++++++++
 3 files changed, 189 insertions(+), 1 deletion(-)

-- 
2.35.3


