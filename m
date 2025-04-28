Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA59C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zY686LvOGJYrYXa+bY9kzT3uv0M2cUnBikXFi3QNhk=; b=MdHxjAePPQ2pKSAR/zJb9NSm23
	PLaeOYBbR6m3aZNcnJ6fVjQA1QDpooQUIIswYSi3qvpfat/hACiC0w2eYmRf1fD70rxNymI+ZjGQD
	+shWu8f1ZK8RrSYx8lEkmwzQEBFgkNHiBSGRju2f8PdaFyi5I8khCxMbf5gwjhIi8n3BF5r7zm052
	lCER697H3XpISaduJtsu0CFQUy3bFdL6bb01L7stAsPjR2huE2VHL3xbyzZEdwjhH9q/l+IuuOpRl
	tGIRtem2w2Qkw3u7KaV+K3LP6WyRbaSBjagTT/f2FcfKcp1LNYcHV0ccWA0HJ6xIzM4BKnTeW0T0l
	0uXUhL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JBW-00000005IPm-1OuA;
	Mon, 28 Apr 2025 07:45:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ItJ-00000005FFt-1d8y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 07:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8zY686LvOGJYrYXa+bY9kzT3uv0M2cUnBikXFi3QNhk=; b=rTpVpKDSN+zukm3OdySkqvH/U9
	fMyrtyDt2fBv8/LayXaswWKboQX6vL/xX23It3O3ttkbPK9UkX13HWE/QTu4f0CsXY1deTAdqhMSr
	TP4+z7PbOm+7kcLyFOl/u0pHkP/04c4a9Qw6uzfpa3oXh2qx6G2egPjHYTP7AzHj8TzDkjDs9pAXB
	yPDBT1dwR5CjGZOABqvEqw/pGU318ufpAbFjS1drYtNOpuDK7EO55OOHla4e5xjDGKeQnF8hHgDGs
	XwQsEO5H9wxRQ4n8IBo1CANyHW4wflH6hWIIjcmgaCo+//8Pis6Br04B+BwWHPZ0xGOSQH1x9uK31
	OJxJ2KNA==;
Received: from mout02.posteo.de ([185.67.36.66])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9ItG-0000000Ca9R-0jKf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:27:00 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id CC198240103
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 09:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1745825205; bh=nDBkBJAdWu/ACY86EyWr8Sx3/0ngI6TPK6V9GBIUBiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=BOcE2IqSE0aj4vSs00NcAdlFm8ATmFEhh9teUyMmf0JirIaIWhgwB1vb2PndV51Xs
	 DeOwScmMKSPH4wtviibnNMzL1gBjlrmeWAo7YWmOy9GH59FrZwhqj3/u548KECG1Fn
	 UTrRW8YU2WWYkc+rrFqL12G1f+FJiDHnBnzAhVh20btLU4XT6l84J1O8rHrL8xsyxE
	 NNKOO1THUDZahjCzlAucJlX4qtQdrgWTXJuPevlaS8hmOqzM8Pg3PYZOwHbPdi/+xU
	 kzTbPBhNVrcUdj7xjTBlu1pA7oiSdaqZK8YGTapplJdQeeNKFx+6u9JjzqT50Yoke5
	 5tNdOFlnxVVrg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZmFPZ1fG3z9rxG;
	Mon, 28 Apr 2025 09:26:42 +0200 (CEST)
Date: Mon, 28 Apr 2025 07:26:41 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
Message-ID: <aA8tsao6hhW50k4e@probook>
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
 <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_082658_350229_380E0996 
X-CRM114-Status: GOOD (  19.16  )
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

On Sun, Apr 27, 2025 at 01:28:58PM +0800, Chen-Yu Tsai wrote:
> On Fri, Apr 18, 2025 at 7:32 AM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> >
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > Line out playback and microphone capture work, after enabling the
> > corresponding ALSA controls. Tested with the Orange Pi Zero interface
> > board, which is a (mostly) passive adapter from the 13-pin header to
> > standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> > microphone).
> >
> >   https://orangepi.com/index.php?route=product/product&product_id=871
> 
> What about the USB ports?

Good point, I could test these. I have not mentioned them because they
are not related to audio.

> In any case, we don't enable peripherals on "headers" by default. That's
> up to the end user. The description for the whole adapter board could be
> an overlay that users can then apply directly.

For features such as pinmuxed UARTs (already present and disabled in the
dts), I fully agree, because they could as well be used as GPIO, and
that's for the user to decide.

For the audio pins, there's nothing else one can do with them, as far as
I understand it. It is possible to use at the least the Line Out pins
with very minimal setup, e.g. just connecting the pins to headphones or
something else.

I'll clarify the following points in a comment in the next version:

 - The audio signals are exposed on the 1x13 header described in
   https://linux-sunxi.org/Xunlong_Orange_Pi_Zero

 - The pins can't be used for anything else according to section
   3.1. Pin Characteristics of the Allwinner H3 Datasheet.

Although I would prefer to enable the audio pins by default (because
they are present on the Orange Pi Zero board), I would also be ok with
adding them as status = "disabled", as is the case with uart1 and uart2.
Please let me know your opinion.

I will test the USB ports and write a devicetree overlay at
arch/arm/boot/dts/allwinner/orangepi-zero-interface-board.dtso


Best regards,
J. Neuschäfer

