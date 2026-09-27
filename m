Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C5C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=; b=jWll9YclkKSvJKrqGYhFZY4/SL
	NVw/bw4pnlTN7AEUywigoJLZdTMr1EygBDdo5zuFweq3jizTKC9c9H/Ad5Ud4iphpRkc9xjXJ/PSU
	f8tBF2PbXwaTIyfdCx13PQV1Cst+LTS5D8TqKjF/BsHzQYOpgy7Wdz/FuCqN3hIMzyZ0JvdqQICm0
	6VdNiX4nrPX0RbWjbEJtXIEeNwT9QsEIh5kdEYoscbcOMr14gSZ8EqXyI3rWyt6BhK4yEZyPzVU1v
	RjyysfN3xE8NnyM9XfBKWHbLhzpR5o++Hu4hv4iCqEUFeDwiYjr/0iGKKCLPvlAoe83yznX7bmmQO
	Nn09jMWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnaF-0000000GHTq-1KBv;
	Sun, 27 Sep 2026 12:02:19 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnaB-0000000GHTV-4B3t
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 12:02:18 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso5066055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790510534; x=1791115334; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=;
        b=K4IAW/bH3BYLPESrubTrhJ8wAWmXmWjNTZ7k3k1LP1PXHafP3U/j7aBh+YUDbAWuTW
         gM4ASsORDjD+mSEnNxba9MACWBzvPzolkT9SN1RtRbHpHLtvvBkCENp5JL1wKA3C0iIy
         hhE0XMyGhreXWIRIyvq9p/EmXU6raOfEuF94ibnrhCBt3/kuM894UI1+OjPs6o3efx61
         0zYFkOvmLleHBZ2byH+qRuM9PA5fhkbPSlQcHH5+ppl/8dXbTfo97honYSQmv673UG/y
         uOct7AlPtnJiKWpiAZpNsykNgasGNUW2Pxf0Ko0Ic1a8mk9l6NXp2aobQjhh6MarbLt0
         7auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790510534; x=1791115334;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkpPVjsJ4tErMKKRalZevupwBw/pEsRxXAWUlZU5BkY=;
        b=GmnaorRGteMPCbwNabHLxgG+N51lpvL6jUVDpUHfhNLRuht8y9vPLHDedtdaYTy/Ye
         LfyPIxhgYtMTJi8IGR/XYfbPP/5SjHZh6XN0Q+DvpFzVEhP2dN6TYIxW+vEdS9tKYltZ
         1ft/92267RS0MGXvjkt0d4Sc8gCirEYTLM3gH8fOjNZdaDLR8b2j64jIwhhDGo1qT1JF
         MqG/t035AiLSr43Vwcc5QwvjoI3dGP+zPPB07DRMesiiNNxQ70AKVtz8EQyBLHGj4yQG
         VW3SCHHUBaLObb+rDyN/12RfwQLH1RBmHwljyVw5szHGohB9GZg4vHhWpo79hS7beUR/
         xAZQ==
X-Gm-Message-State: AFuF++nKywYb6kbS0q7xYlX+fJo6Y7c1KTNGBvJjGI3xbB6d8N4EWgrT
	Pc8yaIlOd4BEHKCq4KBY1PN7KX9EoHmNV3T6u4S9IX8ngz8ieC0f5WDX
X-Gm-Gg: AYBFou1rUm3bNhWMukXfxC4e1n+vKJqAUG3JPIbeoCAyxtVmheU0ekw/PcrCwdYHVoD
	XW2Yb9q773Td/Hx0JQk/bp4t4/n1D19SUSACXGBA2O1MtD5N5dqjaDWWIsM3Go7tfgJzCe7/Stk
	Si0AFUZTgnaefeYSvAyphBbLZnrekO9GOieY3kDtpfrXaka20IRSArj+1uOa/uE66GAwkrOI/m1
	0k2yuJPD16IzmA1AGJZyKb+CfxVqTqqW1QJjRSRg2ORApzKZfq/a16hv95lw67afV+FC1puBSMH
	XwFg4BBlJDImwe3ihCuiff86iEqWMENPK5jYQ2W65ZS3ovvFuV0Uqi+M9nEaHb9+opUxvhzFzVu
	829H58gJoRAIRpnYDGD+UUhfT9Gdl7VCZCAbljo6/rBal1UJINKS5+9QbSzrQ+FuXnzozkGAVUb
	Vpn47iJiOHyXfiNTSEU8KFsZc7GyVjCw77xUMDxWXDWMm5hg9t7N32YdZ+z3wulY65a/nvf/qwL
	U3k3DWYMouD+PF56/DydKZux6V/w7z0OrzSLVgIgEydM9n+n6OopAzHT0tAbaaxDnz5PzQVs8eA
	71nuIuhCrw/fz5j3AWenRYqgKrH1Ngs0DGd5KD+yClylDXyWF29/QiCGBrmENK5tvYVfk8CTPER
	xrcD2O5ATcU8FemCEYg9u6JTClP/ED5DPrPd0j19NCwODRlj9/p+HqSRUeA0phVWFKK7J3AUnUf
	G3gEPdkAWmgP4wmOJJBj6Gwo8Gw3s=
X-Received: by 2002:a05:600c:3547:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49fe66c8a33mr175216005e9.2.1790510533830;
        Sun, 27 Sep 2026 05:02:13 -0700 (PDT)
Received: from jernej-laptop.localnet (77-38-7-79.dynamic.telemach.net. [77.38.7.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001790022sm69199455e9.13.2026.09.27.05.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:02:12 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 jaidevshastri@vt.edu
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jaidev Shastri <jaidevshastri@vt.edu>
Subject: Re: [PATCH] soc: sunxi: sram: order the publication of base against sram_dev
Date: Sun, 27 Sep 2026 14:02:11 +0200
Message-ID: <_KSVwOofQtuLLVcIRHSVdg@gmail.com>
In-Reply-To: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
References: <20260921-mb-sunxi-sram-v1-1-ad7817f0ee7d@vt.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_050216_072482_0101ED21 
X-CRM114-Status: GOOD (  25.85  )
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

Dne torek, 22. september 2026 ob 02:48:49 Srednjeevropski poletni =C4=8Das =
je Jaidev Shastri via B4 Relay napisal(a):
> From: Jaidev Shastri <jaidevshastri@vt.edu>
>=20
> sunxi_sram_claim() is called from the probe functions of the EMAC, the
> video engine and other consumers. It gates on the file-scope base
> pointer:
>=20
> 	if (!base)
> 		return -EPROBE_DEFER;
>=20
> and then walks sram_dev->of_node in sunxi_sram_of_parse().

Where do you see sunxi_sram_of_parse()? This function doesn't exist
in current kernel.

> sunxi_sram_probe() writes sram_dev and then base, both with plain
> stores, and the claimer reads both with plain loads. Neither the two
> stores nor the two loads are ordered, so a claimer on another CPU can
> pass the gate and dereference sram_dev =3D=3D NULL.
>=20
> Keep the mapped registers in a local and publish base with
> smp_store_release() once sram_dev is set; read it with
> smp_load_acquire() in sunxi_sram_claim(). The error value is still

Where does sunxi_sram_claim() use sram_dev? It's used only in debugfs
show method.

I don't think this solves real issue, so NAK.

Best regards,
Jernej

> stored to base so that a failed probe keeps reporting it to claimers.
>=20
> Found with MBCheck, a static herd7-based memory consistency checker.
>=20
> Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
> ---
>  drivers/soc/sunxi/sunxi_sram.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sra=
m.c
> index 2ccaeacf8..0e0b86ad3 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -266,10 +266,14 @@ int sunxi_sram_claim(struct device *dev)
>  	int err;
>  	int count =3D 0;
> =20
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	void __iomem *regs;
> =20
> -	if (!base)
> +	/* Pairs with smp_store_release() in sunxi_sram_probe(). */
> +	regs =3D smp_load_acquire(&base);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	if (!regs)
>  		return -EPROBE_DEFER;
> =20
>  	if (!dev || !dev->of_node)
> @@ -410,6 +414,7 @@ static int __init sunxi_sram_probe(struct platform_de=
vice *pdev)
>  	const struct sunxi_sramc_variant *variant;
>  	struct device *dev =3D &pdev->dev;
>  	struct regmap *regmap;
> +	void __iomem *regs;
>  	int ret;
> =20
>  	sram_dev =3D &pdev->dev;
> @@ -420,12 +425,21 @@ static int __init sunxi_sram_probe(struct platform_=
device *pdev)
> =20
>  	dev_set_drvdata(dev, (struct sunxi_sramc_variant *)variant);
> =20
> -	base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(base))
> -		return PTR_ERR(base);
> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs)) {
> +		base =3D regs;
> +		return PTR_ERR(regs);
> +	}
> +
> +	/*
> +	 * base is the gate that sunxi_sram_claim() tests before it walks
> +	 * sram_dev->of_node. Publish it after sram_dev so that a claimer on
> +	 * another CPU that passes the gate also sees sram_dev.
> +	 */
> +	smp_store_release(&base, regs);
> =20
>  	if (variant->num_emac_clocks || variant->has_ldo_ctrl) {
> -		regmap =3D devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
> +		regmap =3D devm_regmap_init_mmio(dev, regs, &sunxi_sram_regmap_config);
>  		if (IS_ERR(regmap))
>  			return PTR_ERR(regmap);
> =20
>=20
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20260921-mb-sunxi-sram-41c3288a4660
>=20
> Best regards,
> -- =20
> Jaidev Shastri <jaidevshastri@vt.edu>
>=20
>=20
>=20





