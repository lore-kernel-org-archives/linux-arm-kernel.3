Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CD5CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juGtphXMD16IFNj3hinHoDUNtNqf8xKJCjB681xRr7Q=; b=SlTYHiUs5FCyYKHP8vFcrASdLD
	veYM5kj1tMa/zcUk20h+TcCy+fRfULudifZ6/bKyPo3aVnSFY162p4/bw+dc2bsfXxLOM73UwUuW3
	6/m7lTkAtqFV0r/75Qgp/2Xf7EG8w1pHJjgt5ZF0wGoowYGmxycS8lziDlcDAGcZNPTJW09kEx3OG
	QwRkfuQWNORsCg6g7QPftYa0Jn/NbvhsfQ8iKwUS5OysDS/e1rEi08MpZP05B/BbvnpL+LarLLhDB
	7Hvqn+R7wuxbpZi1q2sVVChiEiHO0uhkdtjTV+hl0fUz/hmyGsWb7miJ39hJv9tbgnkW18ZJI+DDl
	PGbhbjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YyX-00000005Bkn-2XsP;
	Tue, 30 Sep 2025 11:56:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3YyU-00000005Bjo-3CqF;
	Tue, 30 Sep 2025 11:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAAC44379F;
	Tue, 30 Sep 2025 11:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15489C4CEF0;
	Tue, 30 Sep 2025 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759233413;
	bh=rVEH3heWQ9CYRYUOy9sPRsybw/cgSFigHuULmvEsgIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nbM1X5UCOwCMtc5gSaozPLdjbuYKjdj4qoWN8L9+ohY6oyfmeWyC+g6oE7BVMp/GP
	 0yVOGQMN6ZNUKmTFTRzV69wY8e+Uv1IvFQa5YfQQb35b0fpLS5xQ5brgtvVIAxIM/i
	 Lbg/BXoROC9RqSox211SoamyQcuRRDIcvkVXFX3JBXBJfax2/oziZD5WC4BrBk5cY/
	 8nl5DLyBetQegq1ls234yG+v3EYB2gjdBYlAXTMjIY6EcLU9DHokO5fNT7gb1ZNLl8
	 ZZzL3gumC7yjdoDcwwPEZiWMr7L2O4IaiNCrKAMbdLeKe/It5OauunNzdZLxjFYLPU
	 7HnexeEs0je5A==
Date: Tue, 30 Sep 2025 13:56:50 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/3] dt-bindings: net: airoha: npu: Add
 AN7583 support
Message-ID: <aNvFgkV-8YCnnfaP@lore-desk>
References: <20250927-airoha-npu-7583-v2-0-e12fac5cce1f@kernel.org>
 <20250927-airoha-npu-7583-v2-1-e12fac5cce1f@kernel.org>
 <157578d3-c06f-4621-b707-ca4208d18807@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GI8sOrmB41LyVA3t"
Content-Disposition: inline
In-Reply-To: <157578d3-c06f-4621-b707-ca4208d18807@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_045654_821025_2FF799A1 
X-CRM114-Status: GOOD (  15.33  )
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


--GI8sOrmB41LyVA3t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 9/27/25 4:03 PM, Lorenzo Bianconi wrote:
> > Introduce AN7583 NPU support to Airoha EN7581 NPU device-tree bindings.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.ya=
ml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > index c7644e6586d329d8ec2f0a0d8d8e4f4490429dcc..59c57f58116b568092446e6=
cfb7b6bd3f4f47b82 100644
> > --- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > +++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
> > @@ -18,6 +18,7 @@ properties:
> >    compatible:
> >      enum:
> >        - airoha,en7581-npu
> > +      - airoha,an7583-npu
> > =20
> >    reg:
> >      maxItems: 1
> >=20
>=20
> This needs ack from the DT maintainer and we are finalizing the net-next
> PR right now. Let's defer this series to the next cycle, thanks!
>=20
> Paolo
>=20

ack, fine. I will repost during next cycle.

Regards,
Lorenzo

--GI8sOrmB41LyVA3t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaNvFggAKCRA6cBh0uS2t
rGOXAQD9aWmnKC+UFDiJtMtXqtAOebHLNu9HuxT+1kz7pSHUVgD/bEjQtex8chJk
Le7FZ5a+eHigvNV2TMN3TurtWfqGbgc=
=u+lc
-----END PGP SIGNATURE-----

--GI8sOrmB41LyVA3t--

