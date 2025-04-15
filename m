Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5543C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmhW1Fm3+iHJPGf1IIT8HBxj98nomqHbWz2xIa4Xm40=; b=cifCl57eMz1CkcQk/k9KoD8ZQ3
	l89ckK6l8EvLeTvJ34HBelO7vB4FUX4rAetFSWTkoRtcgOgRwjOYis7lfLeLMqulm9x+oqYGUYdTh
	h+3jA5Qj/MvT/cuSUN53CS3mjOW3LVrJNjlslKeQDTgUy47dOBGtSZrdZe5x06JNhEctu5W5EInUV
	f1H4KAyxvu3wDUjjn5Gsb7jH52G2c8oeSEG5Iy7QZisXBzPUWKecuZ6cgkd00P06qU0faHKoJkyR7
	nbGulueYjpEAblIEo6JpY4LGhesYU+lXeeIgsKcKEM1Ev4uFWCCISNhiwn7cT4ZrsJM69y8LMTNA1
	gAec//yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aMZ-00000004kCx-3JQF;
	Tue, 15 Apr 2025 07:05:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aBh-00000004iL2-39Sc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:54:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A07305C5560;
	Tue, 15 Apr 2025 06:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18E56C4CEF1;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744700068;
	bh=gJf5CbBqH0C0nOOWFRC8Iyrhov631LfP4YHpR5pnMYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lNqyVoFL3vczZ4D0itLuTut4XuCVa5NLiNv4JHRQRa5uqn3x3j4Q0TaQ16KW4dXfV
	 O9T7G9GR523uY2kEDAgEAFiwT6A3GeEY6nUH1OWxI6SJMfJU9Bie/OtgQP7wz6lKHv
	 hBGdMkPNP9RI5aHMu9nMt9G0+AKupd9SI1M+OijpubKUOIinEaLs/RFlpFa1ihqe1w
	 kqPsiLn6U8dfbFvmp5NJ8+WNiMHesrZ00wGKnkthdS+WeMWZx7DZ8nwqwkjBKD31NA
	 3KzVldqkVyQH6OeBJT8uiLzLH8MeULof5T/rpUoIyxzW8SZEEMd4PD0cietWvlh3Qc
	 djRvn4zA/XC5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF91C369B8;
	Tue, 15 Apr 2025 06:54:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 15 Apr 2025 08:54:26 +0200
Subject: [PATCH v5 3/8] MAINTAINERS: add maintainer for the Ka-Ro tx8p-ml81
 COM module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-initial_display-v5-3-f309f8d71499@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
In-Reply-To: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744700066; l=931;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=45G3DurvF3CmLAxUTF3brxzwuPgV1THWsW5gIgc1doQ=;
 b=nGJd77N9KMAhYG/bxN87/liFszpFCA+IAx/lg6GciwYCsSRdSBfUL0jsOF9uAOF+NttgxcF/8
 PDbRCxyupOtCg3H08tIlLmBBqMp6zl5+eQLgGD+zbwjTraFC/uKOeiv
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_235429_929159_1B96BE0E 
X-CRM114-Status: UNSURE (   9.74  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
module bindings.

This support is not officially done by Ka-Ro electronics, if they at
some point will supporting mainline, this should be changed to them.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12779,6 +12779,12 @@ S:	Maintained
 F:	Documentation/hwmon/k8temp.rst
 F:	drivers/hwmon/k8temp.c
 
+KA-RO TX8P COM MODULE
+M:	Maud Spierings <maudspierings@gocontroll.com>
+L:	imx@lists.linux.dev
+S:	Maintained
+F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
+
 KASAN
 M:	Andrey Ryabinin <ryabinin.a.a@gmail.com>
 R:	Alexander Potapenko <glider@google.com>

-- 
2.49.0



