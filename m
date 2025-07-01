Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A3EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lG1lZ4wTBqNQl0EYVKKzdzGkBoFkZNZqcyt1z8734U=; b=Z2/ShkBtOcnEyymGnp2TWnClE8
	tlbEukpNry/Vcgsqj0O2Yiscr99xGXDiR3b9wl7bMGStcK7y+7sPZ/nnrBx0oGVz/zsyZGRsYcMv/
	AOpaDqKVsQgJjP1qaOYwYX8+k7MCOGtIp2iz1J27cyk+ZjrbjijL2p6XWxJ4jArIx6lP5UynALXjg
	WjaAbHu/FMY2uDEQBAcwcNWjEYdnBfmK5TevaiZAcIWRyGmClTHemcuobH5w0NerHHS8wxi9nIRVS
	1bAXHZ1+ZcbNYwU1yiWVqoZMfT7hcpgNUtba/51ug1/1wMmekcKaivDIlwFYAnWw9MuviTrs6RFGu
	XXfjzv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWj2-00000004TXn-14UZ;
	Tue, 01 Jul 2025 08:52:24 +0000
Received: from out-181.mta1.migadu.com ([2001:41d0:203:375::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWDc-00000004OXQ-1lE8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 08:19:58 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751357992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5lG1lZ4wTBqNQl0EYVKKzdzGkBoFkZNZqcyt1z8734U=;
	b=f/t6qj6pKG54lCbY53Sunp7mqaPSbRc5H1X0tEQklgAq5suOFxddzV80NWrxXyAvmr/lRV
	1Dto+v4xBF4t+Zhh3RHFuQ/JDSF8+J9AOVdNOvNaeQOoPCyzhn6YjoG9w0fwNpUoQotP3T
	no2BXMcOLzWFkEKXPJ/i0tv/yPWXDPzDMRhe4Lp9mjhtB1JKJQ6NtSB23/UcJwi2uc2s2/
	8hZWN1LMgeF2sP890h5JCSwNsE6KJcnFotTSoGE+FDEMHUAZCrlMaTOLRk/ChdnvaXQUcc
	WVQm/80AdIhv2xRdsUFr58hIIEOADfl3f0WtGoAHj6FcWIg/r6idjSaCIfws5w==
Content-Type: multipart/signed;
 boundary=38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 01 Jul 2025 10:19:33 +0200
Message-Id: <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <20250630-rock4d-reg-usb-wifi-v1-1-1057f412d98c@collabora.com>
 <DB02KKR1VK9H.1Q1Y5A98FKGLK@cknow.org>
 <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
In-Reply-To: <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_011956_850254_E77C5C47 
X-CRM114-Status: GOOD (  15.98  )
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

--38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Jul 1, 2025 at 1:10 AM CEST, Sebastian Reichel wrote:
> On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
>> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
>> > The ROCK 4D's actual DC input is 5V, and the schematic names it as bei=
ng
>> > 5V as well.
>> >
>> > Rename the regulator, and change the voltage it claims to be at.
>>=20
>> Shouldn't it have a fixes tag then? Providing 12V where 5V is expected
>> sounds problematic ;-)
>
> This is basically "just" documentation, as the DT just describes
> a fixed regulator (i.e. nothing software controllable). This just
> changes a number in sysfs :)
>
> Note, that the 5V DCIN is a USB-C port, which does not do any PD
> negotiation, but has the 5K1 resistors on the CC lines to "request"
> 5V. If for whatever reason a higher voltage is applied (which does
> not happen as long as the power is provided by anything remotely
> following the USB specifications) there also is an over-voltage
> protection chip. So it's not problematic :)

I was worried about and wondered why I/we did NOT receive reports about
boards being fried. Good to know, thanks!

> OTOH adding a Fixes tag does not hurt ;)

Cheers,
  Diederik

--38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGOaGQAKCRDXblvOeH7b
brm5AQDBQgTI6i56C46hjlIfyd5URIiHLipsV2TsQBP3ETCBSAD/S76s5EMy093j
72Dzr2Gp3zlu93a5HL9EgvMHM4K/YwE=
=0tkF
-----END PGP SIGNATURE-----

--38693364ded63ed777e864851ae1da7c89f5b94f050aba042d5a6802b722--

