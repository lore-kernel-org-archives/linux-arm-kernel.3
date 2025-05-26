Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDBCC5B547
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8sQQ3Cts6+EFLzLQeXtx+1mqIBMCxdFqVuYmU4fm3Y=; b=nZp5HpredafqMI+waUiH49V2Z5
	900dgp9oCGAS4qMU8IMD4HVOyQq5K4mUui9rlvUcWw6Kk9k8xmw3H7hLyTcFbTo3m6hJ52U+0vTD9
	GgfrbaeoUSP2HpQT91V8lG0vAXGFNhrf9o0GPZt1AdPyU7qUYhbiOnyPyk3WbXigGAdwMk8KRPHuW
	qfT02pqN+pproieQajJvIcTxIrDid7G/5VWhxsBdT+UJ4JIIg9eaX8TzFpo1jLPHQXOgSv09SNsI+
	dbFUg8ofToDeSORQGESGBrBuK9XMF5JNKVEsjstjIAA0HhXf3BMMrxY/6jB/IfS5zUlMszhF6Fbmj
	NThIOpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYtB-000000091V3-0HiC;
	Mon, 26 May 2025 14:33:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYq2-000000090xY-0M1o;
	Mon, 26 May 2025 14:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EEF8544A9D;
	Mon, 26 May 2025 14:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843BAC4CEE7;
	Mon, 26 May 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748269798;
	bh=jXxtsHqy49HEr7W/9gJvil9hdu/xf25Qj4R61xruCPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYB2bOQPnMVuzF+jZgA00OrAQt2+/HUjMP0htmSkX9GzBM4eXFhoy+ELlfBKH42Hf
	 pPNONSpLStJLWsYFn7vDOLiBa/wF4oHXMRbG3468eJbYVtJNAb3ECQ/BbxK0Lv4LIj
	 4q/EtuCYOea+8Aej0duZoN0hFYC7TfB7eSOyD9QGe00k9HXjGA3A1wL9eCsZZalY0b
	 IJ0nIjuU8VG1lAvF51OgTxSFW7xRq1GOoPJymqA3b5jwVQfJYyvwgyEwZ26ZIdRA1e
	 2faSDf1r2QuWETwbEMx6EnUr+Px4Q58QR7Yx1YAo0o5mbPWmNulcTO9xQbb3M4xgbZ
	 3csA7JLDRukxA==
Date: Mon, 26 May 2025 15:29:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
Message-ID: <20250526-churn-survey-92e4ac835db3@spud>
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ewRwsCC7aREqelS"
Content-Disposition: inline
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_073002_151656_41918195 
X-CRM114-Status: GOOD (  10.25  )
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


--6ewRwsCC7aREqelS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 07:16:40AM +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraints, because binding must be specific in
> respect to hardware.  Add missing constraints to number of iommus in
> Mediatek media devices.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6ewRwsCC7aREqelS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDR64QAKCRB4tDGHoIJi
0vZWAP9BR4vLb8OlwsUrb+fCOvG9Bsq3De8bY4TqVlmsHnP9PAD+OVk4U34TmxkS
EV+BCTevs7Syc2H23i8NMl+1tSwmuAU=
=llAX
-----END PGP SIGNATURE-----

--6ewRwsCC7aREqelS--

