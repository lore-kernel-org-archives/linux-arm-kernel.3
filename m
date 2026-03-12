Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8821106ACD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meviQmyqF1kqc9YGmZkuHNtSHzTX0EVSt/TuohoolFU=; b=aV+8PuZq2pyw0bzb7wH69VnFi6
	5kwXFws7djrTVljc8/OqcFHGG/LYHFIHYU98V9Lp2qG+g8DwRdvl5dJtSYZMKeHUvkymsraoTNr/V
	CpIxs6BDu2Ec+nCKUmJQqHZ5WP489A1dSQE5HnSTvR85uUXh8bh+1bFPcto755kt/1dUyeYmOgmDi
	+Iq0bGUetXlwuzhw0wZkIxMyj38eywSFZPLUN5mhQvgcbTp5EBmZ9S0VoWdB9gPgDRtxH8SU/5ly0
	wJjbO653iX8mhrnnLS6j/Yr50pNyaXTytVW9fdFZ00F5JiJgASxFzu1TPBd/+96V2YwRc+yD9wBYW
	PhUZKyAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k72-0000000ElcT-0kQu;
	Thu, 12 Mar 2026 17:46:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0k70-0000000ElbR-1S41;
	Thu, 12 Mar 2026 17:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 911F04407A;
	Thu, 12 Mar 2026 17:46:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A732C4CEF7;
	Thu, 12 Mar 2026 17:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337577;
	bh=meviQmyqF1kqc9YGmZkuHNtSHzTX0EVSt/TuohoolFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJno1Os4TyC+orQ3q2f7ippncDXGpK7OY6C1d0KzUtzsQ2vQgEgqusv8gquOWj5su
	 wNhhfkVTof7D3YmVOh4jJwWATk/m++0XmqZm8GV74MYX4H/z4EQol2CZYff5Bhhv7m
	 5ExjK7PV7loPSD0iANbuT6iCsTE5zSFdypnNzoejzW1eZgDjoXsj71WKeeWZ8VGMdT
	 ZboF8iifUztyoyxzq+DU3/GI+YaYxzL74kS4vtdAGrEegcYCmFVPI17UAI27eZ5xW+
	 Bw7vkqfFYAz18iKVaZKUcrAOIUViyPxBKUH8/+rsnOvHJ+oPQPR+8x3/1NfiLq+m3n
	 Hq5+HJoAtXhpQ==
Date: Thu, 12 Mar 2026 17:46:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Message-ID: <20260312-fabulous-enigmatic-a7da953094b8@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-5-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nYKNSAcxTp+Skt4e"
Content-Disposition: inline
In-Reply-To: <20260312113040.68189-5-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_104618_403219_1FC9475B 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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


--nYKNSAcxTp+Skt4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 07:30:37PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
>=20
> Add device tree bindings for RTD1625.
>=20
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v3:
> - Changed slew-rate to use valid numbers.
> - Revert realtek,pulse-width-adjust to realtek,duty-cycle.
> - Fixed example values from hexadecimal to decimal format.

Modulo commentary on the new generic property,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--nYKNSAcxTp+Skt4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL75AAKCRB4tDGHoIJi
0iExAP0TS9ZR4jIaJv+WfNqXT1+/YBx7PrC0FvRZHXR73TBOEQEA2hD7PTwMl5zi
+A/E3kN/Dz0IcLWvJicp8ZpLvf6mPww=
=+01R
-----END PGP SIGNATURE-----

--nYKNSAcxTp+Skt4e--

