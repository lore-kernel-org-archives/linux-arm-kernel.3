Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA88CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFdF5CMCTAnwISZ/eT+Yrx/sOBZpyVdhARbcIzdq8VU=; b=igbDcAENZkp8P3wY7tVGDlp52L
	v09bIxjT8YYesqv/I+xYogNG3WUDnCQmPdW8WUmBrkecyYnRBPa5NRlvBTAtNFs3Zd941ytC45c+x
	sKL7KKBTaQNnUUjlaaLRDrYpUG+jnsLbO3ichHYlJ2xqC7kvyVUWdJpcVhTFRV466pd2M6BHgVnfA
	pB4R5Llma6Z0ps2JybBpydOFb8BKSnorP3/vHKwhTG/Ci3iXndfBBtSAEQHvCZalEhuZTbRQrQSee
	3FJY7agYY1CXDHUhovBeig4wn/sFGd8ZACusIEnASMTH6anlecX+x5Tr87egFYt9okL/u0jGEZec1
	nLe1o6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDML-00000005Koo-1qmM;
	Mon, 15 Sep 2025 17:51:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDMJ-00000005KoX-3S88;
	Mon, 15 Sep 2025 17:51:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D385B60202;
	Mon, 15 Sep 2025 17:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6CFC4CEF1;
	Mon, 15 Sep 2025 17:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958682;
	bh=fFdF5CMCTAnwISZ/eT+Yrx/sOBZpyVdhARbcIzdq8VU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sRb5sF/bNQ34JDwzv2LB0JOxy9bYFZ+e7R8cPR1WaImljDF11kCCrpzEiUKGvLsi+
	 HZa4tuxWeGLKXw1ZjCaOm4bHNIFe+lLBBBWyuqZ2j5ltYiJOkso94xIXk62ouG64Dm
	 mB3b1TCOJ7qo8vTN4oSfSx4Z/8f6PAaNpzBlrNrQ8wKxa5mmdXKop2tKO4jedveEZY
	 j3AUPBydRAZSw6YbOS/rsaouUKRdGm5ESTHPd2iAQEayn31iilu9EOSfWhZsCHzaR9
	 pZentVVopng0ONFoSCIsZMXXK6V+5l+f7ubnk4hKAo2mhUrV4ltNhChzQGYhbS2GEp
	 aCqjmEXNLCJVw==
Date: Mon, 15 Sep 2025 18:51:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250915-numerate-makeshift-c076500aaec3@spud>
References: <20250913002155.1163908-1-olvaffe@gmail.com>
 <20250913002155.1163908-2-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vT2LutKl9MtQTSAL"
Content-Disposition: inline
In-Reply-To: <20250913002155.1163908-2-olvaffe@gmail.com>
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


--vT2LutKl9MtQTSAL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vT2LutKl9MtQTSAL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhSFAAKCRB4tDGHoIJi
0hyDAQD5XpyVrgwBrD8kkao4gH4YK4KfNqnZEXgFzHZtZFmiBQEA0WDTgBM88F9Z
PcXqDWyoUO1rnrO+HG6i4coKk1lnPQs=
=JkzN
-----END PGP SIGNATURE-----

--vT2LutKl9MtQTSAL--

