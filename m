Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rL3bZLrnUYURF8thqtoxReFNhkZUU/y7H9FUEGpZHlk=; b=3bwg9FtLLqkLyHX1Q5Lwos7+gO
	K5OaWsdt5QNPz35wIHKqYGUEaGtA3IKiRn+ZTBc25WcOoml7Cb35tne+Or7JkGKoV+Zk2H1eNpqZz
	m21nQ1NuYmIcY1lb8SzmxR2eCQn50vOX0C5zwgHmGww4xKYcLLZhgyLRW71OupCuVqkqLz216HY7o
	eZrB/xNixlfKlzzePpO7ZPfKUvUZsa2qzhtykaYUOlOIBjXX2cDFW1UXxguDMQliGtoKc4Ly8PuhT
	XzXluK88FoXc0987lzBGtrUBbGiNMnc4dGxOUVbXu7YxQx4VRSSbKq1xBD4RdgxJ4v5LdVY0ozW6V
	LAYDvgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAUr-0000000EbLU-1WeB;
	Mon, 15 Jun 2026 16:49:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAUq-0000000EbLK-07SM;
	Mon, 15 Jun 2026 16:49:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4A8D40E00;
	Mon, 15 Jun 2026 16:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60B41F000E9;
	Mon, 15 Jun 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542151;
	bh=rL3bZLrnUYURF8thqtoxReFNhkZUU/y7H9FUEGpZHlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f8LcJjd/1HjAnpmX20Vn9djIiVGiZCV/WTc3HJ/wfaEmbciM09pyS4RAPgOhcfF/j
	 IJL/Tlx6f87EiSalmrO8wzxxYefAy4aeCCWtl0SCdOy2Cpu0jQFCfZqsF4nZYix5lm
	 sIURhYzU2tWr3Mkw4DzebDua/cQ9LjMAGWX7GEC5jSjf+A9l0EkUSqf709XLumEfjQ
	 ChScSOOykIT35cJu0rYeX9FPqhvGFwfvmfzcPE3WjCpJ/nu+EPSJ9vvx26tJ43wT43
	 gOtMN/srrm53JcLut48+BgAjo+xmTUnNspwRY5WpwH5bwiP06SjBMd6gAAqzy/9Ivw
	 cPfZdf0OUzvWQ==
Date: Mon, 15 Jun 2026 17:49:06 +0100
From: Conor Dooley <conor@kernel.org>
To: MidG971 <midgy971@gmail.com>
Cc: tomeu@tomeuvizoso.net, ogabbay@kernel.org, heiko@sntech.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ulf.hansson@linaro.org, dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	xxm@rock-chips.com, chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com, diederik@cknow-tech.com,
	jonas@kwiboo.se
Subject: Re: [RFC PATCH v4 6/9] dt-bindings: npu: rockchip,rk3588-rknn-core:
 Add RK3568
Message-ID: <20260615-drift-dreamlike-0323a8dc5ce9@spud>
References: <20260613070116.438906-1-midgy971@gmail.com>
 <20260613070116.438906-7-midgy971@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CNSFopl0nkQ6YS29"
Content-Disposition: inline
In-Reply-To: <20260613070116.438906-7-midgy971@gmail.com>
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


--CNSFopl0nkQ6YS29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--CNSFopl0nkQ6YS29
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAtAQAKCRB4tDGHoIJi
0jbdAP4q0Xsijjrii0xb5mKoYRM8X3GV+zM9Ls2VeJvRKSouvQEAiryegcy5biWz
HQrV9PRAFwdCKCO1WUIBrZR7rlOn1Ao=
=kTnb
-----END PGP SIGNATURE-----

--CNSFopl0nkQ6YS29--

