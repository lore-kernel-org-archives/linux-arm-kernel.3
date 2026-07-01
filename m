Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16895C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ayeh5cwlNmAyr6iAkzZDlc0fFc73iNUdsmim0PGnNac=; b=z5ZCx84UJWlPBnbf5vucPc+PDO
	4xtGG8RxjrY4FwGA4LJBrTFAz1ye90yGW+lDyBWYaGCnHrS8Po3tLAVkick+O/2irJq/8VL1q2b8Z
	cmsQD17vGMfAjK6eaqLveT8wUHEBIsQjz5PfRcc8jMtp4PiIcPFqCfFWsmEfh3CV2crUuUoqB+BRR
	Uo4C5wJNxXtuq4Lak0vfHULPaeknJnsyYgHn43nvUTeiY91SpSiXezTofXo8LVRyi1ELKgvwVPbhE
	zuSH1nZ+1MLGIuClPoN0K7LMuCJYw178jFGWZKQLlwU0J46CiQZmLF6eamV8axXK5HWol9uo8Zhmd
	XGmw7iAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyL4-00000002ez2-3hUr;
	Wed, 01 Jul 2026 17:03:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyL4-00000002eyo-0FOi;
	Wed, 01 Jul 2026 17:03:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67DD86001D;
	Wed,  1 Jul 2026 17:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273321F000E9;
	Wed,  1 Jul 2026 17:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782925385;
	bh=Ayeh5cwlNmAyr6iAkzZDlc0fFc73iNUdsmim0PGnNac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l0Vzf8l8cEYmuVQId4BSIH8RN89lDFObUwiCje2GvWsJ4MMLGTzTbcRGmcEdqccEs
	 Cr5NPpG5jkJVykGGl3i4Wp/EHLZTZLQSq7rdNtL2V8AEhz/URJZi1BC/D5w/e6mc6E
	 Xz6xaGcoiOV47avbOF/2NMU93/wxzv427KfClf6T6QdXFSipEf8fYZRbE9XX5i3jsI
	 pRuZvS4wKVmeZCeZWh5wyhZKhKBi0TY/btg73gQcWoUfaH4GTGC4bb10JYD4jLJa+w
	 zTEJJ5Opi33oQtxJDY7cjACcGpyLBwTTXWMbFsNKgyZonDCkPYq6TnRfQbGDl245wm
	 dzhpvKB81U5cA==
Date: Wed, 1 Jul 2026 18:03:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Document extra clocks for
 MT8189
Message-ID: <20260701-baton-hug-877eacff8744@spud>
References: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mPEXYlg63dNqM9Ep"
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
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

--mPEXYlg63dNqM9Ep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 04:44:26PM +0200, Louis-Alexis Eyraud wrote:
> MT8189 SoC MMC Controller IP has 4 additional clocks.

I think "additional" is slightly confusing wording here, since you go on
to permit 6 not 11 (the binding already allows 7).

Not a big deak though,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mPEXYlg63dNqM9Ep
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakVIRAAKCRB4tDGHoIJi
0m5ZAQDPDgv+aEUBLc5jd7ivTFD5RAfydjyVmNG7sWeRkLuObQEAoWlbrthLLsZz
3tjdnZ7FRZ4xtWaC8FMotDXsvQhpwgU=
=2df6
-----END PGP SIGNATURE-----

--mPEXYlg63dNqM9Ep--

