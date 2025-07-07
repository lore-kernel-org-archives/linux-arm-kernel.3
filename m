Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D61C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uilggJahxqU7SS916h8QHDF7NIa9ZHqEyrDiC8vfSbg=; b=ySp3pJbjxw4iXUFXrF//a2yVbf
	S2YYta1y7uqJhaFymuBl5kQ9yYaisG3OtW8B0HYUAGzXZP1XpNv//+fGoDISluwj5nQk9qY891o9w
	MGlmHFwgDaoPRpRLUuBVJxDBuK9N7IVJtxowoYx0kFft1pUUnyndvDNyQSMJM8SDMquyXgEjrKJYr
	4j+cVOmLhZ8Xma8QrOwpL9Pwkup2mpA8LcOrqRV3uuFhcy1EcjSVrigs/l+ZMfAOgW2jf57hHYzG2
	mXLRBTmfjjrv1xdkpPqCiCG1FE5gv27bUKW3PpCnuLmtQJD7C7IQKU6K675d9LQTvk31P7uKSSu35
	pl/Y/9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfVg-00000001ZBF-2oDc;
	Mon, 07 Jul 2025 06:39:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfSX-00000001Yxi-1bZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:36:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BD2D61130;
	Mon,  7 Jul 2025 06:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC70EC4CEE3;
	Mon,  7 Jul 2025 06:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751870172;
	bh=dc209bSSOMZyBL/UHG3HiH6AvU5ec3DCsBGBA0MD8OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgDAmbZ3f9Aqqwkljq5jHe8OaKHd8qTEvKsZj/eNsQ/Wl/Bz1ykWcyzsrwomDXV6B
	 aYDH/g4K/oBR6eg4WVcYY7gnsb5YQ07RQBK0hxwXAluwwe8DwCCe8FU7bTsY+h1O8+
	 P4/NYZFy9Yi8j2zEdiiEIdOiq8SXV3t452Seh+/sOCH8sqJHDy/tcsiPaT6BOoTYh6
	 e9yYTtn1Pj5LAy6LvdfgPGv0bvYNhEVwedJSRNJ6+TWBRWWkh++2BatUpmG8zFmmRS
	 SYqKsvNHTE4+iwSiC4DGCEJQp7AWLB3pwvsMIE0FJ00gwPJ65nYQubayx5OziXcMeF
	 vgMmFHKDEmKaA==
Date: Mon, 7 Jul 2025 08:36:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: samsung,exynos7-decon:
 document iommus, memory-region, and ports
Message-ID: <20250707-silent-authentic-trogon-cca34d@krzk-bin>
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
 <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250706-exynosdrm-decon-v4-1-735fd215f4b3@disroot.org>
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

On Sun, Jul 06, 2025 at 10:59:45PM +0530, Kaustabh Chakraborty wrote:
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - Outputs image data to another block, say an MIC or a DSI master.
> 
> If an IOMMU is present, it may also require to access the reserved
> framebuffer region.
> 
> Document these bindings in the devicetree schema.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../display/samsung/samsung,exynos7-decon.yaml      | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


