Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC003C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 22:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BsSQL3Vwnw+tLfFu0xgQFzyGewrOaXiW80oniV4mXuI=; b=H4us9/ajktEZDhnt/O9uhlAT/H
	R8MMJ2cwA7yik1o1qBWv8Amb47GrBVwabn+wDLGb2iYh7avS+/Q9uxJAm8Cp68a2+iMOtojRL/Ygx
	FkZ2w/WQfOIH61Xd9h0o7adaY1eZzJdlyEld++hUjH3Ov/JKwhFoswvO8ecAtUcb54FeNl6K7h34e
	sCR8m8MaboONC83UVcwE3f6dvANMwOK1kZI593btKQH7jK0sTTU/gHfdmpbA8Y51MisTP5lduwNlM
	AGuXhhXJXoXmeW3GixnNARDD6JX0xIWdxX0fvH48yU4z0DD0qwSjAI8OOh00QPusPqv2InT6aSPyT
	fokgwhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiHu-000000065c6-3b7v;
	Wed, 23 Jul 2025 22:50:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiDM-0000000655U-23Q1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 22:45:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2363616a1a6so2721505ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 15:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753310731; x=1753915531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsSQL3Vwnw+tLfFu0xgQFzyGewrOaXiW80oniV4mXuI=;
        b=dwMl3LvpfWaHTT8eC3bc4pRiVVTtZu3UlXS0pEEUh26pfdnpCbN/98BxhhYRM1ZIqJ
         xzh/2Mtzvn+UNBbfUMV6M8LadRCUAxhXXv+QYZ9BPuusKh1OsdwBOmU+A0135gwWTGgm
         bVvb8/vOjP8faFSYRiS3miK0RM2Un70FOceBzrprxm+DK/aXYkVm6rlcHNFXRelvAjEy
         Gulp4brWdO2lfLbokLlyd2E9FIEhecgALmGoZeBdQ5atKFertiIPPJAw/pcUVN1WOQTN
         eS1ck2u6ExJP95I6QcuXHGiwBGQOmfvy9Sq4z32MRXbdNTJtH+mK8c0jieVFw+kdrOWL
         JunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753310731; x=1753915531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsSQL3Vwnw+tLfFu0xgQFzyGewrOaXiW80oniV4mXuI=;
        b=u7qYLMmCbdbAS3yqhfHxv/DeWcpLkUUHfw7cfCcFdg/FHYsw6C1sKdyUsSCWc+WFTq
         Lzsqiz0L2YRb8TsUErmTvfgnB33voOgPOpBdwhG6weQb9XLf0u1eEaFFif+suK2oS2sV
         ctnzn1HW7ev+g2TPbGJKU58e7rG1nhkEpfX6ot7RVISL/EO/1Vcwl2vQEZvgpL0SKGbb
         pmSpF2FPhQJpTHxenngQhx+Na/TscxpUrNzKMP16Slf5i5X8/R1/wKLztsnsOKjkrbvw
         ZrAYh854RKIlvHg25QO3OxiZOnzz2tq1ecEquPQpO3q6y7mrsBiM9qKVokot1INHFzUN
         Zt8A==
X-Gm-Message-State: AOJu0YwwF2kakQ1QaqNImUd/PFoOQOmkfo+FdOxMGYOwhlXreY2Kpeio
	x1bSNdZOHOIfzoVUC08WsTpnkC8V/1tHROwvWq9jOJCqbFht/5IroB8=
X-Gm-Gg: ASbGncuq3zb6CzfDA3QHhRft8AWRzSI8Y/rYcu4JC7xXRliDlOsY19KgGiIBxMNr9s0
	Hz/VOthXRswpT3C9PUWV3HKIb+2c21ehOvN4bFXSvGKjnzIh3geeS6Q53s6KlHHPYSkrmE+JTxW
	z4NwmowcRrg/jmTRYs9QmtukSC+IdkYWrPWJy8yQ5OPmBCIgwc41DV+MvQWNUZWVBS+ukQkLFOT
	NGnDDjML9JlzwpYANXhNlsDMzOs+xqhb2atlzK4tuvv7bY7lw5jTytnqDcMCazhgMIPpqcPq7mL
	VDHgTWmverI0Qb10FcFVy3V9GTaaiRmeTotE6qj2lGeI8wwD8us8mbSpIK1Z7s1SC9bcL+8riiU
	Ck8KliG2bqxgJid4V4div5hnQGb6kFgLA6g6BiKfGdT5E
X-Google-Smtp-Source: AGHT+IHiZHXZ3o9Sy0wMu/NV5ivRDKsQ0eXF4l4GSCt7RZOpjddgQKvcEcYp1RF9kO0kjPiHk6mgYA==
X-Received: by 2002:a17:902:cece:b0:234:d431:ec6e with SMTP id d9443c01a7336-23f9813a90emr73288825ad.3.1753310731403;
        Wed, 23 Jul 2025 15:45:31 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:157f:651:b817:d1e:dd27:e736])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f83asm990235ad.41.2025.07.23.15.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:45:30 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: armada-370-db: Fix stereo audio input routing on Armada 370
Date: Thu, 24 Jul 2025 00:45:04 +0200
Message-Id: <20250723224504.70862-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_154532_540457_F4182ABB 
X-CRM114-Status: GOOD (  13.26  )
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

The simple-audio-card configuration for the Armada 370 development
board incorrectly routed the left channel signal ("AIN1L") to both
sides of the stereo "In Jack".

This commit corrects the typo for the right channel, changing the
second "AIN1L" entry to "AIN1R" to enable proper stereo input
recording.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-370-db.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-370-db.dts b/arch/arm/boot/dts/marvell/armada-370-db.dts
index a7dc4c04d..a9a05d826 100644
--- a/arch/arm/boot/dts/marvell/armada-370-db.dts
+++ b/arch/arm/boot/dts/marvell/armada-370-db.dts
@@ -119,7 +119,7 @@ sound {
 			"Out Jack", "HPL",
 			"Out Jack", "HPR",
 			"AIN1L", "In Jack",
-			"AIN1L", "In Jack";
+			"AIN1R", "In Jack";
 		status = "okay";
 
 		simple-audio-card,dai-link@0 {
-- 
2.39.5


