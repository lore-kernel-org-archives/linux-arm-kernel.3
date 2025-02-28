Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51AEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 19:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8TO8kJvdzGkByRvxotHz25r5Pr/JTfV5defoqrC03M=; b=vlkBEYfSbVpAg26N0QZZCV7ZO+
	4sVAWwxkj4Qt7LvTBc7wuE0g/UlIYxjR1NDiFpW+PsAkyCYU2161rsX6PodD3kwi8msG3Y4uvt/Xj
	Wt1WrirY9Pl1zYrhl5v0EeZ5mzKpY8dbOYK2uJGvKV+p/DVknSGYYxI+M/JrQFWzDSVhni2EKjWd0
	siX+hP7xzu1/4MFu9IZgeAXEExDEzIY3ugPYOpKya2GgEkmHxIiQiQOfjbRGTOfJHH7OL00puIZSc
	s3JuRu1DAMKW98e8o+tjN4Hr22tTQeNhlCYVRsqci25zSsk3Nnjqn0DX6LfCEwop2nhO4ZklPvM8t
	RyqG+9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5dY-0000000CI5x-2LpA;
	Fri, 28 Feb 2025 19:03:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to5aR-0000000CHMV-2OyZ;
	Fri, 28 Feb 2025 18:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 207625C6969;
	Fri, 28 Feb 2025 18:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2974DC4CED6;
	Fri, 28 Feb 2025 18:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740769190;
	bh=V8TO8kJvdzGkByRvxotHz25r5Pr/JTfV5defoqrC03M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AzRFEN4qoxk+OLKPqEaSZXjz+7JVBrDji4+ZrJPCMWsW8323Hn4LbuD2m+yEuR7+4
	 maZFJwcxu7jV+6oej+cMIitQ680qOQwSHT4rrwgkqomV6MCqmAZm/iFatUI3w6kde4
	 J7wGZDfymze/KiIfd7WC4CVZkTyFfkvYTFBqdhzVgFrw+4kJS/Kxv6nmLcygwu9oCX
	 U4Nog4yAXjNwtnEyfyTXJyzgsxSM856n6/BK48Cs3Oq5k+fQ6ODD3IMw1pS1SBdgJa
	 kddQ8nV9wQML3po67NFktAuRVEUShPZN5fCnUKS/tF2IaTv9L2fvbR876luHf+wj2P
	 PPdoKbjA3owIg==
Date: Fri, 28 Feb 2025 18:59:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: iio: adc: Add rockchip,rk3528-saradc
 variant
Message-ID: <20250228-aging-catty-3e09df499f0b@spud>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
 <20250227184058.2964204-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kcYt+SH3XA+Svxpf"
Content-Disposition: inline
In-Reply-To: <20250227184058.2964204-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_105951_661917_14358EDA 
X-CRM114-Status: UNSURE (   6.81  )
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


--kcYt+SH3XA+Svxpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--kcYt+SH3XA+Svxpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IHoQAKCRB4tDGHoIJi
0v55AP4uv6g/zpHbFmNUhaEZ83d6AZyP0AVS/FuShq/Vo/xOagD+JRT1vizD6zSK
x680FeC4UCRNAlWGNnW/x+bSs2jqCgs=
=5SMi
-----END PGP SIGNATURE-----

--kcYt+SH3XA+Svxpf--

