Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF06F30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geXM8QRY/cBWOmRMMwOpgOquG+P/WWrnlGqkqRUfv3w=; b=ybLj2ubmjzCNEQhJdVqSPY3Jzw
	BdNGcHLLGmIRXroRKoazaAN7SZXCZXeAF3FnvkZoZWafqJ4j4br2owq1xxsYsMnW8+5PDmaR0wqWD
	KEtw/+LEQH3yCG+whFGNYAvxSTuPtBroCwS+Axd7PpEs3ClrOzJV4d43arQ5HgpxYRmaYca2IV2tI
	jbfSccOtCStD/LIdX9vZ9eW4Bwvpfa/bhh4woyY4vv3YQexdVbp3PyXoZ2kMeGD7tdLwIRjBQ4nkf
	Re8mkUivA/EYNxOMGKMP0+V5FsN668vNcYbnPnWYUL+MEEf5QVb3aPrghat7Pd6sk26h6B0tykCh5
	wQIm98YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5iX-00000001X8g-30e0;
	Thu, 05 Mar 2026 10:14:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5iV-00000001X7b-3r3W;
	Thu, 05 Mar 2026 10:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=geXM8QRY/cBWOmRMMwOpgOquG+P/WWrnlGqkqRUfv3w=; b=CsZNuLQW7LvW4Lr2lIERegd3Gd
	Hugi5mKd2FR84bevutDbmljnKKkyWpa+Y9/8Fdz5/+XH8yjT2tJ9L998pSsVKOshIFftYTopy9tHW
	7ZF6SCZJIlLizc28DvLzCdrrTFoXPxSqeJsusR9YgIhzvIQK5TwDMZOwGOnxZyjiECC9AL1Iq8DK3
	6YmO3o9JCvxPVA/5mX7Z/AeTBXSw6ddJbAc2aGNX0Tuj+00XYWecA9Fdat3sDTfKL2QSU4+rx7X76
	hEN7LIQO8aLKdSdKB71nyPJOWT2P+p/LTyjcfbw8vuy6s0PaQXjDjwaoq0y+KTUPLTvCZA6ncSRRH
	xeDk18Gg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5iT-00000006SF9-07fl;
	Thu, 05 Mar 2026 10:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1BD5416B5;
	Thu,  5 Mar 2026 10:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52AEC116C6;
	Thu,  5 Mar 2026 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772705636;
	bh=gLlEtYagEKIFjG5F8a3A/NR9PRdUS4OHscROMOIMXZA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OGxx742ke8ndUq+KKpCoK78oYVQ+tBt9CF0nBSTEw5V6sjEK34QB1i75slSO+ilb5
	 bzv8SKdM+Aj941MheVLLmptyNHH2aZRlbMyfKcyximmU0Iqru503CIvVVpvKQewuVJ
	 I1gkrYmmRNt70fhzjJFOJIBOr43VyqJZnMKOHmI4BpNrGBTGz3h27oyGs2gULFRa48
	 cK56WnPdi+Oq6gXwLZby4u/gIzKC/Y28ebuttCuqXyLbELbpasi/D2md3AQnhSl5BY
	 P9X2qwHlg3WZH66oyHfOnWJ2bJhliZovnSdIh46cr0FMTHaQ40jjxu7XbWLeozpAnG
	 I1rOHUQJMHF/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vy5iM-0000000GOHR-0DfY;
	Thu, 05 Mar 2026 10:13:54 +0000
Date: Thu, 05 Mar 2026 10:13:53 +0000
Message-ID: <86v7fa7fdq.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
In-Reply-To: <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
	<d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: geert+renesas@glider.be, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org, atenart@kernel.org, florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, mark-pk.tsai@mediatek.com, daniel@thingy.jp, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_101401_412779_1BF844BF 
X-CRM114-Status: GOOD (  22.08  )
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

On Wed, 04 Mar 2026 17:21:58 +0000,
Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> Replace magic numbers by symbolic DT binding definitions.  This improves
> readability, and makes it easier to find where the various GIC
> interrupts types are handled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/irqchip/irq-gic-v3.c | 14 ++++++++------
>  drivers/irqchip/irq-gic.c    |  6 ++++--
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index d75163e71bf22473..6ac103cb40097acc 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -35,6 +35,8 @@
>  #include <asm/smp_plat.h>
>  #include <asm/virt.h>
>  
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>  #include "irq-gic-common.h"
>  
>  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
>  			return -EINVAL;
>  
>  		switch (fwspec->param[0]) {
> -		case 0:			/* SPI */
> +		case GIC_SPI:

I'd rather not do that. I use *numeric* values on purpose, because
that's what the DT *binding* describes, and I have no control over
what lives in that include file (it gets changed without me being even
Cc'd).

So I want to stick to the binding, and not to the interpretation of
it. If you want symbolic values to be used, describe them in the
binding, have a tool to generate the values from the binding, and use
that everywhere.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

