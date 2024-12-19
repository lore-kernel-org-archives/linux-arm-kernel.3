Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD29E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 04:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV9rPYBMtv6zYearTenprodqq3vw1d5TA0nxIP3JZ6Y=; b=ZYxpge5QDllAlaX5DoBu5k3QJ/
	c3lokEkXfEmxKb9gt8ekv/gJqmfTmTH09+/tCnx+jeVdv1iml2Sr8YZ7pls/Iw+YLsP0IQVUkXWBW
	f6pcOoNjIViqrwvPZ8w6ZE0jFsA17dfBD1ZFq/Xzx4sCztlzWP7XXs2+a0UkXiHsOwU6NzLTxMzRC
	VUT2KQF3gsJPz4GkA25EavbjrqQO2KOAeq3c79ozBXD3KfsULvRaKPDGxodM5++/yfkqt5ItNFxHH
	tKe4qywYFef/jRztmhQEEPtPEXY69kiPyhIzqKu8CdvuK/DgmWFZZvr3I/uiS4y54kZ4+8je7v3+Y
	Zcfv+/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8HM-00000000ngO-01wb;
	Thu, 19 Dec 2024 04:36:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO8GF-00000000nbX-0VBx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 04:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D63E85C663E;
	Thu, 19 Dec 2024 04:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDF5C4CED4;
	Thu, 19 Dec 2024 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734582940;
	bh=hV9rPYBMtv6zYearTenprodqq3vw1d5TA0nxIP3JZ6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PmhVPEXtShJus3vwjeSG5S4LQfWCt0QUciQanZHZtLfx25uODBbaAxOiV+xmD4P0x
	 lSLGwwOECXwwtM3TDH3rIlzn2tlT2Lnoe/55j6VRDIUE/fD9aYWQa4y8PFX6p7Fqbq
	 wnJOpU+wB0MBZO2Y/mjlnvnQSMPRpT1w8BYg8o7GsVeUxmfVTs4pBCG8C8M0tIBpJ5
	 R9h50P2Aw6FyTHvqUpO/UPwkMAzNE1FD2azO36OG3hFzIXcNFzx3w76X0f/psjKfT2
	 BDvxuEKi0B1KhVZNDMGrTkA8HshT2oSa8zUyE+H2Q1dCK1cyYiifZ+j5igGoNhlanf
	 PHN6ALlKl3X+g==
Date: Thu, 19 Dec 2024 13:35:35 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, jic23@kernel.org,
	ukleinek@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH 4/9] counter: stm32-timer-cnt: add support for stm32mp25
Message-ID: <Z2Oilz0GECUbovtN@ishi>
References: <20241218090153.742869-1-fabrice.gasnier@foss.st.com>
 <20241218090153.742869-5-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iv0TR1n6hMiqaW6j"
Content-Disposition: inline
In-Reply-To: <20241218090153.742869-5-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_203543_207702_DA2B6EB4 
X-CRM114-Status: GOOD (  11.59  )
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


--iv0TR1n6hMiqaW6j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 10:01:48AM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. There are new counter modes that may be
> implemented in later. Still, use newly introduced compatible to handle
> this new HW variant and avoid being blocked with existing compatible
> in SoC dtsi file. Modes supported currently still remains compatible.
> New timer 20 has encoder capability, add it to the list.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: William Breathitt Gray <wbg@kernel.org>

--iv0TR1n6hMiqaW6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ2OilwAKCRC1SFbKvhIj
K6GkAQD+kR7xgAP18OR+NrSPlqcTp3zBvvvPdQkB+Hg+9YasgQEAoM1u+U2lGv6Q
2ZQAnG3TGdEj7O7hRpdM5mQ3nywuYQo=
=GExD
-----END PGP SIGNATURE-----

--iv0TR1n6hMiqaW6j--

