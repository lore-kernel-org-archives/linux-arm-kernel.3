Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B56CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3kYuC9PS9XSvrxs3ONBNdUCPTWsXaUqGEN513hR79k=; b=pd85l8vKKuJe/KIM4Hxp/sWgN2
	8jTJzgou0iXVXlz5seUJviP0oIdRQkcE226C7KbChmUnmjyvPFRDZUXMY/yWhdQ10j++r4UB3EEBz
	+j59GwAweucIJa/cheHssYIX01lxbxBgG8BhrNsKAp+3nZGYMzCxiIeznAVrWtCSK54WaucbRVN/B
	EqYWtJZUbRmY19NJ+i4eu1nAWEa4boJW8lPsMH8cDrooAzml8JdW5Gnk1Q+ca5dJp57XMt5hFcmX/
	vUUj1M2aWNkSYvAxtLWQKaZ9UCPpNRHDaD2AdEQczwXXrkmWLiubGo6fdTBFfPa2i9DO19Ak9ZdKT
	TKbCMaXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSPF-00000007HET-0cKC;
	Mon, 25 Aug 2025 08:18:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRdC-00000007AQN-2gmZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 07:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2EA65C5A8D;
	Mon, 25 Aug 2025 07:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C98EC4CEED;
	Mon, 25 Aug 2025 07:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756106920;
	bh=OHl2l7fwcSBs2PnP0cy1ul4eRIrzpQHu81WxmlH2tY8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Hj5sfPcu+0GZO8ZMxzNtpk2D3hDwuorOx/VaVXaSdlFYUg25YCacBi2RzIKDjLwc9
	 OSxoJ3BfdjPKlCKrQQA5vb1iWAEobDoaM4vFbHlTGtIrr4o/C903UnkugX2HW65tej
	 R1e3GzYuyURQoJdYO0llKI6gxDPC8MHc77Xw+AgADdLcO7Hv/RjckYy+t5u8PBuMpq
	 GVSeBvBT5ikpD6pNNMSamc0FY9j/vF/UgYhUYISaU+2JejMF7xwI2SBZTGOVtybrlv
	 BUQwQnMyz9fMU/9kCIjr8MZp3j7BZa1HPKMZ++pvva+t+UuIq3w7YPyj95aiJYicbB
	 qzzCyqE4DRYXA==
Content-Type: multipart/signed;
 boundary=fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 25 Aug 2025 09:28:36 +0200
Message-Id: <DCBBY4827XAZ.11UHI6NWP7RT0@kernel.org>
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jean Delvare"
 <jdelvare@suse.com>, "Guenter Roeck" <linux@roeck-us.net>, "Lee Jones"
 <lee@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Nishanth Menon" <nm@ti.com>
Subject: Re: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
X-Mailer: aerc 0.16.0
References: <20250822131531.1366437-1-mwalle@kernel.org>
 <20250822152313.vjzjtzik2q5ek5kq@sadly>
In-Reply-To: <20250822152313.vjzjtzik2q5ek5kq@sadly>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002842_789395_66B68C46 
X-CRM114-Status: GOOD (  25.04  )
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

--fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Aug 22, 2025 at 5:23 PM CEST, Nishanth Menon wrote:
> On 15:15-20250822, Michael Walle wrote:
> > Now that the PMIC support is there, we can finally, upstream the
> > support for this board. Besides the usual device tree, this
> > patchset contains the support for the on-board house keeping MCU. It
> > make extensive reuse of the drivers for the former SMARC-sAL28
> > board. Besides different hwmon sensors, all the dt binding patches
> > will just add a board specific compatible (in addition to the old
> > sl28 compatible) to make any future board specific quirks possible.
> >=20
> > I'm aware that there is a patch [1] which moves the sl28cpld MFD
> > schema to a different directory. Once that patch is merged, I'll
> > repost this series. But I already want to get some early feedback.
> >=20
> > [1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowsk=
i@linaro.org/
> >=20
> > Michael Walle (7):
> >   dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
> >   dt-bindings: mfd: sl28cpld: add sa67mcu compatible
> >   dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
> >   dt-bindings: watchdog: add SMARC-sAM67 support
> >   dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
> >   hwmon: sl28cpld: add SMARC-sAM67 support
> >   arm64: dts: ti: Add support for Kontron SMARC-sAM67
>
> Since this goes through multiple maintainers, may I suggest the
> following strategy?
>
> for this window:
> * send dts and board binding changes dropping the nodes that are yet to
>  be upstream
> * send the compatible changes to each of the maintainers
>
> Next window:
> * add the nodes based on acceptance of the driver bindings
>
> This removes multiple maintainers needing to give me immutable tags etc.
>
> What do you think?

Not sure, if this needs an IB anyway or if the DTS can be pulled by
the corresponding SoC subsys and the DT binding can go through
another tree in the same cycle. If not, I can certainly split the
device tree (to my knowledge, it was said that it should be a
complete description :).

I'd expect that Lee is picking up the first 6 patches after they got
an ACK. Please correct me if I'm wrong, Lee.

In any case, I'd give this v1 some time to get some feedback on the
patches.

-michael

--fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKwQpRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hMEAF/Vhvuizfo2QflfI6C2/jHtRw3dLRPlo28
HIDgT2LP6cbtUavEPx2nq1ESho4HXf7EAYCPD4RX3DAZ96VoKuiMPWtrhByKmEo8
LvQhb/8169l6w+5b/5Suq4WzzVE4BArZHes=
=DIAl
-----END PGP SIGNATURE-----

--fd4931382990d6306de8142488bafb3cdc9bb19db8a764e4efedf063a500--

