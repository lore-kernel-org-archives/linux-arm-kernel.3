Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66683E83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBQp3nLqWP8FzkdVHFvaNH+FKz7q+nqq4HbvzVC2Nu0=; b=T5SDlmdzU7kmwN2VnHohTOXB4C
	Z9BM4ZtGBaX6pyazdHSvbq+tB0j5Z7KMydakIyRB78NkLHp0fG/cG8SWYOKaCVdg4upRH1eKr1nyz
	D+hIx4Iuo384sCu82Yez3CMmlQ4tVUn4dngetj5aa8b70j4oq2Y3CrLokUwdz1O0EUf67aw4LYwjs
	TLKxwyzNoxOQBboTMH2ii5GEQml6bQoH88kHDbpT5M8qB2xhqkfxk3/FnedZPohD0Ezzc6Lb3leFT
	we2IkAaMbnhJPMz1WFDFi3rJeYc7J6jjoNABk3ondIfiNFVfnSuKcAoR/nyuXge8at/HkEfTlJUt0
	U4JPKwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhF3-00000008u5r-07IX;
	Wed, 04 Feb 2026 18:04:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhF2-00000008u5k-1ADK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 18:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ADCA60018;
	Wed,  4 Feb 2026 18:04:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49896C4CEF7;
	Wed,  4 Feb 2026 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228279;
	bh=jBQp3nLqWP8FzkdVHFvaNH+FKz7q+nqq4HbvzVC2Nu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiM/vKOWNK91k16+wMf/KvrhwbJ6NFyvbtXkWOVwjmzZCPRxJN6PY8RXr5ziRjKB+
	 R9aSFT9o/FHbv4v2OOfiWatyfue9hrEHPxKvKa+H7m/HAyB4ras2wLyWGjl8ekpjLs
	 UYMn+/SJz/Qr3Rg6m0uBjNXQ6xhWODWJZJMHcgMFLiT44j36bkX5qC5l1EDmdo2P1h
	 DZmRnUNe80PVYJAHiRR2km7FokPulAzVgQeTRj0AMkA/rmrKbp9ZVs8slwEKZTMV+/
	 4HniVwhcTVEwwzOgeOlP+FVdFQtyZ1ohnRN/NggPAbWT3T7jOTWnz0yi4IqR7BE9X0
	 m7RCaFbzmbGlg==
Date: Wed, 4 Feb 2026 18:04:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Roger Kan <Roger.Kan@quantatw.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
Message-ID: <20260204-pentagram-undrilled-3c85ec087a2b@spud>
References: <20260203-sanmiguel_init_dts-v2-0-6a5682c32b38@gmail.com>
 <20260203-sanmiguel_init_dts-v2-1-6a5682c32b38@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8hOsCkrKAc3Pq8Lt"
Content-Disposition: inline
In-Reply-To: <20260203-sanmiguel_init_dts-v2-1-6a5682c32b38@gmail.com>
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


--8hOsCkrKAc3Pq8Lt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8hOsCkrKAc3Pq8Lt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKMQAKCRB4tDGHoIJi
0hsIAQDcWkSEb+P7WnSB/EHaS0NN88Ti/rykerSiGLt2jE9mYQEAzYAaHgX6rASe
Gfdsh6cxkDzBBA/abp5+aRh1+kIgCw4=
=PuSJ
-----END PGP SIGNATURE-----

--8hOsCkrKAc3Pq8Lt--

