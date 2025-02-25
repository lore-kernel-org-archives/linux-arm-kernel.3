Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21632C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WP2slSSn5/vAlil0BRoIszaR28yXM6EA7mHcY7THNAw=; b=aUyIRtbpacGqe6yKHawXoJF+UL
	oScGkx2pO0emz4CumSVAeWR+Z5QoMSsmTSces3+YWKHz8AYR4B8x68KwKabHRCXybgZ/VEiKu5jH0
	ZHqDyxPumbjft3fj1d29Oajk18fz9NMWge8D7sk6r4yoUe8ZVp4fqqhZKNqGq3vnO+T4Uel75rZHK
	3fyapSomDJ7JfP0CNdnLqmAzsroSAYOP8m/AKSbVYeB5P8csLg87x6XQEGUiBaMmlRIoPfc8VhwM9
	/MGNn2VGhc7+vNEH98WKjAdjINO2edkDP34UZJgDpDZTECpIsijNVVSx93DmDPUHvM5ttCTlOoepP
	UDIqBxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2GB-00000001VP4-28gz;
	Tue, 25 Feb 2025 21:14:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1bS-00000001NYz-1HKx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 20:32:31 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16745A30;
	Tue, 25 Feb 2025 21:31:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740515460;
	bh=wckgz3tdenQ9ZtBQpHOi8VCnc+yy0A2dSk2aV0Zjeqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIzpj0s9msFhLOz+8bA185w8lDAvF6MScXRRMWToJGq11vaWb1/54GtxQCAOvXrqh
	 RH6/pHRixNuKKM/vbBSymDEELXmkO1a88QHytPB+UlaV4YbeEwZQoZj2FNj2j1mVBb
	 ZPMjQ1V5Q3I6kuMK4oLbVo7miOEkNBd2u6vXcsaE=
Date: Tue, 25 Feb 2025 22:32:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: dt: submitting-patches: Document sending DTS
 patches
Message-ID: <20250225203208.GG18866@pendragon.ideasonboard.com>
References: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_123230_660352_62935F4F 
X-CRM114-Status: GOOD (  30.13  )
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

Hi Krzysztof,

On Tue, Feb 25, 2025 at 07:48:21PM +0100, Krzysztof Kozlowski wrote:
> Document two rules already widely used and enforced by DT maintainers
> and SoC platform maintainers:
> 
> 1. DTS patches should be placed at the end of driver patchset to
>    indicate no dependencies of driver code on DTS.
> 
> 2. DTS patches should be applied via SoC platform maintainers, because
>    it is a driver-independent hardware description.  However some
>    driver maintainers are reluctant to pick up portions of patchsets and
>    prefer to take entire set at once.  For such cases, the DTS portion
>    should be split into separate patchset, so it will not end up in the
>    driver subsystem integration tree.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This matches my understanding of the current (and best) practices, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/submitting-patches.rst           | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
> index a64f21a5f299..f3e23e69a638 100644
> --- a/Documentation/devicetree/bindings/submitting-patches.rst
> +++ b/Documentation/devicetree/bindings/submitting-patches.rst
> @@ -54,11 +54,22 @@ I. For patch submitters
>       followed as of commit bff5da4335256513497cc8c79f9a9d1665e09864
>       ("checkpatch: add DT compatible string documentation checks"). ]
>  
> -  7) If a documented compatible string is not yet matched by the
> +  7) DTS is treated in general as driver-independent hardware description, thus
> +     any DTS patches, regardless whether using existing or new bindings, should
> +     be placed at the end of patchset to indicate no dependency of drivers on
> +     the DTS.  DTS will be anyway applied through separate tree or branch, so
> +     different order would indicate the serie is non-bisectable.
> +
> +     If a driver subsystem maintainer prefers to apply entire set, instead of
> +     their relevant portion of patchset, please split the DTS patches into
> +     separate patchset with a reference in changelog or cover letter to the
> +     bindings submission on the mailing list.
> +
> +  8) If a documented compatible string is not yet matched by the
>       driver, the documentation should also include a compatible
>       string that is matched by the driver.
>  
> -  8) Bindings are actively used by multiple projects other than the Linux
> +  9) Bindings are actively used by multiple projects other than the Linux
>       Kernel, extra care and consideration may need to be taken when making changes
>       to existing bindings.
>  
> @@ -79,6 +90,10 @@ II. For kernel maintainers
>    3) For a series going though multiple trees, the binding patch should be
>       kept with the driver using the binding.
>  
> +  4) The DTS files should however never be applied via driver subsystem tree,
> +     but always via platform SoC trees on dedicated branches (see also
> +     Documentation/process/maintainer-soc.rst).
> +
>  III. Notes
>  ==========
>  
> -- 
> 2.43.0
> 
> 

-- 
Regards,

Laurent Pinchart

