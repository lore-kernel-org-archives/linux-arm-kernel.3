Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C22FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbSjDmbB+fwd9uisoHdA7Y4E4U6AJ9oA6oBIi/aMsc8=; b=GBpX1xfFb9Yt9cqQIdShPFsysP
	UjY1daiGmHa5OZJwPTFJW+GnYneYWSq5EZATivijPaG/vicPT4LnDXOXeiQWaoRtMp2wanOSuV/ME
	UK6u05f3yqvb/fuNP31E53spIt7tKujsnW1VwEQQ0k+nfkDJr2hezyJXwnoSUAXFMUWxvAuigbbdv
	724PYRFzv3aE8RE16rLxlRMlxtxyoKuO7j4iw2IJNS2uuCFra/xKZ/+aRWWyj21dtr1m+8mjSrCh8
	WgC4e8a/yrlGUuLE3cHFxmTESzBp2lVed51cZArV9pdRr4VAw9QKok1WQFiRBuowHvOTV06VYr4yn
	AucKHOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPRP-00000005N5x-3TBs;
	Thu, 30 Apr 2026 11:20:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPRO-00000005N5Y-1Z8R;
	Thu, 30 Apr 2026 11:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EA0660142;
	Thu, 30 Apr 2026 11:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E20C2BCB3;
	Thu, 30 Apr 2026 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777548021;
	bh=CbSjDmbB+fwd9uisoHdA7Y4E4U6AJ9oA6oBIi/aMsc8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=cpqLcMhmh2CIoQ+Nl5Ja10CZ2fUCK2AqQR0hPt+Jg56DI00cidDuS0GPw+Qqf2Diq
	 tfB3oTt+jVvOoWtK1OREKNbMQ2zNRKBsYVHr9vr/0mHG9ZtBEm0RDDG0n5xZWzRlBo
	 MRxBgyCcjKBLbWiELDDYr034AwDjtwcB95J+z8jQJbK+g+dDRXpr2whmW0DLkM4yP0
	 xAp4x6MN2ejYI7MGy5fmbB5PQOGEMBBhMtlSiZZr+8OQyFC232C4CM+PV2mKFIzzNK
	 OCgWgFQfu+bEYdah5EWqsOzBW2kA+q3gNXYKzCInBmIgj48lTMpgYrCK0T2K6CNH8w
	 n4MzBQKAn6sFw==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 30 Apr 2026 13:20:16 +0200
Message-Id: <DI6G6LSE68E9.1PHS6K9083JJ9@kernel.org>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
 =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "afaerber@suse.com" <afaerber@suse.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
 "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
 <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
 <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
In-Reply-To: <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
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

--d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Apr 30, 2026 at 11:58 AM CEST, Yu-Chun Lin [=E6=9E=97=E7=A5=90=E5=90=
=9B] wrote:
>> >> 3. Hardware Debounce: We also need to support hardware debounce setti=
ngs per pin,
>> >> which requires custom configuration via set_config mapped to these sp=
ecific per-pin
>> >> registers.
>> >
>> > Just add a version of an optional .set_config() call to gpio-regmap.c
>> > to handle this using .reg_mask_xlate() per above and add a new
>> > GPIO_REGMAP_CONFIG_OP to the above enum, problem solved.
>> >
>> > If it seems too hard I can write patch 1 & 2 adding this infrastructur=
e
>> > but I bet you can easily see what can be done with gpio-regmap.c
>> > here provided Michael W approves the idea.
>> >
>
> Our .set_config requires mapping specific debounce time values to
> hardware-specific enums and applying a Write-Enable bit.
>
> Would it be better to allow drivers to assign a custom '.set_config' call=
back
> directly within 'struct gpio_regmap_config'?

Yeah, I don't think there will be much code sharing of
code/functionality for the .set_config callback. A custom
.set_config was proposed many times in the past.

> Additionally, I didn't mention this in my previous email. we also need to
> implement GPIO interrupts. Our hardware design does not fit well with
> 'regmap_irq_chip'. Therefore, I am planning to create our own 'irqdomain'=
 and
> 'irqchip' ops to handle our cascaded interrupts.
>
> Because of this custom IRQ implementation, I would need to use 'readl()/w=
ritel()'
> for the IRQ callbacks in the rtd1625 GPIO driver instead of the regmap AP=
Is.
> Do you have any suggestions on how to handle this gracefully while keepin=
g it
> aligned with the regmap infrastructure?

Why can't the MMIO regmap be used for that?

-michael

--d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafM68RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gI3AGAy9Rtm8M8cPTowSj7LX/6Bv869nnmd8Cw
MpzVztzODqPB/LkXkMyvpkhWH6AzyLlvAX48SNhCzsSDeC7wqRKPl8sErYeJZGLX
es14enI6yhoXQgX6nbZ9889InNSwBDjGvOQ=
=hoAy
-----END PGP SIGNATURE-----

--d813880cce0dd36de044a5774161cd7c2bdcd11d3b8f945b00451ee61dba--

