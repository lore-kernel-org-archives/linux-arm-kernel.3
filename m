Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED41C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0wE4P228NG5zm6ve2xonCuTbgzrvTUWCSJfyvGiQ0E=; b=Fx4QZQWzjNEk967FaCR/1cwmsk
	8iiwUOGMbu3b2Bqj5GP4WFDkiunvWuNrNE7NvHy/DbPC8VhEQmkKSP1WynsIFJo4dbo5VtQJwmKxk
	Hxw8mmsvqHDIv5Ec2vqaIGpd02iQHQ0Lxs2lEb9/5iX6krw+ELuQs+BPLCDjzML3+DPcc3Iym4mSx
	7TuQC0xEqJ1HGRjviICLBvz44fz30iIdnTxmZnipQdZCkNjJjp5bUA/7in07IrxqV0IySaykh7POV
	ynACTBijRMp6lmYMJeYVn4OhobONLyF/y39hBjciV8+1migIhzWSlsLcOdcgPar8ob1j47vcQ3ckl
	NTcdBPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNVj-00000002EU6-1CSz;
	Mon, 27 Jan 2025 11:42:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNUR-00000002EJa-2ZSO;
	Mon, 27 Jan 2025 11:41:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4363ae65100so47034185e9.0;
        Mon, 27 Jan 2025 03:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737978073; x=1738582873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v0wE4P228NG5zm6ve2xonCuTbgzrvTUWCSJfyvGiQ0E=;
        b=QWPfovSCAUDC3iZdzNLS0tGfqMgYdWrkjZoXvAmYwWu+KUvpt1uoPfoMZm+0bJYlQf
         PPMWelOHdZ5tv6cd19sGzQGba6SNmf6widJao8zA4hyU5OT7TqmBN4R67I7Xx0hd7UWa
         OaqQbT3F5QRMrkaKPGVV81+z9TkJh8upQK6FcmU+00AMoPycsETVM8Yze5xcNW4bFSqb
         1S+1Ztpfz7dr1Wme9a20rqCOtuxgQV49RrBmDb02I0stJRPIMs71Jiwf80u76GHb6JaK
         2IVMUjHIhnedS2DiXAnI2/a4NqnJMJRyD52z647hT9EObVfnWCCLiEuCqxzM+AzJP5rM
         kkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737978073; x=1738582873;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0wE4P228NG5zm6ve2xonCuTbgzrvTUWCSJfyvGiQ0E=;
        b=UB67ADIUYOSgdOR39zJN+KE5/QlCSvaggLjd/29LDhy2oj30LLGm/238TYeLe+1VrK
         zuaP6VY6Uv94D8rZjhFWKMY30M+9ZuVzZk0Ys7MgEeRkpN78nd4+B9LqCD2KSeXjlY+Q
         LzFZC98yid/0rHfaxdlEIUhheIcZhS6KE23ly2b7CSEEb4nybaFruWXPy1SnJQQzpj6+
         19p5qlWP2/7SA8J6mSV4j114a9eXwnPMUKktpVw5hFRJPiAHhZGDXqC8fBuLtW88J6PY
         boLToqTqWl/Lb571DZ9lLAqqD4nEhxZLYbomEk6HSHyLFLBkiuPozzdjqNr6ZuWO1D0V
         C1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHx1FHq7D7VNPnh6vr7akK76aEJIKL0t0Qln3xgJaiIS2E4RZxazwrbnPx9N6RkJ9qWEC1kj49tMjh/1GbhGI=@lists.infradead.org, AJvYcCWNnd7XYqHJq6w/PTSxVzzkrsOxdrD80UvC0lw7yEXjEdzBgjpKcPrQ0VTp24AWxyuZUiSVu8jT0hxqj3j6oz4Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yz79toXYt9CkpKv/3CVa8rO3k6V3DiII7R/7zMpBqsHwGAkYBZo
	IlD4/7UUHznuMGG+WAzf0rxK1ClWRLzBT2Fkp0tib34LucuVIrMd
X-Gm-Gg: ASbGncu3iyZqH/ZF9x5EyjTj91LDD4rT4Xl0AQDyfCpS9AWzwW4GmOon6a/pF6RWSNo
	MG8BZZBZX7xnzQX3pYWbIzYGCQ1pZXErzZ5NBsoSs5qCZ5LoEbQ2AqwaBAlFsq0zi/F0XjGhB5l
	G/GiXsPcyqADfGARRe3noN3aAuozJIb0+UVWJhMZQo99XDFm+KFqyasOJnEUcxLbah9slOJWr01
	5dn5zdGCdMmSamO3JgKNzFCZRWP4kV735u8XhNNBig1URsm/ya/o2gOWd4NSOe9vyoTOh8mF5u9
	peI1WMIao8X8WubOHJ2QOj+AWvxSYH+KRFR+
X-Google-Smtp-Source: AGHT+IFBKfZ6lr05IuG32kozsCnly6M7wesKyPODFe2rVTS28RG+C7fl3v+/QSC5xC9yaXhf65GrcQ==
X-Received: by 2002:a05:600c:1d20:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438913e1b1fmr447704935e9.11.1737978073350;
        Mon, 27 Jan 2025 03:41:13 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f367sm128606055e9.7.2025.01.27.03.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 03:41:12 -0800 (PST)
Message-ID: <679770d8.7b0a0220.b6f23.38b4@mx.google.com>
X-Google-Original-Message-ID: <Z5dw1q4hoSsDWjNA@Ansuel-XPS.>
Date: Mon, 27 Jan 2025 12:41:10 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
References: <20250120184728.18325-1-ansuelsmth@gmail.com>
 <20250120184728.18325-2-ansuelsmth@gmail.com>
 <20250121-zippy-umber-fossa-abbfb0@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-zippy-umber-fossa-abbfb0@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_034115_653537_83B727B3 
X-CRM114-Status: GOOD (  18.15  )
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

On Tue, Jan 21, 2025 at 08:59:19AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Jan 20, 2025 at 07:47:02PM +0100, Christian Marangi wrote:
> > -			pinctrl_select_state(host->pinctrl, host->pins_uhs);
> > +			/* Skip setting uhs pins if not supported */
> > +			if (host->pins_uhs)
> > +				pinctrl_select_state(host->pinctrl, host->pins_uhs);
> >  		} else {
> >  			dev_pm_clear_wake_irq(host->dev);
> >  		}
> > @@ -2816,9 +2835,12 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
> >  	if (IS_ERR(host->src_clk))
> >  		return PTR_ERR(host->src_clk);
> >  
> > -	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > -	if (IS_ERR(host->h_clk))
> > -		return PTR_ERR(host->h_clk);
> > +	/* AN7581 SoC doesn't have hclk */
> > +	if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> 
> Please avoid coding compatible in multiple places. Not only because
> above check is slow comparing to check on integer, but it just scales
> poorly and leads to less readable further code. Use driver data with
> model name or flags/quirks bitmask.
>

I implemented this in a more compatible way so we don't need an
additional compatible anymore. Soo this series is not needed anymore.

Should I flag these as not applicable anywhere in the patchwork systems?

-- 
	Ansuel

