Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF96CFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2VscTNdIlS5vsji2abiXF+8aeUy0jlwcvqlNVowB/g=; b=OtpThsQ9cf6FLU5TUaUnslU3+W
	hDluKeWoXFu2VwCInwctN5YamijMeo8hxnS24Czs9Q/Vw98WZcDEmrwd+jaAw82TIa9t5qAW6ykjI
	l1dtiKLhmu8/05FPPz7EgcliriFnlkQD4tRdfp6g5HDOndlmVeIHvGFWvTUWuB9NTxZg1EfDqlhpx
	us9rBUtG1ziUvTpR4R785YSZyqshUYvccLbe90yj/Qp2wxBB4ZXcE9uBO44DbWQR9z+KpznpnG0/y
	bnoU352ygm+10v9Q1CuFvC2Jnr/QMGyZVrrn6vp6HwmD8ohKDKxU964AyWTzjZV+XHnjdXjsbsgLt
	naemkn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gw8-0000000Fess-2bEe;
	Wed, 23 Oct 2024 19:22:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fQX-0000000FPus-3pNQ;
	Wed, 23 Oct 2024 17:45:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so5078146f8f.1;
        Wed, 23 Oct 2024 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729705544; x=1730310344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2VscTNdIlS5vsji2abiXF+8aeUy0jlwcvqlNVowB/g=;
        b=R/nLES4zf3C8vRXw/TET/kR1WvgDxPlEBBQCk9Csded9U1lU9L/+VMYRzlyptfOA8I
         hMNTvL7nB2ClE4yk8EwaIOwqJdAqhS1wDmRgcf2W1I6fOJSozQHbpnmKWLghXBd+vPrA
         sY79yqizPQYKgCIfpPFjr8WOuICazV9Scnq4G5Jd83d5TfOi+1JVUgK6SleO0anqyvem
         /68WTS0UCKx+FL5iIEVdQ5EpegoW7DNEWYYqQkGl35K1Khpk0d19N9nhegQZWyqOdETK
         Ulx2xZNwJJlP8t3Z3/XuGp1dc0+xSLuciMTjGAlOsXOOmowDh15GHksK/gaBWdfvVU01
         EIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705544; x=1730310344;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2VscTNdIlS5vsji2abiXF+8aeUy0jlwcvqlNVowB/g=;
        b=GbrQjRorscDfJtn4j+JPzO+n1bozfhJasYeDxNOELiFeTMp6R43Hn74Bkg+0QxkHQa
         Uq8iqtZFpQL/m/Fqb0GK4+N/I988csx4ife9LWss+RYtDmmRcGXXcXrgrfR+r04NNjvW
         w5aLJSOQ27WuDjb/A79De5LGIqmMY3UGpF0kiY7AfQ5j1kPrnO3pQjsjnVmJSYxwOUcV
         7Gp6JuLThpA4mBCVPI2KMYQEzyWRdv8YLA9Cj4oyQHsN+lC21a0s3LGTIqp7zPZ3GAb2
         JlEM4D1OSLyVF45GnSd9eJzOCoGOPQquMC0WYQfwkqca0/r+BUNqAro7ECwwVXo9q0js
         iNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqG+7uee+I9Pskwr575aysqxkxbZtD/iwuhbgTzSgjEL8TGd64V4fyDKR4GYZZ4Li5mOmLzojHaoRk/vrQzQfb@lists.infradead.org, AJvYcCWxE+iN8SVrk1jfpkfbpTYLW6xu60p0z6aRiKByoUYNMFe7cAJZLUUROL1J3aW+0fIP8YSiINkhIQTd0fzhQcA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxaFFY0w3UzQvcUY9wQvIdfNpMt7sDpjdAAEaUqpYQ5OrTG3JFf
	HX0PQRC5d3jj3ac4SnSRGD0vmAjsc31B3LHfZybOgNnEtb5E7Oxf
X-Google-Smtp-Source: AGHT+IEY8xxWoI65TbiESsWmXVoSDRzzgUk/ryShEl9kzMOLIChMg5LvevZzioCPurdVUr/AA453Kg==
X-Received: by 2002:a5d:4704:0:b0:37d:5496:290c with SMTP id ffacd0b85a97d-37efcf051afmr2378914f8f.7.1729705543774;
        Wed, 23 Oct 2024 10:45:43 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37aecsm9431133f8f.8.2024.10.23.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:45:43 -0700 (PDT)
Message-ID: <67193647.5d0a0220.1b234f.2b09@mx.google.com>
X-Google-Original-Message-ID: <Zxk2Q35zMPUsC1RZ@Ansuel-XPS.>
Date: Wed, 23 Oct 2024 19:45:39 +0200
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
 <67192f00.7b0a0220.343b2b.9836@mx.google.com>
 <77e99052-a14e-4495-9197-06d98257c590@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77e99052-a14e-4495-9197-06d98257c590@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_104545_985773_D8031A3F 
X-CRM114-Status: GOOD (  27.06  )
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

On Wed, Oct 23, 2024 at 07:39:01PM +0200, Andrew Lunn wrote:
> > Well the first case that comes to mind is multiple switch and conflict.
> > I have no idea if there are hw strap to configure this so I assume if a
> > SoC have 2 switch (maybe of the same type), this permits to configure
> > them (with reset pin and deasserting them once the base address is
> > correctly configured)
> 
> Is this switch internal on an internal MDIO bus, or external?

External so it can be mounted on any SoC given correct mdio/mdc.

> 
> Most PHYs and switches i've seen have strapping pins to set the base
> address. It would be unusual if there was not strapping.

Same feeling, but I didn't found anything in the documentation.
(actually no mention of hw strap or pin)

> 
> For the Marvell switches, the strapping moves all the MDIO
> registers. This is why we have a reg at the top level in mv88e6xxx:
> 
>         ethernet-switch@0 {
>             compatible = "marvell,mv88e6085";
>             reg = <0>;
> 
> There is one family which use the values of 0 or 16, and each switch
> uses 16 addresses. So you can put two on the bus.
> 

Yes this is what that property does. Everything is shifted.

> > > > +  mdio:
> > > > +    $ref: /schemas/net/mdio.yaml#
> > > > +    unevaluatedProperties: false
> > > > +    description:
> > > > +      Define the relative address of the internal PHY for each port.
> > > > +
> > > > +      Each reg for the PHY is relative to the switch base PHY address.
> > > 
> > > Which is not the usual meaning of reg.
> > > 
> > > > +            mdio {
> > > > +                #address-cells = <1>;
> > > > +                #size-cells = <0>;
> > > > +
> > > > +                internal_phy0: phy@0 {
> > > > +                    reg = <0>;
> > > 
> > > So given that airoha,base_smi_address defaults to 1, this is actually
> > > address 1 on the MDIO bus?
> > >
> > 
> > Yes correct. One problem I had was that moving this outside the swich
> > cause panic as it does conflict with the switch PHY address...
> 
> I would make these addresses absolute, not relative. The example above
> from the marvell switch, the device using addresses 16-31 has its PHYs
> within that range, and we uses the absolute reg values.
>

They were relative with the base SMI implementation in mind (as we would
then offset) If the path is to drop that option then yes, these address
should be absolute.

Or do you think even with that option, these address should be absolute?

-- 
	Ansuel

