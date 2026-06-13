Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4084CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 23:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zK4mML80EwVGL6lWczcuu1KIJZUvXPEYaU6eVFtltBg=; b=hs2VuLFMNvH3iyZF7q2jcRa5na
	MAonaB63hQk3ofIfqqKSwbSjUmGsMKhDa42VRzFzaa3zNuUfIFZLyCu5hK02BrmWRUrwwK6FcjyDN
	oEegMuCLmJPisIyX2Ls7NBL7Gn5YlPPRCubFM2W5oWifXP7LICtMxq0V/V77w401aJzRYnCB7uMml
	p1piEvvro0tpYZ2qdzxaw4kUx6gt32V4wAok/iTy+gy1zbbuBQKXsrkqlU+2oitonwqIK4TVzrA3/
	4MqDSHdIel65laMB0BPm9mLZq0ssECfb8MGNSAFkta2pHuODVleaxF0Tyq8RmdUWC9qft/pk/6Hge
	zUWWA5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYY9t-0000000Ccmk-46PZ;
	Sat, 13 Jun 2026 23:53:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYY9r-0000000Ccm2-0xu5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 23:53:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c2da7fa321so9276125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781394778; x=1781999578; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK4mML80EwVGL6lWczcuu1KIJZUvXPEYaU6eVFtltBg=;
        b=cEFgm8mVrAFOJyXorsWUtKbueW4GnFk9RajwfHFCcWBuk2KYFptGrp0OSGqG+vLFgo
         +KStZMnYMWJijljUj6ZKMR9fbgTkThBAN7efg32tGGfAh14n0z1eOrd6RP0I6+NVccBN
         yok2FBx3hBzsTtYFw/HNKTnE+JYY1wYNrkfvU5VZGxvZSpSptPZuqqH+L8e/SMPWQcdp
         BvrlUKK6YfEYdqPbtWWN3L2hiuCCX8I9kI0cHw7Ez4eNBni7pVXIPFE2OXKVIvmkTo+h
         bB9Cobu598yaB4kxu5RFSMsNTnTgMdNLoqNmLfj4XlBMLD9VP5QseUrSxAZVtSK1PsZ0
         vWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781394778; x=1781999578;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zK4mML80EwVGL6lWczcuu1KIJZUvXPEYaU6eVFtltBg=;
        b=RTg+cLck37OvcfHfpUhnuZ/JVVHApvWwTxbQ9HoUsrHF4hP95+6W+X6Xy949MoVLP6
         FDBdBDnFe5hycK3h/bL60X4e1yDdm5Fz4RZWsf41nusmgxx+oH+Q5ZBf73OP/7iIxU4P
         FjmCMpu/ccQz85ypWuz8KY9UQFNMP7bQ1MpE0Di5a/U1PuBCkictLOSD8O+3KBoJn+RQ
         FBqBltkWaOdMoG1f/QQweiegoMgK1ZOhyv1u8ZG/j2rOiGC14Wbk5NwdGIQzZZvpMri4
         t/O8zZBBBZ0DncMzpdwePbY7oQ30BajyJsid3yTcsrkraqdKQvCaDZ2/YbqcGeiCnSzK
         zUlA==
X-Forwarded-Encrypted: i=1; AFNElJ+pEfj1aaSnMyEnfJTcc4SD1CSkfkj2l6J6WMuJSjPjQgk8uTCEoIqDJaf1gZRj6dQbLfD5Z/nqdSpxzfNMVfUp@lists.infradead.org
X-Gm-Message-State: AOJu0YxRZ/RwgGDFI1m7G2LHn09mnaI6IH7ZsFL6Y/V+yukpJICGdziu
	pqHGdmvQm0IOOplMcMQrKD7CY6m81FPCKO2IHOYBrG8u9pWj11BxERmj
X-Gm-Gg: Acq92OGjYAiqsmuIhO61cnJQcjaRw3VuPfHiZu535yFUbDeRrp6eQz54La2t8cRZ+AN
	TwCH+b1VcVhedtw7nFNZmhS+cVMK4GYg9egEQlAsWenUuDx9bvC02zpaLqKyB1TgdT0OEkUgP0F
	pNuzHMkq0Z1XlMQK+wM5zW0iJrWeW3VhEwqp4zi93bk8+I05GJVEmjpMRjQN/at08AnGp1EZMNP
	azS7Xo/M7jVPtp7chxUlzXTx491NMqdNd5LvuFZ+8L/JeCFAnmFQuesbwwKcTQ6u1o2K7kHOGrg
	pVpGoG+bGglIWao3J6QM1uYQKNhn5AqOfA/vfMA/hGalaRhQluDbzMxgyNOt/4P5e186SUBOUlm
	UT5cUxY053m6tZDe96Q+MBNO1Lx7ot7OZ3Pky0DutZoeiZwGzNIs5ncfqmhpave3atakszMKFrI
	/MKMNkypE+FEoWpITQ
X-Received: by 2002:a17:902:da2d:b0:2c4:d55:eb88 with SMTP id d9443c01a7336-2c410cd169dmr91771305ad.4.1781394778226;
        Sat, 13 Jun 2026 16:52:58 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm58185565ad.53.2026.06.13.16.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:52:57 -0700 (PDT)
Message-ID: <6a2ded59.63d39acb.391892.7632@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:52:39 +0800
Subject: [PATCH] net: airoha: Fix MODULE_LICENSE to match SPDX GPL-2.0-only
 identifier
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_165259_271250_F47F339D 
X-CRM114-Status: GOOD (  10.75  )
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

Both airoha_eth.c and airoha_npu.c declare SPDX-License-Identifier:
GPL-2.0-only but use MODULE_LICENSE("GPL"), which the kernel module
loader interprets as GPL-2.0+ (any GPL version). This mismatch causes
license compliance tools (FOSSology, ScanCode, etc.) to misidentify
the effective license as more permissive than intended.

Replace MODULE_LICENSE("GPL") with MODULE_LICENSE("GPL v2") to
align with the GPL-2.0-only SPDX identifier. Per include/linux/module.h,
"GPL v2" maps to GPL-2.0-only, matching the source files' declared
license.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..960727957e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3333,6 +3333,6 @@ static struct platform_driver airoha_driver = {
 };
 module_platform_driver(airoha_driver);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Ethernet driver for Airoha SoC");
diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 17dbdc8325..870d61fdd9 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -826,6 +826,6 @@ MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_RV32);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Airoha Network Processor Unit driver");
-- 
2.51.0



