Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07299C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh5pIV8WkpI5HMeTJ5df7eJWevXbYQsSGtle3kqnKrE=; b=RQgGiExdhEkBntqEYz/L3EtCqJ
	L74FhYCXkwPjQ/Sznpz0LBHialgPyZBNzD7J0zAJeuw7tIxvQrZ6ckWlYre4prNshjrvH1Efqajm/
	2k+CLcDz1bHUjdvtqBrRwSRRM4boL71qHjuQYeFp/DAmhbDlVKoq0jwZ7GrkaxlzMS8pYl0chRfQB
	p/8ATdt+I7lzEl6ZIZ5weYHZSKcVdYOdZDk+F136EHHf9Ss9b4909yLu1SOEHpkFnxIxkA8sctjDj
	dY+u2DsKjhe5ETbIM+o97Zum1yFvZbsOF5pWtBhnRf52yNUQtjgjIeNql1shVm1CCKAoqJEJITdrq
	SMePbNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZaL-0000000FQVz-214P;
	Fri, 20 Jun 2025 11:07:06 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYhk-0000000FJ2g-3JaK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 10:10:41 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750414227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh5pIV8WkpI5HMeTJ5df7eJWevXbYQsSGtle3kqnKrE=;
	b=nJuDkGL09UtmImqfvryADBKU0wujEnm2pxtNg2qi98hUv3Oq26UXz8d1At3pQ1c5FJ7z2m
	i7Y73alRZoz+/Hr8yCj+qCJhA4032jLzcd3BxrVFNLqQlE3rXD6HLFXPnNXehBSz7T3SZX
	DSdE4TWhVR/G0DPZit2LKRcM409BPIuBYgfI3dXodbZNXCPBhO1mSG2h565SVyUIC2qZE6
	Csv/1+MoU6j3vxEX6FwAT2A75J1GnTGeo0nz/sZXGjnhlFs4blrt2Rk2ppUvSk9ykjvWB5
	NGdzqJSeUtjW0i917JRpTkyukJPhyA3ylnMr9ICdBSgaX5C2PuBoUwVRnzqe+Q==
Content-Type: multipart/signed;
 boundary=3849aed8dc18aa9a4d5f113a0f5d2765faac8f215c4386c490a0ad7c38eb;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 20 Jun 2025 12:10:10 +0200
Message-Id: <DARA1V0ITPV5.T24DK4TVI0W7@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, <stable@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: rockchip: enable further peripherals
 on ArmSoM Sige5
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>, "Alexey Charkov" <alchark@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
 <175036770856.1520003.17823147228060153634.b4-ty@sntech.de>
 <CABjd4Yzz9mh0G5BhpPOGAoadD-A5eX4kdsF8rGrWk82hAE-MYQ@mail.gmail.com>
 <5004008.8F6SAcFxjW@phil>
In-Reply-To: <5004008.8F6SAcFxjW@phil>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_031040_968246_9ABFD7E3 
X-CRM114-Status: GOOD (  12.68  )
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

--3849aed8dc18aa9a4d5f113a0f5d2765faac8f215c4386c490a0ad7c38eb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jun 20, 2025 at 10:44 AM CEST, Heiko Stuebner wrote:
> Am Freitag, 20. Juni 2025, 10:40:49 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Alexey Charkov:
>> On Fri, Jun 20, 2025 at 1:17=E2=80=AFAM Heiko Stuebner <heiko@sntech.de>=
 wrote:
>> >
>> > I've also fixed the wifi@1 node in the overlay - which was using
>> > spaces instead of tabs.
>>=20
>> Thanks Heiko! It's annoying that YAML doesn't like tabs, so copying
>> from binding examples is not a universally good idea :)
>>=20
>> By the way, is there any tool that helps catch those?
>
> checkpatch.pl would be the tool to do that, but I'm not sure it handles
> this at this time.
>
> I also only saw things when I looked at the patch in "mcedit", because
> it nicely distinguishes between tabs and spaces :-) .

In vim, ``:set list`` makes them visible as well.

--3849aed8dc18aa9a4d5f113a0f5d2765faac8f215c4386c490a0ad7c38eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFUzjQAKCRDXblvOeH7b
bs/QAP0WF4+k13q1KtXzF57NuU9bR7PWT5UFo1PZ4uovhmnPzQEAwWcTlpj6q/oo
whJ0eFpdigYeLRxSCw2IgXaWu2AV3gg=
=hqZi
-----END PGP SIGNATURE-----

--3849aed8dc18aa9a4d5f113a0f5d2765faac8f215c4386c490a0ad7c38eb--

