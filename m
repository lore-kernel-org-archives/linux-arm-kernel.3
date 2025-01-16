Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D459C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QxCo4uSbjepThciaI7lCoB7DB7kOHfN8F7vdydY9ED4=; b=ife2ldnCwGVKD0UJP/27Qza9Cl
	azxKdL8Ddq1MUZis4SPU2U78IxGC07YS7tRTeUmnyutXam7BarTnZJs9XM9SkVsySqH2iDugD8gb5
	A4bT7WbZxpgwqu1gfA81xN/4Z9z86Y6YlxUQwt13EcrhL+qKVFmdsfq/TT38q0o/yKVCsTL+d1y0v
	3jt8G40Th69oB3KS5qRkq9YZSvSFviQoUC2RldkwtlLii1PR3C4W1Ce7OamjICEC8QGLD2/COKuhY
	jyrmGRq+WGcjLen77sFE1pET9ueUGGXBMAbfKBY3JuyFe/re+/MNmKotV+sdGuVG+w8uxN1PFyQwi
	U3KeP0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMch-0000000EQbj-0OyB;
	Thu, 16 Jan 2025 09:57:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMbR-0000000EQPd-2aLy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:55:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso125421766b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 01:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1737021352; x=1737626152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxCo4uSbjepThciaI7lCoB7DB7kOHfN8F7vdydY9ED4=;
        b=OfWnSGnV0d+X6F498jFMaRqXhzh/REi4AYLNWAqVkc8WMbotR0rLziKN1HP2omoef5
         eMvo0oQUohYQWwXDndOeBbTa6TQ1BcYA3O2cpM1OhgKBIZjmHNx6LZY+jVv5GoBamaBm
         wthx+h33CZOTuGoKR3yPpIp9ihHfmpPxGLC4a4pmVPcwUSAs/dzeb8gWXQZnIxeJ8sPw
         1eXcHenQrB6K6JLE0ILNVObApqMJaNTviMCIRvkH3estxQh4f5oMxEpO7K86MPU9sx/9
         yUvhlKZk61CmnH5S3/IYLxGocjNH8tpxB5SWrB55ZHgSb/sydZGNb/+65PAjm802l6s6
         kVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737021352; x=1737626152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxCo4uSbjepThciaI7lCoB7DB7kOHfN8F7vdydY9ED4=;
        b=fURcaKW69ZenqY+85B56MHyB4BnifAQDxrz8dz2Oc2ueYx1dcJu6pmz4Vs77mgt3n3
         mtRxPsCnbwd/KmTqILb9Xjn/uZKxA+PdcZOQhme5OWe46QMFcO5RifoC5ped9SKrVg0p
         Y/JlfxHDdmSTgdH6xE4WmYPfb0W7cHSwQ66GxfWdk5AxBSCojAYaX5LIzW6JbW6S/bhE
         tRGKosT/3jEWy2DcrF71IWWPhyVORDw4qDRdgj4l0hgW3dBgLyF8er65UAG42H6ZJHBg
         LDXbFFwM8de1yxivpmYzFyszCXNzp8te6n5Xzz2gK3GwYCVrWC3aSL4zHrb62nEvO9P/
         lmow==
X-Forwarded-Encrypted: i=1; AJvYcCVsmMth08r0Nq7hiTHEu99m2/XAHqoxUw7P/+wasjEB1hZlzbIowwOAY4il6ZM8ROgNc9cr/wDUjzwFPJSasEOf@lists.infradead.org
X-Gm-Message-State: AOJu0YzIvYroe4La+vgBfNZ53LCMKU3OCigBbXZA+wmg6NPpwKjYzqo6
	7iLheW/wrDX0uFi0bnPvRq67HHssFX1n9Cesk/v2rBU9B2abzVb1KHLSgTZs/8E=
X-Gm-Gg: ASbGnctZHAfQ+IbhuP114kKmor9d0qfxPqBZgFAUotZO2lpFha5oDoha1qVm4uiFpsa
	x0Cj1dRkCz0GSrK3fx7yz4tAzoDB90ApNWeGUkj6+KJApKWMPA4NrnMQm9GB3Ui6Jlw7wI85EHM
	aa+9slzgB8Bzbu12xGEGdhIiTJAHjcZZOIH2rFNVbipN2w/exSEvmMq1AAsIAm4/7EbD/3tY5RK
	rcZMFoqNfwM1scJuu9rcTzQv6EzYm6ecxEdlDbtDFsMB8fGUnqP5A7h36fQOldeisg/Bhhkk0Dh
	3HcltCV+yk4fngtKXOZY
X-Google-Smtp-Source: AGHT+IGvliE9afxI7Vd6Sp1fQbggZFq09lgfqvnkRw8Ll4GPxQqmkrtWB/499oMziB1FX5BmyK5pfQ==
X-Received: by 2002:a17:907:d87:b0:aa6:7ec4:8bac with SMTP id a640c23a62f3a-ab2ab709c68mr3135422266b.17.1737021351811;
        Thu, 16 Jan 2025 01:55:51 -0800 (PST)
Received: from fedora.. (cpe-94-253-164-135.zg.cable.xnet.hr. [94.253.164.135])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ab2c905e296sm896769566b.12.2025.01.16.01.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:55:51 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	daniel.machon@microchip.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v4 1/2] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Thu, 16 Jan 2025 10:55:30 +0100
Message-ID: <20250116095549.449169-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_015553_662933_B36A3E90 
X-CRM114-Status: UNSURE (   8.25  )
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v4:
* Rebase on top of next-20250115
* Pickup Acked-by from Daniel

Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..247835b08c70 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.48.0


