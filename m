Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F11EE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73xQjGFD4kv0bIyMOBquAjnNM1xCWQ7ChvbHtBBk+Ag=; b=d77yL/YyOnp/joHjFnm5FUuWoA
	KDKpOwRxkvzPJq1dfZCtCJi32PIuDtlcIvBNvykdh/16xqfMxtFmSdyRzC5/uXpnqFSUwa3n3lW3Z
	eccu0BJ3tTZ3E1TCX581iWlLbibDPzlP6a0ZtGUXHHUIKVVt2VYs4F9hCcgr8ZMeCndf0M8jDh5yt
	Gc5OSxiqq5uVCaaAu6Zij1gnXAChGGorXoMyx3woM9eHg4zl6t9WeGJUNf5eZ7ycwSQrb7feHmZIp
	pcsr/f5g3EDptwQXa1V+rQR8MZqScHNN4f1d4fdSRTZrl9xPYZKNAib7A+t9vtXRCO9ZfZevjZxTE
	U/Sd9TVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG8U-0000000H2dH-306f;
	Thu, 05 Dec 2024 17:59:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJG7T-0000000H2UG-0C0r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:58:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A51495C6D9D;
	Thu,  5 Dec 2024 17:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF0AC4CED1;
	Thu,  5 Dec 2024 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733421510;
	bh=73xQjGFD4kv0bIyMOBquAjnNM1xCWQ7ChvbHtBBk+Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Orlrb+ElrHdizDwlaDZTRLYCgXbBCQ7lTewAAGkzKjsd2qydeM+XKlwzkgmHmNakO
	 /Tg1HkdP0dmYfuhOwdRfv/iqU0R5Che9ad6MPbCSkOjUQ4o3huwLs9e42to2S/Plbi
	 fLUrVrT2+wROyeUOu7V/5B8hFgFlrDNnU4JsuV5RqE1x2iXZpSpQBG2PO/JfXWp2/4
	 r3tCBU9HrWPHnBgmDharqVj374h+kKmfJx981ZFl4g0jypdF+Z6wwkrSeE/7RwwZWP
	 48hqgipspHnjAN5w8ooFd1fs+ag48MQvzPj72b8DvOKVT5EKZoqapsgIc4dlwVmnnb
	 OQ1s9bINGxWYA==
Date: Thu, 5 Dec 2024 17:58:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] regulator: dt-bindings: pca9450: Add pca9452 support
Message-ID: <20241205-cornfield-stoplight-664ad32353de@spud>
References: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
 <20241205-pca9450-v1-3-aab448b74e78@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MyZ5EmMb99Zgg/w4"
Content-Disposition: inline
In-Reply-To: <20241205-pca9450-v1-3-aab448b74e78@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_095831_124308_B085CE29 
X-CRM114-Status: UNSURE (   9.46  )
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


--MyZ5EmMb99Zgg/w4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2024 at 11:51:11AM -0500, Frank Li wrote:
> From: Joy Zou <joy.zou@nxp.com>
>=20
> Add compatible string 'nxp,pca9452'. pca9452 add 'ldo3' compared with
> pca9451a.
>=20
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--MyZ5EmMb99Zgg/w4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1HpwAAKCRB4tDGHoIJi
0vSkAP0e4ibG2OMWjU9zkkepAuDnmh7gZrt/mo0r917YnFvyvQEA1mACkRWBygEy
s2e5cq6G63ISm+PTrFg9VWDwjfPXngs=
=9/jl
-----END PGP SIGNATURE-----

--MyZ5EmMb99Zgg/w4--

