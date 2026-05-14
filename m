Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E1ACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGZRaiY9JxfnRh/cW6JZKZ1Qeq5ua7wHmwJMRARXUaY=; b=p68gF8wZUVGwmwTlYWlxEqCS9O
	BwND/3Qfu8LukhhRr4EW5iQRrv+iv27ZhoxvzgcRpwE8N2uSdRiV/kvvWS0p05uOSrZ2wuTFCOUMN
	liR27uYPPjQSvDxQExAYvLookqUpwCaEfO7iXqoFzqosityuecWvZc+zlWfjq4f94RrKr7wAPnGP0
	JhfhqlS/Em+hnVIEw2kvV/5myDSflGlht8geKvWj23hkyJnMk8P9wXPz701QyFY++HZVGuTf8ksrP
	OJxaDHg34Y8AQ0jJDT4nM3KLKuslpFz9RokqqtJDkY1eI42c1B1+22APSOOJ3etIclT3G/gVqQKoa
	QImWFfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNViT-00000005XkB-25TS;
	Thu, 14 May 2026 13:03:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNViS-00000005XjT-3MRr;
	Thu, 14 May 2026 13:03:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D332560008;
	Thu, 14 May 2026 13:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03376C2BCB3;
	Thu, 14 May 2026 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778763783;
	bh=esmD5ZlFatNDDQ2YdV8QKifdxwq20DRFXsWE4S5ByrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSOtra3amH98ML2nsdTRfc9GkKHQf/NG1SRcC5xBBbhdVLToWw7QeW2O40zNleM/I
	 I99kb6XciHwEKgmvBPyUhUXcpqDQQGmGGYaJVBiNDJgVXRAMZymfq+mhXL7QPK/FO8
	 krbnGesieD3ZimI8Fe1E43peO4qBcos9j+CUaTqhEsBaciFx9qwit7nale3P9qpFNr
	 iTOsmWRYmA/eq0YJQCEJZr9gvGVatXzJqfS3ezKzxHjkZQ3eLB8Hi01fKXFR9FoV6L
	 34n53iKYgpwIP0J7zZPeHV8LhYpe8SpwINlGDEXxEW/Psx6OS0hrS47wA4eGzdcV5y
	 OLBtsScdLhpXQ==
Date: Thu, 14 May 2026 15:03:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 16/16] MAINTAINERS: add MediaTek mt6323 PMIC thermal
 driver maintainer
Message-ID: <20260514-sweet-electric-buffalo-841c18@quoll>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
 <20260512-mt6323-v2-16-3efcba579e88@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512-mt6323-v2-16-3efcba579e88@protonmail.com>
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

On Tue, May 12, 2026 at 08:18:30AM +0300, Roman Vivchar wrote:
> Add myself as MediaTek mt6323 thermal driver maintainer.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bf2e066f377d..3001a713b083 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16355,6 +16355,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
>  F:	drivers/leds/leds-mt6323.c
>  
> +MEDIATEK PMIC THERMAL DRIVER
> +M:	Roman Vivchar <rva333@protonmail.com>
> +S:	Odd Fixes

Odd Fixes means driver is half-abandonded, so please explain in the
commit msg why you add yourself as maintainer but not really committed.
Such entry makes more sense for subsystems, but if individual driver has
odd-fixes stage, shouldn't we just remove this maintainer entry? If so,
why adding it in the first place?

> +F:	drivers/thermal/mediatek/mtk_pmic_thermal.c

Best regards,
Krzysztof


