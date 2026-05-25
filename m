Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40016CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBdwrpDpVLZphgnQqjfINiqHGCa1lpywck29IxJWjLU=; b=4iPL/vIWSJYdNm16IU0/kjlahv
	UWSinRLsd6E2YFb/KDeyQydVbBneJe+EzqMj5wy7XZ7bLth/bY2kKPwTtxZEuSdz289H99Tf9gUjT
	JPhghPWssSm2p5C2LB4DvM/H1D6PFM190qY2eBhDLl4AmkwxaJDo8FWfpuPltaSmqD306i6Z3SCLj
	Sw6q2ykfMX+fzbJTV8OOmbxpKO60/cF035Ct+GLGxIdORDeEkQuofxp59dmruOje4YsjXLIL+rxGl
	dRemXFE4NijlkB9P6co7PpfPTpR6RzUu2zGrix/STW4ge9xgb8z5I8H50y6/tFfd28rs5MQeQH2Fs
	4pmf+l3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQKd-0000000Gax2-2mVR;
	Mon, 25 May 2026 08:06:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQKb-0000000GawQ-3ltj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:06:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FE16445B7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137841F01562
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779696397;
	bh=XBdwrpDpVLZphgnQqjfINiqHGCa1lpywck29IxJWjLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fDLEwigvfx3SKEy+abqKr/OzEu8M1uZr5lZwv82fmKYtK+YvG9058zhlwLGw4oST5
	 0478577WUe+Uc5wobNxLnJxUxHa0w2WEc4p42UrWv0+7pcuOFtgl5uQywyTZ7VPHod
	 m5h2YUwU66j6aPQnq84kLOkJiAEg6CCu5bJ6qOal41l2D+aYc8NwfZslUrXD3TEXEo
	 mdqDKnNJXIYIGlGCmp01Qc8O939wTaNiQ0pd7s7tO2h+dEgrhDnjIz6ydkBi29LCXe
	 UCHXvyb1Ig/C7O67TkPG3ciG5fITPX7NAAC6/M4R671dFZbM76Lk0FYLmh0crQXTpu
	 Imm1SJsoC+Ebg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so9320708e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gut73FFJrItlHaLVfZ3j8nbtQZu7SSwsXokrYLRmGBb49YyNKRhNQZxGP/ny9k5oKMJ1Lr0K+YI6sraEKqqOM@lists.infradead.org
X-Gm-Message-State: AOJu0YxNdivblHnJMW8VkXNjq431jqE49h+Sf3xKV0blEYM/MF45KoMZ
	IIXM6muD58XfCh6BSPcg1s73I8oh+ay76LTIvqs2pamGTPQ/SCtji6h80WbNuRibRDNsz+kFNR4
	O+CXS3Rytkobi8YDPYRlnx0dMoFcBYMc=
X-Received: by 2002:a05:6512:692:b0:5a8:fc25:3843 with SMTP id
 2adb3069b0e04-5aa323a49d0mr3894276e87.39.1779696395729; Mon, 25 May 2026
 01:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
In-Reply-To: <20260521-pinctrl-single-bit-v5-0-308be2c160fc@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:06:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLnxMGux88CCXH70hwEGiQXn9FCJ=vucLaS=JLhp_C48VQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaI0HREPthKKhQrYPPwj27_NpiZglEh2S216je37LkMgP9M9Luyc3lYsg
Message-ID: <CAD++jLnxMGux88CCXH70hwEGiQXn9FCJ=vucLaS=JLhp_C48VQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] pinctrl: aspeed: Add AST2700 SoC1 support
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Lee Jones <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, patrickw3@meta.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, 
	openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_010637_987281_6179A7BF 
X-CRM114-Status: GOOD (  19.23  )
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

On Thu, May 21, 2026 at 11:17=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.=
com> wrote:

> Legacy ASPEED pin controllers have historically not had a coherent
> register interface. Control fields often had no consistent mapping to
> individual pins, and configuring a function frequently required
> coordinating multiple control bits across several registers. As a
> result, the existing ASPEED pinctrl drivers rely on complex macro
> infrastructure to describe the dependencies between pins, functions,
> and register fields.
>
> The pin controller for SoC1 in the AST2700 breaks from this legacy
> design.
>
> For SoC1, each pin maps directly to a dedicated function field in the
> SCU register space that determines the active mux function for that
> pin. This results in a much more regular register layout compared to
> previous generations.
>
> While the behaviour is conceptually similar to pinctrl-single, the
> register layout and configuration model differ enough that reusing
> pinctrl-single directly is not practical. Therefore this driver is
> implemented as a SoC-specific pinctrl driver using static data tables
> to describe the register layout.
>
> The binding reuses the standard pinmux and generic pin configuration
> schemas and does not introduce any custom Devicetree properties.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Patches 2 & 3 applied to the pinctrl tree, thanks Billy!

Sashiko is moaning about something, look into it but my confidence
is low since it is using weasel words like "critical" for things that are
certainly not critical, if there is some validty to these comments it
can certainly be fixed up in-tree.

Yours,
Linus Walleij

