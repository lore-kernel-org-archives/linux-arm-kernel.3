Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F1BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 01:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Edn74AFcsuP9KsL9TiLXPO+mD82mDfRGLigRZWWQmH0=; b=oE+mjj5WT9vHBE0Rvs1C+YztsR
	S+SOOESLkn/Ym82xmjYHU0X0NasvZ7N3pjgH2X45EhkXPv3AYVebU5xel7O+LJtjIgxhFxA4MofOl
	4IpxZHqNonrEst19YFjVU+oVGXMFX/dckc/+IDO79FURPByQ0dPuINyR8Do2GSCTJGf5COaRYWXXU
	6BnMwxEMxK/vLfmqdnnzFS5M4LrB2Qo/oJriB9YExpg9xFw+j0dkelIvxIh3lt8MdqEnSpb7+7r/a
	JlfpWgArwaGA/MzdRaxWq2jwgCoUrRu5ydfrBNjfZye1mY2B2LPkZWeCc5i2HrJhNlhGPpfOolMzC
	qwsZenPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkC1b-00000006OK0-3rSa;
	Tue, 18 Feb 2025 01:03:47 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkC08-00000006OAJ-1EUK;
	Tue, 18 Feb 2025 01:02:18 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c0ade6036aso10777385a.0;
        Mon, 17 Feb 2025 17:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739840533; x=1740445333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Edn74AFcsuP9KsL9TiLXPO+mD82mDfRGLigRZWWQmH0=;
        b=Xv9RnW3aCB7UVXStVlABvmepkAPnbXVXpzNLMIJqEUhmal58IU7uNhPHdJHdmT7X2H
         P9VeoBP1gIH9ToaziNBQqEJe1U3mbN11s6X7jO0E+Qp/415BX5Xg+4fcr9oIE4fi73Pd
         PUFqP/Bp/ozrekOVa1cb6BqLMoVsMZRcEEtttaRf589cnQ1zPazZFparGSGsX08nC++1
         oKki2B4CN20eM8cDIwCiL7kUKtqF/Z9R5kjhCljC1c0WaoazcD/hA/eo6Ix0dgZ4/lde
         0mavBtnjuY+cMjzyvZdNiqgPbAr4+/bQt8RFq5yzSBnsTOnSQLtOD6B4rNvPEdahP6+W
         vSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739840533; x=1740445333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Edn74AFcsuP9KsL9TiLXPO+mD82mDfRGLigRZWWQmH0=;
        b=QUjBTuMQUpzX2RU+7KZ2zF6Vi6KqzwooNccmqLmkyFmsEsGJXEylj7+hnVNEcMiIy/
         68AwnRS+WjqSZ6rRo0ZcrRv5MIrlj4AwEVjhW3juGG238A1jRxvTmwj3ow8I6Ro9yFqO
         wt/yy9/H9ScBTCKWOO1ubun6UypOl9IC6cQXo1RScBHvm6AowaEEvZvbOTApQDdMpuJU
         KMRKWrlAOLnQAVN+80ccYhSAHXpWrbU5j/B1oSZssGU9x5yTzE/iH5TI7NJ1qXkqSvnk
         Cnr5XVMFOWsuEDCap6DzQsUctv4oAxlm+0nckvVBSYtbm7Tl3waUoEg32DbY0QSALidi
         UYqg==
X-Forwarded-Encrypted: i=1; AJvYcCX+w8bkKcGgtF9b82bNdBMbBSLxPC4LRafSXhbO6dAgoQIxfwcEdscI7JHtNjv1V4kY/KPgEQzRMGUg0RUrDKUu@lists.infradead.org, AJvYcCX3FfjyuLfcwQL/8N6+tkPPWKJ4jPThfr9Fw3q2rzCL+zxAAuh21ob/rGwQx5pcDZS3Ua54kuQzQvJjHVM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfwBYwgLqyY3c6A5CI7NmrucxkJVmZkqhTVkPWXaado/QLlwYU
	HCiwd+G/6GDEvb4tWvNOJ9ycft+f4+7IUMwwC/bVi1eWY6WkrhVB
X-Gm-Gg: ASbGncsoL2Dsq2nKlVwrmWfn4I1BmdZunKCoUV+dtad8wIKTQ6iG37hL6/WIw3sHLuq
	Q5StklaoDWb/8jj6Kl8Z0OmQ0FqSrCd7Pphm8nlsblLsiCKDaA4jyaU37n2W8muDfz+c/iE0Rrs
	f6ZjlLe6C/mPDgrQDuRDmbOAqbpvDbwzO6cbjmb/MfjouqRgVanyN+ifX/QJ9AFTVDoaHffvso4
	sMxvUdBDJgSKguxQqxoQOeMgDVYXoq3bHZOg/yC0hHu7RcjqU9gMML/FbkpspqZKfk=
X-Google-Smtp-Source: AGHT+IED0MT/Y3Zl2u3Z7wdGB5LOycEU5pxFY7tKuSKPsLRXNIGrw99KUylS24xgTBikaz1r1N9Tbw==
X-Received: by 2002:a05:620a:3729:b0:7ac:b95b:7107 with SMTP id af79cd13be357-7c07a892c13mr2798593385a.12.1739840532807;
        Mon, 17 Feb 2025 17:02:12 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c07c608291sm597329685a.43.2025.02.17.17.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 17:02:11 -0800 (PST)
Date: Tue, 18 Feb 2025 09:01:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
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
Message-ID: <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_170216_335937_DC100EE1 
X-CRM114-Status: GOOD (  37.47  )
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

On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > the databook. So I think it is possible to move this in the core so
> > > > > any platform with these clock can reuse it.
> > > > 
> > > > Great
> > > > 
> > > > The next problem will be, has everybody called it the same thing in
> > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > accident.
> > > 
> > > Tegra186: "tx"
> > > imx: "tx"
> > > intel: "tx_clk"
> > > rk: "clk_mac_speed"
> > > s32: "tx"
> > > starfive: "tx"
> > > sti: "sti-ethclk"
> > > 
> > 
> > The dwc-qos-eth also use clock name "tx", but set the clock with
> > extra calibration logic.
> 
> Yep, that's what I meant by "Tegra186" above.
> 
> > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > that horse has already bolted.
> > > 
> > 
> > The "rx" clock in s32 also uses the same logic. I think the core also
> > needs to take it, as this rx clock is also mentioned in the databook.
> 
> The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> seems to be limited to RGMII.
> 
> This seems weird as the receive clock is supposed to be supplied by the
> PHY, and is recovered from the media (and thus will be 2.5, 25 or
> 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> clock is really the clk_rx_i clock supplied to the DWMAC core.
> 
> Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> input on the DWMAC(4) core.
> 

RGMII is not the problem. The databook says the RGMII clock (rx/tx)
follows this set rate logic. 

For other things, I agree with you. A fixed "rx" clock does reach the
limit of what I know. And the databook told nothing about it. As we
can not determine the rx clock of s32 and it may be set for the phy,
it will be better to not move it into the core.

> > > I have some ideas on sorting this out, and I'm working on some patches
> > > today.
> > 
> > Great, Could you cc me when you submit them? So I can take it and
> > change my series.
> 
> Will do - I'm almost at that point, I have three other cleanup patches
> I will be sending before hand, so I'll send those out and then this
> series as RFC.
> 
> The only platform drivers I've left with a call to rgmii_clock() are
> sti, imx (for imx93 only as that does extra fiddling after setting the
> clock and I'm not sure if there's an ordering dependency there) and
> the rk platforms.
> 
> Five platforms converted, three not, and hopefully your platform can
> also use the helper as well!
> 

I think my platform can fit. Thanks for your effort.

Regards,
Inochi

