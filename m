Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3FCC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOs+4yBxdgeIOQ3L+qpYzP58KIbPbK84kJo8I8Osoa4=; b=DoJ1kudr9Gp8ElsR2Md8QRiOYX
	NTLYnj1ndk2IomDP9DPtyW/ftq9Xuj5mjV+YKPJDLAYHKSu+Imx+tES9OSBHBCLZvtJ/Kzhe/nDKL
	KlkXgstTHn+mX0NT/ob4QfUt+YfWK3XuPD3IZ56D4VNE9352tZtRhtG7Q1kCBQ94s133eHMVHmsVq
	iG6Re3aSk6YNO4KoFjFwB0HlbKzm8ky9MroxzKYHGiNY5eTXaevBD4Cw7shBKBTrMrz59LyVI7TLC
	rtzsZJZbnTSI6/p/0KPKIjXyt55iq0q1gvTV6LhkYSakK4eeSSXeaAjjrDDPIhnkzzcb8pzAjMwh4
	hgYJgO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYmh-00000004pBp-0Qid;
	Tue, 01 Jul 2025 11:04:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYgs-00000004oUf-0R8D;
	Tue, 01 Jul 2025 10:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 09F87A52EED;
	Tue,  1 Jul 2025 10:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB174C4CEEB;
	Tue,  1 Jul 2025 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751367496;
	bh=fevrYmYKDOiJ2smfFONJqA3GH4hDj/8aAOo/6KjTtkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yj3ni6pmbztQxjncDscxzlfllX1jePVP447M+Ruz72SpzDZoEGlt/kfbGY1gJVWM6
	 iqng2cK0+CgpY9W+FVQIqFG8W0OEY6ZP+XJ7tIebCVrbWw0Hw4w1CE/leCG246QBh6
	 jocETkmJQ+njPSrX27y+kuAMOJ7rIu5dd7awjK2gKLJNyIvr9IFloIKBC8BuqM0n9q
	 L+kYQ5W/xnsrb+6x+BUQbyTXXz7JLKRKXA+P34gavMdIXbbaBHU0N6+oHnR2XbH4FG
	 Qf5cnw3kNtClk0elPte1ElT5DijShDcwdjBDaKuhQB6XVSWi4oJ4sAAHvb+zqnOrW5
	 3m53dPNpajr9Q==
Date: Tue, 1 Jul 2025 11:58:11 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Fabien Parent <fparent@baylibre.com>, Reported-by: 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org;
Subject: Re: [PATCH] MFD: mt6397: do not use generic name for keypad
 sub-devices
Message-ID: <20250701105811.GI10134@google.com>
References: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r4k3pgd3ew3ypne7ernxuzwgniiyvzosbce4cfajbcu7equblt@yato35tjb3lw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_035818_270372_581EDC8E 
X-CRM114-Status: GOOD (  24.21  )
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

On Mon, 30 Jun 2025, Dmitry Torokhov wrote:

> Do not use "mtk-pmic-keys" when creating sub-device for the keypad to
> make sure the keypad driver will only bind to the sub-device if it has
> support for the variant/has matching compatible.
> 
> Reported-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Fixes: de58cee8c6b8 ("mfd: mt6397-core: Add MT6357 PMIC support")
> Fixes: 4a901e305011 ("mfd: mt6397-core: Add resources for PMIC keys for MT6359")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> This is not tested so if someone with hardware could try it out that
> would be great. I *think* it should work...

My suspicion is that this will not work.  Providing compatible strings
here is only for device to node matching.  I do not believe the drivers
will probe using them.

You don't need H/W to test this theory.  You can just feed in a DTB and
see if it probes.  QEMU should be good enough for this.

>  drivers/mfd/mt6397-core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5f8ed8988907..3e58d0764c7e 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -136,7 +136,7 @@ static const struct mfd_cell mt6323_devs[] = {
>  		.name = "mt6323-led",
>  		.of_compatible = "mediatek,mt6323-led"
>  	}, {
> -		.name = "mtk-pmic-keys",
> +		.name = "mt6323-keys",
>  		.num_resources = ARRAY_SIZE(mt6323_keys_resources),
>  		.resources = mt6323_keys_resources,
>  		.of_compatible = "mediatek,mt6323-keys"
> @@ -153,7 +153,7 @@ static const struct mfd_cell mt6328_devs[] = {
>  		.name = "mt6328-regulator",
>  		.of_compatible = "mediatek,mt6328-regulator"
>  	}, {
> -		.name = "mtk-pmic-keys",
> +		.name = "mt6328-keys",
>  		.num_resources = ARRAY_SIZE(mt6328_keys_resources),
>  		.resources = mt6328_keys_resources,
>  		.of_compatible = "mediatek,mt6328-keys"
> @@ -175,7 +175,7 @@ static const struct mfd_cell mt6357_devs[] = {
>  		.name = "mt6357-sound",
>  		.of_compatible = "mediatek,mt6357-sound"
>  	}, {
> -		.name = "mtk-pmic-keys",
> +		.name = "mt6357-keys",
>  		.num_resources = ARRAY_SIZE(mt6357_keys_resources),
>  		.resources = mt6357_keys_resources,
>  		.of_compatible = "mediatek,mt6357-keys"
> @@ -196,7 +196,7 @@ static const struct mfd_cell mt6331_mt6332_devs[] = {
>  		.name = "mt6332-regulator",
>  		.of_compatible = "mediatek,mt6332-regulator"
>  	}, {
> -		.name = "mtk-pmic-keys",
> +		.name = "mt6331-keys",
>  		.num_resources = ARRAY_SIZE(mt6331_keys_resources),
>  		.resources = mt6331_keys_resources,
>  		.of_compatible = "mediatek,mt6331-keys"
> @@ -240,7 +240,7 @@ static const struct mfd_cell mt6359_devs[] = {
>  	},
>  	{ .name = "mt6359-sound", },
>  	{
> -		.name = "mtk-pmic-keys",
> +		.name = "mt6359-keys",
>  		.num_resources = ARRAY_SIZE(mt6359_keys_resources),
>  		.resources = mt6359_keys_resources,
>  		.of_compatible = "mediatek,mt6359-keys"
> @@ -272,7 +272,7 @@ static const struct mfd_cell mt6397_devs[] = {
>  		.name = "mt6397-pinctrl",
>  		.of_compatible = "mediatek,mt6397-pinctrl",
>  	}, {
> -		.name = "mtk-pmic-keys",
> +		.name = "mt6397-keys",
>  		.num_resources = ARRAY_SIZE(mt6397_keys_resources),
>  		.resources = mt6397_keys_resources,
>  		.of_compatible = "mediatek,mt6397-keys"
> -- 
> 2.50.0.727.gbf7dc18ff4-goog
> 
> 
> -- 
> Dmitry

-- 
Lee Jones [李琼斯]

