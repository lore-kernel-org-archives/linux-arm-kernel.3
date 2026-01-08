Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F271AD1D465
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98T3Tz2YokjXRlEpYaNT4TU3KwxLHeHEgt7OoAsL7Uc=; b=wBoDO0KNwhmzQONUp7o9DgMZLK
	ExK8TStBoms3GCpiTESPrDmwASml4gbkINcG6VS1ZcVko+pLf4t3jbF+Krd46cfpqQP2Gzff+gMA+
	lRU1XBClxgHR7lRX26c3k7W0Fsx85hCpbv7ldnTHZY4bBPaCD6NwKZd1gGElSwSklbVBzu9MgHp3I
	WWyw4K/W/VqxL5kAPfMMwlKHvrFcLsn8b9sPBZS4GMeEa4Q7j6iiUDRMPSWzvdmLI7SeWT6gerOZA
	KnN0wMOAy/lKfwgS6dSnGsXAxa1zTWsgEcFUJry4urxBhAHqNMySp4pzAtQo5PG/zHqnEh4aAYPAE
	7Q+VsNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrHm-0000000HOvr-25dJ;
	Thu, 08 Jan 2026 14:46:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrHj-0000000HOv3-422o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D1D85432CA;
	Thu,  8 Jan 2026 14:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA07C116C6;
	Thu,  8 Jan 2026 14:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767883606;
	bh=2ei8nRnBAMWW9W6WszkkXLKWBiHlzTnUwXvTR2tRXME=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=UOKtgMLOfyWCtqWtHypoDAaD5/hZoh/E4MzZsFgxwG0tK+Azgci2tjpkcWrwpm80f
	 eZeK4Ssue8j6PZAsgHMEg9kIo3y6GeN9P/sp5IxVYIUbARxVOV/8D4kwbhmj5C3FbB
	 TnQ+FnUlNMt8K+YyhcBAXaAi4RuCRJgQdQGTZRz56PrjcVXREWl6TTuFo8GHzgwWim
	 CKbDvguGhsu13yTxzZVqUq0+NGrpByBbD9lJYi736zGK+Eip6vVlKFpxZ/rvJOKnFM
	 1mQNaSTjXFqcQoFj3TsSSmhdQoE/79Ydh6M7MJVmuV+CI3728uh75GKeb+atncU7SS
	 nTp0gpiiFXw9g==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 08 Jan 2026 15:46:36 +0100
Message-Id: <DFJAFK3DTBOZ.3G2P3A5IH34GF@kernel.org>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
Cc: <linux-hardening@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Kees Cook" <kees@kernel.org>,
 "Mika Westerberg" <westeri@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Manivannan Sadhasivam"
 <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Andy Shevchenko" <andy@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_064648_044926_51EA30D7 
X-CRM114-Status: GOOD (  32.32  )
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

--5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Bartosz,

On Wed Nov 12, 2025 at 2:55 PM CET, Bartosz Golaszewski wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.

The problem here is that the aarch64 defconfig has ARCH_QCOM enabled
and thus it will get enabled for any platforms, right?

I haven't grokked everything, but does GPIO_SHARED=3Dy makes any sense
without GPIO_SHARED_PROXY? It seems to me that the probing of shared
pins will be deferred indefinitely.

> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
>
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).

This broke my board (using the arm64 defconfig, works without
GPIO_SHARED of course). I'm seeing two issues here with my board
(arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67*):

 (1) It's GPIO controller (gpio-davinci) doesn't support
     .get_direction so I'm getting ENOTSUPP during probing of the
     (some?) shared GPIOs.=20
    =20
 (2) GPIO_SHARED_PROXY is default m in the defconfig, but I need the
     pins for the root filesystem medium, i.e. the SD card regulators.

-michael

--5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaV/DTRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jkBQF+MtwNQeOvtcMN0ofh9FJstZG1LqdasjYc
4/kT44u4mQt8stCwJA4J/rprAq7X8ayrAYD1LmLKHnkWQUO3PxpeH0TQvkMeEsd+
4ITEdyzXpVm0JxSd8OaCMSAhsekBmk6e5M4=
=cIVp
-----END PGP SIGNATURE-----

--5411f11ff9f9c069b7f705877418128e825c926029051e168dc800dc1521--

