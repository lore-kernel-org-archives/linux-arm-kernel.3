Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC84CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4Okv/x23FhMBO+/B4ePTthjPHwfFGhVSGVX7+s/ZjA=; b=E6gmSu/sz0+RDU8+PJmWLqrqCj
	QcDTzvuS8r2nXIf3ckRTjq8JytZGB7iaVwzbB8x5y1B3v/H9VnzpicgLgH7jiuGVTTmuGos7jLx2m
	/+cEwOs7mhPf8dpuk+tffVHqeRwJ22SVsNjggqDXy4FNjTgAvjxYCZJynihf+NPMbUhyeTIvlMgC5
	m6X/89nfsjFhYG+AUETi7HqGYKGm5mx64UyjU556Tw78pQdE97tEX/ms9p4hvoWHUQ6OoygX1G98D
	5mOi5NIR/YrpVkJilPvYsoylqtrkjdqp0Go2LPtXLlk0JPPVPm9+bfZ3Vo6yVZbpVRHQHxvo8ctct
	G9gj8gHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgSL-0000000C5Cx-1CCE;
	Fri, 02 Oct 2026 16:49:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgSJ-0000000C5Cq-3t4Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 16:49:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E81960214;
	Fri,  2 Oct 2026 16:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090451F000FF;
	Fri,  2 Oct 2026 16:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790959795;
	bh=G4Okv/x23FhMBO+/B4ePTthjPHwfFGhVSGVX7+s/ZjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pg1/XsmH+d7+eadQzhCsTS14MyZB0vy59qclPJJTU4WgGv16P3mCCvHo/J174itvs
	 mqzwfToYZWbUWXUAGRyV3epwz8jH3Acxe7u4metvBbIVZIyaCHCcZV5WTs2HbfUKWl
	 1GZfro2ueNhfICQoecgbgIvZFSpLkla02UF/h0uBgeB7GTiPQdNqJ0dt9fsYtdqZ2w
	 rGN0zsMno/X5yZP+dZidbua5GaxtAEOU4TiD7oMHccZORRVMpQN1tYAEg2Zg60aW5y
	 JcpXA9hOdogzBHU8a2xWRdp8FbhYqFzidHp6le9tzZiAO2U71BYbG3lJTUIdPF9b/S
	 vYiylgJJEcjyQ==
Date: Fri, 2 Oct 2026 17:49:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
Message-ID: <20261002-plow-paternity-f059f34024e8@spud>
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m/DhfOejCnplycPG"
Content-Disposition: inline
In-Reply-To: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
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

--m/DhfOejCnplycPG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--m/DhfOejCnplycPG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/grgAKCRB4tDGHoIJi
0jR6AP0ZIXTgdFOaUkqfMyferOijuBekqN5LahEr8tjbq1HdNAD8DAhmGCYmXi4a
xPcbVbSWan+n4jGfKCFnBIaiFzym3AY=
=OBEL
-----END PGP SIGNATURE-----

--m/DhfOejCnplycPG--

