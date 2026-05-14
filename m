Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42972CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSnGyU4JHKaKOuv1EvO1FsYRaRpqJE3rP+CActO3FME=; b=RwsII6Nr5uc4eZqsspvXlADIZu
	6zKplXAL35wzk/K/R5GMF3AFC3Fxnr9/i8B0eOH1bqYLu2Kk+YhsndrtiPXUvjlz6T+Mi/0mPN02g
	5yTO3jKvW0akbS4WVSOuoH2CkZ+3KqKYA0zWzrPxqLz/ByWtmacnu5GTkmlex1vWtqTNCm3qpo0QP
	jEZ0BRT2nKPc6FFKg7HByvh525UQxyBdOIdUOEixAQhSpZ5KytFlDqkHItciS8bhoLWoj5ttKgE7i
	5P5nbp6KkMhkl/q6CWsO6inorOAhnLPV44imaK4l9rih0JpPY/qVgVQgiFb/oCo1lsOprc0nyka+S
	O6FJZmjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4X-00000005AAu-31bp;
	Thu, 14 May 2026 10:13:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT4R-00000005A75-30LX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 015124448C;
	Thu, 14 May 2026 10:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F252C2BCC7;
	Thu, 14 May 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778753614;
	bh=rXQRhGpz7xYtLzNL2vzAmJA6KRx3QEVri+tj58EgfE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0UwHvR97FgarFPgSNeFKajHCBU+IEAAsdsnq/e9ocLHGoitfmub6hWS3DIho8g+t
	 5AU2BZxmqbce8svlzVZZy/Br31Jqm7wr86A15XvyICMw4Gw18J/bldZsKDBzTlh+ol
	 Zik6DUHnt222yezt+2tFldhfB7nryMAKGgSuhOup+z2jo4KajZrcQTqazf51g35j5p
	 7QRvQKV2L332hBjRdNxTGsMq8mAlg83W1anSHgfspf4MM26I4U5rovJZTZh6VUfv/E
	 fDG15RGre0zeEFreBl6316FbSn0Rr89LsOtWJBDFHCRAQSpgwJJnNXFtlDxeeqIiOj
	 OFmUDRQKnzT7g==
Date: Thu, 14 May 2026 12:13:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v4 2/6] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Message-ID: <20260514-pearl-mamba-of-inquire-e4888f@quoll>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
 <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-glymur-gpu-dt-v4-2-f83832c3bc9a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031335_782845_157DE09B 
X-CRM114-Status: GOOD (  13.89  )
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

On Wed, May 13, 2026 at 12:51:19AM +0530, Akhil P Oommen wrote:
> Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
> It features a new slice architecture with 4 slices, significantly higher
> bandwidth throughput compared to mobile counterparts, raytracing support,
> and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
> other improvements. Update the dt bindings documentation to describe this
> GPU.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Someone needs to start applying Adreno GPU patches...
https://lore.kernel.org/all/20260301142033.88851-2-krzysztof.kozlowski@oss.qualcomm.com/


> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> index 04b2328903ca..e67cd708dda2 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -411,6 +411,22 @@ allOf:
>          - clocks
>          - clock-names
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-44070001
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: kgsl_3d0_reg_memory
> +            - const: cx_mem

Are you sure there is no cx_dbgc? If not, then just minItems+maxItems
like for 'reg:'.

Best regards,
Krzysztof


