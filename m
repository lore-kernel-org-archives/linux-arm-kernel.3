Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40580C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9+8yBW/ttWJz+sinWqg0S6VzMzDxjVFTIDj+qWEu/0=; b=mHf/HmbE7bWsnV3EED/EG5og0k
	8+RGt2fRVxqcAsnK0BNhOhdpaEYXl3lW4zS7Y+pUBieftrTLoyMc5fGBeYRRIchkadLx/d4VnX4IZ
	pttysjKp/ddr9sdlNoAnCt0aj2Auvk37aMfZzuHQP/i87I+F+3pVAgqPXVDyUIbNyvbXjwIqgLEhn
	ISx8EcU++d9kv8VLGzWIyuzK+qA/T8rh+uJvrE1Z7zecM/w6zAHceTygygUBI+lOSU7RL3d4tfCDu
	XJ5JWQpZ/cD/wVya+pbAxjDLBPRuvI49aTJANB0GCfuLlgIAAKR1QfpSl6/vnk+Y5fAseGyHyzj86
	5iiyP+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webvh-0000000HXjB-01lb;
	Tue, 30 Jun 2026 17:07:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webvf-0000000HXit-2nTc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:07:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D18840959;
	Tue, 30 Jun 2026 17:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8498C1F00A3A;
	Tue, 30 Jun 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839243;
	bh=w9+8yBW/ttWJz+sinWqg0S6VzMzDxjVFTIDj+qWEu/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lNINN85GsqYxbZSA0cZrfT+mS9QPr/3HQNG3o2NNp0YXCFSr834FMhQ2IZNp/fAe7
	 P5rGd1mUhDMbduz0GObTTm7ZDHYzM4Fz79WL5XeRzU2PPe3lh1PGM7YYdPa0LMSLIg
	 8uyrwrzmOFTOxGlKEDkdlT9NKlUzaAI5qo63eppfL59O4YSOQU6ttbW46hVIbp0PBi
	 WCia1Qc4OkRn2tMVURK1Fak2z4ICqLQk6HDy/FpG/AGZ0URhCKccnlAcupJmycj4Fx
	 C6/VrCBFnvwbjpVfmKBdXYAQIPIVJUupP9ylTPYuCnP6vGgKJ14SIO07v/3Z/Uv8DG
	 ilW3BYTjTW+WA==
Date: Tue, 30 Jun 2026 18:07:17 +0100
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
Subject: Re: [PATCH 03/10] dt-bindings: iommu: apple,dart: Add t8122
 compatible
Message-ID: <20260630-drove-uniformed-e27afecdfd05@spud>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-3-506d936a1707@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pZtEHyUigp4Yu2He"
Content-Disposition: inline
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-3-506d936a1707@gmail.com>
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

--pZtEHyUigp4Yu2He
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--pZtEHyUigp4Yu2He
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP3xQAKCRB4tDGHoIJi
0gb3AQCSuvpncMB3eYqYLTAgeavZu0OiQNNyInzS7FsL7f6VuQEAqq6x35gFBmaW
Fe9uycvWkdrYfgFhEe8fftzjNsB7LQw=
=lwzJ
-----END PGP SIGNATURE-----

--pZtEHyUigp4Yu2He--

