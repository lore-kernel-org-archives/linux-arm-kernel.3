Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A95C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xiZQB8gwrJDrCywMudYQRs1hEye2ekt3JZl88zWIo0I=; b=a3NveOsST9b9urodAVijHbo1Du
	77hyRL/LM5IhDYasG/0r1fnMr9mR+0TyU571h99D1KP/Ter2pRZXYFPgQHNcc7R102sqNMwXBpeKA
	WwNKE6qg1fB/zseKtvjRyzyXzCW1O0nqys0H0aEel5t/wFk8AwRoqRQ3NVR8E0Pp5TBU2FuJHbUFp
	64rmB/X6nNDbRkqmpLT7HrpUcmiPfY+Dn/X5bLTBa/Ca/KX/fSJg6PHLtKq6AYR0xvNPpeN3taSGn
	V778Irj/GsO20JAF0Pd4ugSyEN7JD/IFMnY0L0j6iKfif+bg4+TVowVTIWfaSTuWfY45y+y/d+YBv
	i+4JyaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjevO-0000000CVt7-1dkG;
	Tue, 14 Jul 2026 15:19:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjevM-0000000CVsB-3UoQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 15:19:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB5BB60254;
	Tue, 14 Jul 2026 15:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CCD1F000E9;
	Tue, 14 Jul 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784042395;
	bh=xiZQB8gwrJDrCywMudYQRs1hEye2ekt3JZl88zWIo0I=;
	h=From:To:Cc:Subject:Date;
	b=F7H5FF3qKIhZKnBbYLMums6Nb0FKwdyYH+TE16TOxnfLdb59P0AZvh0gRsr2MZlem
	 DrQH2IPtnJypWBoRO/Nm0fgpz2JDLJXDO9gj+hDzjAdqz5oARvZu2j2dEuvDRxyjZJ
	 fQqWKkM7nnnX7bR1S6S2I2QW/aTRF3ePVQUnlFx936slULa3CFlyAcrtNLATT60qOM
	 cQ4cQ/EQnr2q7zPCt5GmMZrEg+8g4KzirhuxN/vdUlLY73seWO6yqo59L0pWGa+CFk
	 klwuEHwuB6fsDgBuuf9WwPS4RJKxgy7G+Hql/6DlTPXShwsIdKansookKnflMAoAWG
	 ZTjiMWNQqqHng==
Received: by wens.tw (Postfix, from userid 1000)
	id B8D905FC39; Tue, 14 Jul 2026 23:19:52 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: sun4i-codec: Sort sound related #include statements
Date: Tue, 14 Jul 2026 23:19:49 +0800
Message-ID: <20260714151950.316035-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Some of the sound related #include statements are not ordered in
alphabetic order.

Sort them. This results in no functional change.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 sound/soc/sunxi/sun4i-codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 93f511fb6190..2c5cf12f1a6c 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -22,13 +22,13 @@
 #include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
-#include <sound/initval.h>
-#include <sound/dmaengine_pcm.h>
 
 /* Codec DAC digital controls and FIFO registers */
 #define SUN4I_CODEC_DAC_DPC			(0x00)
-- 
2.47.3


