Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F77D597A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9IEMQPSVtNlCc6/S5SqeKWGzYp+R/DaBjCz0N2sj2Qc=; b=IZC0JgGUPjhYlCJOetc3kbRi57
	kRiG1NAp0szvymRw8YCnxiHddZF+gy4+YCZ+kU0ezRe+aGOyPPnCgTyP5tRd97/nM0zfbWa6Uma8e
	Zj58+b86kt+34U2rCJjDUQQgBM2jnO5fm9tWCY/lyAGDft3lOKLkZqIS7cymSXD+ZQKIumilLDm6T
	2RuJVYsGifLzl3GKtnSdLlOAlQTmYhoJNHO8RerIZBUUWm5T+W5w5V8JcprUcbNi42zO4NfCcZm/y
	/HXgGe4xnFERgHzDU3aMWFC7zUe2rD+Y+HP5XnTqxzyhj6gPATpV2lcklU75yL4HX3xPlMrUbRaS/
	j1LI8iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxq3-00000004vFl-0KFe;
	Tue, 12 Nov 2024 20:50:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxoE-00000004ure-0zRI;
	Tue, 12 Nov 2024 20:48:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4314b316495so51420345e9.2;
        Tue, 12 Nov 2024 12:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731444501; x=1732049301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEMQPSVtNlCc6/S5SqeKWGzYp+R/DaBjCz0N2sj2Qc=;
        b=hHO8pmme73WSLREIqHjuYyimIJSSwj/eMz+cWz46q3f4mtPBo1ZoYDHqE50XRLRU9D
         DJl9+jCB5f1yZiPS0kUWrWcCeCxlrH/KUyNkVfZz0d2GmUNtuzHYhFI6T50l0dOgUreq
         nqymuqIO/lhApfQhuC3M9xyQg3oAiu/W5Md7FIkrUKmNsergw7L41eQ3hi4sdiX4imIE
         Outyo5buolH2T+xOtANPvdf3cvh5lHJkcrKE+Ur5SWf30L59G1gLAtBg6ZkCgUL0qvC2
         L3yEGvPyQp/a6sw6zFg2QTU440h/YoJrCETAgWNDXhqMZbMEm2b2Qauqm0uB6G1NZnCK
         0zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731444501; x=1732049301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEMQPSVtNlCc6/S5SqeKWGzYp+R/DaBjCz0N2sj2Qc=;
        b=HKQOeMaOF0lBDCqTnGS9Z9ExnFpw/w9Wn467dwwrU4gNP3iVs1lVgPfeJxdkN38OeG
         9P1mkxmIkWWckCQHk63PLIsWKO/TMbJhqGCi/SUry+LgH83knzvDOj6bvKS2kWXCbZBc
         uLT4Y9hSJYPulB+OohCrusSzgvxhSDv4ZfPWSe0qLqW8WMx1BzmtVrrNYHzTBJCUhTkN
         8ngmRit+L1/WlYl+4FtOijZICnooojHbmIo2SpsRK06O/prtqVBJ7QclT7IWQPMOAoiS
         Bd7ZMNDINUQj0+jngSaVnO93gSHbI/ndYNLrccLAU+I6qfOWivkuPGjVTsnWCo49AsxU
         bqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYyceSW2wO19ZsfJbV9MulkPamrUY2IQo3xs6ywVGT64h4lKqd4Q9eyQCL0sSV/TOBlchArcLXWQp8DeSGWMrl@lists.infradead.org, AJvYcCWLx46RZDheMofPi1pi73iORfr6HXfhkFNdAdiuwl7v/iEzUt15FDtRTLMNp4x8+Q4iDf0tBHzsphJGjYVgxi8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKJPqz+kdf/otOfEYqyADZrPyckrQFcFswrAw3INe81rN0kGsY
	kQQHF1zubjGZU4MaGF6o+4i1tAZw57n49sEz4I09xMPse56Ik9If
X-Google-Smtp-Source: AGHT+IHfMUfl4lLrkGoe+qI2lDcOs0XrtRDrd6/WhdzyPnclivKq+ECLdyn2nrlfubdCh7Cal4/OMQ==
X-Received: by 2002:a05:600c:5006:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-432d4aae640mr4349335e9.11.1731444500531;
        Tue, 12 Nov 2024 12:48:20 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432b05c26e3sm225426715e9.33.2024.11.12.12.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 12:48:19 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v5 0/4] net: dsa: Add Airoha AN8855 support
Date: Tue, 12 Nov 2024 21:47:23 +0100
Message-ID: <20241112204743.6710-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_124822_303971_4777C5DB 
X-CRM114-Status: GOOD (  17.09  )
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

This small series add the initial support for the Airoha AN8855 Switch.

It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.

This is starting to get in the wild and there are already some router
having this switch chip.

It's conceptually similar to mediatek switch but register and bits
are different. And there is that massive Hell that is the PCS
configuration.
Saddly for that part we have absolutely NO documentation currently.

There is this special thing where PHY needs to be calibrated with values
from the switch efuse. (the thing have a whole cpu timer and MCU)

Changes v5:
- Add devm_dsa_register_switch() patch
- Add Reviewed-by tag for DT patch
Changes v4:
- Set regmap readable_table static (mute compilation warning)
- Add support for port_bridge flags (LEARNING, FLOOD)
- Reset fdb struct in fdb_dump
- Drop support_asym_pause in port_enable
- Add define for get_phy_flags
- Fix bug for port not inititially part of a bridge
  (in an8855_setup the port matrix was always cleared but
   the CPU port was never initially added)
- Disable learning and flood for user port by default
- Set CPU port to flood and learning by default
- Correctly AND force duplex and flow control in an8855_phylink_mac_link_up
- Drop RGMII from pcs_config
- Check ret in "Disable AN if not in autoneg"
- Use devm_mutex_init
- Fix typo for AN8855_PORT_CHECK_MODE
- Better define AN8855_STP_LISTENING = AN8855_STP_BLOCKING
- Fix typo in AN8855_PHY_EN_DOWN_SHIFT
- Use paged helper for PHY
- Skip calibration in config_init if priv not defined
Changes v3:
- Out of RFC
- Switch PHY code to select_page API
- Better describe masks and bits in PHY driver for ADC register
- Drop raw values and use define for mii read/write
- Switch to absolute PHY address
- Replace raw values with mask and bits for pcs_config
- Fix typo for ext-surge property name
- Drop support for relocating Switch base PHY address on the bus
Changes v2:
- Drop mutex guard patch
- Drop guard usage in DSA driver
- Use __mdiobus_write/read
- Check return condition and return errors for mii read/write
- Fix wrong logic for EEE
- Fix link_down (don't force link down with autoneg)
- Fix forcing speed on sgmii autoneg
- Better document link speed for sgmii reg
- Use standard define for sgmii reg
- Imlement nvmem support to expose switch EFUSE
- Rework PHY calibration with the use of NVMEM producer/consumer
- Update DT with new NVMEM property
- Move aneg validation for 2500-basex in pcs_config
- Move r50Ohm table and function to PHY driver

Christian Marangi (4):
  net: dsa: add devm_dsa_register_switch()
  dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
  net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
  net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

 .../bindings/net/dsa/airoha,an8855.yaml       |  242 ++
 MAINTAINERS                                   |   11 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2129 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  638 +++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  268 +++
 include/net/dsa.h                             |    1 +
 net/dsa/dsa.c                                 |   19 +
 11 files changed, 3324 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


