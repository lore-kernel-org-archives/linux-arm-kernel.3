Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6FA606D83A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YQv+oTeV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCUPRS1Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=; b=YQv+oTeVTEw+1KESDho8jsAgWR
	cWdOlTOgUi+xp+Pm9p/Q1tscJdcdC++AiklS6JXU9j6jBdUKTc1sYiD5x26+8b6hgbxFF9020pvdk
	9k6SOmqL2c7i5JQC0Qx95X7OdSyqheRurMQgBYcc4xCcpjvAExpi+QzDYnqW6YdatgiOaee3Y7vR3
	3p96N1bnYyneyIHEe6bRZGsX9E9jXuKjwn+o/FNhq+NRWMkTneTVsoXSDFNPwsQxGeT5Cydstsu/9
	xBoA1kvXChUgUWzW+jGvNJCzPzHvjFH1Ea/lRLPFp40mF1ml4ta9CYgiGfk95YusthlCzn9KLsJYS
	0fpVWdPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmO-00000003oBd-1gAV;
	Tue, 03 Nov 2026 22:14:56 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmK-00000003o94-0ife
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:14:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48b060ec084so50860f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744090; x=1794348890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
        b=tCUPRS1YvrlMy+rAHaDuw4gUUcu8+RIIv6wQ1gw831H9XB7Hmj989kUcIxM1XasmX8
         KvKDHB13MgrYWMS/Ksh1bjlc9kopwSeSNog4LnysufPCEY9XcE2BDaKK1aHVSfy3mwCr
         WuJs0o29gwVyy4NM/MyQgenv8abNEmRBCTTX7Ht5v+ASCzVwxVWMNtkhaP2UQ86vvktl
         tFHMT2l3DTZ4IGMIreecrNgFl58J8TkvzlJ4bs2/GJMU9/1uub9NbifgXlQaoaBqIpKd
         GdzA2wlELAC3gxIfUQ8S8Xc/MmLWPA1EAZQDfY/CxacKazhIVuqvidFxrKMKtyotPFXB
         JZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744090; x=1794348890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
        b=ASbj7TMaPDlsjZ/LhGft5tUUWefAZ653aJShDEQpDnuPVMmFP6Fs1agTZxITlI6JIS
         Ewne5c5VcjWnFCxfSGC7MmF/NjXdDNQihrYa6S3sZRzdQ3TdW6aCeeqmGCp9NEn5z59J
         7117Or4GOCbWROwbuHjprGIKvEgh8wmSNiuLg+KddhNZlSOY7PRRdtnQWEgdqcElf/fe
         QYc/98oT97oR4o7g3QSdq8sHDGlyr/v7Z0e+Qz+oKln0ba/aqmu+fx7DqvATDJyjfj5e
         J3cqD2d8a6hSLgfIFwZT2Qj2e52j4sZsi2TTKAoAujOX2pHXbqg0DqNC0aDk2N6Ovv40
         d6dg==
X-Forwarded-Encrypted: i=1; AKwUvBw3TFDRBxhynRVCwycYabYNPGEqVa4PTvK2vdnEBrMxKgL2YCnfoay6xu1/MiG6a+2BKIug+9oYQOFCJRcds4+x@lists.infradead.org
X-Gm-Message-State: APuU4Z8Gd5jnLioHkb/Jey05zWPQ7Ov4bnYXTC6zK4OKDBOOZhB9ETLs
	aDmAEH9qP6UGYKsnD8VYGqxCu+PWLDwGw6nvG+iqXOXWiOmAG4X0zI3f
X-Gm-Gg: AYBFou3J4BErCkKlk2ktPR9T2fsdqBc1w7AflYGyB7X0AnmMDk+ivHV+o93rRggcMOv
	mkIUwwyFJ4mPjqMWFHjbUWnRf7WOtWNcF7wrTBqmEnYlmMoBEZ/+EFclmErom9T35wWLu4ueJnC
	+YsGBCDAVcdFR7ag1QVx4ZYpOtnty1gsqqXtJqpqX2Bc/gaSfQSP46A9y3XHBctWrwXBsGN3oaQ
	FYej5qvgVHecVJArFXVIFOsRc3VWSFQ5xiWOIbaAPAhG/QJfc0YUsv9FgWA6IqfTe0Sjnpa1SEi
	j/jZKwGjVBW9WJm1/sGA+Y/k/bfVBv6cBMCQGC6QV7l82tRguh3CpZh/fgRxnM1TBwhuOjR7fPa
	ClnXiTsmG0Seu+w+tFYhiG5jspBAWpVnhgVkO9QqSKFdHnLbDGPXVnln3It97gIOA31NOmpiV3j
	Qd1jsGPTFbUUJ0gQUlj/eULcQBO2rXT0ccUWJQqcexvyCMqf7Z4h6vyfBfV5PFPDVQ4TRzrUWmR
	V0lBh81+svty/ySwwWPckQ5Vx/1gmSKQ5VoYSOTkHe97tJsbwwA88bN0ykdDd2rFc9Wb9DAAj9I
	yvpFEgRRgi9HO8tZ9k4I7dKbxYqMI09j1BCzNnMfHLc7Nw39UKrKprZv1tb8pHn/uMlc4vPKFld
	/vEiElI3IilOAtNFmMzakkGHB8u6ICfltiQ==
X-Received: by 2002:a5d:64e3:0:b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e6e309763mr30399015f8f.48.1793744090007;
        Tue, 03 Nov 2026 14:14:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:49 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Tue,  3 Nov 2026 23:14:31 +0100
Message-ID: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141452_245161_B1A6D1E0 
X-CRM114-Status: GOOD (  17.08  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Changes v4:
- Fix typo in Kconfig
- Prevent out-of-bounds for zcal_ctrl
- Protect concurrent rext_sw_calib_done
- Validate port 0 presence for calibration
- Correctly set shared local variable
- Use phy_package_init_once for shared tables
- Better handle early exit restore
- Better handle phy_select_page

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: generalize cal_cycle function for GE SoC
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1882 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  553 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  377 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2396 insertions(+), 536 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0


