Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4703CD98D5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLccqOA4BPe5kgO4FUw1T9ppkHgLsCcr8VedH/8bpLk=; b=ybHV2UKrRXdk/k9hU3p+rm6A2s
	PVSvIFun3xh3Qmv15jR8Qg6/pA9gH18AsEkpw9eZttWk1a3zuTt3VGNimyT2y/78KnECpGZxjLDpt
	Jbl9c9irr5jfBQw21p9G4cPmIwr5RYs968HDXFJr227k0dzPdg5cmgLech7w7h/TnHJBLFRe1louW
	k8mkqi7WwyJn6r9E3Y+RlRutwgeJ0m6MRfVjrm/55gEbA5uM/gwuNJOkjDJBfHHm1KqG66sOPe16u
	LGiinzrgWPyAKsrX6a1C1Qd2BwqFag1yQ46uJPbpl/4CWIjv/BB10IPDkAiwz7VI2IinkJcT2eXPi
	LulWjFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd5r-0000000B0vj-0dil;
	Thu, 13 Nov 2025 19:34:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJd5p-0000000B0va-2ZVK;
	Thu, 13 Nov 2025 19:34:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C04AF6011E;
	Thu, 13 Nov 2025 19:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05FCC4CEF8;
	Thu, 13 Nov 2025 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763062492;
	bh=nLccqOA4BPe5kgO4FUw1T9ppkHgLsCcr8VedH/8bpLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgehgEzIc+NUo3zs4tLr7re1tIDqsVuIe4+uhDhJo8p45rNyEUzHapZZL/Jlm9EpF
	 OrAMw5Y0M8XrjeXPL14t/+piOKeCGqv+DwX63eRyFRgphcT66Wu8ottWKQm7niLLa0
	 1l/f8kSX6RxRf+7gJi7kfgQSv4bzWiUoAnjGvgeQjXX3jb+hHO7UWjDp1PlyHMYDNF
	 j+2HjuIPgaoMQcHW8YJJVK/ybyRekT4+k6W/peRDH7tgArnSHO3iytql2GG72lodjX
	 VZOqiWsd+sTCgNRA8zYr7AXTaEuGBVjOZbZF94/82ex0/flBEaHVTsedRumY7zL4Mi
	 FAQ0vNNEgmsnQ==
Date: Thu, 13 Nov 2025 19:34:47 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dmaengine@vger.kernel.org, sean.wang@mediatek.com, vkoul@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 4/8] dmaengine: mediatek: uart-apdma: Get addressing bits
 from match data
Message-ID: <20251113-obituary-living-8e3cffbbd121@spud>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
 <20251113122229.23998-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X9B0kVAFeBMDC/X+"
Content-Disposition: inline
In-Reply-To: <20251113122229.23998-5-angelogioacchino.delregno@collabora.com>
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


--X9B0kVAFeBMDC/X+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 13, 2025 at 01:22:25PM +0100, AngeloGioacchino Del Regno wrote:
> The only SoC that declares mediatek,dma-33bits in its devicetree
> currently is MT6795, which obviously also declares a SoC-specific
> compatible string:

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--X9B0kVAFeBMDC/X+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRYy1wAKCRB4tDGHoIJi
0mflAP9dcdMB14OyfQ6CIyRKL+Tt3e/oY8hoCi4xCeO9hDn3igD9EHtbHzjlEqtL
hmYcc7JBKikQuSYCrOAtP32xTAEJ3A0=
=/Cxy
-----END PGP SIGNATURE-----

--X9B0kVAFeBMDC/X+--

