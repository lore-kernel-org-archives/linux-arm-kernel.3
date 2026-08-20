Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB25C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHW9cNS1bAzJSHh0Hf7sojpp13ovZ/n31IWZ0I9IVHU=; b=EAuRzzXlfPhtmYfIraH8HCyTj1
	Md6DjnWetHGepHVMmBOJ12YcdAinnT+7HSY98SuRalOcLRd5m1GUl1bCADc9GjTMZeZBJuU3+vbWE
	PzXdTeFTz/CPDVwhqpfknJoEtjRjALXabMpEn72S9mG8mMYgtCMu1PFzL6OXRO+/Kum5y5RdyZPfH
	FGBOwEFE8vndV/M6D0nEOXQLaCgw2PInWKWkri2nhzcqyhOVwDHfBn7EffKgOrNVSwZFdaXQPb58P
	+62pBr63KS41qsDyucYSmyIwrcF8ndBd9bjHxOIs7w7D9wpsDH2wVFCFU2u5kh3Kcmx6evcqVqGd5
	5nU5NPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7H6-0000000C1ra-3DYG;
	Thu, 20 Aug 2026 18:14:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7H6-0000000C1rU-1Ctx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 18:14:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AA0844084B;
	Thu, 20 Aug 2026 18:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EA41F000E9;
	Thu, 20 Aug 2026 18:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249639;
	bh=DHW9cNS1bAzJSHh0Hf7sojpp13ovZ/n31IWZ0I9IVHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JYRMzIlKcxDf+F4AXqznL1V8BWSzeQhMO/JGUugdCwiZnW2F0FSMcDytVhZ+2L19u
	 wWitX7KE2A0AY/ptHXfmM05a+FMV1buaJQLCaa3Lpy5BAp89bQuKSuv5UzG4IyuLtN
	 pOICXVh6B/LrwEFnN00+NAzhs883Hwdb/OdjydrwXuB0QzCpoiV1OZSK2y80aQi8N0
	 WHIXyZbLx+WnfPBiV8qHpayErFwSfRQ2KvQOtiV4oAkquR0WZzEjbZMacsngpkl0k9
	 KuWIH8SC1lKMHn5UyvjTNOBZ/EQyVy99jECcpUH5JmyAVUrq4+JxUMk2MnIP2tbbxS
	 s8uk2eEjvC2hg==
Date: Thu, 20 Aug 2026 19:13:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Turner <tturner@lineageos.org>
Cc: semen.protsenko@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org,
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: arm,mali-bifrost: add
 exynos850-mali compatible
Message-ID: <20260820-blemish-cancel-c1698ef90d32@spud>
References: <20260820110620.1881-1-tturner@lineageos.org>
 <20260820140439.83220-1-tturner@lineageos.org>
 <20260820140439.83220-2-tturner@lineageos.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6NvgXej4M7dQyR6J"
Content-Disposition: inline
In-Reply-To: <20260820140439.83220-2-tturner@lineageos.org>
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

--6NvgXej4M7dQyR6J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--6NvgXej4M7dQyR6J
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodD4wAKCRB4tDGHoIJi
0hgsAQD9tdhZ0vEgSmGESeOTwyNP/Qb3m2OcwQ8Mk1w67393VgEA7LJHdNYc9QRk
CaK4hmHy7P3dc2epag9tzRNOocpoWgg=
=4BUq
-----END PGP SIGNATURE-----

--6NvgXej4M7dQyR6J--

