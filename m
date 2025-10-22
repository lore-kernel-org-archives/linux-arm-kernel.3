Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88636CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+Zl8ejinEPVx7KvbwfEUBHq8Gh29eQma2UCTEn6VCM=; b=2r+DvmUpYheEX2d7hfXOJMiZ7W
	VXoNf2eD+f9R98CT3XHansWGw/qernpgUjeCjhxTHMdbsSOhLkIdGBrjA3GCdEW8kmsMwFR4byDu2
	mM3gxtL+3hBNr0uqhjVuEIQpb2iTttzByQ8HOpmoRnNr5WoQvZuxCPcqi1MyBvX7Q7d/DYArROVNp
	RVq36rs4kbeszUojJICwUuG3ABRwIjvjDbwpepVKvymHUwv+Bb90rV4Bhnbws/Thyurw4swhNudCk
	oT8OT3+kDksLpd+qJmHc6TVkSfo2mG+1LN/X0IfmCVymayXY9pVZ507TC3AN0J5UCNgJq56gplQfA
	nz4assiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBctN-00000003qbq-2NYG;
	Wed, 22 Oct 2025 17:44:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBctL-00000003qb3-2ZSw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 844CF450A8;
	Wed, 22 Oct 2025 17:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688F3C4CEE7;
	Wed, 22 Oct 2025 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155094;
	bh=W+Zl8ejinEPVx7KvbwfEUBHq8Gh29eQma2UCTEn6VCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+rdPsNdkSUD+O/huDpptmt6jYlXJsEflfnExbc/V0T20aZU2IoENwrTMPza8ENcL
	 Zmc3teUEgqthrozg/tgJAt8o56rw94SRRNmiGI9AeIRT7bSssRDakSiJLAzU511jlU
	 uOtAImLPh+9h3B5kL6h5yg38cYqxiNgNeQSztfR5UrX7sEIQRSccfcRyYml0F7Tj4k
	 zbJK6WbbZ8TBApgp2jQC3oVXqsp21vbA0dTvSbBhdgb5IDqdeeZKvitqXkYY0MIbgi
	 zj3AtFe2UpYZs69tmiuFHU+Z4zQnUEhqVATtjRysI8U3dNUmzUUiuka9UTBHOqH2Sq
	 L0dEluffPuA/w==
Date: Wed, 22 Oct 2025 18:44:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v5 1/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Message-ID: <20251022-flammable-mockup-4965b730e86b@spud>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
 <20251021070410.3585997-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Aslcfr6pZqhuksvL"
Content-Disposition: inline
In-Reply-To: <20251021070410.3585997-2-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104455_669597_6588C092 
X-CRM114-Status: GOOD (  11.73  )
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


--Aslcfr6pZqhuksvL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 03:04:08PM +0800, Gary Yang wrote:
> The pin-controller is used to control the Soc pins.
> There are two pin-controllers on Cix Sky1 platform.
> One is used under S0 state, the other is used under
> S0 and S5 state.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Aslcfr6pZqhuksvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkYEgAKCRB4tDGHoIJi
0sYAAP9O+QBhPMKlVXgWxSSjkvMDNX/EKzPmh2SGi+q0jIXBNwD/dYGDW5Iyv4n8
LUGkY0fQrp1kfczldh5l67AUCywPSQk=
=69W1
-----END PGP SIGNATURE-----

--Aslcfr6pZqhuksvL--

