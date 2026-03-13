Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66841107BCD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4CpsdGFbMbI7tOvEswPlTmMEckGSY4N9ExaDjo0Rjc=; b=oKrR2wbEyuxGb1G8J2nNP/a+oc
	4JUVwJ6iB+dKd+OzosYTBxHxy2NqVP3DcFIJuDcVAD3fQyx1gUibM+L1VxexBKF8j1DEmTKBk4791
	odnKiTfl22zzEVrPX0QEBB1sc8Jl/4toCmCwerhrxtZ6S+B5R7pbjm+FugouakcngqimZq/wtVWA9
	WNPnKOVA6KGoRzKn509o/PJljrK5ZLyO99KxctMYyAoYctlOrigYfV2bUE4xOoipp0c00BBdw7cuT
	52CVpCnXpv7X4rzerPKXxP3rcllL6e7+qff1sKnj4YoXWtoiOGG/kMnazDfcpGVIR71XO91KPiI6J
	Qe6P7jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16LK-00000000ldd-1rBY;
	Fri, 13 Mar 2026 17:30:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16LH-00000000ldJ-2wU2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 17:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4395744504;
	Fri, 13 Mar 2026 17:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F574C19421;
	Fri, 13 Mar 2026 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773423031;
	bh=X4CpsdGFbMbI7tOvEswPlTmMEckGSY4N9ExaDjo0Rjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dh2QU9kcBFEYWzQw5hrRi6oLIX4WEV049KPRhXIRoxlCZF6whuxnErZHNqBusMPte
	 MrK3YT44m36jWAlsVswaBhbuANAtMsu+nJfgN9DF3fJSAZQ68HhzmHbZ9MtT9JuPEd
	 bvsj9s7tHhToX+ZJtTImxMXsUcRmS3XeDiZYwJUDFzeI9zImww8GIih9ZZQFJD/S5q
	 p6bLw3+sMf7LkYYCLWwcGf4tFRs+uj8wxstKHyktXa37QynpYfQlQhYfFGoAlfYkjc
	 xUg7/ksMNIx9OC7GP67dv4dErGTEkVbiFhTzhwc1tMPrRQFszTCbrbPeb9m91wFNV9
	 uEGcn3P46MW+A==
Date: Fri, 13 Mar 2026 17:30:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: media: st,stm32-dcmi: add 'power-domains'
 property
Message-ID: <20260313-cheddar-wavy-c4c1deda70bc@spud>
References: <20260312-stm32-dcmi-power-domain-v1-1-07cc47216a76@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sJ8wY+4DHeSlHDaa"
Content-Disposition: inline
In-Reply-To: <20260312-stm32-dcmi-power-domain-v1-1-07cc47216a76@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_103031_775606_195E8E1E 
X-CRM114-Status: UNSURE (   6.44  )
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


--sJ8wY+4DHeSlHDaa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sJ8wY+4DHeSlHDaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRJsgAKCRB4tDGHoIJi
0kleAQDXGAulLqgZbTIoSAz103uNiuY79YYvml9BDUgEgzQb3QD8CyMhxSzinwOc
XJ31tRkhVwhibWIMqMOXS8b3ULvMcA4=
=Hh2Q
-----END PGP SIGNATURE-----

--sJ8wY+4DHeSlHDaa--

