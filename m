Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A4C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDph8o4VJsVzjeS+fQHhLvixFjAGCCc70Y2IOH3Ghhk=; b=nXS/AhGY0M6Jrdc3mAMnmPZPo/
	mJ04pAbHWN0eYQacqGVlbl4obGL/N1zgPz0N+eRk8dnRg8m3yh4p0sbbkkmtxsHYDVvs2sHwcJkbq
	hasDnM9iGm/1cmmuKB9p1XLDTGTuawCpC0Vd8F5YBW/qeBZrV3eIVk0kBDAeDzHP+ZD2bgMKrlo7f
	pEQZbW6SRjfegJ/p216BIcgyql4AhrCHLrUGY6ERn3XpSIeMJlY5TG5ZKYjvN5sYkXnolF15hq1JF
	/SBZeLnmsoSdThJ1QWNctU/k9KS4g/FMnwdbtihrouVYyI1ZpKOEt3kFHET6AFql0LkuGQCf7OmOY
	3p7XShOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7Jo-0000000C2D5-1QUr;
	Thu, 20 Aug 2026 18:16:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx7Jn-0000000C2Cq-1r2S;
	Thu, 20 Aug 2026 18:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 362FB42A15;
	Thu, 20 Aug 2026 18:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09D01F000E9;
	Thu, 20 Aug 2026 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787249807;
	bh=GDph8o4VJsVzjeS+fQHhLvixFjAGCCc70Y2IOH3Ghhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ctgg8EdwAgOtSNLiVR02WIq7Y2+WlLj5WEpQigvdrcsFB1bAjhJ3AN3ElmLXP7M1F
	 nnP2GqXEHef/oHj/E3uUOx6FGtf+3B/6dzrgNK793MybmoIfm1aXbhgf8MshvpDHdg
	 sYeEpvAsM8BnwLJc226FXNNlIg5L/EAEnaWUKTpPRqz/AZaR/fMYGfSQupe0cG6ONg
	 FkBQdOSro5RBVV48fVw2KAPPVAfbltMFJ6UAwEiiPqM281zYgiSyW3KcKFqBWIkBB7
	 Hvq8pxZW3H0ReibpW+YYylLJIzktcEbGK/xdIWiMtv4T6rBHm70jvHWHpiY8AETEI5
	 wXhgKh4itFYUA==
Date: Thu, 20 Aug 2026 19:16:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: rockchip: add rk3576 csidphy grf
 syscon
Message-ID: <20260820-subsoil-likely-9fcfb3b9eb71@spud>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
 <20260820-rk3576-dphy-v1-1-70e25e8d5e78@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zA/ukao4qz3PmLj6"
Content-Disposition: inline
In-Reply-To: <20260820-rk3576-dphy-v1-1-70e25e8d5e78@gmail.com>
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

--zA/ukao4qz3PmLj6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--zA/ukao4qz3PmLj6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaodEigAKCRB4tDGHoIJi
0hPSAQDrdcFSqcxVVQmda4opS9E6UCYTtjVUW6+TGRlOcuuG6wD/YhujDFzzEr+y
o9MCV8VkHtb9nb2JQ+QcoABE6gn4SwE=
=2g6I
-----END PGP SIGNATURE-----

--zA/ukao4qz3PmLj6--

