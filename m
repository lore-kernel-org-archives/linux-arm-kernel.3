Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8C9CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvzsU878s43V9yqsfqVgWPJGSTifXNGQZFIt8LMxa+Q=; b=4H4sy/aegQaeO2WpIspKB65GVP
	imQe9POJDgYU/RkTx5XgbMrx1WP8rWn67mGe1ZO/lMTx7uzRo+G7lq0OE0m2PtECaljKkNSdu9r/R
	LqvmESNkivcCwMIha2TgSjrvxswRk77jfeFf/S07Lwb7lFxEBa10n/Rh3IKJZdIFUEqwx/A9++K9y
	OQeQYGmKsR9p4g7jLABGdP3oojmLo/WCF3s2WmtZ5HIRXMxwZaXgKgbyyRq4hQ61o20sHVCvJfNoo
	NKmb1IAo8m5+uJcvLObv9De1QsannJqkpXrtkSFfWPRBhm9u9K/1kGFjMR+HmiSEuBHYbNvdz6MXV
	iFixdmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXaT-000000009R0-2Twi;
	Wed, 06 May 2026 08:26:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXaS-000000009Qk-1sa2;
	Wed, 06 May 2026 08:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EA7D60132;
	Wed,  6 May 2026 08:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B52C2BCB8;
	Wed,  6 May 2026 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778055990;
	bh=DwhWJ+pjboLiRZQ//nb4qIvtmoRjATdD0FdPcN1x66U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyEHbRzA0y5lw0cj+yZr4bB+/4LvtgCP5SZAWG6zAEiNWvUdwLqXrq/BTzFn8uidp
	 zCye+WOEYVheWeB4oZEWhI1hhXht+PaEFaau5JS9P8QZGSnOVnTGBZfDpkPxGOz5CR
	 ZeecwFgVF5XoK+N1H8szpwHjF9fTzPHmTTiNOag/ywoMra5CekYiXgh8dPO+Yyco8q
	 sta4sZx/DJ6bnGbyHxTLcGV95YQbaWusIs7JM3CVHuvk9uw5OmfEDqO57MrClW5qDY
	 B+yCW/OkgDnoEd11cuzqGfdUwNnmMQViqkPERV8RKWigR0c8lKA4qYVg58OaO9bSIS
	 YjqVfCLxnte1g==
Date: Wed, 6 May 2026 10:26:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 13/13] MAINTAINERS: add mt6323 drivers maintainer
Message-ID: <20260506-honest-cyan-cow-d6c5b0@quoll>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com>
 <20260504-mt6323-v1-13-799b58b355ff@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-mt6323-v1-13-799b58b355ff@protonmail.com>
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

On Mon, May 04, 2026 at 09:25:05PM +0300, Roman Vivchar wrote:
> Add myself as MediaTek mt6323 AUXADC, EFUSE and thermal driver maintainer.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f..53493a24d00a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16337,6 +16337,18 @@ S:	Orphan
>  F:	Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
>  F:	drivers/mtd/nand/raw/mtk_*
>  
> +MEDIATEK PMIC AUXADC DRIVER
> +M:	Roman Vivchar <rva333@protonmail.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/adc/mediatek,mt6323-auxadc.yaml
> +F:	drivers/iio/adc/mt6323-auxadc.c

This should be squashed with individual patches. Otherwise how do you
imagine this being applied? By which maintainer?

You also should not merge independent patchsets into one patchset. I see
no dependencies here at all, although if you fix your MFD binding then
there would be a dependency...

Best regards,
Krzysztof


