Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E078D29C40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIT23ZJJmSn61oh1EAaGAO58uF5tV1ns3RhMngSPNpE=; b=oSUCZWxAnxOXKXKIyfNesh689A
	TGJ+ixOXdOZrsJV+KuhcTMw71P36OKnsDjTqpzHKEsm04t0OP928T6hU0nhEiUF81KUZnyVKhbWu0
	XrjkPQTLaaBf8PJsbiYeCWfKVr/fgXUNAOoaLfnW6sPbtDFoXt/XyoZA/eFEWCCk17Aa4hmfc+90U
	97duS4S6idCWm16pYvjvUpgzSoBsMe9/ZPx8eZ8e7oFFTd+Ww3/0mwJj1B9AeuBPZAIguUVwa0M0q
	cI1gz50LZZd61k48lb0atmi354ew4aqjj01kxaJIl2TtveHZlmNx4NGYLpeNkoLTl9eyDRzF5jvg2
	+dbj5hpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsBf-00000002VxK-1dGU;
	Mon, 19 Jan 2026 16:33:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsBa-00000002VvH-0MBI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93888400DA;
	Mon, 19 Jan 2026 16:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78464C116C6;
	Mon, 19 Jan 2026 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840381;
	bh=FSK2p39fnYyOReSbFHAT7uDwUgHyiuXc91JnF4Ih5Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unRG7bW+ig0RCov1HYV8fF2IJlzjJbL2Oo+6mAoopXSU27xHFSj0U2YrQo/3uhwWX
	 jBvycIPINdznhVcTADN9y1N0vgfc8zZm77dYlQO7wC8n2/nZ2wS48vS7UxWKeQPcNu
	 jPBr3B+b7B+eOLADnoogEcDOhy5xKNovblb82JXyN6+oOQqLhrx1kStLKFJMLqVjEG
	 DCyednN+Oh0d9s0mE6jd7bBi6bPG7V68w3IG4UyJ7MmOI9jiZ1ws12XhGOmhOm+BbF
	 yuJ0OuOUjiyV/jNoNZE3EzUa44dW8tJxD+xlLvs9HheU30Mto4TXVX8Qq4o5PJpXIZ
	 F45poegiDnyeQ==
Date: Mon, 19 Jan 2026 16:32:56 +0000
From: Mark Brown <broonie@kernel.org>
To: abdurrahman@nexthop.ai
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
Message-ID: <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V4YoqTaJILUWHTXZ"
Content-Disposition: inline
In-Reply-To: <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083304_876160_C8695DF3 
X-CRM114-Status: GOOD (  10.08  )
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


--V4YoqTaJILUWHTXZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 07:06:24AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> -		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
> -					  &num_cs);
> -		ret = of_property_read_u32(pdev->dev.of_node,
> -					   "xlnx,num-transfer-bits",
> -					   &bits_per_word);
> +		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
> +					 &num_cs);
> +		ret = device_property_read_u32(&pdev->dev,
> +					       "xlnx,num-transfer-bits",
> +					       &bits_per_word);

Are these bindings appropraite for ACPI systems?

--V4YoqTaJILUWHTXZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluXLgACgkQJNaLcl1U
h9C9gQf+J10ea4w8nkbPfpv4jU70xx2BhYkVgoUYn+riFNO3SKUIFiPLzobc+5KS
PpceBDoj4/KQa3S82dLz9lrNrhPB0cGBtMn1AixquTSRBg+pf+LVH0JfQwuWyk/3
WfYqEOI/SaPBdYWDZtt9t7U4rlbmb7g9tFrDyjzL53nbzihr+MfOMNbNbnNp7VQk
IKpaZRa1I2AnMMYz4yGDBptPVvlbyG3Hh/k64Ntl5Pecfjvx5LP21O30Wp7xmbHW
+Vz5hN/RhjTN3VB+cIq94D6MOoo2yuDIbyCMzzABg9hw6g9yOZdfG5UOPPSJ9Cmq
mBJwXwYcsjl78RNhoI6cCWO5yKwhkA==
=E8uq
-----END PGP SIGNATURE-----

--V4YoqTaJILUWHTXZ--

