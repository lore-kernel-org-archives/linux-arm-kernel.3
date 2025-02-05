Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31ADC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh95A09WnqJQrh+8tFDa+ZJM62OQ9MFYHuEgzP12Zos=; b=PyB/yYjN2hUn4WThh41K+297kQ
	s/OiytNpHV4ih6prfVrltLlni9v7WdGlT7I4X9xN5FQOEzWVAAFR0crIra4v3hy+A9Zk7T+zGC89e
	FuMC0DjD+zmvBQXMGlAlysxSy4pOfx6YpqiW8G1/RVJxbAimPQLzMCb97KX/qubqQJb4LWaTICK/z
	skMiRFwsS/S8yBdJ6SByC4KCJDAINfN4+YkglEjKm6T5kPa+cwj/nPvDZcRVEXeFBiOOPTFQumiu9
	VQ5Nq7FFmESdoDElmBzLrOKNa8O/ODnOeeZEQEel4zmT3R/93g6X/7FZsoW5ZuMMj8Gm0pqjN3zQZ
	OTc7nbyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfaoU-00000002aSe-23TG;
	Wed, 05 Feb 2025 08:31:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfalU-00000002a2y-0GM7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:28:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB75F5C53EF;
	Wed,  5 Feb 2025 08:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECA3C4CED1;
	Wed,  5 Feb 2025 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744087;
	bh=CFd1at/8SMlmUXn2NDq5TSXadPYqd3iQolIPX3ikTW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1ljhnKdJD2LM6Y2LHYGv/OgPP/cMZvit0Le2OZiUh/BUyNouNO7USToUdfesOqCm
	 lUcJZoG8EHYVrp1qCDEHhr76Z/vZy/aBTFYmt1Ucz//PY2dffDTNbAYtirDrGvyxjX
	 W8jn4G6ovDJzfcwTjr5l0Fyh6d6DUqDJKKKbcntE1fn09q8M+Abs+l1sbSdZrvABpu
	 c02lpKSbOWb0aBH0hnGfuKjPIkQlQekU9wYSWFn2vVbSDuUbjtdXMwhzb1lQE6Pmdw
	 Kpx04iKAMY8HP4VEKe0tm8RI5plUYq/6lgMc38G6pkJHNRdg4cChz6prQ2FGl62x5k
	 pliAN73c+a9cw==
Date: Wed, 5 Feb 2025 09:28:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mmc: samsung,exynos-dw-mshc: add
 exynos7870 support
Message-ID: <20250205-premium-cuttlefish-of-strength-506a7d@krzk-bin>
References: <20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org>
 <20250204-exynos7870-mmc-v1-1-c87cfc72be4a@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-mmc-v1-1-c87cfc72be4a@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_002808_141180_D693AC22 
X-CRM114-Status: UNSURE (   9.53  )
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

On Tue, Feb 04, 2025 at 02:04:16AM +0530, Kaustabh Chakraborty wrote:
> Document the compatibles for Exynos7870's DW MMC driver, for both
> non-SMU and SMU variants.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


