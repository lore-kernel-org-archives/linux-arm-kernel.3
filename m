Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D2E77178
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25q/F0gihiJFe/6WUGt1Y7YKxMYzaHeYr6+Jz+bsBqo=; b=Ipy90OWoavB8hiOsXjLLm81bPM
	SOQ434IwCVnSaCQJcGw7Cf40MW6VoeeUxVnwxYefr7TRbazAxKI4yX1rabWWLBUIWDFncEvV38Dz4
	WGGvUv++B4truG858L4N3u+r7IiVQ7qQBF4FOcidSrqXmmUKMuwnsSKaq2LuoJifl4a+OuowIGpEX
	5jSyznJFPdfX+dykUe3it6uYysLA2+duUlMgwu5tgqm56FIKwHasTSuVHO5bY7gzd3dKGDUDe3Ci6
	0GykXLpGAz7EECBlka7SJSimHMsdgkiZn4Dm5piuPKma2QlSjQ3xeE8QOG8dWdQJsP6GJBTsUVpkD
	VQP7OadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFQj-0000000GtiQ-0BM3;
	Thu, 05 Dec 2024 17:14:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFBW-0000000GquA-2Ta8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 350CE5C5DAD;
	Thu,  5 Dec 2024 16:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74AEC4CED1;
	Thu,  5 Dec 2024 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417917;
	bh=nTRnH3LEvkzjiwoZZ3ih3yskW6g7MF8/Slf2mJenKdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECHlgGImtotL50LXwi9oXB2Vy3NH00it6CMDrVvFBZ8yci1Mh+nPCt7GeY2te6fIl
	 33bCCvrecW8FFnbLz2CBzZJ2QKiKO+nJDywY2SqpTx1xnz0O6+qzgkqZGsB5jwtcW2
	 ZhTrfdVSbN37lriLFPIQXployevdgh5E070M/ehMf4YNeBICp+8vVUF3FS2eqnDHF3
	 u8QKCP4nbfoXxdm1JlG8TY8IQmMfI6Pz70dyIzk0HzU6sKDZpk+VJC1Jqdx1mKl1FH
	 eulnVP4i9+zYdjN9Z2sc4NCgLbSLLZjWnKJgcOo5JrYwEiETLkFACX6XhwzQ4tPOiE
	 JAdED9o/MRXVw==
Date: Thu, 5 Dec 2024 16:58:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] arm64: dts: imx93: add pca9452 support
Message-ID: <b5b07f6f-a5c5-4b29-ada3-962dbbba42d4@sirena.org.uk>
References: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
 <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+N1E8Hjj5Y37D8a5"
Content-Disposition: inline
In-Reply-To: <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
X-Cookie: System checkpoint complete.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_085838_668928_DE2E45F4 
X-CRM114-Status: UNSURE (   9.52  )
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


--+N1E8Hjj5Y37D8a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 11:51:13AM -0500, Frank Li wrote:

> +				regulator-name = "BUCK1";
> +				regulator-min-microvolt = <610000>;
> +				regulator-max-microvolt = <950000>;

> +				regulator-name = "BUCK4";
> +				regulator-min-microvolt = <1620000>;
> +				regulator-max-microvolt = <3400000>;

The regulators all have really wide ranges, especially with no obvious
consumers specified.  Are these actually valid for the board?

--+N1E8Hjj5Y37D8a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdR27YACgkQJNaLcl1U
h9BM6wf9HQleDuZ4uYHDOaaCK09bL4yTR8x6i7YoMmnlls2srtzGMRGZZ1cb/sPr
a0RwpUShL14RqyuRYmEerOprPVYYLpvx+Poe70MiMG00p1c2wDbLrt2o3OYppkmh
9DXALyEsWkqnL6bzUD9T+m/zBfaIfUuO+ZY/IGiI+mVl0vzDEebE+hq9Jg4rvoNd
lN7951ImhymCfvRvkUM/RmjuLkijea9e00JW0Mqbai6WbhC5NYbo6Ya+inPKtkKX
+zuQQlnFcs93oqTJqtngequdn8bmyvjzHKmBXzS3kz1PmUUV69gXm2C7FbYOh88x
H0307QzEKgiy+Cugcn/uBhoFj41F3w==
=Ioa2
-----END PGP SIGNATURE-----

--+N1E8Hjj5Y37D8a5--

