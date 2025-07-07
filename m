Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFB6C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uqZV1nG1qu0z44H/dhVREFF7Vw4p3job8fEuaI2uOk=; b=QEGug7//eDPhG6UxDagl6yjHXR
	Qh2b5h/xqCMxNs0jIu0W7b5vrBEfjPsBnm+iQU1mWkGqBPtAh7fsff+cIoPs7T1edfRS6kSt4B/tP
	c5fQvM0CSj/cIi0WWmLt2+yOm5WIkymJsD/vi5YdB7qNqt3Uiyv1zLys566sfMVS/L+FEN21b4Gyk
	BeQn/xHnyzoEVS0PVbEfgvHF1Zv2a0rmyUmweolRwO1NEDqDdYLdlhfRxK9glJ96XnIexdn4l8h18
	TvEUlNs3heZHuVGSEELP7l48WS99r7oLDNK/0rc12OHi/N4v+RoEjVJQb5w6cyNNU0kruVYfOq0cg
	l9tsJ0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnJA-00000002mZC-3KHm;
	Mon, 07 Jul 2025 14:59:04 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnGo-00000002mBf-3kun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 14:56:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0249A443AB;
	Mon,  7 Jul 2025 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751900194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4uqZV1nG1qu0z44H/dhVREFF7Vw4p3job8fEuaI2uOk=;
	b=Z8fnlEMi9u4VVVlXGOrvwJwv0Zmy8H9iXVz3AS3tlrqAEN67cFKN5oCFQ1PbHAXbxIYbam
	dy/QSMEbAzNG5HewHaWVVYY8V9ltEKVsN5k68xRPDV2LPs+D7n/t01FjxUz5zy4W4+yWAT
	LyCwIQvg2yoZ0qfGgpnU094FGruvQ8xHFlv0s4em6BDwWppYNNNgMRT5PCwWT7DWiqlDOw
	rpVqWua57zDJO/zEmSC/C+YcNdpvsLgoQFnGn1bxWayoPamKoIg0vTax/eJJOdeO/S8AHn
	x+BAdIrzFUaq6fzHAcLRYGpU8D4Xao9GrcR2TOK3mQWXKJScifCEjbMWDWo7JQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Andrew Lunn
 <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 resend] arm: orion: use string choices helper
In-Reply-To: <877c0ou0xo.wl-kuninori.morimoto.gx@renesas.com>
References: <877c0ou0xo.wl-kuninori.morimoto.gx@renesas.com>
Date: Mon, 07 Jul 2025 16:56:31 +0200
Message-ID: <87zfdgf3s0.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeejhfegueeftefhveehgeefleetuefgtdfhleffudeifeehteegveejheegffejnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemfegutgemvggvkedtmeeljegufhemrgeitddtmegutdejgeemkeduuggrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeefuggtmegvvgektdemleejughfmegriedttdemugdtjeegmeekudgurgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehkuhhnihhnohhrihdrmhhorhhimhhothhordhggiesrhgvnhgvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehlihhnuhigsegrrhhml
 hhinhhugidrohhrghdruhhkpdhrtghpthhtohepshgvsggrshhtihgrnhdrhhgvshhsvghlsggrrhhthhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_075639_435502_D2718AD3 
X-CRM114-Status: GOOD (  13.16  )
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

Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> writes:

> We can use string choices helper, let's use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied on mvebu/arm

Thanks,

Gregory
> ---
> v1 -> v2
> 	- add commit message
> 	- add Reviewed-by
>
>  arch/arm/plat-orion/gpio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
> index ca1bd764cfa5..6f09f65e3d95 100644
> --- a/arch/arm/plat-orion/gpio.c
> +++ b/arch/arm/plat-orion/gpio.c
> @@ -468,14 +468,14 @@ static void orion_gpio_dbg_show(struct seq_file *s,=
 struct gpio_chip *chip)
>=20=20
>  		if (is_out) {
>  			seq_printf(s, " out %s %s\n",
> -				   out & msk ? "hi" : "lo",
> +				   str_hi_lo(out & msk),
>  				   blink & msk ? "(blink )" : "");
>  			continue;
>  		}
>=20=20
>  		seq_printf(s, " in  %s (act %s) - IRQ",
> -			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
> -			   in_pol & msk ? "lo" : "hi");
> +			   str_hi_lo((data_in ^ in_pol) & msk),
> +			   str_lo_hi(in_pol & msk));
>  		if (!((edg_msk | lvl_msk) & msk)) {
>  			seq_puts(s, " disabled\n");
>  			continue;
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

