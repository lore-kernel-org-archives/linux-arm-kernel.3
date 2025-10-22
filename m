Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A7ACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNEg5P+Ttc8VSR9Q4md86Pd8eZOASwjjfO0iGgVd1+0=; b=Li6TuqiEie9mY1ZGNJNJm2cLLa
	F8genZp2GHC5EMdLmrH6yjU/ROnWKWrQXtPgKbEGf5t+6kYBobhRtFljj/AQvyUZfkc/JPx9PTrj9
	WCFvoXtsWzODe82XdH1lW2+F57Coj9R+6Vm3X/fJcEwwurhZO8KdCZEjzPAOS6k+PsGfNjoIDjzMU
	o8JfsMMWuJhmJX0GFlWE0WmmyqkLCciQxfTvXRyEvLEKxBFKcpphaQLWyWvKTc0vwsZmMGvSaKsd+
	eNhCutDo2MZaUafqRWoyNIrtBh1UBhIECQRoSWk5HwqDa/Sbp/RuIBpyUGv8N3DuQaBYFylpun0kC
	txlO71eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd4X-00000003uER-0TSr;
	Wed, 22 Oct 2025 17:56:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd4W-00000003uE6-082E;
	Wed, 22 Oct 2025 17:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BED163D73;
	Wed, 22 Oct 2025 17:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EBEC4CEE7;
	Wed, 22 Oct 2025 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155787;
	bh=oNEg5P+Ttc8VSR9Q4md86Pd8eZOASwjjfO0iGgVd1+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h3eIwWDQ0Z/3Tp00SmF6KNlW5DQO+WCU/0e4Py0iUdRh3uPFKb1CbCBeGYjdNPhxa
	 Q5/b4YkMYd3z9R3+RfmFIVWlPp+sdU6RKBYIGlIwjYQ25JK/iieveVI7B9UhMK3e/o
	 QTffdutMsttq4tOKfO7oDszhtAhTuJxuo+hcWqgLTeLq/c6FJgcIHsmzqv3KtUvXy5
	 74Q6KdeV48RSg0QLZu6d2Wj7jC1sjq1VHOnruwNHOKQX48130vGdgg69fCC247MLx2
	 7bADJU56kALSUEt0fuOh1OzzGOEczjpXm5V9oqpD6k3XK/Qp4W75wB3snxyfGNSvoP
	 hBQJHYU0kzuYA==
Date: Wed, 22 Oct 2025 18:56:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: net: snps,dwmac: Sync list of Rockchip
 compatibles
Message-ID: <20251022-undiluted-vengeful-5d25f15a6619@spud>
References: <20251021224357.195015-1-heiko@sntech.de>
 <20251021224357.195015-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AaSWsIAoSnlBIPJU"
Content-Disposition: inline
In-Reply-To: <20251021224357.195015-3-heiko@sntech.de>
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


--AaSWsIAoSnlBIPJU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--AaSWsIAoSnlBIPJU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkaxgAKCRB4tDGHoIJi
0mfgAP9tWrOwSjhvFyojtCqJcCnn/wgCp39OALg2qGN24SiWxQD/XHloj44IFaQA
Me576GhEl5516HV+ViBK6c+zTMkVngE=
=vUEM
-----END PGP SIGNATURE-----

--AaSWsIAoSnlBIPJU--

