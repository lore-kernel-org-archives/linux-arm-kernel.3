Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E044C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=765idAEKKbWPuz2USlH1VcNBUvTkzIPKO0MxgkuZDTo=; b=ttXt5oZngvDqRIgDuOXwcwOZaQ
	04lQXIvSil8IU97ELlXH2N/DbD9WKaojW8FlDXqLiPa7fUhxphEdHsGWapz6rsQzjWtlr5bQ/Irsx
	ZxfuDau23o/rCl4070rzgBlrKX8qtwd0xcJNXR8f9iYAqlW3Xp8a7CNDeTvm/svVYOVKfoaek4s3e
	9cf7ITks/1iqCMm5WlL4k+7WnnER1RQGTPuF3quQtCO4spzHeaAJX+sncMvIEiW9qgmOlo0AquH16
	SRxsHPkVpZrpgXluVb7pijuoWPBZXVNfu0uUZOlOd/2NSY3s66qTMbL72f4d7XHoUkowsbyS844Kj
	2NqvkHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x402U-00000009uP0-3oop;
	Tue, 08 Sep 2026 17:55:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x402R-00000009uNU-0eEO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:55:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 617A5601DE;
	Tue,  8 Sep 2026 17:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ED41F00A3D;
	Tue,  8 Sep 2026 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788890118;
	bh=765idAEKKbWPuz2USlH1VcNBUvTkzIPKO0MxgkuZDTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TO4wloGHlbkHv52gHzObnN3VVqxM1a4e/M9o8fBTYihhow1bP9RJBw6jNnSBye4Ao
	 ntvkKCjI/vSDGmv+LIgaRXNIvv9lV7tKRSvyLYrKXZ3kzqGMhlPTFk2270uQ9tENoB
	 PWeZYkti1K+BEFDbSgGn0TrR4wUYfkknljXNTAtaFI1wjBFUa8OjOsHZ3+KTn9RSzp
	 +qCJPDcFTFah7hzjPiNXtM9aE/MORRz3hNqkBV+y0yT3Ditbou1V3KQJQE7h1Py6/A
	 gp/ouwO7LrmSgaxukWNxvEzu3I7rPQcOJSL3sciNtmX/oljsFGgv1izTei8qY6pC2q
	 TYl6leeLghpDQ==
Date: Tue, 8 Sep 2026 18:55:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: zhengxingda@iscas.ac.cn, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support
 for nuvoton,ma35d1-dcu
Message-ID: <20260908-elevating-eggnog-0d11f728f6f2@spud>
References: <20260908092840.225220-1-a0987203069@gmail.com>
 <20260908092840.225220-2-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxAegO/MuCyNqq2e"
Content-Disposition: inline
In-Reply-To: <20260908092840.225220-2-a0987203069@gmail.com>
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

--bxAegO/MuCyNqq2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--bxAegO/MuCyNqq2e
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqBMAAAKCRB4tDGHoIJi
0iZXAQCE8i0GV0vfMMOm3ja2XjSEnbf+JCqzgRyl/u9zngsMNgD/ZXAx3nxTMtoJ
P39HX+WyJk4Tjo3v5hxRuaPy++cdwwo=
=6YLb
-----END PGP SIGNATURE-----

--bxAegO/MuCyNqq2e--

