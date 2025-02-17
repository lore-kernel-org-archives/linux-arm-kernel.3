Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0C0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 22:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=; b=FI5Sw7vXMhnHqTsJv0nb0uB5kV
	DpuhluYutahhpPEGBSoqdQhCTKIPbOB9kxUdgXrjAN0vFkMQaUE4QqOGBpEdPPi8WQrivFrseif86
	r76cwWxD7qXRqTiGhmX0zG07/4lYUA2naxa7M8JGJDIZp+pSFqYKIXLRBCi2f+eQGRIV7F0m1ObZq
	XrvZRzxe3Zf3FrR3kjOszl8VzPC6C2mYmIBVkwzy6RvwczcYIfGzE/q4x2WctZpMA2OaIQCU5Nn2D
	zXrLgQa6gFS/Vf41QNeyFL4ojx0UYFcrbzu7ZsVGibSJAQzKTNNQezNjaA5SbHnY+gzx9n4h/fBTe
	YQjpuNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk9yG-00000006BwA-2siQ;
	Mon, 17 Feb 2025 22:52:12 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk9wk-00000006BfP-3s46;
	Mon, 17 Feb 2025 22:50:40 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7c07cd527e4so310165385a.3;
        Mon, 17 Feb 2025 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739832636; x=1740437436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=;
        b=McM/N2Q03eMeptK+MtE4lpH26IjIOLLgkx6XFsLMXs89i4cTHVV1CYqyyT0zoFsaQH
         0uDGu0sntWZP3fMPG9R8JOD5NKhdYNu5NTWY6VM/aDAn17FKaTXVKkEB2EExOcq1fAtM
         7tt62xmpSjPxQLf75141ooBCjegzvHp78TC+65fq4sxnrymZbKUvAelhY6m7PCOffwI5
         m62poTMnSwT7L2mDc4gk8p8OuHnEc4dNMWRwME2WxSM2ShyWQBVGPR+sKG/Cj4/tjMZo
         Kklgu9+SYlROVlTGjjt3ekby9pA98N6y70UARsuGJrmJXBrmIkkBTRw63RPEYm8nLaat
         8EtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739832636; x=1740437436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=;
        b=qrSdxzh6eXAqBIk7Am52fyZ+uoX9OwU8nE5MmcKmo0piK3ZEEaoB7YudD4erpBFFC6
         XsJS8mv6u+TyFN2Ee8UJlEF+oo8rUO55Op7KmNAO3/TSuUGgY35H6oaKBWbMN0tsuIeT
         W5xGUj56SdSQaGTMBTGwPhIgsBBf4VueMWjZqXU9QPUsd6X99v3BX1dXO0S0YmeduaFB
         ktbBMdfoiJHwjvcr2oz7yCW0ZJojz8ONHVHS6K4Gb63PWYihj84e4Aqrb+MXwG9PeQWK
         kU+abFk6Mw6YNvRD77lbfH/fKJCsvBgkFFAr3kP8gvNC+9/DEf4RiRQf8fUWhHHWL+hb
         oY/w==
X-Forwarded-Encrypted: i=1; AJvYcCU+scXTIWlq8eb85oSbxFypTEBlmBcurHrt5C7n/cvi5+zU+X5lqGWMf7t9ZZ3sTP2IW4Y8FhzRXbhIit0=@lists.infradead.org, AJvYcCWmBLZbkgQCVmkwQ1LjBPs7IVE6WPdj+LqnWN4hGBC0Ud/SpF8/5RHN61mqv5MsR34go8Y/HAP+IMvfMY9ApBQR@lists.infradead.org
X-Gm-Message-State: AOJu0YxDcWlCrWDXrmhuyULAVaBW8SOXMh+Zy9kcJVPGIQZ9EZg664PP
	fyxAgbxFpRL8VS5fYZlTy22ayji0L0RobBgZ1DPx+EExjLSToJjG
X-Gm-Gg: ASbGncsVcb3DQvQ5XyeoKiPz1kVobkaF8M/G1/RVE286Hddyxo+fGLRdO4QbcS88Mf2
	RhT+OTgRJUpnLGEG3hPCQYmEW1pZtWJBOEVjxqfqlozMTk+8loUGVWk0BYLzdrX4uVYoWT2w8Zk
	bHIUnt8BaxD6S/C9/wrjg2DNowJHkNkLvzyN9cwxDdQHArRjB8yKuY34EVK7T/88JteC1KrWYp4
	cLlOUZUemGQTwgueihx7WAcekYi6TMOIO63WkPdSsJxJHTB8675uXzD06XEXBF6vVk=
X-Google-Smtp-Source: AGHT+IE77k8p+mAi1BZHXw2Af6ibqX9QoECI2nv0Dz4rUPqmmgRmUNBBDIKtrBxkEobOVjl1YJiisg==
X-Received: by 2002:a05:620a:44c7:b0:7b6:d97a:2608 with SMTP id af79cd13be357-7c08a9a6481mr1561011085a.17.1739832636093;
        Mon, 17 Feb 2025 14:50:36 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0971334f0sm208792885a.56.2025.02.17.14.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 14:50:35 -0800 (PST)
Date: Tue, 18 Feb 2025 06:50:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_145038_963594_6DA300FB 
X-CRM114-Status: GOOD (  19.78  )
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

On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > I am not sure all whether devices has this clock, but it appears in
> > > the databook. So I think it is possible to move this in the core so
> > > any platform with these clock can reuse it.
> > 
> > Great
> > 
> > The next problem will be, has everybody called it the same thing in
> > DT. Since there has been a lot of cut/paste, maybe they have, by
> > accident.
> 
> Tegra186: "tx"
> imx: "tx"
> intel: "tx_clk"
> rk: "clk_mac_speed"
> s32: "tx"
> starfive: "tx"
> sti: "sti-ethclk"
> 

The dwc-qos-eth also use clock name "tx", but set the clock with
extra calibration logic.

> so 50% have settled on "tx" and the rest are doing their own thing, and
> that horse has already bolted.
> 

The "rx" clock in s32 also uses the same logic. I think the core also
needs to take it, as this rx clock is also mentioned in the databook.

> I have some ideas on sorting this out, and I'm working on some patches
> today.

Great, Could you cc me when you submit them? So I can take it and
change my series.

Regards,
Inochi

