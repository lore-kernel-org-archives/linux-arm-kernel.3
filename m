Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFC0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5w6r/tH+1c0BjCnlsR14DQ0xLjOX7snNJrPcoiIoCk=; b=1cXcYX2Ltd/GpcVfFzVWmIIFYl
	y6Rn7lxHvYmncAW4YhSMXtE20h6CSPHR69rBpCZYKM1imqoD2vXbH/5P2u1BAuH/3U8dwoMGr6k6F
	AAopuBd1MButuuyCwAvNtWcj2xENLRcm043pzoyWEqWXCyR2VZoZXg9HPkffDenAXuy+7NqIi+xhX
	/GWUAiYDRaTvsa/ETVB2IFNlXLMqLe5x9HKFj9fdrpUpue1q9WiXblIggLr8s3ocvQTL6VYm0ZQpa
	FhmWucKzCzjyztViyKtBSomyQRHwFAELXa1yijqLkxadI7ekn+9it+mK9C0ygyzgJJhSJOWdm4Bas
	bqanoGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webuJ-0000000HXVC-0axw;
	Tue, 30 Jun 2026 17:05:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webuI-0000000HXUw-0k5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:05:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D009A40BFA;
	Tue, 30 Jun 2026 17:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58F71F000E9;
	Tue, 30 Jun 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839157;
	bh=N5w6r/tH+1c0BjCnlsR14DQ0xLjOX7snNJrPcoiIoCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tq+k5hvIrMkpq6tMhKjw9bs3y/wAxIQjsfM1BqQQG4AWoy15ckAGsnL2JXDQQk36q
	 Cm4PIgPXaMNvPkJaLC41//c92OXYFveU4cuyInYkoCBR2Am1GJr6ND3qIYL/rVVoEh
	 Es4o/nTr29Bdkbt/HB1fvXISE2sZsnpxA8odhH7V29o1/IVuE09OYIqKdP/Pydbm8S
	 akJkXgLHQu4GN2ccLZi8Z51d1aoX4T+zyy9JueUxVv3qH8GPh4q9d5XXYIGijr3CeQ
	 dLv04Aav9uxxPSxpkuZqPVgZMZxUaaQc8Ij4nKYsGxejytEu6B8FWJPYSxWyYljTC9
	 L5SsZTg4Y/NwA==
Date: Tue, 30 Jun 2026 18:05:51 +0100
From: Conor Dooley <conor@kernel.org>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mailbox: Add Apple t8122 ASC mailbox
Message-ID: <20260630-friction-goggles-a9cdc64f4308@spud>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-1-506d936a1707@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qmm03Rbc43iQseES"
Content-Disposition: inline
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-1-506d936a1707@gmail.com>
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

--Qmm03Rbc43iQseES
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Qmm03Rbc43iQseES
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP3bwAKCRB4tDGHoIJi
0lcVAP9mxKonu8vsx/p/xSEg5pwp2Y0Y/cEW5k0OE+8uaHA2dQEA1dSy0Rbw9wDy
hFOPhEyqtWzYjDrJmXpR0qcQ0TNxpAw=
=qzpt
-----END PGP SIGNATURE-----

--Qmm03Rbc43iQseES--

