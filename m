Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BC4CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=; b=14oh0dSV8LHS4HYeTbymREX6Q5
	PiM8WF/7uCwUtUrGE9u/eh9ml4FQ/CjRRe7C4+hC1FK/ZcbG2ZCdNTWq32nhEaVQCWVidQHDCFW/d
	jmvwj5z65FtmwAnbNQdTGN7txjbdmIFusfbD9sCWTff7zUYobL3flY7Qb+iWC8Wiqz94Fux8GEW5p
	pXAccN+W6kqwrizVkX9ppUBbz8iDUF2KT42hWgt1Sgal9EuAwMSwPcHhibZqRb64iALFp2m4Cy3Lm
	pnm0eh8TUBtDzrKYEM6SUnHciSndNjD8RZPYpclMm6nSCD3vB+XX2G+Pl4I0QrmmlC9s/Q86CJccI
	/TTGS6sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaR-0000000AoL0-3Bt3;
	Fri, 02 Oct 2026 07:21:43 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaM-0000000AoH4-1zjb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:40 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488811c9ebaso3870074f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925696; x=1791530496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=;
        b=tN8Ah4KPpoIRLXOZHy2ReWzDTQrdR8eAl9qbwyrrpejd+soIEAUcKOSLs5k40CrM0C
         WILZYvM0SZQi8ZRaBlwrPhhTp9h1SHuEEbwnY8nrclO+poVXXQtgk2pUo3EmIIDKegtn
         Z1pyOvpIjxThAasDQ2FRT+UH2Rre7TJa+umaw2N3TM+fN3wFOyqTxabAcaCEAKLMPTLX
         f57e7dOGXBuK/lBuJ2oNViaLLm/SYNe55Uci+IAAwzovsXLaJhS+LHCvq9IxZPnEE3Mk
         2uS4RZUXySBeB/l2w77BHvyK5ADdP8TjxG7RD+Lh8X9HxbrYTLhj7suRWc128Akk8jyD
         IabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925696; x=1791530496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=;
        b=kUmBwj0a+OUJEziV+4aR5lcSffF/eEcwHtnfzJNYS+mR2hAW7m8GZWaDWQ6nin/36d
         22fsTkPNvGQAcEo0tvlHVHx/ohuK95Qw6v4FVTCeFsXFe1/lXPVJlSOVotf9GzU8TFo5
         rfzaS8TzZf7oyJsH8QPpA4blFya6WlkwUYtpptzuHHNeXqE/1mO3iersAitUbPp3qQMM
         KGTrsvlibNX/eIHHBo+6u9m1/xb97nmTF2P9zArRWtJ8fNLkCjRNudLtTL/T2ASxqTql
         pQ2xoCfe36fQOg1Z3rSm5jfGBjZCuXYfho6X9UDzn2bmdSqMjoVjgSC9Kn0M68xuDSOp
         f5gQ==
X-Forwarded-Encrypted: i=1; AKwUvBwixicwfv3lwnc9WLq6L3Y4evBURPHwSngMyWHqxCt9DReQ+dgdx2TCvzrp4wFclIFF374+eSRJ7axgguIF6OBt@lists.infradead.org
X-Gm-Message-State: AFq9FYIJdu80BxuAsG/nN4RAuOiZMywh7v7bwLMiVYMqH99GTfD8ef9Z
	yxB+VJFYw7mPhCPDsJpQSqD2RlTyxk+/ZLJbtmh007QDs7di/n0XbTktNhZSCw==
X-Gm-Gg: AYBFou3FEGobAqA+qdorfVxAtm89Ta3SYh++09tisqHZMgk5D9Q/TpROLgoRGxoTKA+
	g8RObKK3j/n7xyp1jgcdXlbxTumwWYmhzNVLp5mFC7UgqE1j6nuVBDa6i8wvvL9yI3THFbjRjDr
	Nux/YuT3Ft1AvFdFwmPmID9iOlmQSIiCwEjGjds9wqZ+Gl4UMjPEMGTBpE9QcN7DN99O/Y1mrWb
	mQTAqCcJTWHkm7jnrGG/SiO7C78nzHzq7co50FGeO2drmRJhn+AZGALMWwPNY9eWGq8SuNpJnhw
	B5Uh8nRA5VR+lQosYMacUs9zuTLPX4gBIds1vRq+mVKD0nu8vLF/OXrWJhYK3o4jxxB+S4AYTYy
	aqhwciLq3N2Ljb5M04uBfdhMLfrxMCkWueuWsZ/y8Q432iTOGwHY0Jn/kHaTJeWZZqm0TmIKh4n
	pmN8HLiLDRcL9nJh0vBzHluk1U3wlFgcTxscEa15qQvttBbf24SL8/VkNHLiN2ERJd+Q==
X-Received: by 2002:a5d:6f04:0:b0:48b:11ba:1281 with SMTP id ffacd0b85a97d-48b127517b4mr2978023f8f.53.1790925696282;
        Fri, 02 Oct 2026 00:21:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:35 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] clocksource/drivers/timer-mediatek: Fix random crash at boot
Date: Fri,  2 Oct 2026 09:19:26 +0200
Message-ID: <20261002072115.169250-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002138_541321_3F4AA615 
X-CRM114-Status: GOOD (  16.45  )
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

MediaTek bootloaders generally enable APXGPT timers at boot. This means
that a timer IRQ can sometimes happen between the IRQ line request and the
configuration of the clock event handler. This leads to a hard crash with
an instruction abort, branch to pc 0x0 in mtk_gpt_interrupt handler as
clkevt is null.

To avoid this issue request the IRQ with IRQF_NO_AUTOEN and enable it
explicitly after the clock event is configured.

Issue was reported and fix tested on the Lenovo Tab E7 (TB-7104F, mt8167).

Fixes: a0858f937960 ("clocksource/drivers/timer-mediatek: Convert the driver to timer-of")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Credits for issue discovery and suggested fix go to          
matemiller992 on postmarketOS forums. I am submitting it upstream with     
permission. Not adding Reported-by or Suggested-by tags because it was     
requested not to share real name.    

 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..e20075b09fab 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -277,7 +277,7 @@ static struct timer_of to = {
 	},
 
 	.of_irq = {
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.flags = IRQF_TIMER | IRQF_IRQPOLL | IRQF_NO_AUTOEN,
 	},
 };
 
@@ -298,6 +298,7 @@ static int __init mtk_syst_init(struct device_node *node)
 
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
+	enable_irq(timer_of_irq(&to));
 
 	return 0;
 }
@@ -334,6 +335,7 @@ static int __init mtk_gpt_init(struct device_node *node)
 					TIMER_SYNC_TICKS, 0xffffffff);
 
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
+	enable_irq(timer_of_irq(&to));
 
 	return 0;
 }
-- 
2.43.0


