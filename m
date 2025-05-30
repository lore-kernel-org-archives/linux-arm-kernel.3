Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EFDC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=; b=yMZlLj/G3Ed+NekHx6Ol4PyoRn
	5ZmxOLgFA3RGGG0FJSFiC6+TFE4borwWxqjumz6dirlVaSOsrDq4GIFl+92Qfx3bPV2l4SRIZzE5J
	YP8V4Zd2/yinS0XjMJsVK9oGKqeHuVX09ksYinhE/7oK9R3e5Bpy2zRaNqR9HdBa/t9uZrAzrmNdS
	8QwJrCeVeZRxODpg22qZyN3ICj7IHUp2xSsuuCFAs5PlcHQXqSDme5abACFiuIk7xAUN6u/GX1x94
	vEj4jS7x05CKxWPEqZ8TTZIlk56I1MeEHtbeNM6BesIja8nEY3TH3mNBO4Yylg82qtLPEb0F6Cp8m
	lXa5cW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2RW-000000018ys-0n4t;
	Fri, 30 May 2025 16:18:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2H5-000000016yA-2D0S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:08:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-441ab63a415so23871485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748621282; x=1749226082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=efbONvoZIaVtE+IEXe4rYxkQc3r5qE0uKj5vm0hbtTYsEtV+dYjiExMX0GhBQjeFuj
         phE7EYn/rbRfcTfR2gJrQP2s7ik437XzxmUnOI7GR4uSftH8+JPyYFg0VYK305M4FfEl
         heNBVO80Mo7m0RkczE4OvLSdY4+6KT4y2Tcxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621282; x=1749226082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxYH3NexwAbeEcXLC/B+xWmBAAgWvD5JzKcWCQ9bGyI=;
        b=VcMFwabAD8Kh5Uri/3IDejzAiHW9A7NXY9Pd0wisl93a+TGA0KYJIUAHmGYdRf1SVC
         TN8MWQJkddRYBUCDuMJj7W+ohoZ3Y0aZuj5Yowy/yRoBb/C5uFV6y4ZTMWfG/0oZx7sW
         gYm0tC0QNkUEYVYoIr6dfjkNEph3V3X6AHrOatNjuaFPmqZoCPCZ9NFtqlsxIs4YUMiW
         BUcra0+cDSxS+raYZQ2k7bRKd/6qbS4sR+yRXBV4d2M307Ze/CPmgCYJkQLrqucz1rdw
         oZeQlNxymyueVggNodnroOZk0qeOyaeRcgwXRQb9vnYfmbtObBpwU8+GdBBSRijq8X5m
         k98A==
X-Forwarded-Encrypted: i=1; AJvYcCXXyQnFaA8e8UV4jGpTdzQ7HHXyXrzoYjSlqRCdMqZrJ1GT/H7hSWp3KqGy5w+coCqbxWvrDTO6ug7mrpqphaHa@lists.infradead.org
X-Gm-Message-State: AOJu0YxrYeV5NSzBIcRP97uCVRNHy6hOcw3mmuKnLkhUNRJxhaUOtr/U
	/Ira2dXjOLyVf/rgn6/naScGlVJteNWDUokNAfpLjgfHwKEVzohlh4xnoojRGrdpNqY=
X-Gm-Gg: ASbGnctz+Nj//nsv0ZSU0X4UPqcdiWMLDIp1l7YFyCFFZD6VbJrhIXOPbLIG4uPmg/R
	fICX0NsoDzx5DAGcTk1M7JSiMg5HT7zFsu3TCbW9kAylxkNSHPYIJo1jzUFoXFFNBZDAtt255Ta
	O61snccaeN7qSxBz2SCPjH8d6vL5uc8ni2PBDf0Nm6VZndqPx+xeWw4NCqZorMDiqwthOd3mE1N
	K5p8GXYG036MnMw7F7lz/PsqDGxCbk+wVs++q6zS/r7+lIMFFqxcieb8pRGBluq83oyYVFr02DP
	LNqZ8E6PTB+6bk/MwDPmSR7nFp6OdjgZVk6pOoOW0HXlvyokY8g4Z6AAU5uGpgzcNznIqQ6TSKI
	g6Z+jDqzJG1szKDsg8jbohNdi9aLUEJdoytbytRxkAOcjDOqKvN4=
X-Google-Smtp-Source: AGHT+IHB4KCY+ASia3MI/531qxYpWVifkfMHclrIx7cEJgeFFM0P1DgHGGwchnm9I8j/YZZJXHCf/w==
X-Received: by 2002:a05:600c:6286:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-450d657fbf9mr35257455e9.21.1748621281779;
        Fri, 30 May 2025 09:08:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm9716365e9.38.2025.05.30.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:08:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/6] ARM: mxs_defconfig: Cleanup mxs_defconfig
Date: Fri, 30 May 2025 18:07:36 +0200
Message-ID: <20250530160748.2476088-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
References: <20250530160748.2476088-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090803_556691_09B4A2B9 
X-CRM114-Status: GOOD (  10.24  )
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

Generate mxs_defconfig by doing:

make mxs_defconfig
make savedefconfig
cp defconfig arch/arm/configs/mxs_defconfig

No functional change. The goal here is to cleanup mxs_defconfig file to
make easier and cleaner the addition of new entries.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index c76d66135abb..91723fdd3c04 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
@@ -138,10 +131,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.43.0


