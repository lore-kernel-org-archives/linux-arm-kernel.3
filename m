Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18705C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=; b=ic9XC0hQKre/SVwvVn+jG+ON74
	2sUUSUcntrkrzFlz0+/WuU9Cz/99IppnA1mRLuC65UeNDxYii4VPahffWNRTENd3O28l/2EzsmaSn
	OnkPmGD6a7DYhQGWchGgoA9bPAkI/h2invUK0e8tq8oT2vqviTFsaOvytQ8vStrNZv/7pU5E5ulkL
	+AZN01Gf7wczYkY7cvKsQyfkVo2c2qJ7A9IzbgHX13r26GhljG5oPZrGMIRQq2gcb/kqOOgjISf6M
	q2gHRyeBHl9PUs/eBY5jzu4jD3N0EyUgDRSkx63r6/yOQCnDYNKepV0ddLVsl624WhNhXhbWjFSbr
	X0Oohwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepGl-0000000EbUj-44Lh;
	Mon, 03 Feb 2025 05:45:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepFJ-0000000Eb7C-1tnF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:43:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-215770613dbso51300165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 21:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738561424; x=1739166224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
        b=JSt/16amI6nXBqlL9xa7OyAdCDwv4LmQKEPMrpGbD/Apl6M7nSDK7CAYEmL4WblzAs
         jZp+EEbbxt92Hg89St1arm8tUVb99ihH76KzQjHqw6d65kiuqxTL5z4KMmMXfi8ha1vU
         eulu9rHpLeaKXYL7pj0tZ6ddcl6ccSjLh4By0PJvwS5jh/CPI1rdJ9WLfnPQ+Ck+ptzl
         uoSouGtL85MHAFdXwq6Jbq8upAmFIvuEx7GX3B1M8L+DbrcEAJMKzMCH9LCBVTir/tQ9
         HwBbe0aHu2F1B/I4V6HQr0QlxOMcsT94nska0TAtTRC90Ovs+Zh8j3OrMtenvLTpqAlN
         h7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561424; x=1739166224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
        b=tNoafRwkgkyIJoXfcVVJ4x1feIXk7azQ0fslrg8qXJD90qxpIf8ChHembI0cFE/rct
         dUbhdp1B/tLo5TFwGbNHr9K6aarmU3qcx5kq+ILJm621Oy8bUtPeK0KqSDfomgcplJuF
         X22/zGXbD/w1ZfcApwsgGULlED4HuS+QqPFdFb41kxJgoeG/pEVgtTH2GJ+hQJjNHkGb
         10EiRGgqw3+iXzhDXS0hr3mTBfL18k3nKEHF8TndlMwaWD3W29ol1Q953XLJoN771l+J
         kyPsT2aT40fZ8fFHFsPlO7WpCyKE5vXM+qv2CL44IQQWyJvB5txCYX9STmkBgTzWaO/n
         4rpg==
X-Forwarded-Encrypted: i=1; AJvYcCU4839XKVcbDVls6+8tua+Gs1g+8DtH8D7Y1IQPQbmbWH5SE1XE2e2deXIOeF2rq56lq/PKiuQVmuR3INcFMS+L@lists.infradead.org
X-Gm-Message-State: AOJu0YxQZ+wygY04q1vQX5sRPUbdDk1I4741iyr6yynHOcCLBTaTErqO
	Ai1W85qz3U0DIADHAOl7K7elKmOy/AFR2XMZrxTd4JPBjs72N16R
X-Gm-Gg: ASbGncuOatfvTARpYQnPspydJcOtrxRqB4KEs8kYslhY5VwQVcipux0FOaJG5OmLEpT
	sD/oBbQmaC0UWs9y7aaLGF8DQROn7DY+xwiC8+kwqBcsXggrzFAJHaixMfZYF4h/Ebsp32WWs1L
	m8SitzBh7d82BBQJplFB9mBRuOdlcoX7pbtHba6kUpet+sf7MFmpg4EeGZm8ofqtZ/8PVRxMA40
	zAwht+i5/pzd95HHEh0zT65aV37/AOcUabyp1h78+TYBPUpmuLgIz7q2mDPb04i1JGT82bNkaqF
	RYvQrzLZEClG1Ncr14dH1aNKOKZ6XI7W8HUc3rkRG8hjd47+h22lKE94
X-Google-Smtp-Source: AGHT+IFZo0ftKSRImunKlJXQj0l7sQfkYC+YNDQdjmv/qB1QLAW3j7xBuAzdPaBhuWUb5WL8D9R29g==
X-Received: by 2002:a17:902:f546:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-21dd7df98f8mr329030855ad.50.1738561424238;
        Sun, 02 Feb 2025 21:43:44 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 21:43:43 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Date: Mon,  3 Feb 2025 13:41:57 +0800
Message-Id: <20250203054200.21977-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214345_501637_0F6DF9D0 
X-CRM114-Status: GOOD (  15.47  )
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

This patch series is submitted to add GMAC support for Nuvoton MA35D1
SoC platform. This work involves implementing a GMAC driver glue layer
based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
interface capabilities.

Overview:
  1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
  the platform's two GMAC interfaces.
  2. Added device tree settings, with specific configurations for our
  development boards:
    a. SOM board: Configured for two RGMII interfaces.
    b. IoT board: Configured with one RGMII and one RMII interface.
  3. Added dt-bindings for the GMAC interfaces.

v8:
  - Update dwmac-nuvoton driver
    - Improve the driver.
    - Update the license to GPL.
    - Update the description in Kconfig. 

v7:
  - Update dwmac-nuvoton driver
    - Update probe function to use stmmac_pltfr_probe instead.

v6:
  - Update dwmac-nuvoton driver
    - Use NVT as the previx for all functions, structs, and defines.
    - Remove unnecessary comments.

v5:
  - Update yaml
    - Remove the properties already defined in snps dwmac.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use remove instead of remove_new.
    - Use dev_err_probe instead.

v3:
  - Update yaml
    - Fix for dt_binding_check warnings & errors.
    - Add compatible in snps dwmac.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update yaml
    - Rename file to align with the compatible property.
    - Add an argument to syscon to replace mac-id,
      with corresponding descriptions.
    - Use tx-internal-delay-ps and rx-internal-delay-ps properties for
      configurable path delay with corresponding descriptions,
      allowing selection between GMAC internal and PHY.
    - Add all supported phy-mode options.
    - Remove unused properties.
  - Update dtsi
    - Modify syscon configuration to include an argument for
      GMAC interface selection.
  - Update dwmac-nuvoton driver
    - Remove redundant device information print statements.
    - Remove non-global parameters.
    - Retrieve GMAC interface selection from the syscon argument.
    - Parse Tx and Rx path delays by correct properties.
    - Update configurations to support Wake-on-LAN.

Joey Lu (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 8 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1


