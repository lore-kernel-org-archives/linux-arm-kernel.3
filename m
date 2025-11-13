Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9958ACD98D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdDY2Y5ow7Akz/NswUqHtwC26DuJTuA8klDFKCsu6bM=; b=vNKxvZzFzm5/JxB3Qz2hKALA05
	XClnfOunX5ER9PFSJpQv3TnV9qlhFJvikyZAeeF8BfrHD+l1mvRtn5niiwo/yGAFg+kEDHqfnTua+
	iRczoTHfntgy2M6cV8bda839JTQaxrWaZGtFRESPj9um2SodXmmY0L3nibe6i3GMo5jqiWhRNSGS1
	JCR4zOx2HQuZf6KoyG09z4cQ9jKIYku9NYM5w+SKfOYuXn5pw7xTYaBGB0JERJlTZ89IBEDYQvNiu
	mTPj5nQu1bqO4f+22HbJMPfEt8q6s/5RYutpdohFvhnJy48YusvZ/jKA4wM27/cwL6oZcB9LVfLcC
	OeO3XOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd3B-0000000B0Qf-2xF2;
	Thu, 13 Nov 2025 19:32:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd39-0000000B0Pn-1zGR;
	Thu, 13 Nov 2025 19:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13DB14379A;
	Thu, 13 Nov 2025 19:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 355C7C4CEF1;
	Thu, 13 Nov 2025 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062326;
	bh=BdDY2Y5ow7Akz/NswUqHtwC26DuJTuA8klDFKCsu6bM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uy7YsIYUwbfD94LDxhC+E1AO0Jct7f/fhEglYJwYFleowCtlA/IMcDFTzDsT5mdNR
	 90ClGTL254pzaXk5liK/9GO69m/TfSunxVbIo1dOsxIQze83+mEIUdV4saF6OP+jnF
	 i6RDdToSEzIjIDzYQ1+NhcWHguzJWr0Mjjn3dZIV4jJ4dC2soc7dWra+H6w74dJjVn
	 Q2+qW6xV1eU2ZdODQg42Oft52tUKba4r9YbZopZZP45URjd1LQzLxtRrxg+7I5SCNs
	 zIn1N2a19AGm1RAyAqtnmx0hdvSHaQxnW9gIbkmKzOZcWE9VXp8LKaLLUbkAA0e2HZ
	 fLZNJVSO/xA0Q==
Date: Thu, 13 Nov 2025 19:32:02 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, sean.wang@mediatek.com, vkoul@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 3/8] dt-bindings: dma: mediatek,uart-dma: Support all SoC
 generations
Message-ID: <20251113-moonbeam-untold-0a2e61bcc050@spud>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
 <20251113122229.23998-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZAXCNDRXne5IyPst"
Content-Disposition: inline
In-Reply-To: <20251113122229.23998-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113207_531758_8673FA64 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
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


--ZAXCNDRXne5IyPst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ZAXCNDRXne5IyPst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYyMgAKCRB4tDGHoIJi
0iEzAP9KgDizT2iEVi7kgYlIdMoP0pAgOj0p0a6l2gVXD5W8tgEAj8XW5x+y5BnG
oUmwgkdJH4QQXxIvrbkB14RR2+EI7QY=
=hw3B
-----END PGP SIGNATURE-----

--ZAXCNDRXne5IyPst--

