Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D96CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCCeWjIO6/V0fuE5wLIQltMgO5ed5m3tGd8KS2cyWi0=; b=iW0VHtWv5/Q3OHJZ1lEVArsOF+
	kxFYE5VGKvi7026Ghnw7EMD1xW0WKFF+NlrTamzB5IERjzMvIuO6g/rO3OM+h7m2q1LNs/taVlwfo
	CFv8EiA+UISCA6NFyT63qEEceXUdFkm24n4x4HVPJUVmkfs2BR49yi5tiPJ1UfgNZ3p3Hh4uzA9z+
	ivwaoh6g6ZYoxHd9TSkAlKv1ftjf7I/abqMjKo6ksWP2JVJPqtkWhrMvybLGa7ewA0c1WtfEC4wRc
	BtfxxQPLzdtg+KpJMhaOnx01zqEHn1FtiJ1u8RBh3nygxmSRV/S1fnwQkvr+q00zTeuDu9DZuxG5H
	PHsqE3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBw9Z-00000006Yrd-2v2w;
	Thu, 23 Oct 2025 14:18:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBw9X-00000006Yqs-36Q8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 14:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GCCeWjIO6/V0fuE5wLIQltMgO5ed5m3tGd8KS2cyWi0=; b=DcGF3Okx2twde4nA5FqcqILLHB
	mxjKPTImh9N54uaehDP950waFBbPOwdVRe9p3wSbyrFZxpuT0IE8kpq4UH4CSmbG7Ay8DlmsDvTm9
	gQFhuvhR2a+KVKgarp0JdjbiC/Gtz7A9r/Yv4NMrMzLZ6CqdV2w2ZMmr6JyhiDV4u5F6sprvl0INa
	ds7EZOUDsA30DkP2fb2VDs97YrIpe6OZocIDCGDPLn5lZmHW12k9NVqREmf2RJGelmMxO2MBeBuhj
	yOcMsY+EMGF5AGbeT44KV8+cRw+Juy/e9FAbIAdlb6x6nujutrywga3tNehFloqsBztwrDpeGlWIT
	cc0ObnCw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvHp-00000001P5D-13G9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A894B453D5;
	Thu, 23 Oct 2025 14:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B047C4CEF7;
	Thu, 23 Oct 2025 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761229128;
	bh=bJxweCGYFicDN8XJJqtvmSXX/oE1+rQFvpKIjeLyq2c=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=NifcWW7Qh2v4x/kLGCIpFeNvdnkhS+V9q2j8GvTnzHLKheB40XnFQmGWdNho73/oI
	 oaJu22dbrmDgSIwevJzCLSqUwTJlficK7YpgG6zOcTuE3UMJG9nCfNDpDVevl4rsGO
	 Abo1bSlW+gOYqhrhaqFeVoxWv6xCINmpFr/HO4czKmfsKVX7CXn1FUdm3M7iU4GIev
	 syBdcO9lnUKTixM2TBbO2iwDDxxu1ZNjUxr/sBYdAde34GBq8/MfUoCvbSDOObSmT1
	 MOTxnb4m8zDVFWKEqQDZsTRdL2FMr/wjR+RzeIaX8ff43/gw9N4VmmySy5qKubK2ls
	 a6CpqR45AxyJg==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b31e57130b0d78ca537571d43b9c56e4965516d92bed9fa6dfb1c4bc1f0c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 23 Oct 2025 16:18:43 +0200
Message-Id: <DDPRM9UCVZNA.HFRGLJW17PIP@kernel.org>
Subject: Re: [PATCH v1 2/2] arm64: dts: ti: k3-j722s-main: fix the audio
 refclk source
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251017102228.530517-1-mwalle@kernel.org>
 <20251017102228.530517-2-mwalle@kernel.org>
 <554df7d2-1809-42a8-b512-bde3fd284163@ti.com>
In-Reply-To: <554df7d2-1809-42a8-b512-bde3fd284163@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_142325_730615_E1D3BB4B 
X-CRM114-Status: GOOD (  19.60  )
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

--b31e57130b0d78ca537571d43b9c56e4965516d92bed9fa6dfb1c4bc1f0c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Oct 23, 2025 at 3:50 PM CEST, Udit Kumar wrote:
> Hi=C2=A0Michael,
>
> On 10/17/2025 3:52 PM, Michael Walle wrote:
>> At the moment the clock parent of the audio extclk output is PLL1_HSDIV6
>> of the main domain. This very clock output is also used among various IP
>> cores, for example for the USB1 LPM clock. The audio extclock being an
>> external clock output with a variable frequency, it is likely that a
>> user of this clock will try to set it's frequency to a different value,
>> i.e. an audio codec. Because that clock output is used also for other IP
>> cores, bad things will happen.
>>
>> Instead of using PLL1_HSDIV6 use the PLL2_HSDIV8 as a sane default, as
>> this output is exclusively used among other audio peripherals.
>
>
> Thanks for this fix,
>
> Initial support for audio_refclkx was added in j722s and am62p soc=20
> specific files due
>
> to selection of different parent.
>
> Since these SOC share many common things, and this patch will make these=
=20
> nodes same as of am62p device
>
> https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/boot/dts/ti/=
k3-am62p-main.dtsi#L46=20
>
>
> So I suggest to move in common file=20
> https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/boot/dts/ti/=
k3-am62p-j722s-common-main.dtsi#L42=20
>
>
> and remove from SOC specific files.

Ok, but to keep the information and to not conflate two different
things, I'd do the following:
 - keep this patch as is
 - add a second one, to move the (now) identical nodes into the
   common-main.dtsi

Sounds good?

-michael

--b31e57130b0d78ca537571d43b9c56e4965516d92bed9fa6dfb1c4bc1f0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaPo5RBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gCUAGA9Tu3/0BHusm+p7jGMd54B3ImM/u3QJ3r
ZSwBtJZ52mr5+mzokC5OWhhScA4ykLUnAX4i/3RhUGrEc8x3Ozddhl10LCJ5y/5g
p3uM4fOAngaRMIRZc0UFjEcoGpv/Z3wSh9M=
=zxEV
-----END PGP SIGNATURE-----

--b31e57130b0d78ca537571d43b9c56e4965516d92bed9fa6dfb1c4bc1f0c--

