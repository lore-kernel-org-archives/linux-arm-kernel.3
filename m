Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B70606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4yX/iEf3;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=LJIohZ4X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=; b=4yX/iEf3Tr0YG5gHzXm/QNO4AD
	LDc34OATF/1v6F1reRGygMiksCzAEDh+yL3BNF8ehGw/KrcZviVRA6RpM2gw6FsjcIAtZ8+FqvmJs
	6yezJJNDecJUVYyAR+2m9wxgYU3MBaxLTooDsPOB9eRHVLp21pxa/ge+9924Z0jh1WOVR88qxvuwa
	Yh9+qwgeoFkyix8ObbBY1muNQxOeodlnTKk8WSMjRvSXPkOOg3t6SOXr3wOW4X/W9S61Pr3+B7GfI
	laX76gr6QiPnGKfajVq4VUXhD42t+W2DeemZVDILPQobrKEaqon3lwxVpfusvLRA4axvAGDZFIEyh
	2vp3rFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpaB-0000000C8iK-3ov0;
	Fri, 30 Oct 2026 16:35:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpa7-0000000C8hN-22VU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 16:35:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9753925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793378153; x=1793982953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=LJIohZ4X/OLR11y9QboWY4glk6YixJHkdo8qOZOn+yDnXJcfIgTpyP8D0lCREN7YkO
         8DIsNGUb3VHsz22N2uxx54PooMx+dzdV281usjTfNpxMwHGg7d/UlntNd+hyDVMlbD5C
         V3Fz3hrAgFG59Nq9mqURT9v4k4pEgWclaUe6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378153; x=1793982953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C27CPAIU3rCWv1caX+bgOf8gRpTTIO2oZucMeDYt7Ag=;
        b=fcdNe7Nyui2ViV8tRGkeRC2TFPgbbTB52IBwizbK77agHyNCZYzpOmXRnoinKZetC6
         NAmFrw6WTJDEpDSy12TBS+j2+smTwiofWmHtmuGaQyGeWdvRn19zQwS6rs3T0y/O2o1B
         HrxXTZgZ5cqY1Eia4NDvHK841Gx8R5X8SbtF83QA66prNAhnD7b3bEY1SKe8chdg75f9
         kzCuU610zmaiNjJZWdVSyIKELlAcXDPcpsmpmtbZrFd8dlY70mCOYxmwZv2gECMa6oVO
         z4YktW0NFnmJglRR/F4rrVW5U09fE0qOVeAm2xhDSI5aeintTYtN25ZxZPVC2ZJsPHK1
         oCAg==
X-Forwarded-Encrypted: i=1; AKwUvBy7nmz4s62BwPsSJTp43qdxqCvm013UaHhjDIhzqUyQkAFY2IV1WBFGR2MgLKF8+yXhkhwvcOuAPRa2krdqclWr@lists.infradead.org
X-Gm-Message-State: AFq9FYKlxED2ZD6XHWqz/bSI08lC7Gq21swmdTKrl+wmSF9QR6P6V7Ip
	Afzxa/pkq6g197NMYIjD7Cl0p63xnDOkXsh+D0QcFcF48njK2chEfhK8fqh9fuB/0dA=
X-Gm-Gg: AYBFou2hxaruJL6jnFlT7QMaIkOYyTGW2Uqkqgg6pGnP18oAKk50SCL7qDYobFS+OhJ
	6dRsIAwo+Brn68DakRpjsUjiNfTFwRA+TiYfdQu31fganR4lfg+2M/72LCMdLDa4oJlkK8xLbo2
	sr8YOZCsUaECZ9ExE3hNJJ8xN05P6Tl54/HcyVCbCoJVusGe36R2zMMPnXAOL21R3j6JB7U8fI8
	u4+4Lhnvbh7LYg0nu8VvhtHBUXaW0C47t9IJ3bXU+EskMCYRInBHY0Yr7OI/zMT8qlKRoGLGlTk
	STVdjPf9oXoQW5qXfZLiDcNFWHCaQKbunC1+68K1LLfeKAVlffgYxOqqGmmn6eBcOev4RErJKit
	ev5610ZVVsAjPIjS8jOOlmpkFhhubnBEtK09WfoBbP/erc04Qk73IG0KTsvlE4vdP/WnBhoXqAL
	B40ifG5g5jQ38oCTDSkR5WfXWfFgse7Ci3RMle1yMzxd6OCvbgBd2kQu3zFIbHcgPsWmeJJMXlV
	FmqO7GdggLVipwCV/vUJyFq4Z/0Ft6N/7M1udeKxnzR60tRHIEm31WyO5Xd1Nrjv/Vmi6I/3PL+
	G/sdwhW0dczyMPrG420hWvkTfdM+yTCNBhf1BvrMMbX0F9Uorr9jeiCQj+kOXeuYAaq4j+gfPLD
	FpLtBE9JjigGiZEr2xikBpCfmPAk0zhkIk9IVa7w6U5VKsrbTyiK46TscNJveIFmAgb0agtVcwN
	bbrZYRV6LZoIPmThUWX1kNzVoTgw==
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr66801575e9.4.1793378152471;
        Fri, 30 Oct 2026 09:35:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723fcsm4084806f8f.14.2026.10.30.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:35:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.r@variscite.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0 board
Date: Fri, 30 Oct 2026 17:35:39 +0100
Message-ID: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_093555_588803_2A5BC4C4 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for the Engicam i.Core MX8M Plus Fast
Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
SoM.

The support includes device tree descriptions for the SoM and for the
C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
LVDS display (C.TOUCH 2.0 10.1" Open Frame).


Dario Binacchi (5):
  arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
  dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
  arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
    board
  arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
 .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
 .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
 .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
 .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
 7 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctouch2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-ctouch2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.dtsi

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
branch: engicam-imx8mp-icore-fe-ctouch2

-- 
2.43.0


