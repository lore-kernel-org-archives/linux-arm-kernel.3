Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08F3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+24dvPWABcFd9MeuF3ZS2A94KuzubvQXMwsC3UbrqGc=; b=NTX9Zplnvh3e7ITh4s0BKqB9j6
	d6kctHrxZwK3ue2Vsm3z82f02+wGcm7FnWy44so2yMPlSuf1APSNr21/xJGHcsRy5BVR322njXozw
	aRIKqVQZJzZdFXKOd6UMrzsLTo1/uBSPvDXMyq4QtlorCZIyck1RwPytyAVg4ePCL6CSKDo3Ay/Xy
	u9qntTU8druTOobFv9LDFKnBFx5mwPN1VBRJC17Dx9us38SCq8sbdGe5nE0Q63UbKNjzIeBT43Z3y
	kSkPBqqcEACiHYtXdHtQ/wN8qSSjUtYNfaYo/vItZUe1cSRe/6A4pQvtyhL65IBrRLO4/xm2fIgqC
	gES1OnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjEq-0000000Cg7M-00pW;
	Wed, 19 Feb 2025 12:31:40 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjDF-0000000CfGz-3KyJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 12:30:03 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30797730cbdso69556041fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 04:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739968199; x=1740572999; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+24dvPWABcFd9MeuF3ZS2A94KuzubvQXMwsC3UbrqGc=;
        b=PIaQMBZlxrSgX0ord6Jd+Lut+WAj1muAYS0mXQzpMyIdOM9+ZZLXc9od09S6JP8Jos
         Vy9AJZajP/1EqTPzIIE8CZfvNN7wn+bthkl27E3PBsYdDK5lujmyk4rAWKhmg6dhP3ak
         nNbPN5DB703WXmfmWYUtYAQK3d8Is9nRwWEMKKz8/3seufxIfB/WyqDVjEAcGfG6/ayG
         ErD3JtWZGpo43UqsjXncJ/awmGoLUR5o1icb9YEXChA+Cp1oqNzQSYmTUdovoae7dfRn
         wC07cwJjZtNmR8lBOCINYK3iJrpIUtA34A3f4NbWeRPy24MPh7ryD83r5YWFfD8XpOVA
         XbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968199; x=1740572999;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+24dvPWABcFd9MeuF3ZS2A94KuzubvQXMwsC3UbrqGc=;
        b=IIZI2cOglKGJZRLSEYScArOBobwEc2OujrjP8DFEXRApXMs0BJWqNAjPrqt6l7LWd0
         dM8hF44UqwJRemHpDEsZzAqN4PGie7bh/TRw3GFrf5ZlwlwpzO0t/LZXVS1uIYujk88t
         k7jWc3eMe1KnqipUgPDhHGlfhS1zfBAhf8OFIqmY9LQ2O4duMGOPWelFhZjcxIGXHC+l
         7KoLXd0vvsiTgN+2SxQLCv7Gx2vea/zDnEPsCzmvVsDyPiLcUquP4+wmsP5Ej0skVqL3
         lZ1q77P2kFnV7+VxJBvlUKc65VSsOFQRzLSKgT5fgo1U4pt8wNYaGtvBRRlIrZP9BZMB
         eSMA==
X-Forwarded-Encrypted: i=1; AJvYcCVa49KxI9vA6w/h/d+D33knzfhKJZJ+1LnPbgP8U/gyrewoqxe66QuT49o/0HOB81H+7/28wn5QhuGyYJfLaiS/@lists.infradead.org
X-Gm-Message-State: AOJu0YyKs4lYyLhF6GwOSlw3kY/NwhKNBzenFBNH831Mai7h06a5Orgw
	M1743Zw8NveKiXm9ika85Ke+FS2GYMzaAWtjlDUc3Cuy/YSYqEdE
X-Gm-Gg: ASbGnctsDCrTAqUgagwX49aY0lt7ZUMRL9a1zj5i3DZuu9WP7Ez3IGxh3y1sBtC8S9d
	cGaqR4EChY0uXgvnnaDc0RomotVimwZTkEL0SAyRhJR/369hpKdUZQNV6RK0ng30Oz3QwST4Kuk
	6hY3ZC7EY43T5J172yPCxY4UNAUGSpApMv3gU3CHINUHet/ruSuHCmNqY3Psn+kOOzPFhcitwvU
	Ibprc0YQuNTcEi0trwT7Db3ZnWQ3Wh2BYopp1fEddUJkNdDKxxNy1fsmDCXfS+uAdte+drgG/43
	xSKBAA80quLUky7MJM5W4A==
X-Google-Smtp-Source: AGHT+IFQyrXqy5NpHLF7+Lu4p1h9WASYPxxPIwKuoow2XXCkQtMPyIwZy0Fsi378ablFiyznjOaaqg==
X-Received: by 2002:a2e:95ca:0:b0:308:da52:5672 with SMTP id 38308e7fff4ca-30a44dbb8eamr9477541fa.6.1739968199067;
        Wed, 19 Feb 2025 04:29:59 -0800 (PST)
Received: from mva-rohm ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3091029b75esm22556451fa.103.2025.02.19.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 04:29:56 -0800 (PST)
Date: Wed, 19 Feb 2025 14:29:45 +0200
From: Matti Vaittinen <mazziesaccount@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/9] Support ROHM BD79124 ADC
Message-ID: <cover.1739967040.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VPbxCdjMCaKD7rlG"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043001_851499_3B428BFE 
X-CRM114-Status: GOOD (  21.99  )
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


--VPbxCdjMCaKD7rlG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support ROHM BD79124 ADC.

This series adds also couple of helper functions for parsing the channel
information from the device tree. There has been some discussion about
how useful these are, and whether they should support also differential
and single ended channel configurations. This version adds support for
those - with the cost of added complexity and somewhat harder to use
API. I've babbled more about that in the patch 2/9. (And, I actually
wonder if I should've returned this to RFC?)

The last couple of patches are examples of drivers which could utilize
these added helpers:
 - 6/9 converts rzg2l_adc to use helpers
 - 7/9 converts sun20i-gpadc to use helpers
 - 9/9 makes the ti-ads7924 to respect the channel specification give in
   the device-tree using these helpers.

patch 8/9 is small simplification for the ti-ads7924, and it can be
taken independently from the rest of the series.

NOTE: Patches 6...9 are untested as I lack of relevant HW. They have
been compile tested only.

The ROHM BD79124 ADC itself is quite usual stuff. 12-bit, 8-channel ADC
with threshold monitoring.

Except that:
 - each ADC input pin can be configured as a general purpose output.
 - manually starting an ADC conversion and reading the result would
   require the I2C _master_ to do clock stretching(!) for the duration
   of the conversion... Let's just say this is not well supported.
 - IC supports 'autonomous measurement mode' and storing latest results
   to the result registers. This mode is used by the driver due to the
   "peculiar" I2C when doing manual reads.

Furthermore, the ADC uses this continuous autonomous measuring,
and the IC keeps producing new 'out of window' IRQs if measurements are
out of window - the driver disables the event for 1 seconds when sending
it to user. This prevents generating storm of events

Revision history:
v2 =3D> v3:
 - Restrict BD79124 channel numbers as suggested by Conor and add
   Conor's Reviewed-by tag.
 - Support differential and single-ended inputs
 - Convert couple of existing drivers to use the added ADC helpers
 - Minor fixes based on reviews
Link to v2:
https://lore.kernel.org/all/cover.1738761899.git.mazziesaccount@gmail.com/

RFC v1 =3D> v2:
 - Drop MFD and pinmux.
 - Automatically re-enable events after 1 second.
 - Export fwnode parsing helpers for finding the ADC channels.

---

Matti Vaittinen (9):
  dt-bindings: ROHM BD79124 ADC/GPO
  iio: adc: add helpers for parsing ADC nodes
  iio: adc: Support ROHM BD79124 ADC
  MAINTAINERS: Add IIO ADC helpers
  MAINTAINERS: Add ROHM BD79124 ADC/GPO
  iio: adc: rzg2l_adc: Use adc-helpers
  iio: adc: sun20i-gpadc: Use adc-helpers
  iio: adc: ti-ads7924 Drop unnecessary function parameters
  iio: adc: ti-ads7924: Respect device tree config

 .../bindings/iio/adc/rohm,bd79124.yaml        |  114 ++
 MAINTAINERS                                   |   12 +
 drivers/iio/adc/Kconfig                       |   15 +
 drivers/iio/adc/Makefile                      |    2 +
 drivers/iio/adc/industrialio-adc.c            |  304 +++++
 drivers/iio/adc/rohm-bd79124.c                | 1162 +++++++++++++++++
 drivers/iio/adc/rzg2l_adc.c                   |   41 +-
 drivers/iio/adc/sun20i-gpadc-iio.c            |   42 +-
 drivers/iio/adc/ti-ads7924.c                  |   85 +-
 include/linux/iio/adc-helpers.h               |   56 +
 10 files changed, 1742 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/rohm,bd79124.=
yaml
 create mode 100644 drivers/iio/adc/industrialio-adc.c
 create mode 100644 drivers/iio/adc/rohm-bd79124.c
 create mode 100644 include/linux/iio/adc-helpers.h


base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
--=20
2.48.1


--VPbxCdjMCaKD7rlG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAme1zrIACgkQeFA3/03a
ocUsDQf+MzovJEb2dg7/IVoqkcsWktNipBVWqti1q0SzAim/n4IZOlirx8H9AIrL
fJ2XTMTWXnBwILjIocXuJFYRVnOqvycj24bKxfPxDFf1+FUdmi5fH7DfpLkhdYCS
2eODnHijf63nwjWWd5b/IlljdDtaD5G3B60dNiZ7lFqGsS1gC/qlSCJhU9L2N4UE
o6+uv9mTZMDGIS50sFRwLHPQmLTCeERT2BISZEvUx2tja3oRyUcn6mDj78qeiTFy
5GNg5n2ReMybSVjkK07jlToFJtVy1A+WRU+3BVURyB0vfoaOywcPwj2px8GqUF2Q
nheY0QtC2h8bZvny4IEeWB6TcsLDuw==
=T+fL
-----END PGP SIGNATURE-----

--VPbxCdjMCaKD7rlG--

