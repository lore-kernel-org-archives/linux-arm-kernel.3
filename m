Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AF9E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 18:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yildsclURKwBrFcuZYzExOtDLbmKY9IGWCKkE4r0JCA=; b=Mcr4zzYYujjCPDUFjKpq4i+YY3
	YN8KlS7bE0IvndzrjHDViRPIidXAwMjBwkVcw6KGLvK0T+51K7O1lbZldJhVROEYtZSJr13NPT/Cl
	Wf+lkzTcihAbvYwE8J+RoILq4M+xSTvXc2/kynWKy7RAk5IMfzTWveJvWapowBjijMh4HF2vF7ymZ
	M2hexNMAN8H90Tpcc9U0ukYKbfhgW3mZIxCtbcviijWDHduK0jYx3CDh3bsiR4cD7l6+CoHcDX6GB
	n+5iHCZPzEyZ8y3umaEJrKzI3mt0X7l3vxPbTV5XS0Xeh/NV5JqLT1Dntz0qb3tCIu8S8jtkZiNYM
	HIfO28Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcCq-0000000EWMg-45gk;
	Tue, 17 Dec 2024 18:22:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNcBk-0000000EWBK-3wLg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 18:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 858D0A40FA3;
	Tue, 17 Dec 2024 18:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E710C4CED3;
	Tue, 17 Dec 2024 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459655;
	bh=yildsclURKwBrFcuZYzExOtDLbmKY9IGWCKkE4r0JCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8TKNLVu7XA5lXmycWns29seqO2hyRgVnNOPtDYIK1ZvGtRRuq3/lni9a7rj6NRwA
	 7PpxpAOIusn9wTEce/uJMivoDJ+t8Cc3myGHyo5l6Cw8DZI1J1QJSMfrPz6N0ipLsA
	 ioIkdczq83kqYRtTaUBLRAzkiqu8O2gDl0OhAQhgA/vXU/gZvuKk1xeUXBTBOnOqq/
	 QCzvGg8isuiccF9y3WIVz1BJnMjH8FvJKEIeFD5hz9gmozKkDk/FVFtlOHVAH+rn3c
	 2XI0zdgvBVBIRFYcy/81QfCNBTGKJ9R6qw136CcVzdD2qopafyyEA3mMt0jWNldRH5
	 40N1rjSlTBjTw==
Date: Tue, 17 Dec 2024 18:20:51 +0000
From: Conor Dooley <conor@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Message-ID: <20241217-compare-craftily-94425c53b4d8@spud>
References: <20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com>
 <20241217-imx-ocotp-v2-1-3faa6cbff41b@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xHQ/yDLv8t1eplxP"
Content-Disposition: inline
In-Reply-To: <20241217-imx-ocotp-v2-1-3faa6cbff41b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_102057_039514_0E839C12 
X-CRM114-Status: UNSURE (   8.79  )
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


--xHQ/yDLv8t1eplxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 04:43:36PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Introduce "#access-controller-cells" to make OCOTP be an accessing
> controller, because i.MX Family OCOTP supports a specific peripheral
> or function being fused which means being disabled.
>=20
> Add the i.MX[95,93] OCOTP gate index.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xHQ/yDLv8t1eplxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HBAgAKCRB4tDGHoIJi
0mqiAQCvW9eoF6N7cbHaOx0lGoN8Anj0wtcz8D/mTXwQMot4WgD+NXPCSLjx/jyI
l1ucvLcVZh77ERggFbTtxPhpmvr9hA0=
=qNnf
-----END PGP SIGNATURE-----

--xHQ/yDLv8t1eplxP--

