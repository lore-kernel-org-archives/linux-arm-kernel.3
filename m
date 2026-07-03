Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6628C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB59yWoF1xJrXodhOCNsO8AMkW1gWMSY+FjvASquQ6Q=; b=nNc8tLbS60ZeMTV1OScyOilHZh
	7h5m2c14bmDoJoxbZkWAZ05DztTgAEl/bOfF8MpcQ5qlmYyI/AS4QcNG98hHwJkMCMuMop00NykO6
	OE+EZGGQ1o8Sk4JyMCW/cMwV2sux2MVju98uwDGIsnDyNsdiCqCLyppKaX8iyo61p6WuDevj2hW7q
	KLab0k0dpu9SZ3rKbZ4RtOcIRUdUvz5idr026yOkjVzbmPClPC860NflrrnuPtmMFDVg8M1fBrwPp
	p362XdJVrY5I04/Q20hrjOc9FyY3Jdc/l3ZP6qDNrAJ2Ko4y1xGGBS1gb/aUCJPkVybv1wKYdsiaW
	D7Cb60hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffGc-00000007KOR-0aQx;
	Fri, 03 Jul 2026 14:53:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffGa-00000007KMx-22gF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:53:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so4250285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783090398; x=1783695198; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QB59yWoF1xJrXodhOCNsO8AMkW1gWMSY+FjvASquQ6Q=;
        b=Zj9fAAzK2YC5+3EGJL3gfz59MxkEO50BsMfp/MCoZAk/GKoAnxDf/ledWuxohYr7XW
         sPSjuDCP7ECf69DjFCI7W7ovPGcWKmr6rAC5nLLjoQTxZgKc5G9T9EV9KaZCTYR4BLoO
         9P1APSnyPFB3r7va6wn7UZCraTNs05k5dZhJBQ5nYzcyZvgdJHHBEMOoIZH3YdjCeb4U
         HIgwdyX9coACBg6ZUmWVOFzKJq7zasED3Sbgd/PTuPpjn0ewqqWUrrqwmo5h3CKlRSrY
         Tq0WENlvVI6bC1Oi2uksatcC4o8y7yf/+4N1roptuQPQ00YRrZbiJ5y3kGzQf0aZyhQO
         Gi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090398; x=1783695198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QB59yWoF1xJrXodhOCNsO8AMkW1gWMSY+FjvASquQ6Q=;
        b=jE0+SWeivDehBNSlT0y2rj0eH2dxwv94aWvlG4vP0CAY9rLWjIQRBgR+IicW+Pr+Ib
         4vmLMhieT+e3w2gKDV9gLErm2aoYcW0qKdU9Cq4JPYvJYYG+8NlRceMbkZ9+AT8rFUsk
         UdIHrij/5deapABTeK9H+S1Smq5zRcRlhq2uk2MUANstzCKSdVrhFRWjMXvBsf2mIN2S
         HpuxbFlK9x1LDHgJ2DC2VnMbGgEiYSbikPbImwI8ETm4iJ+PwqKgzxROfxIZ+I2TN1db
         lv+qL3JpsXDSyoE/S27yh0RF1oNHBt7hsFKKRcooWV/n+buDEsrHv0SsgHZqJvTXMVOa
         PIGA==
X-Forwarded-Encrypted: i=1; AFNElJ8ECjGlOrsgNlIAoJyx0lXV9HjHWmxonIhka4RCHm4Wf3/bHiEq6lSHPq0hyBY95/sP52N0cwoM2EaQFEWmE54J@lists.infradead.org
X-Gm-Message-State: AOJu0YzZmBkgrVQCW9PtfSF5WW97+CKsmiA23xyPl0NAJdAJIQmllpJq
	uaB2vK6XqN9cc4r+AWhMfV3Sf5VV/owL3dNiQJJfPRCUFB0jjzFMkXsib/imfquORGY=
X-Gm-Gg: AfdE7cldHlrXvOKJFkdSuRFFFBGfZSOKT7SHyt5TCXb3Ic5b7OfImpnW4pv32i5zvHr
	ZwYgUYzmybxFgHjYRA50JiZ8ha3bF7N6hRXIHlvwdjqh8kplnE9VhE4aTnQp7jTJnPStWNs0I8V
	GQR6/Ssue76jS7oS40qGjGIAe8zhhvIpVP4ZFkK8090wLaBsm9wKVFtOd9vNEfW1WAigaWv+EWc
	+Dlr4UuvAsE6Br27324TgjdaDpA9ZJeuuQ8ra3FvcMWThSuM++vBOLVadGraSil5voilkKD+A3F
	MAxCHB1k89QclMPZm7j3/2OapPvM/DHPyHoyV+Mg5BvnFrb8TBkakI/UDa2dvAfUu18lAQgvPhF
	dvV62/v4uae13LrIad3sTH/Kng6Ji3DrNdE3Hq9s+AR6Q89i8ux+sFech30kUnzC2Veprawy1/9
	mDxSHp5W9nXFs=
X-Received: by 2002:a05:600c:1988:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493d0f43052mr2171635e9.30.1783090398625;
        Fri, 03 Jul 2026 07:53:18 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm17320171f8f.9.2026.07.03.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 07:53:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 3 Jul 2026 16:56:44 +0200
To: Julian Braha <julianbraha@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v5 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <akfNrGoa0bitVSu9@apocalypse>
References: <cover.1780670224.git.andrea.porta@suse.com>
 <f8dd46a553351adaf9d29fbba9f98e803b672fe7.1780670224.git.andrea.porta@suse.com>
 <0b6a7f41-b753-48dc-b46e-77aaf0e999f4@gmail.com>
 <ai-dNlC1_nbQTy5Z@monoceros>
 <6babbdea-fa93-4cd7-8198-5cd3accc34cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6babbdea-fa93-4cd7-8198-5cd3accc34cc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_075320_543344_5C97D2C2 
X-CRM114-Status: GOOD (  14.36  )
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

Hi Julian,

On 11:29 Mon 15 Jun     , Julian Braha wrote:
> Hi Uwe,
> 
> On 6/15/26 07:37, Uwe Kleine-König wrote:
> > IMHO selecting REGMAP_MMIO explicitly here is fine because at least to
> > me it's not obvious that MFD_SYSCON enforces REGMAP_MMIO.
> 
> I think it's better to use comments to document non-obvious behavior,
> rather than dead code.
> E.g.:
> 'select MFD_SYSCON # selects REGMAP_MMIO'
> 
> But I guess this is not really worth bikeshedding over.

Honestly I don't have a strong opinion on that, but documenting is basically
the same than just selecting the option (well with the addition of the #), so
not really a difference. If there's no major concern about that I also wouuld
prefer to expicitly declare teh selecion of REGMAP_MMIO. 

Many thanks,
Andrea

> 
> - Julian Braha

