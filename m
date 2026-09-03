Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ED4C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5A1QYfa6A6TwbHZ40DsvlwxTmcMjlVcOQHbaH73blu0=; b=ML2Qv8V+jdM7kbqkp+QzZu75b+
	GRyINUI7Lg18OYf8iILB4ojl/kBVUlpV3yKTu2dxGfFDbBM0WxC3IJosLtT6H7XhbIoLrQhl23h0n
	Xifh+crdZKoB9KVmuByjq1QEcpRaxCkSAcAOeOIPW5XAdBplUTtWyqK8BhdvsSuACMCBnbRuzJlKL
	v+1t0t6tPwMYeIqGKrZx0UVClL9wV9q6kR+CMC7XEWkCIu4V9AvbyhAm4dkNpAWnVUFVrC1cYoBxC
	oofFsnd7BsnlaYbuE3FW68ebEhMJMxk9GNqUotXwqj4fp3Te/xjEypbCftFtQT7npI2F4xxKUY+ns
	O1FSbHiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Bl5-00000000KOq-2p0X;
	Thu, 03 Sep 2026 18:01:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Bl4-00000000KOc-2yA6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:01:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0801541983;
	Thu,  3 Sep 2026 18:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7551F000E9;
	Thu,  3 Sep 2026 18:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788458513;
	bh=5A1QYfa6A6TwbHZ40DsvlwxTmcMjlVcOQHbaH73blu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LGgqy440wXjW4z+2ej4u2b4i0GXg+WhbIy3OSPK2T8EnQeTv97lOTo1HBuZExQuau
	 utxcsrjiFdtV4uH20iMAjhw1GOpdVjC+WYCkI3iTsEEaooKBp5NIopFiAJuhSXzzBW
	 qhAEGu/OFRIvC/9nxFafESHVsu46agx8gOidMyyQTTtbF8eeHuPV+PaHzyV/rQJWe2
	 oO28qKDpDKvQL/4fPa+gIxMT90aQMSGuLCqYsbbInWGv+QIhEJu8EiLdZElSx9eVlW
	 Thvhw+++DDOz+yk1mWOMjTR2XmERgyPfSXGGZ2YjzDyOC38YXiXX1njmx/g4QA/aNz
	 FPdhl7ut8vxPg==
Date: Thu, 3 Sep 2026 19:01:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iommu: dart: Support specifying the
 DMA aperture
Message-ID: <20260903-uptight-lifter-fa7519487839@spud>
References: <20260902-iommu-apple-dart-aperture-v3-0-252ce55b7001@jannau.net>
 <20260902-iommu-apple-dart-aperture-v3-1-252ce55b7001@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P9Nxr44pFcdtpVBU"
Content-Disposition: inline
In-Reply-To: <20260902-iommu-apple-dart-aperture-v3-1-252ce55b7001@jannau.net>
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

--P9Nxr44pFcdtpVBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--P9Nxr44pFcdtpVBU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapm2DQAKCRB4tDGHoIJi
0uC4AQDQIi8jH2g1PVdYyk/QAhScZWhhLt/8d1AAueQhbMe9zQEAzmP/bNMIrhWH
QzUpM1skvbDONjwjgUjC3gF28M/4qw4=
=gvlv
-----END PGP SIGNATURE-----

--P9Nxr44pFcdtpVBU--

