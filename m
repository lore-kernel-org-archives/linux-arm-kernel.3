Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F171CFA45C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24JSccvs0HSbNmxvOVItJ4JQKqdo53s7Emj+lH9aPyw=; b=mFDCuzJeEsWN1N0QQtBPSpcPJd
	p/EM45lhswJcC6sCMeGM71gEeU1MS0zEajKMU9G9G4mygjGacv5Cs2/EJxK/wdY7FxjF+2KvCl4hP
	G7Tgf0Tsb8GSBvJq+Pk+ZGBVIXsZJ+UrX4W3hlS007wG44IUVKh+2fTCvixognW5LjTRMuVBOcvJ8
	nX//DJJ6q0drfbEVczKNqsDREKoW2oqKQIkCjwNWo2gp7nXZ58TTBWsinCfzePj78nACihsCoczYT
	yPIMS/HtdfdkXqfwkO+O9uRQdBNJwFpmEFlnz/cVPh6bLlk5YlCiSctLeijp/WCBRshsaXUZFt5Ar
	Tfynsd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3g1U-0000000FVtU-14B6;
	Wed, 23 Oct 2024 18:23:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ewV-0000000FL2d-0ren;
	Wed, 23 Oct 2024 17:14:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4314b316495so68683305e9.2;
        Wed, 23 Oct 2024 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729703682; x=1730308482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=24JSccvs0HSbNmxvOVItJ4JQKqdo53s7Emj+lH9aPyw=;
        b=XVEQLNC3x1wUxCVq4rt8u2kRNxMZzxWTcY/Q0Ghgz/+jKKnVawjxLTEl6P8JzhzWYK
         Y+v+H73T1sziUMJ4KAo6PmEweW3qT42gmOqJyD4ELUVPZEGrjE3lqJhlrGyE74OyAUQo
         eaacqnhvca+xpbIhO5TcoP7G2zKFERphi92DNJ1CFseA6sz9iEnuo5VKXrttjoMjgrc/
         m7p9A5qvcswmTtHT8+CAmrJu9r7NmuaAUu4Ad97jYEjFsDDie7QoSSg0RhB3TyTJwA+9
         oFEq4ynWA/RU64ygxhrAlZSB6By2HM6WsJ3h043SgGYp5SiXrcjzOb2xVT9SqMlA2Qx1
         4diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729703682; x=1730308482;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24JSccvs0HSbNmxvOVItJ4JQKqdo53s7Emj+lH9aPyw=;
        b=ln4vBrrkynptg8+zpZuh7iVAtM2nAPRsf1Iz/WizbXw4ghX1aXL9bH01CtvqIPgsmQ
         U7d749RzGu8RgbEx4JuwGCisp1ll410Lk8AAnKwvTjND1jAnPD+n2YnAtDBc0TN9hbVd
         wB5kwjX7ceoilnpvine7lNzMUb8MHCLSb4plWPHPSvV40XDwU0im1fu98HWvfeDEa1Z7
         dR8Lt1vEy7woawCLW+Qi7oicCnkyqGOIPMwtQgLIZExs/ngEbfzoAxd21ecSFwwt+VvI
         j+ktZKIDsArIsVpLTSvtJ9DH7jN5SlU2Y+B0wa2V9wvVqq271wClyEGUUWLde0YpWmXy
         XQdw==
X-Forwarded-Encrypted: i=1; AJvYcCUARB73YI0fJ6mKPPAE5Av1IofdC1gD1dG/O1LDnFyefPjWt/wBPL1SmvBug9myfFol+MHkgdbDrISorh8g56c=@lists.infradead.org, AJvYcCUYJgsj2xvyvPfV+7ThlSkfMH7I23Wgmfeuteg6MchYEJZ4zIXf+FcinsE/IY72XtB6LVGyY9F5XNPQX1nITAKO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0BZOVArmsLQXiyICwrWWPjM2dDNroeDT/sKGYvKerr4147UuG
	uQlhIX3C/ytX1QvSn5gNLpSK+MUaWNJNKxllMPl1f09zJasC6djj
X-Google-Smtp-Source: AGHT+IFyL3faonwfZbopJADep8Fb7q5nglJ4asw2OSvMdOVlChDa7XsFH3HgPggJz4T2SeNw/my3rA==
X-Received: by 2002:a05:600c:1c95:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-4318413e532mr24981595e9.8.1729703681340;
        Wed, 23 Oct 2024 10:14:41 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c3a44asm21554805e9.36.2024.10.23.10.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:14:40 -0700 (PDT)
Message-ID: <67192f00.7b0a0220.343b2b.9836@mx.google.com>
X-Google-Original-Message-ID: <Zxku_anuVj64p9nq@Ansuel-XPS.>
Date: Wed, 23 Oct 2024 19:14:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 1/3] dt-bindings: net: dsa: Add Airoha
 AN8855 Gigabit Switch documentation
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-2-ansuelsmth@gmail.com>
 <5761bdc3-7224-4de6-b0f5-bedc066c09f6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5761bdc3-7224-4de6-b0f5-bedc066c09f6@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_101443_279618_399390F1 
X-CRM114-Status: GOOD (  23.03  )
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

On Wed, Oct 23, 2024 at 07:08:57PM +0200, Andrew Lunn wrote:
> > +  airoha,base_smi_address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Configure and change the base switch PHY address to a new address on
> > +      the bus.
> > +      On reset, the switch PHY address is ALWAYS 1.
> > +    default: 1
> > +    maximum: 31
> 
> Given that this is a 5 port switch, what happens if i pick a value
> greater than 31 - 5 ?

The PHY at those address won't be reachable, I didn't think of this, you
are right.

> 
> Do you have a real use case for this? A board which requires the PHYs
> get shifted from the default of 1? Vendors have all sorts of bells and
> whistles which we never use. If its not needed, i would not add it,
> until it is actually needed, if ever.

Well the first case that comes to mind is multiple switch and conflict.
I have no idea if there are hw strap to configure this so I assume if a
SoC have 2 switch (maybe of the same type), this permits to configure
them (with reset pin and deasserting them once the base address is
correctly configured)

But yes totally ok to drop this if too strange... I assume it's problematic
that PHY change at runtime.

> 
> > +  mdio:
> > +    $ref: /schemas/net/mdio.yaml#
> > +    unevaluatedProperties: false
> > +    description:
> > +      Define the relative address of the internal PHY for each port.
> > +
> > +      Each reg for the PHY is relative to the switch base PHY address.
> 
> Which is not the usual meaning of reg.
> 
> > +            mdio {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                internal_phy0: phy@0 {
> > +                    reg = <0>;
> 
> So given that airoha,base_smi_address defaults to 1, this is actually
> address 1 on the MDIO bus?
>

Yes correct. One problem I had was that moving this outside the swich
cause panic as it does conflict with the switch PHY address...

-- 
	Ansuel

