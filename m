Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8F9C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 04:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=; b=tctVy7KuINovMNafU963ha18Nk
	ObgggKzoBkKLrsamcnS774YUZDdr3vuNvrPSvSAxtbFul6117aXq1bST47LDlIIz/e4GVqATih8zM
	XbHoZ38uxxafg3B/9XWIFaHUdNKk+bgUUGQYMOu6QTUk4spN53yIkeoPF4ZutfwiYrubah1ScD/SX
	IV8nJDHYNuhOoWf3dR069J16tZaz3+k+n9M2xkHD8D90MfByFLsliuYzAeO7KhTl+DAKQZTPNTggy
	BoRvFp8eLrLQv5Ia+tplgllfmVsKE1XMqYp/JKg3jStZ0+1No30EkcA9BGTVNsi62kCKprCRKpx+T
	ZyrrPo5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsaG-00000003CjL-3EN0;
	Mon, 17 Feb 2025 04:18:16 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjsYo-00000003CXo-0jJz;
	Mon, 17 Feb 2025 04:16:47 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c095b5365eso39236485a.1;
        Sun, 16 Feb 2025 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739765805; x=1740370605; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=;
        b=d9pe6TN9Oqj5xfFZODmva9aqWGOfJ6nAoQn2W/7CAiSS2UwrvZldHX2jVOyJrGC4yT
         64I67XuEnWbPudWnpeyfh/tZB1saY9ottho4kQoaQgbtBeKfnWZsKns6MRQ+gSglkbwl
         R48/tjPWVuaZKxK8KrmL1j+d34mqU/+Z0aRRxm4tmVYok4W3dCapyp2aWlqRcMFI1AV8
         +JFhgSouWkb2wHHPiB4Xas9nRCaDTyM2nIEH56kgVzPC6IopkgYWAb4kvNHKzk3/Vwsm
         4XZ9ojxtpzJoZPyvmOjMwIFgbGEs0An42bDNkEnNWNZSFwpxryAg9OQJ+IbOG+6YRKWT
         OWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739765805; x=1740370605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=;
        b=mFZdoj5du2YRjxGWUTqhHxkueOuKeqLnwffXc63K78JDGb060v1d9GRws8VfbOmOTM
         9qS0wQCUjRdVDst4AcjS+dl+yycRyrfs8Urwscd2kArMKI1ttjlH5XOMY2zR06h8Yh6E
         yiXyaSCN4lw+jEK6nwHf2mx28uF8ie/jzjrlpiy49ZMKliuTBiSJUOkNNbYKSDsoA3aY
         piT9M6Kn8eLxTLzokWRY8pwg9pcEJDIkq0pqkaUzvQ9PuWf9nFWR9neX3tZwi8e3wRak
         TbTA93Ys066I6GYkff5v/dd88qV/wcZDFpmv56aXueisyQ6Y1IE1CgRwvblzCozx+rMl
         WAoA==
X-Forwarded-Encrypted: i=1; AJvYcCV6S+IGdPKYb10eT4tCQam+Olmd7OxgFVOS0Nalbm8yw+Zon0SYyB5hLpyXdTK3DYOcDagvjYRnLDemHL0=@lists.infradead.org, AJvYcCXSR85MmPs3/VA9xqrnuZMOm4t3pt6Zf+I3DE0KuwXADKYYIaWaP+R45tlQA0kYJwYi5ChH/WhUriIL3UA5mJ/M@lists.infradead.org
X-Gm-Message-State: AOJu0YzEECdPTZ70HH9PZiq+9V2qpkt5oOJ3eL5XZQnz8xqDK/tP5azH
	Lv1VAT2ZcgK7FzZTLOVH1tdXCj19DEnO8bRYD806Lf7TY/0X34nf
X-Gm-Gg: ASbGncuLJhqbswgIGdmPthK61nzFLex7ugKp2nwLs759NK/29/5VajfJZFy0RlokuV1
	GQ6uwYSnpn67hlg+wp+NDujt6tO0MhatWy8u8Utyue6jYLOnEMhcTOAMF70nu7A4eqmWWTYQuKI
	8t7HfwqJsXnGGOGplT1CPus6X1hbF6yB3kMjTRQ9OdDjMUDcEPUsAOYQR0SR+/BAEKBgxCIOX3A
	HlVuaB+/oxLwpnxoVTOfsEEWCVD67NYmvEXI+OYAgORZx/4KtpaPzMXYT9ZWawXUGA=
X-Google-Smtp-Source: AGHT+IHUeYGGtto6/bwu6hE+gNTJFxMdU3WJnKYol+GAez3N8iWRXGYbLq/F4f11XJjWE3T4aBpX5Q==
X-Received: by 2002:a05:620a:172c:b0:7b6:d8da:9095 with SMTP id af79cd13be357-7c08a9a2157mr1155035485a.13.1739765803223;
        Sun, 16 Feb 2025 20:16:43 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09a14d45dsm102936485a.10.2025.02.16.20.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 20:16:42 -0800 (PST)
Date: Mon, 17 Feb 2025 12:16:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_201646_216086_08DAFF22 
X-CRM114-Status: GOOD (  26.13  )
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

On Sun, Feb 16, 2025 at 06:07:05PM +0100, Andrew Lunn wrote:
> On Sun, Feb 16, 2025 at 03:47:18PM +0000, Russell King (Oracle) wrote:
> > On Sun, Feb 16, 2025 at 08:39:51PM +0800, Inochi Amaoto wrote:
> > > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > > +{
> > > +	struct sophgo_dwmac *dwmac = priv;
> > > +	long rate;
> > > +	int ret;
> > > +
> > > +	rate = rgmii_clock(speed);
> > > +	if (rate < 0) {
> > > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > +		return;
> > > +	}
> > > +
> > > +	ret = clk_set_rate(dwmac->clk_tx, rate);
> > > +	if (ret)
> > > +		dev_err(dwmac->dev, "failed to set tx rate %ld: %pe\n",
> > > +			rate, ERR_PTR(ret));
> > > +}
> > 
> > There are a bunch of other platform support in stmmac that are doing
> > the same:
> > 
> > dwmac-s32.c is virtually identical
> > dwmac-imx.c does the same, although has some pre-conditions
> > dwmac-dwc-qos-eth.c is virually identical but the two steps are split
> >   across a bunch of register writes
> > dwmac-starfive.c looks the same
> > dwmac-rk.c also
> > dwmac-intel-plat.c also
> > 
> > So, I wonder whether either this should be a helper, or whether core
> > code should be doing this. Maybe something to look at as a part of
> > this patch submission?
> 
> Inochi, please could you look at the datasheet for this IP. Is the
> transmit clock a part of the IP? 

I checked the ip databook and found it is part of the RGMII clock.
Also, I found RGMII also contains a rx clock following this quirk.

> Can we expect all devices integrating this IP to have such a clock?
> That would be a good indicator the clock handling should be moved
> into the core.
> 

I am not sure all whether devices has this clock, but it appears in
the databook. So I think it is possible to move this in the core so
any platform with these clock can reuse it.

Regards,
Inochi

