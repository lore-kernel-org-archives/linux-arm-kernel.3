Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4F7D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2aEYN0YgI+TDlSh9eLGmWfQZnYSK9t8D+8KLPPKRPw=; b=RbK5OLL4jwreaJka/6wjF/Lx2B
	WPw9fYfRqzQ3L4DGZI7tOPE4BvtVdrF83fliTdlMHkoY3v/OktfjSMIDpVuwNEmfL2uBh+qZsbEpB
	GU8lBd8POP++os1EkKg6FHFzXPmRmMNS/JBn20hUHgyDYaZ9diaV8RMsWihX52JdkgDF849SLqndR
	iJo+38HNFoXe1XH2R8wPdmhSfdMHn9MXIsBPUJ6imavcFBk+TKVtrPzcwabp35Tmfya7lZKCPRydZ
	GZ8rZQKgxSO1wx0w5du1RX1CJ1St2mjiz9aAJtbHw+/EkTU/PEII/muqLOwhhyVlfs38XDyiWEiNq
	mwsrU5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82Hv-0000000Eptk-086v;
	Mon, 04 Nov 2024 18:58:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82G9-0000000Epfy-1dZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65917A43311;
	Mon,  4 Nov 2024 18:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A845BC4CECE;
	Mon,  4 Nov 2024 18:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730746624;
	bh=klRNM2QW6fTskX6MxVeh5Eu1pMzs7Vd2pwb5fH/5Csw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQWik+aeNFU8ogWjtCmkss7kGZP/iF2OtVuPVfEaR5VODM9vL3G3aKKMvmMIB9DCq
	 Su81izEMPMGM/6dJW9MbWy4OPcuBjnU5JSqcB63+Qe4a4dHlTTsfEE1E5HfVnjTw+d
	 JmXLHkwrzQIktGJXSApVm8iGz5uw57EYxNiyPhnIESREtOxDFHxJ6gErnS6EDhDvTY
	 2hGGCKlF8Px6FZ3kDzEBfOGexlCjrLOpJJWZcoPxoCyBaHR5aOfpHt719W+wqmXlqq
	 RcJg1Ky8pIsRTdh9zTNG0WFqzrmefvsBt+hmTfE8VRxeXdfrM/vsx+EhR+iMiVtU3l
	 hJ5lR5Ye/z8iA==
Date: Mon, 4 Nov 2024 18:56:59 +0000
From: Conor Dooley <conor@kernel.org>
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for
 Apple SPI controllers
Message-ID: <20241104-retract-wife-e1abe7425cc8@spud>
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eDkNDo8k+C4oOoqZ"
Content-Disposition: inline
In-Reply-To: <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_105705_523174_3587591B 
X-CRM114-Status: UNSURE (   9.13  )
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


--eDkNDo8k+C4oOoqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 08:26:12PM +0100, Janne Grunau via B4 Relay wrote:
> +      spi: spi@39b104000 {

nit: the label here serves no purpose, and could be dropped. No need to
respin for that obviously.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--eDkNDo8k+C4oOoqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZykY+wAKCRB4tDGHoIJi
0hkyAQCYza7XuxDWpE6cI+SQHeNqZ9LyGEb4tyHPUXhBQfj65AD/Yw6470Q9ai91
Pki+/cTol7qQomfJQSdCFz2ZZaADigo=
=XGu/
-----END PGP SIGNATURE-----

--eDkNDo8k+C4oOoqZ--

