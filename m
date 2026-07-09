Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17759C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puo2WOGFGpyw9J6olKx24es2WTiZU3XCpw4qMf/hVOw=; b=o+nO7vCV3wTY+AlSXeRKRTljie
	1vLOE+XzzfWXbKHAmzdTk54Uni7lObVemh+SC3QB8IrUTfDQja4O2QtMWAqIMNF8RJaDiEUj9SulE
	A6AMUbm0iRkI39ETyfw7tsqbUMlrW1PHPURjlP9GFPzLtSn3GFLvduV0Rc12gQBKSJYjFeSD9zXP9
	LTO342zWEm4HciO4PyY07j933dRwci8/TsPEnZ7NOLooAO1QhVDxNH6E2w1XHXhtVyklwuUNB2bup
	TWtFJ3nssaxj2Av7wzhJCARf0jfl/E37NilTXh2hoN0LaSBt2zHLifQlTRFhPAT9ARFA4A2wYNUFD
	CnRWEvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtBz-00000003COP-3HHO;
	Thu, 09 Jul 2026 18:09:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtBz-00000003CNw-0kOU;
	Thu, 09 Jul 2026 18:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0CFF400EA;
	Thu,  9 Jul 2026 18:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327941F000E9;
	Thu,  9 Jul 2026 18:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620586;
	bh=puo2WOGFGpyw9J6olKx24es2WTiZU3XCpw4qMf/hVOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g3rT5KC4/pKsv+zL6v+2NnYTwzlryPMajIcRxphgS2l5V88M9bSyIjC5SLDLCIpMW
	 58cMeFbNxz5uQVEmx/Fq10wBvQPyJCZyoT2THvbJ3SkduWL8QPfvHPvqIEkoRQDEK2
	 LpW6cNCxYzPs9s5BBMGoQZ1INteYUM/nluobeMn5e/cXGq0LK4o6WxUROYelcdHKCD
	 U3CuvqLrSgrheoZeo0pgoPqEAezj0OCrIyJrL4HSjJi78Hp0cfShvwZPxf1GCT7BSS
	 rVnxn60ajOEaC+p19Cgo8UAkmhc5UXljPjySVPocMEYV25t6ICgS6/sPTi1hhpPks7
	 SP4mzcs3k8zdg==
Date: Thu, 9 Jul 2026 19:09:41 +0100
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
Subject: Re: [PATCH v2 04/18] dt-bindings: clock: mediatek: reorder MT8186
 compatibles
Message-ID: <20260709-ankle-motor-0a58b8d2e3de@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-4-2926da3db6cf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c/mtJweQrXU+gOHH"
Content-Disposition: inline
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-4-2926da3db6cf@collabora.com>
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

--c/mtJweQrXU+gOHH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--c/mtJweQrXU+gOHH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/j5QAKCRB4tDGHoIJi
0sunAPwP4G5IpcKdB+ivZ5OP/6n1Y9Fv4f2bnedCL1UQiUiEMwEA4I6r62j9MDDN
IHJwkxck/G74FFB8UdU2rapilCCtCwA=
=pKTX
-----END PGP SIGNATURE-----

--c/mtJweQrXU+gOHH--

