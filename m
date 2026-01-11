Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678D8D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 09:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ID3O/iSRwCfPDjcjef+NGI7L+mnPMxPUfAKDOJpkvc=; b=Xu9MwX1uVYpSZBnm3cRaoutsnW
	TyTbIim6Xf5QGcujDoxMBydHZKrKvbD5cmtr7piyhHDCUKsA0PV2C3KzD06dQhC+gCli/hr8TjCA4
	IZ5xVWqnL++Oyr5IY2K2TsZeumG35mXndoBMNEiWyBJiuSop9mykOLSPYUCP9PzUZlgYiqsG7lcN0
	WIqFbMUVUutDS0q56s8g00w7SIh9MoqQCoFGhDpj0jj0HkzBfsgRCexQZ0iXp1Y3pkXfvXrX1LKfK
	z/raDUpJoKnGA19CsJEbhAx+d8xJJU7uPS1BfJaHgRM3OUifKy/UY9A71ZwWjdXV+mfR2zf53a6px
	RFI2QDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veryM-0000000462C-27xb;
	Sun, 11 Jan 2026 09:42:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veryK-0000000461y-2yLG;
	Sun, 11 Jan 2026 09:42:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19EBA60122;
	Sun, 11 Jan 2026 09:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254A5C4CEF7;
	Sun, 11 Jan 2026 09:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768124575;
	bh=+KYg75XD2jPTkQn0jSbd/Ju0N5oE/9yFt24CvhVjjF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkxpWjr5krlraBYJpOyEoLkD/j9RtNsltvlMk4e6kPxnIjwDwHP+O6qSAm+HDo3Op
	 5fD//dGEsW+NVcpmzQuUs4D6+hbOqBIurRVMfpt495YKt92XA/414ATIPoREdDzv+7
	 y/jkmTrQ94XUmiLhP38yZ3qtZd4bdnj9JgnDFf+RDZTzgzXmoxXj8KsaGs4KlmcwcU
	 MrvZXOyKWeyGE+XPEDo3q6+aQqgA4ONeL5FPprvGH60zZ1x+JKNj7nNCr16oINtihy
	 5CBEshZKw3yG1xHMA8eft1M/n8wPCc6YxOwgVDEWyhHXQmIUsA3ivHIDi8WYah5K+I
	 Sx5HpR7ZLqtnA==
Date: Sun, 11 Jan 2026 10:42:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marco Schirrmeister <mschirrmeister@gmail.com>
Cc: heiko@sntech.de, ulf.hansson@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] arm64: dts: rockchip: add stability quirk to
 NanoPi R76S
Message-ID: <20260111-utopian-vehement-lori-50cbca@quoll>
References: <20260110010715.1610159-1-mschirrmeister@gmail.com>
 <20260110010715.1610159-4-mschirrmeister@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110010715.1610159-4-mschirrmeister@gmail.com>
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

On Sat, Jan 10, 2026 at 02:07:15AM +0100, Marco Schirrmeister wrote:
> Enable the 'rockchip,disable-runtime-pm' quirk for the SDMMC node on the 
> NanoPi R76S to prevent bus instability and retraining loops during 
> idle periods.

You miss some other properties or fixing driver and solution is not
adding such properties in DTS. Nothing like that belongs to DTS.

> 
> Signed-off-by: Marco Schirrmeister <mschirrmeister@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
> index 31fbefaeceab..90a798ee9e68 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
> @@ -754,6 +754,7 @@ &sdmmc {
>  	disable-wp;
>  	no-mmc;
>  	no-sdio;
> +	rockchip,disable-runtime-pm;

Best regards,
Krzysztof


