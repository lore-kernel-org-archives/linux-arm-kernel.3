Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11526C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrltEk6+3hF6VsUp3/raIH9c76LdjZyg5wwwr6SNNp4=; b=gP4fpD5WkKCjRnpNijlsoNWCMA
	IzP/2MrUt4UjtT+31alq7373LuXBCyanrnay7sTAD5nd6cbiNXqC57WsLYMmq00Fk5xKX8BnINLd8
	Dcvv/YnHPSRnIpe03ORDKCaBTsM8FghILFW7JXNkRjVDiIEo94wVYz2ItDpKL8nNuT5tJoodvPatS
	TqdH7aiyPQqsc2F3xKDgrFkmNpp2tDswmuJwY1ozeqnTK4pWDJH03k12I+roY3RSsJNk2fVPGjF/s
	Oyvs44RgjcrVQTJcXxNfY0bZH6OZooZh/GdYTbs2DvgO8Ik30909lTR9WoA2bttMOplymkJoNoXEi
	I5xpsm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4U4-000000087QB-1p59;
	Wed, 16 Jul 2025 15:55:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Mm-000000086Lb-2wv4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Jul 2025 15:48:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nrltEk6+3hF6VsUp3/raIH9c76LdjZyg5wwwr6SNNp4=; b=k8Qowi+pKayVY7x9cXQ1pS0722
	z+z37JQ4Y1KG0mfknn6iGiFvmivV8vTqLv/6MGmZ/1eZLpHJPsbznPq3wjIJHFsyz3kp1Ah2IS9SU
	0OmvZ8s2Cs4BkghZHNvivYz1QjCjE1quTzkoXEcWgF6K9aLN2UKgL2zO8APBPK5buXVAtXFzX3Aq4
	fiF/uhvJsKXcnYuHNWzETo1bUedrcDD2IRAnoTiozVXRcqvRWcEmtCAagkeGfITkzKcQ8uYageIiI
	CHwlhkZFpDqx1wKKqkkiYFIXpkQtk94/syDV/Iiu0hM4NVJ3o5BrVP7ptRvcxqXIlWL3pgX4U1sTm
	0mrf4s0w==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Mj-0000000A7kB-3NBc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 15:48:19 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so12294157a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 08:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680895; x=1753285695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrltEk6+3hF6VsUp3/raIH9c76LdjZyg5wwwr6SNNp4=;
        b=kv2PxCy9/qNPnHQ+oQW8HPXa4D4DIjM/DVLRZANqewCcfpy69f1z/z7iw2nzlDXLOz
         K0B+L/WujmCHLU2dVWSQUO+OUl/8jaMjy2+f02SC3YbuMT7JMXU1xHbVHuGjomdCDFnm
         G5TcQTd9Wc7Ea/TJ2piZu1AHkmQEKJXsge9tj6F1gMA43rk+qmq3gR44oqn04fDCUUey
         VtVdtn3nct6FP5w1oO310cSGvZy+JmJ9kIuDjM59Ap1UwlibRn3isklQ5OuzItS6cS+L
         Ce7o6IzKrYITSMvrURejeCthIULW6cZIeCC2ShF4i7AzlN+Z9XuSaH7rL8Ba9GURKa8l
         0DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680895; x=1753285695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrltEk6+3hF6VsUp3/raIH9c76LdjZyg5wwwr6SNNp4=;
        b=Br4CrlZehNm1yp3Ix8vod3PlwAdxTdoiPfBVeXbmBW/ihwyYiv4QwpftLVDD6Y1lRL
         hGSfk5G/9Ha02mmzD3COO2Bx490SuXfzAvJRMmjUvVkV6zhn3yl4J1UCGX1RlDKxGGwO
         KC2F3/SMGceAiYkDmUE5uQQIP6W908KQg5f+Wbw6z4gVf8txBsVvphUmSMWyiUWwQiCb
         R/USDY4s/glfdoEItJQq5jW9TXD++HfQHMwxn4htEX3Z5bJyTYFXJ+p16vWXRXbN0Uvk
         9wmYYix1SuHD8r1F/+hcdz9VRvASd21giJ5JY5Fi2/54YoP4whMvbwWQDtbQuj2G3PEV
         DKXg==
X-Forwarded-Encrypted: i=1; AJvYcCVtW7xD1A2F+33f0wm1ZwVUxWLYseid9yebDh6rOXSRBAzYMz8iYdPsD53l2auFYLQc5POzIhm5PWfuJMwJTpI9@lists.infradead.org
X-Gm-Message-State: AOJu0YyncPR/WKViEm/Dx5bhcY9d9spMkTumNb0Y48Te4Mnx5NuZH2c7
	CDEsD1h2NQKuf+U4QQZaxxV3Z8dUo7m/WfqSVBTZOVUE70wMnrxBsXgG
X-Gm-Gg: ASbGncv+HueEeac4dZ+hL7DQyZOr1i+FW263ekZ0Aot3C698fFr9Imj9mwDkkUcMtrV
	/lKt5SSV06Wra4ytWe0QUoHgdntCq1x/Q15S6OmrV0Wg0mX/E85MMrguCTS8eerOAp3W0PcJeB8
	rLkDlpLmC5LxLQsTpU9D46h0lGitSzeQqXrxNb3fTYnGm6nSyX0NRU0n+HMXpK7KeQ2TxfOcR95
	Wu6zl6PR7eyGKJpSRVZRMWjADj7J85BnMA3tmnLi9kvcs9Td6mnSfihjyq6iR/dgvXfZoeF5WfS
	pm40NUCJ0XcaWVwqP0JFaH7zA7TfiehMYo+hWUxpQf/enBFRWyfbxhLll+AHkMvLKsam4hh3Hsl
	+bJoU6xBJ56MKfK5nKA6I7wIjP6PP2gNZCogT
X-Google-Smtp-Source: AGHT+IE8vN8iDrpEck2ZL8pFvrdx9RHifPaHz77OU0YQTwxeYuEHRH4jGkcTFVSWayZ6ccRSNRHHTA==
X-Received: by 2002:a17:907:cb81:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-ae9ce199db0mr319557666b.53.1752680895141;
        Wed, 16 Jul 2025 08:48:15 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293fe7sm1196705266b.123.2025.07.16.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:14 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Wed, 16 Jul 2025 17:48:04 +0200
Message-ID: <20250716154808.335138-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716154808.335138-1-goran.radni@gmail.com>
References: <20250716154808.335138-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_164817_927320_0BBE1683 
X-CRM114-Status: GOOD (  11.00  )
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

The i.MX8MP-based Ultra-MACH SBC is supported by Ultratronik, and its
device tree has been added under arch/arm64/boot/dts/freescale/.

To ensure proper maintainer coverage and notification of relevant
changes, add the imx8mp-ultra-mach-sbc.dts file to the existing
ULTRATRONIK BOARD SUPPORT section.

This follows the established pattern already used for the STM32MP157C-
based Ultra-FLY SBC.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60bba48f5479..0ab09226e0aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25450,6 +25450,7 @@ M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>
 S:	Maintained
 F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+F:	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
-- 
2.43.0


