Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C64C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 12:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=; b=4yHFUMpFPpYo4Ub/xevwoIjOUP
	ssvxK/YuI8YsTAKcWHpAyAi3ajN2HUE3V9MJkr5x48kGXP707FnxovB8KO7qPmi7WoUKmgswI1/YE
	V92XJxTf7NhiaC00rCifbLOrWnhzD2zIAR2Js7yqRrIc05zsrah7hRuY4f5P5vt5XO6DAca75s8M4
	G8rumHCjhtqkX62GqQEx+xr8/edt1yOK98+7blu8iwAWLQfArNOSY3aSSpPsBq8NAqVDodnX3HBVY
	mo0bBaz7DuuyhthZUIry1cz5iL52ftUYWW/X5qJQCXmI+dnQG6hDLx9BH+ByMtVqM0b10ixrXvlip
	jpWzwk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdYq-0000000FJwe-1fGP;
	Wed, 07 May 2025 12:07:40 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCdTW-0000000FIZB-1yYs;
	Wed, 07 May 2025 12:02:11 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-4c32ba00861so1929290137.1;
        Wed, 07 May 2025 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746619329; x=1747224129; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=;
        b=C3jNWQz8fGBSIoq46rqT8nWYfZX2/VvDjVKmx0aLQqRPYwSLRDJTyxqTDHeaSeOVXr
         JB0aVoJ4vCdPQvTv31MMYkllIdzsIP7jOxGXZAWtE3khy9SgvSfi3h8dTXZ6mpCdfIeY
         Ja0nIM1t5OiyQ8XuMG0ljWEd6l39VHFgP68JpTxbPIR5Rlt9CVh1o6OH38h5zjasdzuA
         Gx51SZnc2z22r1gtNshI2aJ0uQfQ/rh15Q3z5WndkeMQ71CZggM3qrg1gUK49/K+Tvq4
         ZXLASyVLKWYQJ2UOOqo2c/0vv4vQK2cbsLXFMkFvpTEFixyDGwGxoquQjAGaNZq9bQSw
         24Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746619329; x=1747224129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=;
        b=HTo5jKwmuFSrsV7YnDzjab2pG0xaCnQPUmsT8rH1ZXGcuWYckdGZWpLtBD/NOweDGL
         2LcSwYQdmSsjWglznS33uNnj2my4OADj28k7Cz1Rirffw7O3GAAZag0oAHFhtAKuvfy+
         AEKZEDGJElx17cMhWVWV4qfoierZbNoenkD7aGJWR8uAe5dIFpX+Rj70mEoOPM3KjmM3
         u4KT+mR4WNrdTMAizQHn0nP8haJbEG22lmcCfh5W4j7Lh298TTdk7phFxpclmvsI+u0m
         /QUEzlP3TpFx+b75QFE0yuQVLwKeZh2PSQvR2t2XP55pC7YWU3o+ll2zfD3+g8oodopU
         M2nA==
X-Forwarded-Encrypted: i=1; AJvYcCV4DcvMJ8GCFVAeDlAeDQ/ZcpGQiEKjGOF2NtbF51bOCBJXNFIX01LDuqVO+QgnZ1ukdkCLP+HMgxj+VAk=@lists.infradead.org, AJvYcCX9BzC2GNbIDr+DteolZN2v9+TaNL0Rz8zolNlsihmWIxcEQ7PhWkQye15f2bdnWgKDGFxzB3nezvMnwGQtsmEZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv65WxtDqKYgLYURdbQROUp6ObqUnByssH/4DH88EKiYCYhoZh
	xP+LlRUjyW5+Qzjyok8DEHhYXYaWGQ/wnc6k84zNExv+5W1K054sInErnw==
X-Gm-Gg: ASbGncsRFlwLVIukVT8VMrsAYPNe2yMh9Ur7jFCkVQ3znFzXqIGGZaawO5xoEnK8N7B
	qQLlJcMuilG3wwd/dQaTmQbGKHYp4UFDGuIfRAM4f4hsiREszeRpdsGg4gVIi6q+kb8pxRPi2FK
	6ZfxBnV9itxD3QA2EmkogbKWV93c/9nJJmutQ0H1a5Gf6FH4B4T45IYWmWgl0rmZcTqDvrbigll
	NrKZm6WwPsHEyMc9008PulawnLePvDUF4iUrJioz8tW4fYK9Sq5++FDPUPzXWBS+oqYOKQJ1EVl
	eVmH/p+1u0YdZWjq
X-Google-Smtp-Source: AGHT+IGRl9BUi1WrHprzmvGHRtZmly2KUBbHCnPcITRG9+w3NMHRJoWIA8I9LxLmf29VDGt76SQFqg==
X-Received: by 2002:ad4:5dc3:0:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f542b31434mr45097126d6.43.1746619317492;
        Wed, 07 May 2025 05:01:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f542647e03sm13464756d6.29.2025.05.07.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:01:56 -0700 (PDT)
Date: Wed, 7 May 2025 20:01:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Romain Gantois <romain.gantois@bootlin.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Lothar Rubusch <l.rubusch@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next 0/4] riscv: sophgo: Add ethernet support for
 SG2042
Message-ID: <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_050210_508132_D63D670C 
X-CRM114-Status: GOOD (  25.56  )
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

On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > tx clock. Add device id for it.
> > > > 
> > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > does not expose this device.
> > > 
> > > Do you have a patch for this EVB board? Ideally there should be a user
> > > added at the same time as support for a device.
> > > 
> > > 	Andrew
> > 
> > Yes, I have one for this device. And Han Gao told me that he will send
> > the board patch for the evb board. So I only send the driver.
> > And the fragment for the evb board is likes below, I think it is kind
> > of trivial:
> > 
> > &gmac0 {
> > 	phy-handle = <&phy0>;
> > 	phy-mode = "rgmii-txid";
> 
> And this is why i ask, because this is broken. For more information,
> please see:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> 
> 	Andrew

You are right, the right phy-mode is "rgmii-id", the delay is not
added by the PCB. It seems to be better to ask for the vendor about
the hardware design before copying params for vendor dts. Anyway,
thanks for reviewing this.

Regards,
Inochi


