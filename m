Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567CEC79FB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=; b=PG5FuuvHqgdw4PG3AyQhI8laOI
	wx4sXegZjuwIW3IFKXwZlCS4SiOOizLWMdGgsu5fiqnRK1yaPULOWey8muEFxL1SNb61qLz0AQYTW
	fLElZCm8MRqsXDdbLNxeLwNXKKCW+0GVRXiMOlHF2DOZSt1ZXxbu2iFrhV4WY2hmgPg8Y63sAhCUM
	JktgMZA+SIEfumy/Q+6DzMU1HjZoDOJu5fDmARXOCCZdecbfLmGavJ6cIS1r9YqCQVyY4vWJ7Gl0Y
	4FREAvgM+GSYD6Foz0l3UGH5lVEY1lspqc4Yjf7Ua3kh2GyRNhlpZs4dS/z6t2KGjJkbc9PTAukc3
	7Tz3KSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoqd-0000000Bt5m-3wuQ;
	Mon, 05 Jan 2026 17:58:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoqb-0000000Bt5L-0xYc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:58:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso1316105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767635907; x=1768240707; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=;
        b=Je5OZa5yb+SrVJHKOfTMzD18GO9uMEYRA9gwyjnh5+eK/iOt2SMgGm1Z1lcbd+xj3T
         hvBzDn3zCtLE0053F0yVrqIhwYDiQt5lUDiFF7VlI/psjMmrApsRZ/kRVJmLXVNZGN5I
         Y2Ki2ZcJMkNc9EXd2bnev2VC4fOwibZh9jAi1qP8ZpFn1/tFsWdge2Vv0JyI6EfApZau
         U0jQ3aiUODnBQC9JHNJOcwRek6NJxQN82DnOD9xnb4eECVhYHPeuSM9DjjuDTV1rp4TG
         azpQG8RJXc8t2Hrp54LifwaJCO7XdagRDnM5tFC2d3cO2zPeLyQ7w0W4+edF0Hf9JkOZ
         4VyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767635907; x=1768240707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=;
        b=U0fvB5nSodgUcs2feusTfNw4qQo46iYHcW9kwWbiF0G9hiNZJMw+/aarZIEusMBm/3
         BycKOKOGnaYrbzZgIjIcv/EkUe75t3FLUL/xpov4/h9p+2bDlz0pYLzCt4BAdXmv/RK0
         JvcSngRMMJKCjIuW5OVIJZpMHaaK80KE1WHGp9jVmuEzvoZJHYQKDBLP5JyfbexMO2oE
         4IE7XNwLGUxL+ejtK6whcmUMzzrb42OoYy4F0hW9ialy2SHeEu6dh6BeOjZfVKd2C3GL
         g6m38bQJQvkAGkl4Ryba2Kf4WQwR7kx0Xt01NACDz1garGHB7EA3PkG7nb/KaCNEnC+w
         pY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfq4a3GcHQy1fDdC6ufIBG/uOULpHGnIj/B/l+0k/KZmCTVh3uqk6bPmu6ZtSThZbhpvbEvU3lE9nR7mqTvmaQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Rfmk+WZU9RcZiTmrOM8AvssuE5FJt76F6yznIkQV0SH9kWai
	7ZncvmvglMp2p9ROIN8EIfnxZBckCvZ9Ax2Tb9njGmCga3sWK/TTee9S
X-Gm-Gg: AY/fxX4Bxlf6qoQhcCWgzgogigx6pHWFu6mysOyWYjELfJMuBUrUokzRSML/LiMV2lw
	NyL7WU/e9SolckJzdJ9O9YUFMz6NJbvF04VK0tJHdw50+vyHSGAWrVwnCi8i7+iAOTgPH0d9BpD
	tmBRhgeDXBRfQPk7Ycharz+NUG4MAIz0y2KW+2mg2KNYNEz9Rq84hwFAWelw9difB4qzav/HOZV
	p2CK/+6y/hfy9xDlYGjAhLbfjAYaFYeKoGSwTb8PQb95X340WprVIUI095RpomYJlJr4Y/ugMXB
	oKrkokYq1YUYtB5kMwTpHPEin5hbR2xhBTYx2KQpoci3QH+yTl8I/VWhZ1xMYOXRQLc3w7bdLQz
	5JjrXagb54W5cbQY5HVYPHPlIrBLWM/MUlCJtsVQJlbo4EqsVG3I4nzroFoyH6a/YDHbQGQOcDD
	kcHSfv0LUY0WeFurJ42yB20g==
X-Google-Smtp-Source: AGHT+IHvDnJREnvXI3rgUm0D8mHDlQfrv7fsBdnLRxoQbMQDvEB8slEC6JxGA2RCLuiUgT4GEjzJqg==
X-Received: by 2002:a05:600c:4fd3:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47d7f0a25d2mr1709695e9.26.1767635907151;
        Mon, 05 Jan 2026 09:58:27 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:1b36:ec4b:aa3c:60f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f390a69sm703765e9.0.2026.01.05.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:58:26 -0800 (PST)
Date: Mon, 5 Jan 2026 18:58:24 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVv7wD2JFikGkt3F@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_095829_322495_521CBC3B 
X-CRM114-Status: GOOD (  29.25  )
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

On Mon, Jan 05, 2026 at 05:09:13PM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> > Yes this is correct. ERR050694 from NXP states:
> > The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> > preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> > (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> > be no preceding preamble byte. The MAC receiver must successfully
> > receive a packet without any preamble(0x55) byte preceding the SFD,
> > SMD-S, or SMD-C byte.
> > However due to the defect, in configurations where frame preemption is
> > enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> > byte, the received packet is discarded by the MAC receiver. This is
> > because, the start-of-packet detection logic of the MAC receiver
> > incorrectly checks for a preamble byte.
> > 
> > NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> > they show two tables one where the preamble is preceding the SFD and one
> > where it is not. The text says:
> > The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> > between transmission at the source GMII and reception at the destination
> > GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> > across the GMII. This case may not be possible with a specific PHY, but
> > illustrates the minimum preamble with which MAC shall be able to
> > operate. Table 35–4 depicts the case where the entire preamble is
> > conveyed across the GMII.
> > 
> > We would change the behavior from "no preamble is preceding SFD" to "the
> > enitre preamble is preceding SFD". Both are listed in the standard and
> > shall be supported by the MAC.
> 
> Thanks for providing the full explanation, it would be good to have
> that in the commit message.

Okay thanks, I will provide the full explanation in the next commit
message.

> 
> The next question would be, is it just the NXP EQOS implementation
> that this breaks on, or are other EQOS implementations affected?
> 
> In other words, if we choose to conditionally enable the preable at
> the PHY, should the generic parts of stmmac handle this rather than
> ending up with multiple platform specific glue having to code this.
> (This is something I really want to avoid - it doesn't scale.)

From the errata from NXP it sounds to me like it is a configuration
issue by NXP. I checked the following ERRATAs from vendors where I have
access to:
- ST STM32MP1: not affected: https://www.st.com/resource/en/errata_sheet/es0438-stm32mp151x3x7x-device-errata-stmicroelectronics.pdf
- Renesas RZN1: not affected: https://www.renesas.com/en/document/tcu/ethernet-mac-gmac-function-issue-0?r=1054561
- Starvive JH7110: not affected: https://doc-en.rvspace.org/JH7110/PDF/JH7110_Errata.pdf
- NXP S32: affected: (ERR050706 under NDA)

So from that I would conclude that it is an NXP specific issue and it's
not the full EQOS implementation that is broken.

Regards,
Stefan

