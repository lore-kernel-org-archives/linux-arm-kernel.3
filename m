Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vB0GjRE3khfQCo9AeS5CukoIBpeitQMqkEW+W4frlb8=; b=WSec2XobqDgsgsL+sieHAUJBQW
	uKs57ecyEwu4Fr4tIpH88I1Zxi1CR74tE9hiR924I5dAIIiU6M7YFiCZCVNTGCAOpGE2BWhKw59cM
	Du3f72EG6M/CHMOIUrbCRo6N28gf2GoYz4lzi72ygoh0v6dG0SqfSW9WOlkteXbLGZ6vmUyIXwdof
	UTjlbh5M6/BtjdeB/tIBuxHr7Q0ocNv2ZnYGIKbyqBagVcCE9gGAuZHZ/605Xnjs6pF4TsDDrovLw
	Xx5vwO1yZBXkTGpit8jCJvUWfzz7LMKKYVA5gQrHU30jJSfWiT5tdo3Km33EmlJJQV9LAxeP9lmoE
	rUr1VNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtDF-00000003Cls-2e5w;
	Thu, 09 Jul 2026 18:11:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtDE-00000003Cle-395f;
	Thu, 09 Jul 2026 18:11:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 821F540255;
	Thu,  9 Jul 2026 18:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C148E1F000E9;
	Thu,  9 Jul 2026 18:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620664;
	bh=vB0GjRE3khfQCo9AeS5CukoIBpeitQMqkEW+W4frlb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1el/Cqyibv9h7w/wdz/XpKMp+O4cUtBcrtayeWy3yBQtz/yXexEo5WvkUbweKm2i
	 n8CveZ27popz0BfRvIWP75WuNPvkOScndWUWMaXOZqVbyKgVmf0u7ux8oaCObXkiEH
	 jbEI6RKW0GpTSz6EFsryQvZC0dvvt+QvO/k56Xp5alnQmIKOS4Mp6ewKxBWo5c/1vk
	 WxZCUlHDDcShLZlAxtpsVdDD2qEt1bF7grpCHXAodmpSM8INX8HqNmDWGpTYxZeqDS
	 izlDK6V7AYvg9CW/w4RL92+cpjZrYlTZlEZnoUamTs0DR0mVzTQtukZs+dDoaya3M/
	 ixBkyURreK+Xg==
Date: Thu, 9 Jul 2026 19:10:58 +0100
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
Subject: Re: [PATCH v2 07/18] dt-bindings: clock: mediatek: regroup MT8195
 dt-bindings into MT8186
Message-ID: <20260709-unwell-tigress-75bda15cf97f@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-7-2926da3db6cf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YOyYCkfYLtSJJ1sW"
Content-Disposition: inline
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-7-2926da3db6cf@collabora.com>
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

--YOyYCkfYLtSJJ1sW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YOyYCkfYLtSJJ1sW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/kMgAKCRB4tDGHoIJi
0n4RAP4npZum5XLpd0EsHYWmc4hcy2hHK2ABwRM4HAGsi+yHGwEA7LZVZIA1cxgk
OVcQXpO3gCi195JR54o1Z51wMc46Xgw=
=pOIq
-----END PGP SIGNATURE-----

--YOyYCkfYLtSJJ1sW--

