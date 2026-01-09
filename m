Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4536AD232F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=; b=Jgu0UbDeL1p0tSltSt5gVmRfJ8
	+XLS5MXq5ovrAZKAe+bIJLKFmnNjsu9pfbd2ONpjuOaM4OhMSXlnDqHN6boDSKQClQdViCaRmvOdu
	0cju6PFZweD3Qvkwk8bVbahNyRb9RPc3YuFU+RnUuPn4tPOd2zyOUpIRCE744yjvaZZUHR2ZCvWyW
	ro7lowCX4+22gdgeTbah3FOFOq+Slb6751gwsuERuH6/DGlCFoi5N4pWB9g8dNxN/T+AFDM+KLN7i
	TS55YZO9i4hRTx6FN5SILg0RCjY09quzGbTtI6IcIzMfq2+fr3LqzACKDX5tH0frbP2VBGAvJf0Xj
	dEVod6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve84a-00000001va3-0PZJ;
	Fri, 09 Jan 2026 08:42:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve84X-00000001vZc-2KCp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:42:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-432d256c2a9so935735f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 00:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767948135; x=1768552935; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=;
        b=SsPMiFLqmFYVk9EO/4nD9QAZIv+b8aUxpvXcUxq4upra7LU1gSfZfo7hMC/o89KzMS
         zQEd567x+8qnCAJu5LbSIqSb9XXR6p83WzfD399/84t7vauygnjYe82tcnB4ls9j7n6o
         OskVoCfBIg3p817E0ga5vGcfD4GgsWy1bgFohaYcmxmld28wubmdnZSYBJUmlixXA+Qr
         PCMDoiIQ5lPIDvQMjMRMEy7GkNztJjS5yjya16QLi2R42HPmVqhtbac+ENzsqX6LNsAH
         UjMNHKbFj7B6PExsVQGt+LNaLAvLyeY9fGINDpyB7QRg7pZxfoiJpO12BWKOIJPv7C7U
         yjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767948135; x=1768552935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=;
        b=mNCGp+Z6Vq+gqUYcZoEit0mkr6icVEekm9HyEcfU9OlajdnLJPLRoCZkDHA1b6fS1K
         0JlWiES+/EPZGBquIpkuBNv3X5NozGy7q87rBjGzrk0cmTlW+xf3OGVCrZgLBzQstiJQ
         y7cJbEAEYdym+wKXfty8FWM8gH9kUNFyTXydNsxe0DDg2tPlIg8rJKaqDPdBdo4d17HJ
         QTRCCEVPQd0v547mYIFqXtGxuKYXc3f4cYJUmCkR6kTQ9wqcqdO3z1kPUrqQujLPDv9T
         ND3/UDMuPfDcrzzLpHKJPCPr6RUczNhizgAA4xdXom4RYehBBTn8vKvGaYQA6OP333Wj
         I4cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFoWZS7DMr9o4SmZAdPgMj6Ua5gHL0wi97nBH0ZQxjLV6JhR/UuJ3ZMTK2dXbxLuGeo0+mu1f/uCdDwRA2fmsQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3PrmUNc2OYjtyJml0hS/4umh65t5fSkmJ/MXFkOYHqZ4eVX3B
	UgKKBL79sqT7iRdb5bWuc+2L5/ofLskbCyjQUNR6P7JIwrMxyXt7COvn
X-Gm-Gg: AY/fxX7i0pTDkZULfY6MqIoFEGIqrz6gWLKl1OM7mG//4mfXgsC878gosGNnzdubV6+
	V6p8C9zwtA29cnkYp/XCOd2gNlbqPUyxOfEZKl7aVjzL18nrNTGMwi5bQKuzWroktBcrCvHF/JJ
	ik3/+Vy4RVzZjRR+fuqDrF4GwbUDpTbqPgTfkuKp/+XkPR4eFdgpk4XjjSFzbqDUbb5s/7IaY4m
	DrHadyVcuKCN8/Ma3lueWLHonNsZIgdiSf2vOLgA6flsdnhbDBJthqYnXhAecNPfthyb+6KVpfm
	XLBqMjJCL//I9OKpqj9rzDKv5WQj7if0Gt2CwfcKrqvO5v14aDJUZHYp0Z73ANAY2MOUOYOhpfo
	R80+mbCkCh8O+IUE1d7aH7gm5tY+jWYAlVL+yP/WRNwQEbmpuyn7Fcv4PN1YRera19fa8y84KcO
	gS0+F3aO8wS/8=
X-Google-Smtp-Source: AGHT+IGYAk2S3Qdr9OmtCXbZaajNREwTznfK/Lnn5IG7bEwG+8LMc/qLBJq9BAHsaKGTT3hoN4rQcA==
X-Received: by 2002:a5d:64e3:0:b0:430:f68f:ee7d with SMTP id ffacd0b85a97d-432c379b79cmr11104260f8f.47.1767948135127;
        Fri, 09 Jan 2026 00:42:15 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:66a2:be50:e0d3:29f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm20839538f8f.5.2026.01.09.00.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:42:14 -0800 (PST)
Date: Fri, 9 Jan 2026 09:42:12 +0100
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
Message-ID: <aWC_ZDu0HipuVhQS@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aVv7wD2JFikGkt3F@eichest-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_004217_641223_F40C2E33 
X-CRM114-Status: GOOD (  35.95  )
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

Hi everyone,

On Mon, Jan 05, 2026 at 06:58:24PM +0100, Stefan Eichenberger wrote:
> On Mon, Jan 05, 2026 at 05:09:13PM +0000, Russell King (Oracle) wrote:
> > On Mon, Jan 05, 2026 at 05:42:23PM +0100, Stefan Eichenberger wrote:
> > > Yes this is correct. ERR050694 from NXP states:
> > > The IEEE 802.3 standard states that, in MII/GMII modes, the byte
> > > preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
> > > (0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
> > > be no preceding preamble byte. The MAC receiver must successfully
> > > receive a packet without any preamble(0x55) byte preceding the SFD,
> > > SMD-S, or SMD-C byte.
> > > However due to the defect, in configurations where frame preemption is
> > > enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
> > > byte, the received packet is discarded by the MAC receiver. This is
> > > because, the start-of-packet detection logic of the MAC receiver
> > > incorrectly checks for a preamble byte.
> > > 
> > > NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
> > > they show two tables one where the preamble is preceding the SFD and one
> > > where it is not. The text says:
> > > The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
> > > between transmission at the source GMII and reception at the destination
> > > GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
> > > across the GMII. This case may not be possible with a specific PHY, but
> > > illustrates the minimum preamble with which MAC shall be able to
> > > operate. Table 35–4 depicts the case where the entire preamble is
> > > conveyed across the GMII.
> > > 
> > > We would change the behavior from "no preamble is preceding SFD" to "the
> > > enitre preamble is preceding SFD". Both are listed in the standard and
> > > shall be supported by the MAC.
> > 
> > Thanks for providing the full explanation, it would be good to have
> > that in the commit message.
> 
> Okay thanks, I will provide the full explanation in the next commit
> message.
> 
> > 
> > The next question would be, is it just the NXP EQOS implementation
> > that this breaks on, or are other EQOS implementations affected?
> > 
> > In other words, if we choose to conditionally enable the preable at
> > the PHY, should the generic parts of stmmac handle this rather than
> > ending up with multiple platform specific glue having to code this.
> > (This is something I really want to avoid - it doesn't scale.)
> 
> From the errata from NXP it sounds to me like it is a configuration
> issue by NXP. I checked the following ERRATAs from vendors where I have
> access to:
> - ST STM32MP1: not affected: https://www.st.com/resource/en/errata_sheet/es0438-stm32mp151x3x7x-device-errata-stmicroelectronics.pdf
> - Renesas RZN1: not affected: https://www.renesas.com/en/document/tcu/ethernet-mac-gmac-function-issue-0?r=1054561
> - Starvive JH7110: not affected: https://doc-en.rvspace.org/JH7110/PDF/JH7110_Errata.pdf
> - NXP S32: affected: (ERR050706 under NDA)
> 
> So from that I would conclude that it is an NXP specific issue and it's
> not the full EQOS implementation that is broken.

I just wanted to check whether I should continue with the current
approach or if I should instead enable the preamble in the PHY for all
MACs. While I prefer the current approach, as the issue lies with the
MAC rather than the PHY, I can also see the advantage of always enabling
the feature.

Regards,
Stefan

