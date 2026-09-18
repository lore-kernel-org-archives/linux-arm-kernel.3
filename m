Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326E5C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=; b=swyYGoyDQYcRuWqkBS4oTB1pKA
	G1EXgZbnCx2ubNiNvgwNQ3qxyk66UJ+szaIwXpi0de5tOyv125LxwSAZVyJjvi05CVrs6WBHvW7xe
	z7h3lP0XuenDvjU7XWGmc/9ZE9X2MyjnbU0NtuvqxLvkOtmLToCo3PD3mBWT6/ToepIi4a0uNzXg/
	QJGeZiMyjgM0URm5Qgx9Qkp1Bn2mOdSMqYV7gWfYLswURRyloSh2mEtqRwdK0podcynRth9PpabJX
	pEncaGScRK9DyHT/DLhu5qtAMUn1TUkQauPDZY26kh245dGsfWw05B3pX2Znbsptw2SDkrR8aAOk9
	+Q9HRvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sye-0000000Dgyt-2XUN;
	Fri, 18 Sep 2026 07:25:45 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SyY-0000000DguD-1YPb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:25:40 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1101605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789716336; x=1790321136; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=;
        b=FuA+tPyZd59ImXD0iC8Z9nsvhW4RhVAR5zbfnAe43O2oWt6dtmfm+3VkKgp3quFgCl
         aeBGxFFg94vdUoob4zf2QszMiIMRqFk9tQnHZvYWUost6Juu7ZU09b5byASenCip1WcR
         UdlOEg2PABNVJvV1Vb59pAUjOfXbrtC2oEdEksnrOW9qZ5TRlp2NT7FBXywIItwQU8YA
         /4a8SMLP9iL8EBhkHQZz7hb/osalK91TIvYGnGE49iln16WDIQCl4cf7QBbvYrf5oIQ3
         AUzRAXdw/ZctgpCQMcYDAVO0jzxF6W6h7r4hY8EjZn781xMQHq+gWQFdX9IvO1DkIWjV
         HKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716336; x=1790321136;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukkkk1BOu2H2mNX0r4yxWxK0V7RNJdbdGm1o4o23Fno=;
        b=k8aiqEk5cjQdK+yweuO9b5ECXuwZzl7OoHt/655fKdcfSs9apevzI6Hp2IqxLQIFeC
         cmtabGjiiLmQGVAMAE2ShiywVbWa5ns4qa3pIhEsxYNhCHIY6QbuXg3f4OQevkl+gXle
         7py+jnWd2qjr0qkss8YB+90oB2L7DWSZ7nHf3vkNR9hAxCNYHs1V3J/ibU8xdzaBUR+3
         BMO2eA66Cw8WgYwsZKWfUhZZIBNwkTK3hN6/FPcZHZh1OkdeFRvFT7IWlhdd4nZ7oR4+
         bha3mnros6TUee1iMEWCnTjGCLJHMkGnKyrKQsP7rUVG/Rfmf08lFZv5HG3RuxrsiKoc
         M95Q==
X-Forwarded-Encrypted: i=1; AKwUvBx1Ek2XitwSzhKPdeqlIAy0ean5A35sPd5W7C6+L0pTalagcYG28MzjS3NIr4lYTjYox33xcVBUzRfyKtdaeGR0@lists.infradead.org
X-Gm-Message-State: AFuF++mKxGhimOHkA0v35T7KiTD5RrrmjnVMm8kcN6gfwzop5KBuLiT9
	TOg0aLA+5mD2zBvoiXrT4GDpk9PD+sE5uJSne49ryf4buA6hxn+8pCUS
X-Gm-Gg: AYBFou2GW6Rf8r+N+hBvSZCOATGcIbjuZ4aRa2W4I64KHbbyO9uQ3ucnOLFkg0tdldp
	4j69akom3NxI2pBIwENtlO6IUqTKmnBKgM1gG9KBYpew04uPODyhpomKWZSf8HqjFkjfFIdx+3x
	8KSrLwYP7Om5bA9Iw0i4CK9wN1a7g8FxY76GTklUyU1nsfspeGmiCevbiA0Rdax+DztAYQzll8v
	EqBBzAdiOtMiVSPhvjmC3FH6Wz9UjIfrAyV2IK7JoWL58khPzkDvbzO0WB4j47mTw6lEgznXzWz
	j1eJ61pCbDtOIjbb7emat5dv87MClTEx0uPQx32GruszkAYV33cmcraulKbhot5PSmJrP7mEGEf
	oVG2/mG/gb/TGvRhUA0KYmBEQaVn6elEZ+az/9rNIHLkRfUYUk/o8ku2ekRXAK/dYS7pYoM+GU0
	Z8I8z/X7w+LZipPWQoQu09fDw9K1R5Rdp1M+Q53iBJgkJzbB8NLQjLb+/h8H8WFgYbS0KrIRaeG
	3jRHnaCUc3OYFYvZmS1vG3O5a5MAE6HHJfBfTapuzUFVzn2eQ7cM5ETp/LIrF9LECswttd59QHw
	GDlXrGgYW/5fp3wujjenEeu+FG1x0isQCmaHCOMo56bvoP/wTjzXV4gQ1p/OB14bFwWtFcFkbiG
	R9kT9Xf+o3iy7HnF6ojfEEXChUUk/MpUE2a9VogcpaqkS1BpenTZ33NctLzlkV8YGYG3iuDXrjg
	LykxwO
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr21569505e9.14.1789716335748;
        Fri, 18 Sep 2026 00:25:35 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm33027395e9.0.2026.09.18.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:25:35 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:25:33 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Peng
 Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: imx: add missing
 pm_runtime_dont_use_autosuspend() calls
Message-ID: <20260918092533.00004dcc@gmail.com>
In-Reply-To: <aqwzG_24bZSSQhTS@SMW015318>
References: <20260915103345.1334-1-joshua.crofts1@gmail.com>
	<aqpgUPWUGZp5Cjzt@hovoldconsulting.com>
	<aqq_ymTi1I951uQp@SMW015318>
	<20260917102429.00002faf@gmail.com>
	<20260917104233.00007a85@gmail.com>
	<aqwUky1jSMGbiXCf@SMW015318>
	<CALoEA-zMXhy1VX1MLVCy3d9pmC0fx22sJULamLhMmBX6xHutwg@mail.gmail.com>
	<aqwzG_24bZSSQhTS@SMW015318>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_002538_434415_6FEB867E 
X-CRM114-Status: GOOD (  33.81  )
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

On Thu, 17 Sep 2026 13:36:11 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Thu, Sep 17, 2026 at 07:15:29PM +0200, Joshua Crofts wrote:
> > On Thu, 17 Sept 2026 at 18:26, Frank Li <Frank.li@oss.nxp.com> wrote:  
> > >
> > > On Thu, Sep 17, 2026 at 10:42:33AM +0200, Joshua Crofts wrote:  
> > > > On Thu, 17 Sep 2026 10:24:29 +0200
> > > > Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> > > >  
> > > > > On Wed, 16 Sep 2026 11:11:54 -0500
> > > > > Frank Li <Frank.li@oss.nxp.com> wrote:
> > > > >  
> > > > > > On Wed, Sep 16, 2026 at 11:24:32AM +0200, Johan Hovold wrote:  
> > > > > > > On Tue, Sep 15, 2026 at 10:33:43AM +0000, Joshua Crofts wrote:  
> > > > > > > > Several drivers in the clk subsystem forget to call dont_use_autosuspend()
> > > > > > > > on teardown or error, causing potential resource leaks. This series adds
> > > > > > > > the missing calls.  
> > > > > > >
> > > > > > > No, as I've explained repeatedly elsewhere, it does not cause any
> > > > > > > resource leaks. [1][2]
> > > > > > >
> > > > > > > The autosuspend setting leaks if you will, but that only matters in the
> > > > > > > theoretical corner case of someone rebinding a different driver (which
> > > > > > > will soon also taint the kernel).
> > > > > > >
> > > > > > > So don't exaggerate the impact, this is essentially just a cleanup,
> > > > > > > which is fine in itself.  
> > > > > >
> > > > > > Is it possilbe to create/improve runtime pm API, let runtime_pm enable/disable
> > > > > > include these pair functions.
> > > > > >
> > > > > > I get many similar patches since scan tools is more powerful now.  
> > > > >
> > > > > I suppose that could work. One would still have to scrub the kernel of legacy
> > > > > use/dont_use_autosuspend() calls though, so it could end up being a large
> > > > > patchset.
> > > > >  
> > > >
> > > > On second thought, some drivers do tend to disable PM runtime system sleep
> > > > etc. so it probably isn't as simple as adding the autosuspend stuff to
> > > > enable/disable.  
> > >
> > > if runtime pm disable, does autosuspend still work? suppose it should be
> > > disable also  
> >
> > If we add dont_use_autosuspend to disable then every time the system suspends
> > and resumes we lose the autosuspend config, meaning it will never autosuspend
> > again.
> >
> > I guess adding dont_use manually to the driver's remove() function is the only
> > way (which according to my cocci script it's 195 drivers that should be patched)  
> 
> Extend with exist pm_runtime_enable() and passdown delay value. if delay
> value is 0, actually it is no autosuspend version.
> 
> and merge dont_use_autosuspend() into disable function. And actually
> I don't understand why need two varible autosuspend_delay and use_autosuspend.
> 
> when autosuspend_delay 0, means take action immediately.

Actually, what about putting dont_use_autosuspend() in pm_runtime_reinit()?
https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/base/power/runtime.c#L1865

driver core calls this in device_unbind_cleanup(), meaning driver core would
just handle it.

-- 
Kind regards,
Joshua Crofts

