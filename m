Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38BBC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scg75GovixsEvdVxNi0J1MYQaQj+4lzopjkTkcLZ+rU=; b=GqRKu646Hh3lDMtCZmULsWa7D3
	1f2xLbkKt9VaDnKVxKGCwOWG2qzotzNsIgalHrbIlGkOhFp24C92zjHgH7Hqv1YI8D59KGSdYOjZ3
	KGC1REoLYD87lIOpjgHVs67ktCnkYZkO3F9Ka0t4BNYeFMFzEfh6R4V/wza3AIou2gi9k9OiyoMKu
	9Tq/lB1uU0vMwIF/QIalxe+vRRfSYn5bfRw3P0JYqGrjXfrLafH46N5/zA2Rcv+0HolBd3EXW2gOW
	Bpl+SbVJY7NNTuRlsvgL6wM4YpF4EFKGaiupzGkutCf9VBksQeBZgEsfSd1eNhBC2lzDMe0AhYyLB
	nQ/D20SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZzym-0000000DBQh-15cY;
	Thu, 10 Jul 2025 22:43:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZA-0000000Ct7f-2Tmh;
	Thu, 10 Jul 2025 20:08:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1396309b3a.2;
        Thu, 10 Jul 2025 13:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178103; x=1752782903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scg75GovixsEvdVxNi0J1MYQaQj+4lzopjkTkcLZ+rU=;
        b=gMFmdBaPaauqoEcQSzwPGqbJRO11nPxN03HyEedMznd7YBkUxk4CxSYwwVlyAz4fUi
         RjKAJId6rRJ4eApvru0lIhtRXq+FsgY08F7ZThIymQ8fvKZ9okj3SA3KIizultcHE9M+
         bd2RLuiJmtiJZ5E1EKfX8WuIaYKcy6AiyUXbzh+Z2PCyZiKacu9gHBGFT6EzjYsCwTP8
         Evrx6uEEoUwk88+hDYs/SLbwXyuwrGRro0MRG3sH5cx2SSMNPYPTOUhWsUWWaiTBlheI
         o31S9iTbEJ8/c+9R2jQAF+LKDxIPsJwRdArYq88gfYW4OfjUxAqOJ++cl/IPNMCUZCr8
         3TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178103; x=1752782903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scg75GovixsEvdVxNi0J1MYQaQj+4lzopjkTkcLZ+rU=;
        b=CC1HXL0eaQheFzhBhJsOCEVGs3kEOPJOB3SVcfMC9KMTOJMvxGJITQdmEdCurz9qOk
         466ho2FSPO5oBh30sGFZPjhRbVnilwxbVyXTs283j95NHKewpOY1VAUro89hqhsd1IUR
         uJqnz69ICF+HXSDVDH/rki+g5Jt0vYMGJFy/kJ76KXoe1kaQ9B3mcRLlxfdZX19m//tT
         5u9n8MvYQcOrpVPhfxesTVFzW1WY82lcVQ8V+4FaObpfc82/qxl2FntKc12+U0iXmp6J
         EDKI9PVWHJRulvkg3eUTENpFnxD5jLKYQrqexxCshj+JmfsxBxM7+j54BdpmO5eptr+v
         vS2A==
X-Forwarded-Encrypted: i=1; AJvYcCWujbPa0Ge9qnbimivOvT5+FQH1zEJNULD9elhdxT/f7oFlL3iUvwtffxe6FvZ80/ReyWPEDMrN8thN4Xx0AKY=@lists.infradead.org, AJvYcCXczRxggZ8c+vUyHjBzBovgFbD2pIdr+Fyvv0V43m359zuh5BPA8QVsHrTfcOZ8508CCQm4INvLmNUrdAi9jt0C@lists.infradead.org
X-Gm-Message-State: AOJu0Yys45lrqka+ItHpNPVZiSrQ1aSyAYBkSthxNVCIsKt2HvrznfSC
	795nUyW1w4s14e/vnEBPip/o+VMp0xulCMwVjqquGa1XjLWR+uOi9v0U
X-Gm-Gg: ASbGnctaHNe1szjpV9+1Uhr47KugwEidxzYgQpB54D6/Ylqgsrsylo59+jGwLebu8t3
	8lZnsXqu02It8zi3jRTikQYK3pBaou6a6awVElBAaZgReytJa6sXuIMb/rQARndIsTqcI5r4FvW
	9u5g4cu8TU605xoTb2oO2U/pC5dvxGRWb74SqwgYeZDOOK/eQer1w57R2sUFBgyca/iK3J6dMdw
	YRkAKNkN2w6Fc4P5BFI+6cVFa8JtmiT2HTd/dPSHu1ZTTHh8sWfA0e85rIZcCaxl2iaaqMtu5UX
	mXSHFOnkE6RPbFijefn03Z2OwQqi2T3xVlk/ANCaWPs=
X-Google-Smtp-Source: AGHT+IGk+CvEH9fmt2OXqR3GTJo5v/lWWaa+7STAsMYtu2xeDU7xQb1KOYuq7AJg1ahGYkxKyQGvwA==
X-Received: by 2002:a05:6a00:807:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-74ee323a063mr442065b3a.19.1752178103355;
        Thu, 10 Jul 2025 13:08:23 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Date: Thu, 10 Jul 2025 13:08:14 -0700
Message-ID: <20250710200820.262295-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_130824_620056_4AE500B3 
X-CRM114-Status: GOOD (  11.84  )
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

While this driver is for a specific arch, there is nothing preventing it
from being compiled on other platforms.

Allows the various bots to test compilation and complain if a patch is
bad.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index d1fd66d44a7e..3a32ceead54f 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
+	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
-- 
2.50.0


