Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85214C83F12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSvqoLf0LP5lzWLW+28LdzLoZ3lXqAKVepinrDPL/NU=; b=rTYkb1Pnp8xIUyY8k3qj+jRX/b
	82qZnaaR1AItijbZe/Lg1duFEA4+Fxq0bVrqhjR9tph/hR86gU92RbxUn8AUJnNb+doUNLYNT2yMp
	xItfMV1W3VfI5Tpf0LUt+Q7X/D7Dn/k5bebBQUfg3FMc39fZm6A9Ul9wCN3z4lG3eLIFYIZWVTAJu
	aO2+002qO15RXphvn98lnLo44oQvFZiutUakEgKxThX9I0KjNqq3ugkiOt3OWSHh7qslvBN6El4vu
	jmq7nb6mv2FBrcvfnRXj0i28MeU6jVS5QKU72SLFlnvJjYSxreeuMhg6vHv3/oZFGpmqSDQKEm4tG
	JJfcbkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa5t-00000009d7o-06oh;
	Wed, 09 Jul 2025 19:04:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWSQ-000000097CZ-35Aw;
	Wed, 09 Jul 2025 15:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hSvqoLf0LP5lzWLW+28LdzLoZ3lXqAKVepinrDPL/NU=; b=ivXLvStVMsA2ZVrqLyZJY7hMse
	yCNz2LW2NI8wqvB45/u+ezwSkR0PCxZnV3CgyQPEW43N924bNvJI5PoMRd4e3lDjj4acP7DhN1fJR
	9q0PMiSldEnVbeshyHPuwsiOmlsldPQVR7SJXj4yCXDSE6sHAc5QCgnV+F3/VnghCDaUwS+9O3f7y
	RaXWUspJQHBmZk3BgiNeFsp/Ygw9R5ay9gY747RFIaP8UswuF0yIoYFfsm+BEooABjXnojhZPmtNv
	6IcwCgse+kV94xYkRz6VG9nU1Rh6aa6CBeAetFZSbP6JpSKhtd0mKj0BYw8f3kaoQ4CImlctKmOiW
	H2cE3Kfg==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZWSF-0004jl-6x; Wed, 09 Jul 2025 17:11:27 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add reset button to NanoPi R5S
Date: Wed, 09 Jul 2025 17:11:26 +0200
Message-ID: <5360173.ktpJ11cQ8Q@diego>
In-Reply-To: <ea6f2815-5882-4fab-8372-1c252a87e09a@kernel.org>
References: <20250709105715.119771-1-didi.debian@cknow.org>
 <DB7HDOPFOQAE.3NG4SP67ES80J@cknow.org>
 <ea6f2815-5882-4fab-8372-1c252a87e09a@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_081138_793843_2E2AC57F 
X-CRM114-Status: GOOD (  22.48  )
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

Am Mittwoch, 9. Juli 2025, 16:18:17 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Krzysztof Kozlowski:
> On 09/07/2025 13:17, Diederik de Haas wrote:
> >>>  		compatible =3D "gpio-leds";
> >>>  		pinctrl-names =3D "default";
> >>> @@ -127,6 +140,12 @@ eth_phy0_reset_pin: eth-phy0-reset-pin {
> >>>  		};
> >>>  	};
> >>> =20
> >>> +	gpio-keys {
> >>> +		gpio4_a0_k1: gpio4-a0-k1 {
> >>
> >> Are you sure that this passes checks?
> >=20
> > I did the following:
> >=20
> > ```sh
> > export PATH=3D~/dev/kernel.org/dt-schema-venv/bin/:$PATH CROSS_COMPILE=
=3Daarch64-linux-gnu- ARCH=3Darm64
> > make distclean
> > make debarm64_defconfig
> > make CHECK_DTBS=3Dy W=3D1 rockchip/rk3568-nanopi-r5s.dtb
>=20
> This looks fine.
>=20
> > ```
> >=20
> > And it did not report any issues.
> > Then booted up my NanoPi R5S and verified that with the updated dtb the
> > reset button worked.
> >=20
> > If it's about the 'weird' name/label, it is what is used in the
> > schematic document I have and I asked Heiko (on IRC) if using
> > ``reset_button_pin: gpio4-a0-k1`` would not be better. That would make
> > it more descriptive while also having the schematic traceability in it.
> > The answer was no, use the form I used in this patch.
> >=20
> > Am I missing checks I should've done as well?
> I meant that usually nodes, including pin controller mux/config nodes,
> have specific prefixes or suffixes. Other cases have here as well. Your
> does not.

I guess this might have more to do with how deep people submitting DTs
dive into the schematics.

The "aim" has always been to just use the schematics/TRM names, which is
true for the core soc pinctrl entries, and many if not most boards do this.

I would assume the "lan1-led-pin" below the newly added one stems from
a more "shallow dive" ;-) . I would assume that "lan1-led-pin" most
likely has a different name in the schematics, and using that would've
been better.





