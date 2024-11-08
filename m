Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF65BD5C0C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g5rDU6VZuerI6+GmmjiOWykpHLX1KujOwsEgmoRFXlc=; b=KjuoDbbCn9H8DJOp/VdtS6NqSL
	54u3URwO4aRQekDvCOGMsUZmxK+9dW22n+FlKK3ha/VEYrd2BN2XkXwfxkCiZ8dvRsgBOei160PtY
	OAnR2oqUItfeqnMs210l3T6MpdWjjvDzOQUmLWmeN1/0+THgSjqtU6IgEkzta10VkT6ACspnJkluR
	ybXczpJyUEufFt6UYCHcs683ZwNai9ymp3ueE940ytjwCcon7pxU9LbC2TCXLnKqChOz+RmZyxB/w
	7yK1xGVJbVjD7xPC9b+28Tol+tlWkaRA61rIOav+NSRfnV1ymuBThN0UPLambp4h5BTNkDgCY4di3
	PKRp/BfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9P2y-0000000AgGY-2btn;
	Fri, 08 Nov 2024 13:29:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ozg-0000000AfVU-0QIg;
	Fri, 08 Nov 2024 13:25:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso17789285e9.3;
        Fri, 08 Nov 2024 05:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731072342; x=1731677142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5rDU6VZuerI6+GmmjiOWykpHLX1KujOwsEgmoRFXlc=;
        b=ED6RMEMvWwi0SsAJKcs9uFevV0nOCMRmCuv0dHju5S6oRRTu5CaRqcJoq9ISUCIrnk
         vgURzCx4wYXqw0i06PgZpAst+7j18Y7Ctge0xHshEK2B6b9dkLTyDr3y0phFxcme5dEz
         Q4jsq8dsGMvrIjCUTJOPnQao2LPXQEUmnnbVoNjH6iKFUPm8tFBMcVAcjWM71ym5cjO+
         JJn5FG/whjfw1SaKaJJ2ko/+WTE5OS53bUxvXhA/2bL0Map+CX5b2SGNYMhaeLGfqJgI
         RXzhL8JFhtTbyLNh6jvyfl/KZxls1ORJJk1RCa6XprA1mpOCCd4Pgbw51aZ1bcG4IX8/
         tH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731072342; x=1731677142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g5rDU6VZuerI6+GmmjiOWykpHLX1KujOwsEgmoRFXlc=;
        b=lTV5oKeP9CL4+CfRn6r2cYFRAaB+Zs/S8+a3WJByYaZ6pNkhrTjSNHlGNluCCbH5M3
         vNWZ17Dj/ydKOPYcO+2XCbBkYppprd2X9fRqBDXm/cVETte9zcHJJ+Dp+4aUHZl9kJzH
         MHGox7Bwu3BGtur320R4nnuHAe4/4KHrxiIslKDJNKBeU0GC5hdUbRYcyIuBYGg0R4oT
         t5/gzIHioKNEab+DWZoCeDgv3Vlp62pnBENSOdZO4VejPjb63LCTpViRZcObEOkVQyYC
         /XwRzkiURZNZdW2eJw4VrZxz07XIShAttD7CvuCAPgv1HCa02V3q0aw0oqeuAwuXqd8G
         mQmg==
X-Forwarded-Encrypted: i=1; AJvYcCUuECMeduQ16ZWo4Oj+AhcW/9qkwT6KKswChJTRN+zc5SUP2tdYgEC3pf8Rt62OPbJxC4hzjY/g0kFyaosxW5U=@lists.infradead.org, AJvYcCXUF1TCH8o+pOXpSZOz26xcxCdX5MeLdPrNvrmKeF1GdnZOhO7CP2DdiayKSudeHa6+fNLN9rlEf/40qqIEuukL@lists.infradead.org
X-Gm-Message-State: AOJu0YzvegTmgnxSypx67KrE6IxiirfNOkciXuGJHIcDfW9VyFHphsN5
	wV+RxwE4YYxcD3MSD27HzKb8uvOoKFGY0HeV1aBohirRgKZhQplh
X-Google-Smtp-Source: AGHT+IGKVneiDpqEWsTNmdvn/OrWcqsgiRdsDLQNHy+NjEyqjVUMx/4HlFOvPZs0rVxTDt3Hp0EB4w==
X-Received: by 2002:a05:600c:138a:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-432b750274fmr20953615e9.11.1731072341963;
        Fri, 08 Nov 2024 05:25:41 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432b05c1f61sm69746705e9.35.2024.11.08.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:25:41 -0800 (PST)
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
Subject: [net-next PATCH v4 0/3] net: dsa: Add Airoha AN8855 support
Date: Fri,  8 Nov 2024 14:24:13 +0100
Message-ID: <20241108132511.18801-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_052544_168821_5C2A3894 
X-CRM114-Status: GOOD (  16.70  )
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

Christian Marangi (3):
  dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
  net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
  net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

 .../bindings/net/dsa/airoha,an8855.yaml       |  242 ++
 MAINTAINERS                                   |   11 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2138 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  638 +++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  268 +++
 9 files changed, 3313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


