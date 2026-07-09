Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6PQf2y5Qv4g44uRJ/wG5ruzypMHaXwLqkCv56hTL6U=; b=s5YgTPmOnx53Ll6RUoEW6H0Pqy
	sl0k+6zQiw7iriJYv9Ql4LggDltMZrFCJpihJnOWXWejbxgUUoiiX5RXInD0l+e2pVEYXqpL0Ivu4
	9l9lAZOsNMgmbDdXQLycZZIN64vKL9djUl054oJCEwcSHbdUjZy4QqUjJ/fvwPCStJJFlA0pnngFl
	rQonWxIE6WwvKMPD+4wg1DuppDTNDFUDd0vwvQnWthFR8qdXKhGVUm5q8rqpSXF8fCD3Cwld7iwFQ
	j93cxAoIx0EKPQrbiUxtWYV+C4dm9QqK73DGae/q16weirzDG1+t9jhQhLoXaS17ndEkmSmrm1aJj
	fn0/6uwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtCR-00000003CY1-090Z;
	Thu, 09 Jul 2026 18:10:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtCP-00000003CWy-3TLT;
	Thu, 09 Jul 2026 18:10:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46634600C3;
	Thu,  9 Jul 2026 18:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C661F000E9;
	Thu,  9 Jul 2026 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783620613;
	bh=C6PQf2y5Qv4g44uRJ/wG5ruzypMHaXwLqkCv56hTL6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i97JtjWIvqzKIgHZoHPIE+VQkT2BBMxw+X6LbOxcJ36VJIONwIT3qpf4oUU6IV1Fi
	 +D9r13STFjclAIxE7Wsy/tAYGDQ4K05Qz0fnFrFjwX4YzqWVTf41HQovzAEOTGxqsS
	 OUHl0cUArPj+0XxXUfBsmHHjT96c8UeKdhrxobyu6TmfWjsWRaUwDaiikHkSkGGTWz
	 WkkSPTtLX3XTnqXgsUREG5dpmU+Hg1IaLpUJatQmTCgimJ5qGANLmzTtikBgDuO2Qe
	 mxH+ElkVpbxG9tpWie9wsziXqbTukFT1q3237Mv4JPOpZzIDauFkrbSP7n6RKcAviC
	 TloJFeELUoa7w==
Date: Thu, 9 Jul 2026 19:10:07 +0100
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
Subject: Re: [PATCH v2 05/18] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Message-ID: <20260709-override-rewrite-48251672afdf@spud>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
 <20260709-mt8189-clocks-system-base-v2-5-2926da3db6cf@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4vhD4k303por5KI"
Content-Disposition: inline
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-5-2926da3db6cf@collabora.com>
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

--j4vhD4k303por5KI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--j4vhD4k303por5KI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/j/wAKCRB4tDGHoIJi
0n2jAP4s8lBU+Exb6BMBsaz65X58KXjVIAJoV2XHfk/fVhoVHAD/dQwM4CgClpDZ
XxoJZdpRcKFPa48HJv89L9ZoDYjdEAk=
=RRLm
-----END PGP SIGNATURE-----

--j4vhD4k303por5KI--

