Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C77EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=545wPjcAu5b4eUfWWgzfH5f+xPToJque93C0kExRh8c=; b=T0f4/9C04CD0XS5ZBDWW0QCRPU
	Q6bK++W1C6xXvWjY3kZqqyuJk/j3leRZia5Fb4Qa5wGMKhwaDIUp0tj77ceblhrOsupmEODkSOpGX
	UaHGwRzySu0svBBRQUIl17/DB22WsrHQQjjCrKNm5QsY67/pmAz5w777sw44Z2S1mRKDkA/9RVvr7
	/Ootz9DeFpXGPQV9Hs+yrwZcFEbIanGv4IpQ6c48jI+W9Z651vtcxkRVKJUtx8Mq1QXM6tVvJAhFb
	3HUltjId1jTYSZBCIeLmMDeJiHJn2NYCynEum5aJonC0NcSJeX2HBDPwIX1JqW6hU1ZFiMngPmnxV
	4sgRgnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZrQ-00000002O8I-0Ooy;
	Thu, 12 Feb 2026 16:48:12 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZrM-00000002O3c-43Eg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=545wPjcAu5b4eUfWWgzfH5f+xPToJque93C0kExRh8c=; b=nsimCLxxy2uNPv3OPg/1vANP2M
	PaJ/pIr9duqcN8UIiRhhMa/QdD4Tkva+uTFZRxeX2GVWACowhYeQrpN2PsuLn9lm4tEfO2eFb2LXE
	sRrsl+JNgYuKHEr3eakfCQY0YoTHeIPByhltH5nu/C3JNLZhQXQGe9upoFwy2xzP5/kfSVdtLAb0j
	6SVgGhzg3a53cKEinPRllo8rHFiiWdos1AOMu8JUMV8Dj+R1bjwZ6yL/ICVoAWayUy1MgQp9wuVf4
	l7dXxyzzQrnWk5pbGCQHFdoV+Vn67IjpOAV7GoPrVmqWTXHrFijY70+XQrcRCossrzUk8ct7fEyl9
	Gozkp9NA==;
Date: Thu, 12 Feb 2026 17:47:18 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "Kory Maincent (TI)" <kory.maincent@bootlin.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260212174718.7daccb70@kemnade.info>
In-Reply-To: <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
	<20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
	<B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_084809_024918_88C3A9F6 
X-CRM114-Status: GOOD (  15.11  )
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

On Thu, 12 Feb 2026 16:49:43 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> > Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) <kory.maincent@bootlin.com>:
> > 
> > Allow overlays to be applied to any DTB. This adds around ~40% to the
> > total size of the DTB files on average.  
> 
> Is this unconditionally enabled or can it be turned off by some CONFIG? We have
> our own defconfig so I would not worry if if is enabled in omap2plus_defconfig
> and disabled in ours.
> 
> We have several devices where the boot loader can't handle overlays (never touch
> a working boot-loader :) So this seems to only contribute to build and load time
> without benefit.
> 
As long as you do not add overlays, the bootloader does not care. I would
like to simply carry around the 1-bit mmc overlay for one broken board.
That would help me. So I think there is a benefit but nobody forces
you to use it.

Regards,
Andreas

