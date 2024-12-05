Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F60E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ta7ODN+agEhvbgrJJw1jUucd5srUw+hGfUFlOpCmtg=; b=33GClfNrNG+DUMiR2WSa09Kiiq
	HStpUfvJMm3wccGhvywd67e9/fHcFU9Cmo7wQaXyLABDnFsJ+RuwgcQJMqG08CQ9xjcdLbeTy18QF
	jJ7Et5ZIRv/BtCCSNsMVM9D6eqTna0a9kFZkgPLsySnPUT2KJGkq6H0jrXlhGoFBMNwo47/ncMkMp
	uLdYVXIGGPLl7EcJnIvBqEAXrzfmzWACjR7x7YvypbDes0pOlt/KhhHgzY1gzSQctA1jxTaHS2x9C
	xpoO0MjkgKXRYpwcJNHy7R5sJjdX2th3u04h9WXnaTtORNEHeStwISyx7ioEXN+lrebfSweYb9IhY
	YMYT+m4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFT8-0000000GuQT-37w1;
	Thu, 05 Dec 2024 17:16:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFIU-0000000GsCs-1iv8;
	Thu, 05 Dec 2024 17:05:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 70A7AA43DFE;
	Thu,  5 Dec 2024 17:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C9CC4CEDD;
	Thu,  5 Dec 2024 17:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733418349;
	bh=+Ta7ODN+agEhvbgrJJw1jUucd5srUw+hGfUFlOpCmtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qLI0xY6MoeZmOqx0tLF+nZ+CMCqUKpfdOl1FE3f8gea824GeEGKOargQIxVwtPPEX
	 BI+LKunB0+T1H9eWtm5D5hSxreYgbQ3GaAv30RHXasel1suib64g8aur/7Zbi4sQzy
	 HPz1pTzRkBdbErPymLmklLFSvrxuvFwgfOVUIUHPOqDLgg6Tahr9lLFdi6H5HSaOyA
	 w59aHBRR0q5gu1/cqfdrLFXUwvSTT2Ij+wo/sscGoHZoKN+C4rWL5gGlVX9ZWzMxFH
	 +tmcLK/8yx9LhCmgOZomadLuRQ2SM5jgQK6HLCsftubAuYDIWs3PoJ29owO+JrLTZ1
	 MK3aee9b3Q6IQ==
Date: Thu, 5 Dec 2024 17:05:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
	Simon Xue <xxm@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: PCI: dwc: rockchip: Add rk3576 support
Message-ID: <20241205-backfire-support-68a48f6dcb80@spud>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
 <20241205103623.878181-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oHiiIfBKH0NLyHDs"
Content-Disposition: inline
In-Reply-To: <20241205103623.878181-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_090550_516839_6CD868A3 
X-CRM114-Status: UNSURE (   8.88  )
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


--oHiiIfBKH0NLyHDs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 06:36:18PM +0800, Kever Yang wrote:
> rk3576 is using the same controller as rk3568.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oHiiIfBKH0NLyHDs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HdZwAKCRB4tDGHoIJi
0mbNAP0bakK9HI1zyUDdT4MjngUTtGcHn4JEUnGw4bxCEQ/MjwEArPBI/XuL37Ya
RoA1adWL3DNLYDM6srHpI0CInum9IgQ=
=BTAd
-----END PGP SIGNATURE-----

--oHiiIfBKH0NLyHDs--

