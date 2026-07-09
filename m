Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158ACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ze/dU7lIxz0YbuvYACCPCGptl+b5eVnohGNYV4Zx84c=; b=eMd7d/flllfaHQXZbAThlc66nY
	zq1Qig7qmGCBAsVL0R879pKQNm9tencdF8fUF95oGutK9U1c7wW6/I7MVkY97U59VIlV+L/SH7DOL
	2rbLoI7pFtTR89qfyrWQcfpCQiBCF2BAFBtBdsi/6j6gC9E2nWpQ9RT5Rwu6Gv5/FXJg85iy+k1VL
	x2iyfwy0nXiPQkQ9Mc4xtOnw4GV7KOmB19gOhChBT1etMW09iUa9nCaLxp35svgQ4REwfBos2TBv0
	iupDLGfEWSa95h+b+9q3G7/6Y/zn7rKQPhSFoAzKQeeMTKpP1wj3hw4I0JMjBbNBEhEBs3PkIfuw6
	0uVW1xBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtBe-00000003CJ1-2bNE;
	Thu, 09 Jul 2026 18:09:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtBd-00000003CIm-3u0s;
	Thu, 09 Jul 2026 18:09:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A49E140191;
	Thu,  9 Jul 2026 18:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F4D1F000E9;
	Thu,  9 Jul 2026 18:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620565;
	bh=Ze/dU7lIxz0YbuvYACCPCGptl+b5eVnohGNYV4Zx84c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=byQZpKWOWOXC8jsXvs/Rd5wbQFaFMDFee1Iq7Xc+RR25iEI7kneuRCVyGLiOVusAj
	 R7L09Axv42/DtIrZTS59wFbDL5TPYQqYFte9j3sdCcPu4qIXfOvQGVXhnTUEGNOd1d
	 2JTs87t47eLybWbRhNRV6zd9pqtAflFRVkc0AbsZKBlZivrH9vj7eOJTHpwzvD2F13
	 wdpIIDUpWqc5T0/zc8ZiN4pKZYHE8ae/hYST/FcBMGSnvsRsRTW2q6DIKs0U0ocfJA
	 l9rTxAIrSVINGIhANBG+Ox88u7n8qZoclhyCpokJruMQaWZesze2neuXUMAXlQ4pXJ
	 5WnGIZ/6hqtRw==
Date: Thu, 9 Jul 2026 19:09:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/18] dt-bindings: clock: mediatek: Make
 '#clock-cells' required for MT8195
Message-ID: <20260709-familiar-distant-38af3e72f7f8@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rhzPqCATrtdnBBrk"
Content-Disposition: inline
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-3-2926da3db6cf@collabora.com>
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

--rhzPqCATrtdnBBrk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--rhzPqCATrtdnBBrk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/jzwAKCRB4tDGHoIJi
0s08AQCKHuySJ3hIGlX3rdoD3nEJOe9Txe83YsBNGh/SsC+U4gEAuiXFAYt+//TG
2C8nsmJS/6EsGEcPD+ob+FeI6gHXnQQ=
=RPVg
-----END PGP SIGNATURE-----

--rhzPqCATrtdnBBrk--

