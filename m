Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A9FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6svUt4iTKLUfioqlz6n+zi3gVpzojRZdfSEAIIkW1Pw=; b=vRrQbuyih5umZ0rAQaoYqnKUhn
	kV4jhEw+0dCRkjPBX+AnJy+pAWuyOs943fOX3Te+h2q3oiJCSX1eERpGYIo1QWgpjAvUf/H1V/U00
	P7Y7HSOH2RGfZKhRveCrRRozT1OciXFBhLwCx8XAU6mFlWYW/DTozzhFWG3wAEemrC/rN7s6TQ6Ry
	U09o+OIonQslYgq8wmrnd4grMTlguwAqR+aGcfOvD9/yxiYxG6sLiMInA0B6nyqBl6pnrV8h7x7k9
	yOlFyGdY2KPfR7MbzfrLIIsOTCisGSURDrIjG5QU2ILBtbihjhiZssB/fcv/rpWlwY+Iq1njwMx76
	nFkCjTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIze-00000005Rpm-3Zx6;
	Sun, 08 Dec 2024 15:14:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIxX-00000005RCf-2QXG;
	Sun, 08 Dec 2024 15:12:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434f80457a4so846355e9.0;
        Sun, 08 Dec 2024 07:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733670754; x=1734275554; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6svUt4iTKLUfioqlz6n+zi3gVpzojRZdfSEAIIkW1Pw=;
        b=LRZFFhXHSjde8G4t+ytTJMKGR4dfyCSDTMl3sAA5gf4z5SJdkDlHv/2h3RvcsfxnjQ
         Kz2r/ox/kMznpsA5BEFq0KRdaUa/JQ1/x16h1+XfnoRnsU33cynJR+/Ag1UviIKjw6pp
         AxtIOmaauHB/ne+Y3VDAx+sT/U6Q6uJsomlcNr/DwKLL9EZM5mxz+U/uxg49+WiYmTAv
         5Q4AliToHY0+avehYqYQFpijFiE0BKMPJfCzQS5AUBXRAf4W8ZdMLPQtlhiulCsjU3LF
         ICDez75MV+itnMhGDQI5rileh1gUIr+bz9F5fss7Drcw3arFETaKcsBmBhA/rTpf/dUH
         Pf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670754; x=1734275554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6svUt4iTKLUfioqlz6n+zi3gVpzojRZdfSEAIIkW1Pw=;
        b=VxwX0UhGx32x03VZehOvng9fCVw6ppibBT0ph9x+VEgfjy+gTJ/JRAmVzKSEQEdMwA
         gVKagCbU/sjqDbM0TaAkaaxZX9ypiPdrCltAPeHzlTng1QDG8DgUb9VhXE7AmjeHm04d
         NC7Wpq5KMqAtuWWqwo+rA2EdnE4garMDHgurRPkHXmOHCdW1zzr2eHIzZxJxNTWIiKM+
         BAhfgGS4xCP/KQh7CCiIbexXf1sUJ4y6lZD2a3tbbMdUnAABPp66NoMqVh4IH1FoIGuZ
         geuXeYQ0zzczsXDXyubbFvrmrzPTUkWY+wAv2gMdnNpqlkYGk+0zzJN3s/Bmaabp27Fh
         h2rw==
X-Forwarded-Encrypted: i=1; AJvYcCWPKd1EdztavHJmsMx03lcjY9TFm78OuFPrSt2GKSMU+iq4Io6G7vllnka0TQvuIflWTlwt6rkNgBSdEVLCjjQ=@lists.infradead.org, AJvYcCWnYD6P9AFgbqlCgqle5DLj67cIk6cActUaM/yqB4lTdiaYo7InhLW+pTDHQWMiUEVcX18U5j8LNdOeUToNLbEp@lists.infradead.org
X-Gm-Message-State: AOJu0YzPym4zHSBsqT+BqxePpaJZlHuF9P6nf/6FNcTMNXLvJFZmdOm3
	K6FjsCEwHRYHYS2Ctg7LY8Tcc5ryHUNUxEx+iQTLXOVmGa0WMRHC
X-Gm-Gg: ASbGncvzgFDGER4rfe676+W87fSOxeRF/7jQQvcDHlAeBrxBArQbA7v6NYWEz+Wten4
	LmNTKc03aha9gSif4uieZdAjnbm84AOtXnVFp6RGfDQu/QsOV8dcZ25L6pADmiFUfZ8xh63ioNN
	Do1DR4EyremYZ01vQ5fact9xpq5LZg88gETAGT85uS6ywqOdUkdeeTWmwJXMYUaeOIOZPHUmDRA
	nk1ZUJzLHakpwD1bO7DMIckok9+JaYF1NqOsDlgtgPk7uZhPB76M2NcfvC1/1MhEEGnxA3+sFG3
	NyA3UA==
X-Google-Smtp-Source: AGHT+IE8MWiF0ZIMr/Rqxq6z65CLXruJETdntJZe3cATM5wP/XUEsgObmORo8sJbHeUy7FtBYkm9/Q==
X-Received: by 2002:a05:600c:3ca1:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-434dded7ad7mr69333975e9.10.1733670753440;
        Sun, 08 Dec 2024 07:12:33 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm123459485e9.29.2024.12.08.07.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:12:33 -0800 (PST)
Message-ID: <6755b761.050a0220.223761.2b14@mx.google.com>
X-Google-Original-Message-ID: <Z1W3XKvIVTsuClew@Ansuel-XPS.>
Date: Sun, 8 Dec 2024 16:12:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno," <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v10 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-6-ansuelsmth@gmail.com>
 <8e9cf879-b188-4bfe-8200-f6a6ae285cb5@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e9cf879-b188-4bfe-8200-f6a6ae285cb5@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_071235_615650_EB063F99 
X-CRM114-Status: GOOD (  26.29  )
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

On Sun, Dec 08, 2024 at 04:09:25PM +0100, Christophe JAILLET wrote:
> Le 08/12/2024 à 01:20, Christian Marangi a écrit :
> > Add support for Airoha AN8855 Switch MFD that provide support for a DSA
> > switch and a NVMEM provider. Also provide support for a virtual MDIO
> > passthrough as the PHYs address for the switch are shared with the switch
> > address
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >   MAINTAINERS                           |   1 +
> >   drivers/mfd/Kconfig                   |   9 +
> >   drivers/mfd/Makefile                  |   1 +
> >   drivers/mfd/airoha-an8855.c           | 279 ++++++++++++++++++++++++++
> >   include/linux/mfd/airoha-an8855-mfd.h |  41 ++++
> >   5 files changed, 331 insertions(+)
> >   create mode 100644 drivers/mfd/airoha-an8855.c
> >   create mode 100644 include/linux/mfd/airoha-an8855-mfd.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index f3e3f6938824..7f4d7c48b6e1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -721,6 +721,7 @@ F:	Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
> >   F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> >   F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> >   F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
> > +F:	drivers/mfd/airoha-an8855.c
> >   AIROHA ETHERNET DRIVER
> >   M:	Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index ae23b317a64e..a83db24336d9 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -53,6 +53,15 @@ config MFD_ALTERA_SYSMGR
> >   	  using regmap_mmio accesses for ARM32 parts and SMC calls to
> >   	  EL3 for ARM64 parts.
> > +config MFD_AIROHA_AN8855
> > +	bool "Airoha AN8855 Switch MFD"
> > +	depends on MDIO && OF
> > +	select MFD_CORE
> > +	help
> > +	  Support for the Airoha AN8855 Switch MFD. This is a SoC Switch
> > +	  that provide various peripherals. Currently it provides a
> 
> provides?
> 
> > +	  DSA switch and a NVMEM provider.
> > +
> >   config MFD_ACT8945A
> >   	tristate "Active-semi ACT8945A"
> >   	select MFD_CORE
> 
> ...
> 
> > +static int an8855_mfd_probe(struct mdio_device *mdiodev)
> > +{
> > +	struct an8855_mfd_priv *priv;
> > +	struct regmap *regmap;
> > +
> > +	priv = devm_kzalloc(&mdiodev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->bus = mdiodev->bus;
> > +	priv->dev = &mdiodev->dev;
> > +	priv->switch_addr = mdiodev->addr;
> > +	/* no DMA for mdiobus, mute warning for DMA mask not set */
> > +	priv->dev->dma_mask = &priv->dev->coherent_dma_mask;
> > +
> > +	regmap = devm_regmap_init(priv->dev, NULL, priv,
> > +				  &an8855_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(priv->dev, "regmap initialization failed");
> 
> Nitpick: Missing ending \n.
> Also, return dev_err_probe() could be used.
>

Can regmap PROBE_DEFER? Or it's just common practice?

> > +		return PTR_ERR(priv->dev);
> > +	}
> > +
> > +	dev_set_drvdata(&mdiodev->dev, priv);
> 
> Is it needed?
> There is no dev_get_drvdata() in this patch
> 

Yes it is, MFD child makes use of dev_get_drv_data(dev->parent) to
access the bug and current_page.

> > +
> > +	return devm_mfd_add_devices(priv->dev, PLATFORM_DEVID_AUTO, an8855_mfd_devs,
> > +				    ARRAY_SIZE(an8855_mfd_devs), NULL, 0,
> > +				    NULL);
> > +}
> 
> ...
> 
> CJ

-- 
	Ansuel

