Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3724C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=; b=etP9ZQGg5OMdcVu7vBsHqmctG6
	WgVUSDGNvx3GF3Ctq1saPIt94/iFDJM0wABcfd9ng46ADKkltlSvZl8Bd4TitKT40hPlzSJFAqGOI
	j/9BctRDDyW8oyUqS1T5xqQoxdCkILbaBIUKbmKStiOlfcKGDyEzNSWxx+SLTJ8/HNVVOR6zTbJov
	cj4D32MxEb1/EjOgZV2f50CMFFOWJKjAVntgfcXsP9UxZa2wmRE6beRqN8gNKc5Rb05iWgId74fc7
	/pdxMQc8QQY6csRhDNyDYuoAQwXP1V7Oya08MyPeSicLocqgdih7FdrwDU3Wf+6fr7sAT2Y/tItnS
	Uq6OA1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNTU-00000008Hc2-0tqH;
	Tue, 18 Feb 2025 13:17:20 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNG3-00000008Eem-1xdb;
	Tue, 18 Feb 2025 13:03:28 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7be3f230436so518101685a.3;
        Tue, 18 Feb 2025 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739883806; x=1740488606; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=;
        b=BMi9Or4ySJfpmHYB9oYm0GJKtZM1eyE7crmWjrunnJWrOYk71IkAgo6QELkxrw2eNy
         FpzKVxGfYJ92F3i6MEqhdpQP84V/ejlNsoN72m4yHUr7LE0eOlCw3m3p3sPzw5xuq3QC
         i/OynN5r98Mf9UzweedQyU+uj//+c1ZfmfyUB9g3wd9dhJMF412Z818Mz8+q0/FuRG2u
         uhR5PFJKnRrbmuH0LTT7tkXTQHOKtazt9MMYMaVZ4cwWJ2hLbiEG1P0OkvWADurIEFdb
         mGPdwv/ewrsRJ1isCORf+/Om0RmLxIRzPneKLwbDy8oA99hH7lyW4r7HawDM7Adag+DH
         p8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739883806; x=1740488606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=;
        b=AuQs4RbUWMrWvpeXqi49NRP9gTVMU00bynHlv3D31EwcguwiR8jdXUnP0g2/CfBLVm
         Ranc/NuG9iUY7vt9MsUeKD3F5a+Ap02NOehZeCSkKA0qm2S15puAaekyReBNGQ7L7XhD
         dPdmMycC3o8wo3JJz9s0QgDHLVLEPloXZ+zMM3wlRYCgAlauS0ssVrJb9Hld+GV8Odi7
         Ulc2D4otKvwcpgtSZUdHgIX/GUZvNtKQISowGkZl1IQSabQwNCdvkbSAN4bOp/TRjvPp
         IDWLn1O6LQ1so7IcnjDWTtqr7VuAXB9/zDENVS925pzW/c+RbztH5TBdQbq+9ZuB721+
         HIjA==
X-Forwarded-Encrypted: i=1; AJvYcCUCemtpWvmMoMAakV+zyJwsw4Pjp9iQ/y9rKqBPTkhIfmD68beTbbfWe/guCO5dItG6TPbaIm4ysJplWYnWcaoF@lists.infradead.org, AJvYcCVbeEI8WhE2h8Zs26lQst1nfNSy8pSrgamPuLDUWhEPy0Aa9zthslQsdcDmZwkUCVbZItIMWe2xYbgheAo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/tb22mSc0IRbbV+f71vtCAeh1HFKdYC82BHZL0G6mmnfC0ce
	zWSFUJhZW/osuuboCQuaYOCpFSh8TRI6wSU4K41xFmy1a29qZpAg
X-Gm-Gg: ASbGncsBrWF3bgllisdBtzAB9DRaONu/zL7ZUOYzUgWbsRmlwmvVMtBKx4f8Cu+eH94
	NxQvHml0JgARYTjhgXhyKX7WfafeTO088cN91gpeBYYE5YHJyqMyZFn4LNwxjteEa8nwxv/iJ+y
	kQ5GAV9IDH5HBxmHypr+8GDw6jAbajRXDO3iACJHXM8CRUkACDspGjeFE2MesQot7kA2SO0hwaS
	anDPp1muImeBV1g7Z73dTN/ORyOUd5+fgZoTzSOUxSctju2zIfOqCrhW8WxbD/siyI=
X-Google-Smtp-Source: AGHT+IHMvBa2pdrsPXBeOhKSDCxofcBeoktPP7uW0o0YVj6yGzgsaMY5yizsS+ID7z1U76ykO/2aOg==
X-Received: by 2002:a05:620a:31a2:b0:7c0:7ca3:b123 with SMTP id af79cd13be357-7c08aa98cdfmr1890605085a.46.1739883806193;
        Tue, 18 Feb 2025 05:03:26 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c0a28e8700sm189185085a.113.2025.02.18.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 05:03:25 -0800 (PST)
Date: Tue, 18 Feb 2025 21:03:13 +0800
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
Message-ID: <rkcf6tmgv44uxof3oxsmzqduvc4bumtnsjlkvenxezu2tjrp6l@vy5rbr4p7f3d>
References: <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
 <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
 <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_050327_509384_BD3F7399 
X-CRM114-Status: GOOD (  40.17  )
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

On Tue, Feb 18, 2025 at 07:34:47PM +0800, Inochi Amaoto wrote:
> On Tue, Feb 18, 2025 at 10:40:14AM +0000, Russell King (Oracle) wrote:
> > On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > > > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > > > any platform with these clock can reuse it.
> > > > > > > 
> > > > > > > Great
> > > > > > > 
> > > > > > > The next problem will be, has everybody called it the same thing in
> > > > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > > > accident.
> > > > > > 
> > > > > > Tegra186: "tx"
> > > > > > imx: "tx"
> > > > > > intel: "tx_clk"
> > > > > > rk: "clk_mac_speed"
> > > > > > s32: "tx"
> > > > > > starfive: "tx"
> > > > > > sti: "sti-ethclk"
> > > > > > 
> > > > > 
> > > > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > > > extra calibration logic.
> > > > 
> > > > Yep, that's what I meant by "Tegra186" above.
> > > > 
> > > > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > > > that horse has already bolted.
> > > > > > 
> > > > > 
> > > > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > > > needs to take it, as this rx clock is also mentioned in the databook.
> > > > 
> > > > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > > > seems to be limited to RGMII.
> > > > 
> > > > This seems weird as the receive clock is supposed to be supplied by the
> > > > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > > > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > > > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > > > 
> > > > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > > > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > > > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > > > input on the DWMAC(4) core.
> > > > 
> > > 
> > > RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> > > follows this set rate logic. 
> > 
> > Sorry, I find this ambiguous. "This" doesn't tell me whether you are
> > referring to either what s32 does (setting the "rx" clock to 125MHz
> > only) or what RGMII spec says about RX_CLK (which is that it comes from
> > the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
> > the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
> > and MII modes.
> > 
> 
> What I said follows the second, the clock is set at 2.5/25/125MHz
> with speed at 10/100/1000Mbps. The only thing I can refer to is the
> ip databook.
> 
> > clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
> > tree is configured for RMII mode, the rate on clk_rx_i depends on the
> > MAC speed (10/100Mbps).
> > 
> 
> OK, I have no problem and find some descriptions related to this in
> the databook.
> 
> > This suggests as far as the core is concerned, the clock supplied as
> > clk_rx_i isn't a fixed rate clock but depends on the speed just like
> > the transmit clock.
> > 
> 
> This is what I want to say. clk_rx_i is not fixed but the
> s32 uses it as a fixed one (This is the thing I felt weird).
> 

> In fact, Non-fixed clk_rx_i is why I suggested adding the rx
> clock to the core at first. Since the drive may not use rx
> clock as the databook says, it is good to leave it alone.

Please ignore my wrong point, I mistake the direction of the
rx clock. It is not provided by the mac, but the phy.

Regards,
Inochi

