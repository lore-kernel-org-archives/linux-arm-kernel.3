Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A180BD44C49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAhzoIc7AT3Hs7SLfgCwpVTdQkfhAduWnWMgLxNwhgY=; b=Yqb6m+tfyGIQ5nPqmJ/eCrYBBO
	DCZF1J1xBaQlNp5zKQjfEAk7JhcqHEOq4Q2/AjYi24Ouq2WJiT9TDyDQgBXzA+/jwx8uYdrzExD/X
	HiyX6JtRq+BvXBZJt9LI2PG+zZakAhLyzqB6No1QOsALAyqeezIMtcqnKR0llw1rFffNiKTmnyR8g
	iNwRJhGz0I8LaqU10XBLSemiM69GObnPsinr3KDPAAp7BNzaWnD6JyXOzkXGYrXzTqr6zvQUqzB6U
	JPYuTO/+Yw9/QW9bMJ0ggk+4xVUN/Eh6eHGm365RdBn9Dfns+ArcsdCmu2ZeJqmEh1G7u8QRYuMsr
	NdLiskqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNN7-0000000CPkm-1Bmp;
	Thu, 15 Jan 2026 13:26:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNMk-0000000CPgF-0osE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E51F844168;
	Thu, 15 Jan 2026 13:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B34FC116D0;
	Thu, 15 Jan 2026 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483581;
	bh=oHw9i7JTmKvZazut3BG98HYIqTHuu7siH7+Jtxfnof0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qgZRr+DSrTNWFUUfoaQ8IyixPr7ABXdist9S6WBsTDu4sAQlvZIYYjrx69yOAfoq4
	 QeRt1JaSIU7N1ehilPy3tBieynqNSRUBh0pcXWfGSCcJ02Q1Ha+eO3i+btLAo7GL1I
	 fMtLuc8/Hv28cCuzXbpwDhIiciMqkMhbQkv7di07UOTgRFeepnqKpCeXSYKKZWUpAB
	 /UUTFF3u5UTn7ET/KRua7CXYNv6I4w69FKF6JcXq6uI/osCsYYKfEVMN6lv7TPDrr4
	 UvaVkWIMRXFAPEWHK8WuRamIXNPn2oRTcWyxXGP87HkZ5u/2xkInGwFv/feHBNwob8
	 BANjdebVFFmRg==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 3/3] arm64: defconfig: enable sa67mcu sensors
Date: Thu, 15 Jan 2026 14:24:44 +0100
Message-ID: <20260115132558.1522169-4-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115132558.1522169-1-mwalle@kernel.org>
References: <20260115132558.1522169-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052622_248440_B4026CBB 
X-CRM114-Status: UNSURE (   8.63  )
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

Enable support for the sensors on the Kontron SMARC-sAM67 board.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e175e283e76b..c109a4b6fc6e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -758,6 +758,7 @@ CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
+CONFIG_SENSORS_SA67MCU=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
-- 
2.47.3


