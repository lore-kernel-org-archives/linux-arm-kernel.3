Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3346CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=; b=a1wKdPm7sCXBpH10zkinmyd/x/
	uBsubuqRHcRljg4d+HeelQqm5QFA1lrXuln5mWst3H9n8xVCq2zF2DfQB0WTknfd4rn6wx/nNjXqC
	5AMe3aopV2N4fuaGBPlm0GwL0McufiaOnhOdZzUnZhmCt4HXYRFSjZGQuK/O7aGmOmsq73ldPoSlB
	cdw8BHPfwpjJ82/oD91pCXyMZj+f+IH0uWI/jgt3DDb4K0OxszUOKV6BwzN9SwcsDFmsq3HPSt/mJ
	QHoQvfKvmxga9roZfrLzWKt1QPj7SOpluYDbazbs4yMuj3Y1YQn6gDDM7TSY4g4RL5+ntuOIlGl/c
	CiLHZAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMk-000000045D3-15F9;
	Thu, 30 Oct 2025 12:02:54 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERMe-0000000459i-1UaK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:02:49 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-429b85c3880so695022f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825766; x=1762430566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=DNVOpu5wE2lku3eTpjmDqm7W3wYKa5PQYChD0RzvGAawD/hgzYDrg5wJDVV+O35swa
         ghJAeVZAXEnDJwv8mFQp4oDK5EqCfsZTY3cHCvm+XeLN7eo6MhzYKolOYczxoto5QLCJ
         ib3YuiTYA/1bRL8Ijq9U5unthBwKCA27nOehv2S+OcsLNyDIjaAJ0gTFuckkcVtXvo2G
         yacP7//O92TrkAYEcsHI3sNQmtyJJu8z0J/0w6OZcYRd32pFTMN1Yk40D4yRuK4de4Kx
         ft3UNvCqPs68Os9F7ohCDTeyyssIp74pFYTYyYQ5GGblUvv39sg9Oje3copjCjxSD7wz
         AWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825766; x=1762430566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=uylKGrUI0Gl080wnXcBMn9lJW23BO0TD+zzXxd7V0PidGTVAAPOidvPbCb/o+UBwZ+
         XgXEt1vTEN0Yd/TqZLcqo+RLA8FwRGWfHViQjk6z3b0PTxyt8K0NN1LkDbuDHSICRHb5
         eydiroB3M+oj55lU2oEAiu/uPLTf35asqxCZ88+Hriz4wafG8mnIS+JY6nkmaw8MyBF6
         KCvVx8l9AgGZ59MnbbFeK0Ws2spPZ/ZSp+Wcy2pyR2ScV4KoUJvTStd3s55+KA2JCeNB
         H2OdMnyUg1+1ds62sn53mrFtKkCGxfdbI9mzWWfLD82fAT1omhtdw/gngruEf0H9Lu0o
         9NHA==
X-Forwarded-Encrypted: i=1; AJvYcCUHVaAED4jNIc/DRFsNQGGJovywxFwCKaqw+nL2jDzf+H46NMYYxiGZe9E3nzScLRR/mRY+vEBhXVvfQzkAJ0mF@lists.infradead.org
X-Gm-Message-State: AOJu0YxZxneNjcYcauziqR5EA0j1u5HMqVMooF5npUKyL9NFKtPVtWD9
	3DBU/e5obOUyZe/yRvFSoHj0upzXoHTkD0bvit1cd3EySez3777mLCYE
X-Gm-Gg: ASbGncuHyfGx9S1bWBSJC+h5YbisO24DV9psKJL9MYvI4xwNl4OU9Qt5cy7F3t1rxZY
	5IC6bl6HyhkYrWXKOq1tXkn5b1Wm3xHBb251/KWnFRqz6HIFdz/2KtXHtjeKl4K4PuNFXM4M3qG
	zVPFrAhzKSUSu9NRI0TT0BjaY+EEOQBPtcRnBVvcjwkTai/EdvehdnKFPgJOTI2YtjdNMfYd1P6
	HlaFSsF9DbIHMxtQGwMCHUtkK8IfhVQ5yXPj1E5S0aBmmfEsutQETL+hku1wI0wPZanuWLMrjBk
	PjTA30xofm/2BCziSgl2feYWdJDJ3nHKya9TA2UaW1RaSuo6CtrcF6c2u8Euhd7wGPuG7aLLztB
	6pMlM7fZw1Mlv8Bo2apdMTg3HGZxXB9pZdcJQCt4NJzm1gEvSqYqj1kkxozjyhjCz5vajxXelOj
	A16a+p8LZ9rU49P4SJoVHWMw5bKmR2CdpCQW/vmD+ll6NDVYC+rO6NMvYWyhInFgVLZwHcZihC
X-Google-Smtp-Source: AGHT+IGkEzWaIhOle1zjpMnONwufJ9WytmJCNBOpcHQt6RREK2pdj8LZw4LmLrh8QmCmDfNohShFNg==
X-Received: by 2002:a05:6000:26ce:b0:3e1:2d70:673e with SMTP id ffacd0b85a97d-429aefb2a1fmr5378560f8f.37.1761825763215;
        Thu, 30 Oct 2025 05:02:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] arm64: dts: freescale: imx93-var-som: Align DTS with hardware revision
Date: Thu, 30 Oct 2025 13:01:20 +0100
Message-ID: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_050248_392941_B134E8B9 
X-CRM114-Status: UNSURE (   9.36  )
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

This patch series updates the device tree for the VAR-SOM-MX93 to align it
with the latest hardware revision of the module.

The updates include the addition of missing peripherals and devices present
on the current SOM version, namely:
 - WiFi and Bluetooth module (NXP IW611/IW612)
 - PMIC (Dual NXP PCA9541)
 - Audio codec (NXP WM8904)
 - Resistive touch controller (TI ADS7846)

These changes ensure the DTS reflects the real hardware configuration and
enable full support for the mentioned peripherals.

Stefano Radaelli (4):
  arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
  arm64: dts: freescale: imx93-var-som: Add PMIC support
  arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx93-var-som: Add support for ADS7846
    touchscreen

 .../boot/dts/freescale/imx93-var-som.dtsi     | 332 +++++++++++++++++-
 1 file changed, 331 insertions(+), 1 deletion(-)


base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
prerequisite-patch-id: bfa4df6e3787b415218cd441317fb838824e06c3
-- 
2.43.0


