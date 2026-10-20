Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414EA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmj82V02;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0uSOzXq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMFqxM453yLwBXSbcRLMTntPAgtjcAyPnxyGhanIJOQ=; b=zmj82V02GlS2vVROgHRXifqM4M
	9p3I8C8HKUK25aNLW8c/3i0aWid5/m/ZvPmqcPwsLwGWOKOjn/eqGiXRVqJEU4r/bHg6/8wXOrguj
	BjmgMB/h2qcLzaAyDM9bmtbb2cSXXQkX+dkeP8fTSumkR9/cCPPR4oPrJnJKVEmdwWNuUtaZOIhgF
	ygR3FtjBKby7InyOiFlJYPj7T3A8O9wBaCd2/5UkeOFk9CI08Q3lhXYU3HFRs00bT638C5mDgxjf9
	rKuJMy89VidM6/OG1vff3m3my7hRMy1WgzWBDcr3dy0g44vJtUXg76/ONxXzX3vedeNrS3LaxQQx0
	SO1vY2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Ii-00000009CB8-1Vkh;
	Tue, 20 Oct 2026 08:34:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Ig-00000009CAb-33Vx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:34:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3F0360D7E;
	Tue, 20 Oct 2026 08:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC79B1F000C4;
	Tue, 20 Oct 2026 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485265;
	bh=VMFqxM453yLwBXSbcRLMTntPAgtjcAyPnxyGhanIJOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F0uSOzXqFAoOHDVJSsaHQ5ir1S8o99DRmrazLP6YHC7SDbkmUtJ5y/168C2X06p/i
	 nzMbd29t2E07Lsyc2maZDbwOG0d+L3tr74ddYjqTV3GeXof9FITQ9ycQBbGoAmtY/Y
	 A891IhY0p7egb56CJ5SJSHUWJX9RJkwnOPRxsS7XUxaSN4OhQP8AA83kqtzXBApRik
	 mI+L9CgLCFcD8h31nrF/m1rgO3QCchzQt6c7DO722cTDpQAp99iFgf6k3DmOjx4mPJ
	 34+oL1kSeaOAFUz/kMCFZExcR8wvgtWMEa6R6NkGKG6L2Y/RDskzOzg6sA3uwfnA2C
	 48Qdrfs1AlECQ==
Date: Tue, 20 Oct 2026 10:34:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: display: Add Solomon SSD16xx
 e-paper controller
Message-ID: <20261020-futuristic-awesome-dinosaur-b61d9b@quoll>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-3-devarsht@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019213726.4145532-3-devarsht@ti.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:07:14AM +0530, Devarsh Thakkar wrote:
> Add device tree binding for the Solomon Systech SSD16xx family of e-Paper
> display controllers (SSD1683 [1], SSD1673 [3], SSD1680 [4], SSD1681 [5]).
> 
> The binding covers the 4-wire SPI interface with required GPIO pins for
> reset (active-low), busy status (active-high), and data/command selection.
> The spi-max-frequency is capped at 20 MHz per the SSD1683 datasheet [1]
> which is also the maximum supported frequency amongst the family.
> 
> An optional rotation property (as defined by panel-common, in degrees
> counter clockwise) allows static display orientation to be configured from
> device tree.
> 
> The data/command selection GPIO pin is also kept as optional since various
> SSD16XX controllers such as SSD1683 [1] support 3-wire mode too with
> data/command selection bit transmitted as first bit before sending the data
> sequence.
> 
> The first supported compatible is for Gooddisplay GDEY042T81 [2] which is
> 4.2", 400x300 resolution black/white e-paper display using SSD1683
> controller.
> 
> Links:
> [1] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1683
> [2] : https://files.seeedstudio.com/wiki/Other_Display/42-epaper/GDEY042T81.pdf
> [3] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1673
> [4] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1680
> [5] : https://www.crystalfontz.com/controllers/SolomonSystech/SSD1681
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> Changes in v3:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


