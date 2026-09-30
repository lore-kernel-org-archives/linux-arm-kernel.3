Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF312CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 00:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lXomcwwRNcnitu9BEV+QJfPTZRxcaqM4ZoIEjBI6Rg=; b=fACbiTaagOLvPcvCmwcjVz/j3x
	4A8e69lTnTmL0TlIxrAQT6qnWDTULts+5vzUuuSGDbfxRDPa5/UAFwYgQkTn2/GO4rDffxFqHfAK2
	+SrF7WNmHcKx39azmPHsW49oR+5LpDKw588XGFaEWCk0813OTNb9UTA5kb8H6ZChdEAH6NEwLtYCi
	SGWwduVU+W1AKa7cg2b5Ufv1xBJZOZ0+1A8Vdx6EID5ANsLADencu6ATsoOrQm/cVGf7tQdv8JxHF
	nHmNFr/DaIM+MfBSDz4r+lyOrtC6HFR6Ellq6fFV0+LyL61Cj5MQ/HsZRP3t76HAWqMrXLlOa/siE
	PwcN4J8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBi49-00000004oOK-03f9;
	Wed, 30 Sep 2026 00:20:57 +0000
Received: from winds.org ([68.75.195.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBi47-00000004oNo-04QW;
	Wed, 30 Sep 2026 00:20:56 +0000
Received: by winds.org (Postfix, from userid 100)
	id 26A288F95F83; Tue, 29 Sep 2026 20:20:50 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by winds.org (Postfix) with ESMTP id 2557E13363343;
	Tue, 29 Sep 2026 20:20:50 -0400 (EDT)
Date: Tue, 29 Sep 2026 20:20:50 -0400 (EDT)
From: Byron Stanoszek <gandalf@winds.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
cc: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
    Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
    Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
    Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Luca Ceresoli <luca.ceresoli@bootlin.com>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, 
    Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
    Emil Renner Berthing <kernel@esmil.dk>, 
    Hal Feng <hal.feng@starfivetech.com>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Dominique Belhachemi <db@domibel.de>, 
    Brian Masney <bmasney+clk@redhat.com>, 
    Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
    linux-riscv@lists.infradead.org, 
    Marek Szyprowski <m.szyprowski@samsung.com>, 
    Maud Spierings <maud_spierings@murena.io>, 
    Graham Markall <hello@big-grey.co.uk>, 
    Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
    Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
    Joshua Peisach <jpeisach@ubuntu.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/21] drm: starfive: jh7110: Enable display
 subsystem
In-Reply-To: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
Message-ID: <e946786b-e063-6ddc-6b07-2fb67ff7a459@polinggroup.com>
References: <CGME20260929103200eucas1p17af134cc3b93c242227964f574f13aa5@eucas1p1.samsung.com> <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_172055_152920_21BA96E1 
X-CRM114-Status: GOOD (  15.24  )
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

On Tue, 29 Sep 2026, Michal Wilczynski wrote:

> This series enables the display subsystem on the StarFive JH7110.
>
> [...]
> - New patch 1 fixes v_HSYNC_POLARITY and v_VSYNC_POLARITY, which have
>  been swapped in inno-hdmi since the driver was merged. The hardware
>  puts HSYNC in bit 2 and VSYNC in bit 3, and the driver had them the
>  other way round. Almost all CEA modes drive both syncs with the same
>  polarity, so the two writes are indistinguishable and the bug only
>  shows on a mode whose polarities differ - a band of black rows at the
>  top of the screen, vsync_end - vsync_start + 1 rows tall. Reported
>  independently by Dominique Belhachemi, Maud Spierings and Byron
>  Stanoszek, and confirmed against the RK3128 TRM by Icenowy Zheng, so
>  this is a Rockchip fix too.
> - Added a 201 MHz entry to the JH7110 pre-PLL table for a 2560x1440
>  mode Byron Stanoszek runs on a Dell U2711. It is derived the same way
>  as the neighbouring entries (fbdiv 134, /16, VCO 3.216 GHz) but I have
>  no sink that asks for it, so it is untested on my hardware.

Hi Michal,

I confirm that the hsync/vsync polarity and 201 MHz mode are both working on my
setup in v5. Tested against 7.3-rc5 with af384d6e0573 and Bo Gan's cache
coherency fixes. Thanks again for your work on this series!

Tested-by: Byron Stanoszek <gandalf@winds.org>

Best regards,
  -Byron


