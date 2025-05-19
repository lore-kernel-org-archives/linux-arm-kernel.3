Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B4FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrmWeUmLByyoivKUnjW0HYxeJNUjIXdEBolOtGcXn28=; b=Xz7WPrQ9YR2xrAN81b4kbcTCd8
	4zbP7rZnCfoQ4WQMAbGNt5y9gFTgicbLEPmj859gd4Vi27XEkpKcUhlgHC7k9JnStmG/t4+n8Ru5Y
	aFCybU4Em4tt5nz+gPMS2xIDdPoIJ0523YdG/D8rtZtCX6l5SDc///vXffWxW6qkHiIqhcu+QRhHU
	HGSOVORJnjMQC6K7JEYLMjEHzRlNU03yLItoobN2CEkBPFrS2yyGfaED059CZeLD9cWMDdNRCJrnh
	Loa9OKygwN80BbOGj3DgdBsmgG8ajk3mlYbexZPai1YEdsAje7wMUKHpWPoNYjk8eorVM5tiyYtMW
	643Oc15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2dz-00000009edy-1gql;
	Mon, 19 May 2025 15:43:11 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1jm-00000009UF3-0oLl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UrmW
	eUmLByyoivKUnjW0HYxeJNUjIXdEBolOtGcXn28=; b=UvrGl7XHCWhHVGmfw0ZZ
	eJlzTB01m5VNbLVZcUgDRODfrkbJGsivp7nJsTbVcq4HWE0TZe4LGWUgaDc/uYgJ
	6yGmH6tjW7Es4BOpLZVJuKU/Vs0Eiq++RvqtAaFx9TUI4Jx1x2ed5MKPH5FgZG3n
	AiVF+BfCmVkDSKUobDjmxkz3wKJ9KcRk25+JaQm8EqWnVN55a35qyq8q5xNV/lrL
	LvEPibqXamG5KT37cXN7BmvdBXEfrYIOxFtZFkt8X81NOc7AHtMQXcD+ApnWFlQy
	dcAwZf7ppV175f3sqsMkw3/GIm7enOWK3g3MIhyXvmEwCUyd6erKknOwGH8Eh07U
	lA==
Received: (qmail 2526168 invoked from network); 19 May 2025 16:45:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 16:45:01 +0200
X-UD-Smtp-Session: l3s3148p1@v7AuLX41Ao1Zz6uL
Date: Mon, 19 May 2025 16:45:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCtD7BH5N_uPGkq7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F3FdI+VratxAxGc4"
Content-Disposition: inline
In-Reply-To: <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074507_098784_3B6384AE 
X-CRM114-Status: GOOD (  10.27  )
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


--F3FdI+VratxAxGc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You did not paste the warning in commit msg, so I don't know the
> rationale, but at first glance this is not correct. "-0" is the
> preferred suffix. "0" is not.

Here is an example:

.../Kernel/linux/arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#


--F3FdI+VratxAxGc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrQ+gACgkQFA3kzBSg
KbZ+0w//fJN6gr8h255gSX5XlD0NasDlY/nwsFPA7mhKJRNT8ilrz2kqXp0QhkXp
g9zenBViHaEvMNSRvWWvD/BgYkIelK64OfDlXizr1Fzyy61N8drRWbJvQYgSfDrb
elymxNHWClKUNyBLYY94YJivMXnDXPT/RqTto3MNjSEHEVHVxJ8LS0NyOU7y+B+/
rk05XLraVxvwZQxIi4Z+jb+eIMsp+RO3sPyi+pjbACjG6F0KmF+v7JaIFygU0MEb
N7d9f99FkkHOa0CR6vHwgOzryISIssFy7l8dXYxw+TONJOTW3Yr+kYnN3HqOVKE9
H5Ti1DOmZCtcLq8A+DJmKQmGmVIs1NSBmO1E/Bk3xIYKvgVqdvcDzDrYLgpaAXtR
dKfZmaaow07S36ZmPqKmznli22qpk1ahXoPpku+YAZ0Prb9LomU3QLDSkOst22k9
QWcdET2ypyYfUhRicR2z+b4ec1c0kLngDidCyQ78sZivAgmCMGIi1zzGMxGsmUKW
dxXYpkNic8iwKPQglW+QdykN9sHoncEUm9DFPfMXkQRuuxYAhMDPmPbeOGU8V0Am
A5Vtx7qrmmTLhh5Urs+mGsGaUTeZAaQ51Np3TOX3JmYD5NwUoFr1J5f8cOJ0PE/W
VZzVluKAq4dXR1bguNmwDEib/gqGt4MW7DZqSwdCQ8qdc7s8Tqs=
=l7oR
-----END PGP SIGNATURE-----

--F3FdI+VratxAxGc4--

