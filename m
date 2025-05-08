Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA971C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vsxm1JyRB+bAQ3tEUlSlA5M/qBA4ktV3wqCb8KbCyU=; b=ysmj0/YR+oiV0Xg7fgOXMSIfkS
	ec9WFw3Umt5AFFhu6vAVJ7EXtx1o9QxnAXKORTeHwGZvRw9TblUHH018kY8HxP/iWukkphUglGJyD
	bwusHGpZ46bcr5aVEw4BW3pf52GpWPU/gPRvl3rla6rhaIflS0xROe1G+PnZlRqHWKZ4cu/UiAGfz
	hbUsoIAxYBMdsSVVY1qph28voZ///T9UcNogvlBRJfO524VINpepdAdjl5tJLICXjCOczWkIWzvAx
	btxtE7LTznmxM1XMY8RPO6VH8nXUErJS/xwKJKiOn2EB4WgtxIdAwXCvE9sgWIo19mz//RPwpx/dg
	tTTuUq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3KK-00000001A2Z-3zuJ;
	Thu, 08 May 2025 15:38:24 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2gC-000000010wn-0obt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62A92A4DEE2;
	Thu,  8 May 2025 14:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A12C4CEE7;
	Thu,  8 May 2025 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716215;
	bh=1vsxm1JyRB+bAQ3tEUlSlA5M/qBA4ktV3wqCb8KbCyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j07kvywVUKN4l2qE9kTZVbyyzXQMh5gn/i7jJIOvsFTdJI2DaCj5f01to0kD1yOPn
	 oNbYZLuUXb7btBzUHSGlUSgbyvpV6IIzNF+u6JaXMywUKN4Aqo/f5y5dNUqz9QE0rc
	 SWNCQrPJR1fYLKQBHOiTHr8BGoquAUD5XeSXdJ+TzZfHnNutQIGmVyl7+DemlVlAEl
	 G4nnXIofN1dyRp9t6V/P3Ln2ISaAGcY5E/Q1l7fgG7zDHyDUSgdRpgjw1erVujp5H0
	 lm+ZwIDFz37odHj3WzqDxaeOvI1G0t3DXcSAG00r8EIq2f061mFYe5s01Fb0ZFoxVP
	 XY55/TPE8R2Sw==
Date: Thu, 8 May 2025 15:56:51 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl,qman-fqd: Fix reserved-memory.yaml
 reference
Message-ID: <20250508-tumbling-suffocate-a0f41c8e67b4@spud>
References: <20250507154231.1590634-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oD3B2Ah4KH8Tz7Mp"
Content-Disposition: inline
In-Reply-To: <20250507154231.1590634-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_075656_299460_AE56886B 
X-CRM114-Status: UNSURE (   9.82  )
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


--oD3B2Ah4KH8Tz7Mp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 10:42:31AM -0500, Rob Herring (Arm) wrote:
> The reserved-memory.yaml reference needs the full path. No warnings were
> generated because the example has the wrong compatible string, so fix
> that too.
>=20
> Fixes: 304a90c4f75d ("dt-bindings: soc: fsl: Convert q(b)man-* to yaml fo=
rmat")
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oD3B2Ah4KH8Tz7Mp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzGMwAKCRB4tDGHoIJi
0jQLAQDjo0zImdxubhL2UWRrPkobD019kaPhau2jHa4h21N5xQD+M40JHVkb1q4E
VNgqwP6qcDhA0fIZ7YW9nJZYAS+vjQ0=
=kREc
-----END PGP SIGNATURE-----

--oD3B2Ah4KH8Tz7Mp--

