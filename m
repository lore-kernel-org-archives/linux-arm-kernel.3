Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC10E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 10:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHyKtZHOYgchRq86HHPZ0uJcPLoYSxef+y7ykG4C4fY=; b=p3O32uDXJaqw/U8jYyy6OORPnZ
	wDA6+7/tYGXB3lEmhuKW1yLhxj3gxNI2Z/6EWmQgrfvSCWaYQ0S+jXCN7VFKiesVcPafQ3mlbHwkd
	tYDA9Fl4gezZXjIPvKTwB6Sv3TMi122GBIv7zsBPrII/zBJE4pV6vKSz1owMWhrSgrg2brOiepoW7
	lhapscotGU0Nt2qHjnGa8vTFhsLBH35jcXhtLs1vUbtzL04DQOd+A7InrjDmzwNiN2SOJd239vf9c
	Tj8KqITlHrn4QaGMgW+hOkscLXDMildsaZ6DO4aE/T5ypOiRlthU3ONFHO4Z57BZIqvLTmkQfDfDA
	RIt8Fu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYaP-00000000bIH-0SLg;
	Sat, 11 Jan 2025 10:19:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWYZA-00000000bAj-43sz;
	Sat, 11 Jan 2025 10:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63A045C4793;
	Sat, 11 Jan 2025 10:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5D7C4CED2;
	Sat, 11 Jan 2025 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736590683;
	bh=hZ30PF9MK7V/3XvgwOYQIRHwGq6CMsygfh0lC3ErEBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXYVsA2Hn5PDzesEHTT6xq7nz1CFfawJHWqMM6NhR9qRsjPoI5WHGZYN0zu8YBAAg
	 VXbHGJZSK1LowXcGMJoQe9r/I3tCd8/e2tbnwM0VExDT9MF3Yaip6G5C8bW2dMFhiM
	 UMZLNDtWArfCAGuQe/l8VxFu4M9oxZdQPPtLtIlbnrayFNCEkdYUihY9KVGlKvJ0GE
	 yXwIknj8mmiwpkg37i9Bbe2Z9MKJDMdcMi8lTZvcpXyu2WrBO9KBP7AkbDeYLBEm0E
	 tce0qa0IDCWdSfF1GB+fgWOqI8yEUuKoOWEoAXGSEkpH955HMU2KzvIHynTK2wOnt0
	 /dYvyHkJpXugw==
Date: Sat, 11 Jan 2025 11:17:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ao Xu <ao.xu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add
 compatible for S4 HDMI controller
Message-ID: <iqy3ff7sltfy7hq4scvtt2sumcghexhj3bj4r2wi7rtbpcqrou@7qwjwh7kgfb7>
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_021805_049248_7955F63F 
X-CRM114-Status: GOOD (  12.08  )
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

On Fri, Jan 10, 2025 at 01:39:51PM +0800, Ao Xu wrote:
> Add devicetree document for S4 HDMI controller
> 
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
>  Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> index 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 100644
> --- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
> @@ -55,6 +55,7 @@ properties:
>            - const: amlogic,meson-gx-dw-hdmi
>        - enum:
>            - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, S905D2)
> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)

Judging by of_device_id table this is compatible, so use proper
fallbacks or explain in commit msg why not.

Best regards,
Krzysztof


