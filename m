Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF812C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muiCXmFX31IwV4lxSnN+fC6uBc73yoCxhywc0sdOaiU=; b=m/jTKTm7YI7IRoSbaCWWszc/br
	L2i/h/Gvf+aJplQwDyXkuQ0DSStyPyMN2rf1qPfyLPfX+IrHphQqHAgbm87ylI/R9nSUb1aznddLu
	yx4EEzkZuaTEfVIrxrsexlBaA5Az7hHO0ka2GkmPNaK9R8DUFl3+TECgkIWRoCSEbaiANx8eGoW26
	oolTrTO3xhaIOSp5DEsFdPOeNMdQu/7YTq5m5SJWC7t7e7gDKryONJ8MFnMdUOGcwSStoh3AJLxSz
	GQTvZze55MyDGoJIrBS1LQSO3G0VRwnGPzcywPAjqjghOQb//iqfkR5xR/2tzHBOAOVgQUMGJJfRP
	coB63aRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVHR-00000004QiR-2nXx;
	Wed, 23 Jul 2025 08:56:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUhz-00000004MIf-11bf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E48BD45543;
	Wed, 23 Jul 2025 08:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F3FC4CEE7;
	Wed, 23 Jul 2025 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753258814;
	bh=+VAH1oPZaKTMRxEiDnWmTlypzS5GEurSvnDvL9UArgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccSo9uzSlkmxbB9yJENs2mmP8LvktBm7liVmV4nepuVaZWB1/LMMbTrD/k2h3G2Dz
	 Y9aPVAdQ8p23oEMwvX7nUpJ0pIqqYfbsM3w1DF+v/98cw062+iB1TgNb79sfftKJqW
	 Vq7vUH9XdUymml3LwReH4Zz/HNZtYTZYWDJqyHTTHBxO0i3nvW11WODSGMzUKOoRrO
	 gcpCDA2BrdVzZAaNL0Dohrx8EgGy96eYWbVzSFfkxxKsv3aHrEAis6Fj2PVWz+peAx
	 g23slysfzARHRmhtUKAtBKGsqC/m7t3HYDAKv8I4KSZ4ixkRnbXlLHb/pn3lCiIdIl
	 vFO4szo183s0A==
Date: Wed, 23 Jul 2025 10:20:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] dt-bindings: i2c: exynos5: add
 samsung,exynos2200-hsi2c compatible
Message-ID: <20250723-auburn-dove-of-performance-f27235@kuoka>
References: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722121434.443648-1-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_012015_304076_5D2E9320 
X-CRM114-Status: UNSURE (   9.47  )
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

On Tue, Jul 22, 2025 at 03:14:34PM +0300, Ivaylo Ivanov wrote:
> Add samsung,exynos2200-hsi2c compatible, reusing the autov9 support
> since it's compatible with exynos2200's i2c controllers.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


