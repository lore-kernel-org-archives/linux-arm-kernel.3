Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8DD6ACF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aShkXMyayZKWZRdrM7J5JHKi41tIxe5R2eQr9Tu6jG0=; b=eN8Oa+Tc+k2x061C+7IPlejtaX
	/uCIEAYqcDIlPvuX+h+7BoRbUiyQl6+yDGW1Mcp/N9R+wEva/GtsPibs/CKcSpoZQ+lrsP7t0SNWz
	wdUEy6/9sukCcIUqw+YsgYve/czq078GOL2zqddBuEQRnf9wbZMSitSZIXuou8viD2faFFtR7B8qZ
	KE5duQhbLdGBZZr6QFGKxgcDcM80S2ox9W4JTOYcg3NkDuaukfZ0Cd4dJ7ZZ02EpBmbYflU+4scft
	pj6jhRaP6fG0x9dKPm5AEorFrMH62WIeoT1yHbYie5spGXUGCWiSp5Cb7lxq/zTsDIfV88El7hauJ
	8S7MSe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKhU-0000000DbQr-3YTI;
	Wed, 27 Nov 2024 16:15:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKgW-0000000DbIc-1Zfs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:14:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B2315C5639;
	Wed, 27 Nov 2024 16:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1F2C4CECC;
	Wed, 27 Nov 2024 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732724075;
	bh=t/t+qxjEE72ckgaetIew3I8k7tV0KGgHqs4PPn6lneU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yzy7GJrBd/e3ed1KEIowTju/iUvh/T9yE4tGSE0foVfkz5XPzXIOav9a3ecTJoRt5
	 moLU8F3FSksk54D/GR/HMeNLeuUuKh3NiYt2bnkveJbvFmKh0fRGHABUGUbsZ9FriC
	 ZTUUjasE8OBdmpR7GkUMGtwjrFU+3VOiB+UijToRHYzP/qVaWiQoI22LUiD2adoIUe
	 6ANGhB0IE2OfxqeDIOQbHvGef7jPGS8zPibk4MFBmqNmk215695V7uGLXiUPItOMIv
	 EfDTid/dN/dhSFUnjvKfQh9oCGv4ZQsc6tA/55cUwZw/kBHf8zQju+TwCHdhHSgtVg
	 GCogrBmNZzflQ==
Date: Wed, 27 Nov 2024 16:14:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Jason Hsu <jasonhell19@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, patrick@stwcx.xyz,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	yang.chen@quantatw.com, jerry.lin@quantatw.com
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Message-ID: <20241127-resupply-tanned-1410c026f127@spud>
References: <20241127073409.147714-1-jason-hsu@quantatw.com>
 <20241127073409.147714-2-jason-hsu@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jmHGxiniHzsUH9Y8"
Content-Disposition: inline
In-Reply-To: <20241127073409.147714-2-jason-hsu@quantatw.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_081436_456869_943481E1 
X-CRM114-Status: GOOD (  14.59  )
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


--jmHGxiniHzsUH9Y8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 03:34:08PM +0800, Jason Hsu wrote:
> From: Jason-Hsu <jasonhell19@gmail.com>
>=20
> Document the new compatibles used on Meta Ventura.
> Add subject prefix for the patch.
>=20
> Signed-off-by: Jason-Hsu <jasonhell19@gmail.com>

I acked this on v1:
https://lore.kernel.org/all/20241022-purgatory-modify-fdcc5f1cff23@spud/

Where did that ack go?

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 2f92b8ab08fa..98ea2b3e0eb1 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -86,6 +86,7 @@ properties:
>                - facebook,greatlakes-bmc
>                - facebook,harma-bmc
>                - facebook,minerva-cmc
> +              - facebook,ventura-rmc
>                - facebook,yosemite4-bmc
>                - ibm,blueridge-bmc
>                - ibm,everest-bmc
> --=20
> 2.34.1
>=20

--jmHGxiniHzsUH9Y8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0dFZgAKCRB4tDGHoIJi
0mIfAQCayJEyg/gpu7kW1AsnuurZqhAYXJ0x4zKzE2K1FAFASQD7BAOqyd6ui9uH
b6YBGxhPSq91ve2zVGXLlpN06U7rIAY=
=Gnpn
-----END PGP SIGNATURE-----

--jmHGxiniHzsUH9Y8--

