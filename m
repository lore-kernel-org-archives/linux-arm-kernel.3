Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D00EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYGHs+rmqAThxK0bAWwe4PbeaiFj7mnmsmdG/2rz7q4=; b=3ouMgbpc0M8sLEHm9Pz0q1vaXj
	Kum3pOn4odvn5hPZsdE31EcKk/mAUhNy5O11xD4vpLtcmR2AB9Wod447E8BtpZ20PlS2GLvbUCVk3
	YpQODB4b9V8dde4T5o65J/5UcjveiQ6nH1c7bt1vsKnYa2emT2I6FOhV7ZD6ya4BKdx2ODr5FWnmi
	z1Ohyef6p1ZdI1/2gMMrrzZ28KqZhNtRZmCFsNLDQz8kRR/TR7a8xqGDzVHpdUgPDFyvGO6B38G4O
	gogLmX7Ij43T9NrX4fX5LAMY5RKaDuf56HlnZhDUWKaTVIcFDpRMrsK5wuBgonjcsAa4N++/wcc+M
	V0PwCzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZco9-00000009xMs-1jwH;
	Wed, 09 Jul 2025 21:58:29 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXxl-00000009Lfx-01RB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 16:48:08 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752079680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wYGHs+rmqAThxK0bAWwe4PbeaiFj7mnmsmdG/2rz7q4=;
	b=jXOQq2rtlwtXNsPPN56seZg4CcCy60xbluMv5iM1AdzqUoFmCwU5SUa7ymKE9Acjf7XL/m
	BkDgW9hmbHIlkrJM/Ovav6HrDZzFzF4DeXpJDWLzn1xhFhl3r0JZhY7sRWqtmaGgXRsVp3
	T0ZRZ/1tORO0g9qW+7hHL55SACN8ZnyOH6YsH7qeRW4VUVUecDmcajhC6QqJ6uxeDDKvo8
	RmGQdkEqLpz/FxiJsQAqdgzmBcQHk5bC/+myowfd/u9CIVqY9Ms7IV27XjgzsqwdAKSDhw
	OY4fgsFtrm64c2BqAsW+HrRBVAkWdLTQHF+RJ8GunZrShdqwBqhsK4o2ojgNEw==
Content-Type: multipart/signed;
 boundary=cb4b35baa72f7fb105cc0d763ed3fae62a1823cd6aadf95634871186272a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 09 Jul 2025 18:47:47 +0200
Message-Id: <DB7OENOUTHGM.2JPD73SZQ9P0P@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add reset button to NanoPi R5S
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250709105715.119771-1-didi.debian@cknow.org>
 <649824ea-a420-437e-ace1-2f079235c604@kernel.org>
 <DB7HDOPFOQAE.3NG4SP67ES80J@cknow.org>
 <ea6f2815-5882-4fab-8372-1c252a87e09a@kernel.org>
In-Reply-To: <ea6f2815-5882-4fab-8372-1c252a87e09a@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_094807_171406_28ABA79F 
X-CRM114-Status: GOOD (  16.00  )
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

--cb4b35baa72f7fb105cc0d763ed3fae62a1823cd6aadf95634871186272a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 9, 2025 at 4:18 PM CEST, Krzysztof Kozlowski wrote:
> On 09/07/2025 13:17, Diederik de Haas wrote:
>>>>  		compatible =3D "gpio-leds";
>>>>  		pinctrl-names =3D "default";
>>>> @@ -127,6 +140,12 @@ eth_phy0_reset_pin: eth-phy0-reset-pin {
>>>>  		};
>>>>  	};
>>>> =20
>>>> +	gpio-keys {
>>>> +		gpio4_a0_k1: gpio4-a0-k1 {
>>>
>>> Are you sure that this passes checks?
>>=20
>> If it's about the 'weird' name/label, it is what is used in the
>> schematic document I have and I asked Heiko (on IRC) if using
>> ``reset_button_pin: gpio4-a0-k1`` would not be better. That would make
>> it more descriptive while also having the schematic traceability in it.
>> The answer was no, use the form I used in this patch.
>>=20
>> Am I missing checks I should've done as well?
> I meant that usually nodes, including pin controller mux/config nodes,
> have specific prefixes or suffixes. Other cases have here as well. Your
> does not.

I agree I've done it inconsistent with how I did the other pinctrl
nodes, so I should've added the '-pin' suffix. For consistency.

I've been wondering whether there are rules for naming [1], both for the
grouping and the node names. Some DTS files use a '-pin' suffix, others
don't. And it's not uncommon to see both variants in the same dts file.

One of the examples I looked at was ``rk3568-qnap-ts433.dts``. While it
uses 'keys' as grouping node, I went with 'gpio-keys' as that was used
more often (in other files). While the gmac0/keys/leds subnodes under
``&pinctrl`` use the '-pin' suffix, the pmic/usb subnodes do not.
(and I just noticed 'hdd4_led-pin' should be 'hdd4-led-pin')

I'd love to know/learn if there are actual rules for these things, but
I don't know them.

Cheers,
  Diederik

[1] https://lists.sr.ht/~diederik/pine64-discuss/%3CDAN429FK06XR.3G8JK8OMGT=
RKN@cknow.org%3E

--cb4b35baa72f7fb105cc0d763ed3fae62a1823cd6aadf95634871186272a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaG6dOQAKCRDXblvOeH7b
bnxSAPoCVZv3DSRcTIXuWD0GoQTcQLm0+bSrUFKoN7lZj65cUwD/QOVG3Uk0vNfE
odCJSTKczf2kfGF7S2EUgc5f3r8/xAc=
=b89H
-----END PGP SIGNATURE-----

--cb4b35baa72f7fb105cc0d763ed3fae62a1823cd6aadf95634871186272a--

