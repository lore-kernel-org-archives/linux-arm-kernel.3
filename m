Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D59CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhvFxcnncxX0njwwXWU2yrdIRcY6J3yBEQVqoNl+/R8=; b=dbrueft6X7Ln7otc3Hb9v3Q6Mg
	cq+z0EF9VlS+lwVj0NW6aHhvI8Plhh0l5Usrv1084AOgh1CpitEhptJGbXZ7XRJFNylKfNImssqlc
	TdZyppasX5T5Ify7v3yXz6/Fy8cQG67seXBlY5J/N5vWi6pHEt5F+RmUeBFgqPiK5F4ZMcnyF912T
	BKODZ8ODBBtIOW9tU83SvKoOQPraAPXB3b/PSBZvXUoMNx4oXuXjsZI/YerhMEITW0f5eIxNFluAS
	imWesILKlHCQJJsL0HMDufHrR/ibUDYHtAHN5q3dMs3TdY05YmBQVOZ5vkyieJFPK+oxHKBqeMv1b
	uucYE86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnK-0000000EIKN-07II;
	Mon, 01 Sep 2025 23:18:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utAy0-0000000DlJB-1fcT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:17:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CD4E41A36;
	Mon,  1 Sep 2025 20:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3401C4CEF0;
	Mon,  1 Sep 2025 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756757848;
	bh=RKwQXF/H4mM8TexV6zQanbTgwCRsx0sgE9ekNciWRT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqMGrIjpRvDAbgkTbKP5pEBdNsuyFf9b3EEawpxGbDJoYeDrjjVcUlPWfuH2hUYUf
	 5znz48aCKZv8ivOxXP6bQertUxs6gBfUBSoHSBeTOS+XeyLgS2cwYX2Kv41LxLr11B
	 VK7BKtboG075hNa7IlSEo4EAQUwgqKTjveQ42axI+0//sLPEOovjWUG82HHTJ5wgHF
	 Ab24J7B6HuQy/lnLtYWk1JwQvqP9JiWEx1XqmN6GPOZA1AFeSrvqcnC38ANsnAnni8
	 BRQstalGfue+e5EghVd9YjKiAA0tYe2hJkhQ2Xx4tl/fhQMyPmR9fgSlsOJF4Cz71V
	 DSnGyMJB4Wpqw==
Date: Mon, 1 Sep 2025 15:17:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: iio: adc: samsung,exynos: Drop
 S3C2410
Message-ID: <175675784648.271916.11996666409097079918.robh@kernel.org>
References: <20250830-s3c-cleanup-adc-v2-0-4f8299343d32@linaro.org>
 <20250830-s3c-cleanup-adc-v2-4-4f8299343d32@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830-s3c-cleanup-adc-v2-4-4f8299343d32@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_131728_456743_5FBAB55F 
X-CRM114-Status: UNSURE (   9.73  )
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


On Sat, 30 Aug 2025 18:48:33 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml | 4 ----
>  1 file changed, 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


