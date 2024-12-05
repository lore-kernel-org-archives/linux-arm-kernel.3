Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3250E7717A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SN1IUjCKosvwoMP78JjC9pNaPeczyqUZO6x+klQrhM8=; b=bgX35PNs6bR2T/uods4t3xZp2o
	pP3g0Aetc1Bhw0FMWAj5bdgQVIXf8TrLBlo6b0FM2S1YdQy1wxYVAe0oJicfPVhFUIGp1u2Vr1dEb
	alTKk8zN1uOL9bf3dSFMyl80PwFZroja1tyYeDJdYmJRHdC93t15dqJ/AFI6GwfGhvihDLFXHpZ9j
	hEnadc9fKHf7onD/RjMTLKzVTmoxxQasfI/WuO2pyF7yRVJqE5sq5qvJIDQVDTqM8zIGCTDF0YqnF
	TdcZpQYGwrhmefw7XMTDQJrRe0tj0pfnrLBY7Nl9C6nTskMk3/5c8meb9I8tKSwfA+9ZU2JHUWa4Q
	XdNnQCgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFd5-0000000Gwl2-2Yyy;
	Thu, 05 Dec 2024 17:27:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFTi-0000000GuaY-0KRL;
	Thu, 05 Dec 2024 17:17:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385de9f789cso856674f8f.2;
        Thu, 05 Dec 2024 09:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733419044; x=1734023844; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SN1IUjCKosvwoMP78JjC9pNaPeczyqUZO6x+klQrhM8=;
        b=f2e0E5qhcAVluynV5KCGu4ruiBu7d7i8Nd6Wj79vYefgFECxF9pFSlluzit1j4d64y
         fgy/pl7uXrI6xpOh0DOkbbQRLKgH1c+DAGI6QKofuuiZdXRlxQDu1D7E/m8hOE20BDzz
         CZFtkc0noVRlw4gBh7UtDiKYQkJrGnZ7AW7vSZajTCsb/epBGNlPXfR0rsG84I3lzkSj
         txQILEwjhGTICiBrgOz4+q5te/WNJkULMKjdQuyqRXA1Adm6+vx/nVDWM4oP9c7uzNdP
         Wbd2ZJ4HCAqVy4dqL73SnH/sv+TqiJ0qjce/IxNEkA1apkT1qNLQcao7PpqVmc7EMzKU
         C6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419044; x=1734023844;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN1IUjCKosvwoMP78JjC9pNaPeczyqUZO6x+klQrhM8=;
        b=upw9E/dBXIzq/jU87L7R/qszLWGOfkBcdO1LJ1rM9/eOI6tTG4VY/dpd2onsdd27Fo
         T3FHQfrCI4LqzC3ztFmD5pgB8szE7nBiTmAwAQeYlvupOwXCUDt8w9a8g96MTXj7xPwL
         REma2oyJUoacIh8bH8JCxZvNxIQhzf044dJKVcu36ugQBz2FImwk/ValVUcJ90qi+DxG
         pczC/mYUNnpXmULrySRXGcUbWyAbptImyzWazpQIhPTsaAy6rzrnv8BbSLBDe7qJpUxj
         9JGTDNh8PpdR2Zwp0I9d80NwGHkpcguNpsIwcpi6FP3RyrKNEhmaVCPbsBpEAugx9wRm
         vNsg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJBhjoBrdPg7QzEpeitL1Y1yL9xkaIiGazYyPWuHFkPGcm8NhS63Nbb+pZGzTAqsX0RcWCPLoI2HVx7nzzw22@lists.infradead.org, AJvYcCWuVQmZ0rey2T8k/JwDWMKfE+RcdJ9dujWYQvteA90voy/kopIYcNPHj66FdhF8YEuTg1anZUTTSIRXMxf18IM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoUluE9xEQk9tvHHttbFRffmG4yg3E0altMY6iTEgprHvce/Ud
	/Hd61Wv5Yo+KZfC0Mjtg1ILCaWLJwSzStFveZZQqezjyve+tmbHiribvEA==
X-Gm-Gg: ASbGncuzhYKYvqp8rvJyLMEYLEuxKwKbm4d7EqedaF1qRwHmRs95lQd8lkGECG2OjM7
	/I42lijmBlm6owke1pOmiC6J7AR89NRfgFyXIU4mnILBXl7BcO2FFtBwmiwMCXRH8bnlJFWd7GV
	eucGmkgPmEIIkbaG4/MkVaxNN3H9OqMklKZOkGyQsT0TqbjN9aKZwZ67YdczQQQgUAWgUNC/jTe
	rgxzgJtIeqDMth3/GOKVBFKT+11nKjrGOMT/gz+BoD5bnizcDne9NGNJv8bEFzRmygZIPwWpbgB
	96bGKw==
X-Google-Smtp-Source: AGHT+IFGLdccQZZT6SK2+da//mSq/Cl9jdeyY32lqwWVf3M+gX0V6WTHyQEf5kO3jT5sbZpH2fuN1A==
X-Received: by 2002:a05:6000:1faa:b0:385:f7d9:99f5 with SMTP id ffacd0b85a97d-385fd433612mr9315287f8f.51.1733419043842;
        Thu, 05 Dec 2024 09:17:23 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a8591sm2443049f8f.36.2024.12.05.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:17:23 -0800 (PST)
Message-ID: <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
X-Google-Original-Message-ID: <Z1HgHu93YLoS_D4P@Ansuel-XPS.>
Date: Thu, 5 Dec 2024 18:17:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
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
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205162759.pm3iz42bhdsvukfm@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091726_117893_55C4E804 
X-CRM114-Status: GOOD (  26.76  )
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

On Thu, Dec 05, 2024 at 06:27:59PM +0200, Vladimir Oltean wrote:
> On Thu, Dec 05, 2024 at 03:51:33PM +0100, Christian Marangi wrote:
> > +static int an8855_efuse_read(void *context, unsigned int offset,
> > +			     void *val, size_t bytes)
> > +{
> > +	struct an8855_priv *priv = context;
> > +
> > +	return regmap_bulk_read(priv->regmap, AN8855_EFUSE_DATA0 + offset,
> > +				val, bytes / sizeof(u32));
> > +}
> > +
> > +static struct nvmem_config an8855_nvmem_config = {
> > +	.name = "an8855-efuse",
> > +	.size = AN8855_EFUSE_CELL * sizeof(u32),
> > +	.stride = sizeof(u32),
> > +	.word_size = sizeof(u32),
> > +	.reg_read = an8855_efuse_read,
> > +};
> > +
> > +static int an8855_sw_register_nvmem(struct an8855_priv *priv)
> > +{
> > +	struct nvmem_device *nvmem;
> > +
> > +	an8855_nvmem_config.priv = priv;
> > +	an8855_nvmem_config.dev = priv->dev;
> > +	nvmem = devm_nvmem_register(priv->dev, &an8855_nvmem_config);
> > +	if (IS_ERR(nvmem))
> > +		return PTR_ERR(nvmem);
> > +
> > +	return 0;
> > +}
> 
> At some point we should enforce the rule that new drivers for switch
> SoCs with complex peripherals should use MFD and move all non-networking
> peripherals to drivers handled by their respective subsystems.
> 
> I don't have the expertise to review a nvmem driver, and the majority of
> them are in drivers/nvmem, with a dedicated subsystem and maintainer.
> In general I want to make sure it is clear that I don't encourage the
> model where DSA owns the entire mdio_device.
> 
> What other peripherals are there on this SoC other than an MDIO bus and
> an EFUSE? IRQCHIP, GPIOs, LED controller, sensors?
> 
> You can take a look at drivers/mfd/ocelot* and
> Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml for an example on
> how to use mfd for the top-level MDIO device, and DSA as just the driver
> for the Ethernet switch component (which will be represented as a
> platform_device).

Hi Vladimir,

I checked the examples and one problems that comes to me is how to model
this if only MDIO is used as a comunication method. Ocelot have PCIE or
SPI but this switch only comunicate with MDIO on his address. So where
should I place the SoC or MFD node? In the switch root node?

Also the big problem is how to model accessing the register with MDIO
with an MFD implementation.

Anyway just to make sure the Switch SoC doesn't expose an actualy MDIO
bus, that is just to solve the problem with the Switch Address shared
with one of the port. (Switch Address can be accessed by every switch
port with a specific page set)

But yes the problem is there... Function is not implemented but the
switch have i2c interface, minimal CPU, GPIO and Timer in it.

Happy to make the required changes, just very confused on how the final
DT node structure.

-- 
	Ansuel

