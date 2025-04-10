Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B1E4C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OSjX1b+D+//GtnfnALVS0VRTFNxvnCOVfJgFbEnwUWA=; b=q6BGG6TuILldWbTzu6BDEGCsD+
	mCT0WrntMsmY0A1spu7vtvEBl6L/u0/1Jch6Ki3OtTdTDgcrwSTS9gy9AnZiWxeRCl/ZJ50tKGKH2
	cmHlEgrhVL1PvxsJR4FAesbt1vO+lXnd134vNBc1ZlmjcHRH6WnP3HsDlY3Wzi4y/t9LjheGWCG+e
	V3zddVYs1jSBdcV6OHeAfuXm+STmncMnkegEZNLojWPxzUX/8At+3rEKUUqJcUO5Uu6Ddq/XbKGu4
	Bb6KejtB2nqJANpfS5pik1dtpLn0r7lVoH/3Xa690WVyGVZVu7Kss706H0mpvCXO3SzWgX7QqSWWo
	/pK2vCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvX-0000000AFTd-1V6S;
	Thu, 10 Apr 2025 11:18:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2om0-0000000A27f-1cUk;
	Thu, 10 Apr 2025 10:04:41 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so5518445e9.3;
        Thu, 10 Apr 2025 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744279478; x=1744884278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSjX1b+D+//GtnfnALVS0VRTFNxvnCOVfJgFbEnwUWA=;
        b=RxnfHav3RUYwszJPuOri2xJXbmv6Vdt0ry5xwX2EAMO8bEfGewBTF35sybSi1RANCy
         5CF4QAzYwlm0dISgXNFY60xFbh/0w1b04H4KakeXWAbpy6fn67z8xRiiVTEpVSR21+Ht
         7OdHGC0k6zKFRz5T8dKU8ZKEjvuhHzfgPC7QDT9Y/zi8L4BgJ+lw3+DOlHwHeuWsBjOz
         FIW1141X0+7cwI6yIVMidqV/oF5702g5ykdBfQ0Cd4f49VqNnCbOJ5Yh1ccra8Wpueom
         mF/lmtEGyuyDJ1TV5NmzlRoRDyiJnWGcDKaW6gy97Fqopbro9G4pAbV9Nl0HYFHt/uvi
         rFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279478; x=1744884278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSjX1b+D+//GtnfnALVS0VRTFNxvnCOVfJgFbEnwUWA=;
        b=TpO5ZfYZTRertGPz2w6N4LSan2dESFfbAqxvAPiMsXJk+uO3jpx9YAHlFkv5EHi8a5
         MajahazzfOKRMxheDvvowz1BsfQ3WI5PC3qgZf8RHUMN97s1Aou1utUBHdVsiqW+buHG
         EfGhT58tB7kpk1sGTo9Zfs10OnZLIW7F2FCIHAq4UdVZVKyBF/J4qsh/ZVfsrJjze5FV
         9MOD2JazR8MKcwdAuYCmxOL1an3qRKBPSxet/WBYPdkQzJhuUmUJE0/mHe7krTjcCn/d
         PFtUpkcCKZdgFMinumhaZM5603I3Eer9ImbjRVidt7l4ppN9cx3hbsTPMLmP3iZzpT3S
         nmTg==
X-Forwarded-Encrypted: i=1; AJvYcCUZvhF93qQL4m/Hm8g79XtWDyTF826idDEyCe9xmQjhsR+4lTU8OqgWU/zxnN+EgsANMD1pNOVeq0VAfiMSv3k=@lists.infradead.org, AJvYcCWmaHQQGYaxeraiAHpDvHIClonTxGMVHRiSKgKTefTQB1TnCFyHkPsXjhm6FSdeqpsVX0hOBZZK5x9QAMVbi5ex@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa4av+1USKFhRxhy5nFDttF6DO5CF2WPZnvs4UMEkmcaoyBoOL
	UWSjomFQx5324YO2XUyNjuzkefnTJMmU5gFY/+hf5eVGnnncIs4f
X-Gm-Gg: ASbGncvLYki9+Du2c5w8xoTswppi3KK3bGvZpEpFZZUjRsp0XOQJp9bPdVSH5JsKcn5
	lcXSmxegb5EOBbQAn9nu8ntHbtA/l5Tee7yGFiJ6GmSsCm3iaMIW8XaX/I6aUEpMGDNVBsrw3oA
	DLRgLEmrhu13xmM3reoKny4FOlWe7PyDPvHcySw4rylhuyX3CjPYwZ2qck4UuZwY+4WDSb00T68
	A0R+mqSPg2fCS3OTf+eb0QtAFZaFDV2+MxuxeTRoyGCknJcABU55j1jqFxSxOh0PNcWnlt9dyKx
	R50SGNe3eDBsd/U4qr9MPBdrrVDyk7FDbsgu2qsrN1tT7FTafdAkiJ9yDKm3d8EfuLJcykKOxjG
	3f1qgmasnbg==
X-Google-Smtp-Source: AGHT+IE9rkx7s3lGoXoLv/0fYUbWZ4s7nji/vh3GglXy7KHxv51ZdIrScMmpN4ZbQ9rN1ZnOv01rZg==
X-Received: by 2002:a05:600c:4ed0:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-43f2d9a12bcmr24466125e9.31.1744279478201;
        Thu, 10 Apr 2025 03:04:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f2066d109sm50193065e9.20.2025.04.10.03.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:04:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Simon Horman <horms@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v2 1/2] net: phy: mediatek: permit to compile test GE SOC PHY driver
Date: Thu, 10 Apr 2025 12:04:03 +0200
Message-ID: <20250410100410.348-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_030440_414952_D06E161F 
X-CRM114-Status: GOOD (  14.19  )
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

When commit 462a3daad679 ("net: phy: mediatek: fix compile-test
dependencies") fixed the dependency, it should have also introduced
an or on COMPILE_TEST to permit this driver to be compile-tested even if
NVMEM_MTK_EFUSE wasn't selected. The driver makes use of NVMEM API that
are always compiled (return error) so the driver can actually be
compiled even without that config.

Fix and simplify the dependency condition of this kernel config.

Fixes: 462a3daad679 ("net: phy: mediatek: fix compile-test dependencies")
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Add Ack and Reviewed-by tag
- Address suggested dependency from Russell

 drivers/net/phy/mediatek/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/Kconfig b/drivers/net/phy/mediatek/Kconfig
index 2a8ac5aed0f8..6a4c2b328c41 100644
--- a/drivers/net/phy/mediatek/Kconfig
+++ b/drivers/net/phy/mediatek/Kconfig
@@ -15,8 +15,7 @@ config MEDIATEK_GE_PHY
 
 config MEDIATEK_GE_SOC_PHY
 	tristate "MediaTek SoC Ethernet PHYs"
-	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
-	depends on NVMEM_MTK_EFUSE
+	depends on (ARM64 && ARCH_MEDIATEK && NVMEM_MTK_EFUSE) || COMPILE_TEST
 	select MTK_NET_PHYLIB
 	help
 	  Supports MediaTek SoC built-in Gigabit Ethernet PHYs.
-- 
2.48.1


