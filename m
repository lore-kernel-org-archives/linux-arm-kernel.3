Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91618D68BFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1XAbIa3hm+HJbfWZ3CE+oQUW9aIaBQsvmTiCcfqd4QU=; b=r25wwmI7z/sobY/nYRGHi1eFNJ
	RyOlGAwT4hA8nxpC2jeDYu+EYcJRd00XgUEh4XoA2BAuoUVSJHDlUjh+OIbFpj/oiGGrmr/8sw80m
	mNZTncR1Ab5yhpVec3QP3DHl5tmU/i317KnUhEMrweiE7410V5mR7PEhCHSEYGAp3GKDF6ZarN8iL
	7rEAQyungxxuTaxGKQOwT2nWYRcfk1K474R+U+Gc+R6iOg9mWx4c60VyuSFMwTzDXuqBuCPhhHppC
	tfcyy/DfXTeVsyIU0hOdCa2MiAfIBcGz2/L1LW9vGMcuHXqkb16MtyUpvuzUvVaCoRe6uEifas/1t
	bFISdHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCfLU-00000007NI1-0clE;
	Sun, 17 Nov 2024 13:29:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCfKX-00000007N4b-433c;
	Sun, 17 Nov 2024 13:28:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-382423f4082so336608f8f.3;
        Sun, 17 Nov 2024 05:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731850124; x=1732454924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1XAbIa3hm+HJbfWZ3CE+oQUW9aIaBQsvmTiCcfqd4QU=;
        b=F3S7flrYg8z9eOlJnI19n8Cg9pLSRUvEvropVUCmQxf0C7VR/56ocB89s5XjKj6CGK
         safLgeQhfBfzpoTjeU7zumQ4lMu1YWsWp8bKWWw7AWT6k7UdWA3RO40BBhgVzQl4TcqZ
         LlREHs8BVCKjGYRtKd1PQEqcyikCfGLxau4sw4sI5D9mmXMVEGjdoHgw92HZoH0EdMm9
         HZcZeTSTtjhcEEpPiMu6uamJO1mwPD0eTkr7pMxsvXsHZG4h1CY90HHP3fxhBarwU0ez
         m2TyrwlBcmD3jvY/NiSvID/dkwcQrlpZKpW4w8UxfiDpdKMshLmj6FK63rdSVBSes6Sh
         WNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731850124; x=1732454924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XAbIa3hm+HJbfWZ3CE+oQUW9aIaBQsvmTiCcfqd4QU=;
        b=Hsp9Ybz5/swrlNF+VI0+JR6UhE4gcJb3rUE3ozeZJcfKgmq2rXikDg3EvhTYmaKj7H
         G/ZF3e0LZXMM6WFfVKZgSLYMjxH1kGfuaEzDzKyi6stlD5aGaRVKWabc64gNiCRzlbL6
         adoIpXinGoEIzogWE9UnxQZFO/lt5XzPlfZW/vZPUVjQvjAdEgBgutUIq4qyGqgqJG6O
         cHpuP8WDmPBjWgmOU6lBfmiQmj6NAhx/ni5CjL7HYAW8uyniDETUqtWcat7PESEnCX0m
         qPZHg9av6W++8A1vTRchRwONL/1n+FcAf0v6m0fl5Qw3gbTbnEQHvMMKDC62NLEzcAp7
         D3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVsFz0j/6WpXMJlOgk2MT5cwbwJpCOpgaFBvpouTjBn2nKgM5xL1FiZBTqbECJ6xw3t4qH5ahhsYfJ6ZTxuIaHx@lists.infradead.org, AJvYcCXgjAB/Mxn0VJxqFEahQypIHvF9L0lSzlhAQMDLHBv/9VBi5ER6UdFNEDq5J3oGd1GGITPSqSBxj7P80S4yoQM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxRwcb+Yyxn5o1bA660IFoELJlW3R2odecABmtqlGuLSyRDEIZQ
	iVOy37Jriptec3mTWivFePgnpAX1AMjSBSWuNM7i25qc9NvrZb2I
X-Google-Smtp-Source: AGHT+IE2PiBZR31XHy+Sv2+wwjB5HCtxiAG5Tfaf9sjkvJjlS9c96ZY5wFNopklt0SylBWZ3yIrb7g==
X-Received: by 2002:a5d:5887:0:b0:382:42c3:83cc with SMTP id ffacd0b85a97d-38242c38557mr1136107f8f.45.1731850123618;
        Sun, 17 Nov 2024 05:28:43 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38229b6e2fasm6282015f8f.40.2024.11.17.05.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 05:28:43 -0800 (PST)
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
Subject: [net-next PATCH v7 0/4] net: dsa: Add Airoha AN8855 support
Date: Sun, 17 Nov 2024 14:27:55 +0100
Message-ID: <20241117132811.67804-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_052846_024196_94BD6EF6 
X-CRM114-Status: GOOD (  16.47  )
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

Changes v7:
- Fix devm_dsa_register_switch wrong export symbol
Changes v6:
- Drop standard MIB and handle with ethtool OPs (as requested by Jakub)
- Cosmetic: use bool instead of 0 or 1
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
 drivers/net/dsa/an8855.c                      | 2233 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  693 +++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  267 ++
 include/net/dsa.h                             |    1 +
 net/dsa/dsa.c                                 |   19 +
 11 files changed, 3482 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


