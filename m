Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FCCCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdWDhxFqpyK1ExaLMvzw0M+RE0xOM5zE+5Ap11B9AYI=; b=yLQE2DbUMXn/9WldH/4AS4pRNb
	l0GwsdTuU5rYYVwSp5TZYuPwXBhdmfTKAr7UQ86yQTso8B3oqQZsCI+3dURKyd1XwViDvHOcd4Ejp
	4PIAic4v6oL+lYxYEbrUaIqo8SG3JLe14YFgkND3I9kKGzyXCpt6XCKGaPVw/dfbczHRR8fWtUtGD
	s4CvLggzVlzN6IjJcG3SnWs9Oz5OIsYw+yiGgg4uOknLUvZU65dWn/+TcFyrVJMLEYINf4myQl8DG
	pt5TZQj7QtML/0SN76uKdrMxVVZ79hH22BlYqMSvxOQSb2shnJuPMJFNG+yr5Ro/TqFnXZRGGGdaz
	Oano3gpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXj6n-00000009pGS-2XrY;
	Thu, 11 Jun 2026 17:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXj6l-00000009pFy-2XTb;
	Thu, 11 Jun 2026 17:22:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3AC6601DF;
	Thu, 11 Jun 2026 17:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E9351F00893;
	Thu, 11 Jun 2026 17:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198542;
	bh=KdWDhxFqpyK1ExaLMvzw0M+RE0xOM5zE+5Ap11B9AYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQG9tRUlJP0O+Sd1fT0nlt7WRopgp33SXyAE4qF3jz3ZTjUjfZeejs/nBQM5g+QR0
	 LXG0TitQNUIZXakKtCp2BTi08j8WexRYvM6omta+DVAk4WLkYU5imHgkuhhVmCDnzg
	 LC4QWKB7GWXxfwhmCwf+MsQ/0i5KVsERKciUTHj0EY2BHCHoH711MMcpfWzegs1cPX
	 N0JjRTnmhZtcKJyPdtQmUklA1b6aq/oXr5mhWaNcLVXXBgkc9wJGjykRw9Qh/EbwhB
	 Xwyy2ziCIUeQDWT+pSLwW3ssf9lKptBLCi7mXkENNk8VP5HAa9MWWInsVYg+RG3z8t
	 s/j0OBmMxXnRg==
Date: Thu, 11 Jun 2026 18:22:17 +0100
From: Conor Dooley <conor@kernel.org>
To: rva333@protonmail.com
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC
 EFUSE
Message-ID: <20260611-density-hamper-2b89bac89312@spud>
References: <20260611-mt6323-nvmem-v1-0-b5e1b9ce51f2@protonmail.com>
 <20260611-mt6323-nvmem-v1-1-b5e1b9ce51f2@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8jlD8HCh7FfdJwQ5"
Content-Disposition: inline
In-Reply-To: <20260611-mt6323-nvmem-v1-1-b5e1b9ce51f2@protonmail.com>
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


--8jlD8HCh7FfdJwQ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8jlD8HCh7FfdJwQ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCairuyAAKCRB4tDGHoIJi
0mk7AP9Mb5T4kei+ZQb9DUhcF53VPvmUwgHWElm07FdeB+BdKQD/Q2pgevrbI0it
++Mc/nhVwa+UmM4gJxL5PlSgYKXFDQs=
=bEoR
-----END PGP SIGNATURE-----

--8jlD8HCh7FfdJwQ5--

