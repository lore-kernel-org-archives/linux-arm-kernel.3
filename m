Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84DFE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPXoJcPeSQwufs65dme8yzbSHiM4hQw48CgHRQis7MU=; b=LHHyZtrn5inPaIm8XzNqcjNXM3
	nlBUQD2RQG5JyOcl7jXNg27hKhD23+sslGqGlPGrJRPft4szA0yPG/9ab4t5472cPT97S2O+SH66w
	xBpvIoNJU5Tu93IRTEIWvRZzxG9FKfFoUl6adoA+suWl7+TJZFgFnojMVs4J8ucY4Sd8WPtlmGpOH
	eXm7nuc82Lg6fptTIG6A160R5kny250/43fIoxCtZqoNkbgFb8skcKKcspKf5kmDbFBuESK3ud2P9
	StYO4zVeLaV9KMTHAgCzy3rMSbuJXC3EjotSUriZCbPnLvt1qJ53AaLRCoQBxpGmS+B3YudL0AoXP
	AmsXbzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEiy-0000000GkfO-3sdl;
	Thu, 05 Dec 2024 16:29:08 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJEhx-0000000GkVc-023P;
	Thu, 05 Dec 2024 16:28:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa62fc2675cso8107666b.1;
        Thu, 05 Dec 2024 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733416083; x=1734020883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPXoJcPeSQwufs65dme8yzbSHiM4hQw48CgHRQis7MU=;
        b=MPc5LiTyenZ1azZRy9BH8K/kCb+nFb08oO9rEAforrRxvDMY9Bh4MhVwcvXKis+ciS
         3zslKp3e9c2QuIHUiz7gHWRGNx51ag4DJPt+6Q8VHMc8WRwysLKpyiRtWR37Dvr/EvNa
         bXOwU8hoV7Y7q4GvZR0GM4B67EwG1VBSCzTpWkZ/gYHOP9qdH1K3bymNSzNm840iN3uV
         XKfIhUqI6j3NyFrJshFdbULTdZJrDf2EbiiMRPHGGeox6BtWZ8rK+j/gFSldCDuty+9m
         5yagwn76iAbyy93rQNDTdAiBAaQ0quW1wzYExviv0kVfZJ1mCbsycUWA7MwlDMjI+91a
         INdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733416083; x=1734020883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPXoJcPeSQwufs65dme8yzbSHiM4hQw48CgHRQis7MU=;
        b=xHf+C1/T5yInyO6YELlHBsKN4jB3oB+kobPT+6C7YQdV2W7zXcC9OYb0BfCOx0aIpA
         abldkJeu3UzxTYTt6ih1i5LQyw/gmanHyiGCcV3lmX3An2LTTVUg2FwIiSRCyhRULeeC
         tJ/oYtSbMWu3Yc3cRTT4sZkLrLmDi7SRmoPuWX0SpI8n/uwciHIG1h2Bf4Rpb3XbSzyd
         mBSv+mvDh/Ubit1gnc49hq3ZHwmhDjZpI3E99Zu/8RjNbVW4wTZTuEt24piV2dZIG7b3
         AhxQt3OLmszy3nziz0r+nGxrJ0ruKAK/NL8Z9xm4TtIMF6fIslc/InjnTi1veL+8O/wK
         ND5A==
X-Forwarded-Encrypted: i=1; AJvYcCXcGb8WAkR8IjaHFznWbmA0YZ7Yw3tsDTdHbAl9Pak94ki9uvN8Vq1Zql8SkNILHuSyeoN7F492rewJYWqdyeZh@lists.infradead.org, AJvYcCXfcjq6lj4eRivG+eiyuo1ub0eAU49tKzoPeyYHMqdz71zxpqVxmBwRNdtxagckZPd/jOlt2ZK50Hd9gepGSXU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5OxkmEY/3aV1eqL5b29taCrtFBukF80oWHu4Ptyy5L/wV+FVg
	WAaBle67cw0Wy1OG7YS1aiSHBFg/hMfpnp+EN9f+7duWwfGUdO2A
X-Gm-Gg: ASbGncs1LNz23LSfljQjN4XmRDXgEqGkj+jUnUt9rq80bFgrKnKTQ5ILxnLp0XLjh7d
	Kgz3/nh94ADXrYPNkPwUyo1mmNXYfVT/YCGtFbBvsQREqiSFvkRoi1lC5bB2tlPwjHCHu6tb6r+
	1BZFSc72VVjzBpcHlmsDnMcg7+IK3NhCt1K+2/cxC1mW5dcl4Js/yBi+Sof5FLTew88oAaay0uS
	Wu7gXrnxBZpkVH4UsjKCc4Qvov3F/X4R82ym+0=
X-Google-Smtp-Source: AGHT+IFXo8dPa3kP8TWBFDql5AxNgfAf43Sw1KmsQzDEJFJ2Gu14qwW18WvRihEawx3T8P1t1NEPUw==
X-Received: by 2002:a17:907:7b85:b0:a99:f230:8d6e with SMTP id a640c23a62f3a-aa5f7d9a1c9mr486801166b.7.1733416082676;
        Thu, 05 Dec 2024 08:28:02 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm111902466b.118.2024.12.05.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:28:02 -0800 (PST)
Date: Thu, 5 Dec 2024 18:27:59 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241205162759.pm3iz42bhdsvukfm@skbuf>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205145142.29278-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_082805_043945_DFFB46FB 
X-CRM114-Status: GOOD (  15.36  )
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

On Thu, Dec 05, 2024 at 03:51:33PM +0100, Christian Marangi wrote:
> +static int an8855_efuse_read(void *context, unsigned int offset,
> +			     void *val, size_t bytes)
> +{
> +	struct an8855_priv *priv = context;
> +
> +	return regmap_bulk_read(priv->regmap, AN8855_EFUSE_DATA0 + offset,
> +				val, bytes / sizeof(u32));
> +}
> +
> +static struct nvmem_config an8855_nvmem_config = {
> +	.name = "an8855-efuse",
> +	.size = AN8855_EFUSE_CELL * sizeof(u32),
> +	.stride = sizeof(u32),
> +	.word_size = sizeof(u32),
> +	.reg_read = an8855_efuse_read,
> +};
> +
> +static int an8855_sw_register_nvmem(struct an8855_priv *priv)
> +{
> +	struct nvmem_device *nvmem;
> +
> +	an8855_nvmem_config.priv = priv;
> +	an8855_nvmem_config.dev = priv->dev;
> +	nvmem = devm_nvmem_register(priv->dev, &an8855_nvmem_config);
> +	if (IS_ERR(nvmem))
> +		return PTR_ERR(nvmem);
> +
> +	return 0;
> +}

At some point we should enforce the rule that new drivers for switch
SoCs with complex peripherals should use MFD and move all non-networking
peripherals to drivers handled by their respective subsystems.

I don't have the expertise to review a nvmem driver, and the majority of
them are in drivers/nvmem, with a dedicated subsystem and maintainer.
In general I want to make sure it is clear that I don't encourage the
model where DSA owns the entire mdio_device.

What other peripherals are there on this SoC other than an MDIO bus and
an EFUSE? IRQCHIP, GPIOs, LED controller, sensors?

You can take a look at drivers/mfd/ocelot* and
Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml for an example on
how to use mfd for the top-level MDIO device, and DSA as just the driver
for the Ethernet switch component (which will be represented as a
platform_device).

