Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19D0C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aK+wgmE6IPS/sqkvNTwZCmBWsyeG6ILTOEv9tkZfBrc=; b=oTcXGfWrWAnED513Ko2+5kGL0H
	YVcVph+pJPi4EVI4tzTouO+ZskCiB1phy6wRS7GN++U7XZSugRxmWhTn0X0cQE65x85a+hfusDJ/v
	R30wMh6WjM9nX2Bi0daJMpx4L41hFYF20pW3HStCQC9cZDoKQCly21ebDT9wxvDE29jHQp9rpP97S
	WxNm97q4nO89LiMyecfLCb/CuDymEQGVoWvg4zArNIdAqTHjsxhAAUiqWMrRBM+7xW4i6RJ1SLm8z
	HAm1YxenbsO0HOvic+CGMZAVIaqKxiiywvwUtvtMu75ZTr92+VcitFeLe9ad91ggud+ZPzR1Dk5EN
	KEcky0xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbCj-00000002dbX-1RNR;
	Wed, 05 Feb 2025 08:56:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbB7-00000002dO1-3thO;
	Wed, 05 Feb 2025 08:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA401A40C6E;
	Wed,  5 Feb 2025 08:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CAAC4CED1;
	Wed,  5 Feb 2025 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738745676;
	bh=jDRflpWn/eNSVYWYsmChMhlBoAx8KSfDOFOxrHxoKr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tc/UMR2FRlTFRyVgYY9afrZYTS+LM9UgZhIPbWvhBkEdq50RpckoDoMsFG2Maj+Xp
	 xQpnREgSJgAJk6owZFc7RIUFxYZ6XMGaK9ikVr3V+GX3rZRNnwawmNQrqGuwf72pp2
	 FOLNnxXK33Mvs4CknqYG6GDUWaczasrSd10uY4pX2DcgewkSsezuzgfbwjwSZ6JxKr
	 CHMWtN/jjvrIQHZtZe+pSujeJtrETJ2gvLolt/b7+RxL524dZ1Xd395O97XC6+Xvg/
	 KuHpmUxhJX3odtIxR7SFQCK6xzWD/0CHny2bDFC0FQ42H/8Kpbl6QE0kQolyHb+DGP
	 3KJ4U6pgJpb0w==
Date: Wed, 5 Feb 2025 09:54:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vivek Gautam <gautam.vivek@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Sergey Lisov <sleirsgoevy@gmail.com>, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
Message-ID: <20250205-sturdy-emerald-gaur-953deb@krzk-bin>
References: <20250204-exynos7870-usbphy-v1-0-f30a9857efeb@disroot.org>
 <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-usbphy-v1-3-f30a9857efeb@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_005438_048462_937B0A5E 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, Feb 04, 2025 at 02:10:14AM +0530, Kaustabh Chakraborty wrote:
> Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
> documentation. The devicetree node requires two clocks, named "phy" and
> "ref" (same as clocks required by Exynos5).
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


