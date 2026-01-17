Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE15DC98321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIlCLy3H9h7XtPhvsaV8aA4QnxgU7tAWxH9CgTKOEW8=; b=qTvU+g9A4471oopnxrwaapSAhv
	cxxCBAUQuLqzvfPOUj0iqxxQKZxPHZ6PaIsx0+y5ubNYZM0j6sGCopcro9OYKDgq/QnN0Tt3ycBeY
	gcgLH+AzSpkiVvuGm6gzUj4PSxLNkOV9Co42ftLJX4/eoapX8E4rQJuOkOAAUNLpgn/caQNfAWdD7
	c05sqPXaySSh2EqczjUd2eGDIQIMaxJ/cI/rcYGjOq2BJRQNa/wqCKdVLeRfwsY2W8OojwtBNIcCI
	+5A22rENXYdaFLUmqrk3tDmWb4isSo7pXA3lYTi3eCvFrKrWEe5pzxQky70td9HNsxQnP8FFR24CV
	8tbkTmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4iy-0000000FVvp-2R4N;
	Sat, 17 Jan 2026 11:44:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4iw-0000000FVvU-1aRE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 11:44:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5886438D0;
	Sat, 17 Jan 2026 11:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1EEC4CEF7;
	Sat, 17 Jan 2026 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768650249;
	bh=7lknc6FIsN8kTaQ3hRHqL8L6jIldGI7xwi+wz3k2pVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUrkHI3TVz80ah/2V2OAa3YVWKUKlfBKTjrVaFB4AvpYJLenjYw9sIIbogSR970f8
	 cvGB31uAzYakxyaHsj1BFcCz55w8Mz/hymC0nr0RrfpvsMeLZdfb5ZxTU2A9814g5j
	 t1loXK3qayAfqBwBD4uwBn/HIh14LsGlngm/Wwm7DzHcqI8DGBM3giqP1+TjCTwFEX
	 SqlVmei7xQ2O9BMJZFQXZQ75mvE1uaGLhMEdvvTUHmRXhSM7CovoKwl/Hi4f4WaWEO
	 MGLT1KHJBv3T7Wk0UQgD5CBJ84TbxroJ9OcVHNYDcH4QkIx2XPUzMCWo0FHWVuIaQQ
	 wK0e+49RC5ceA==
Date: Sat, 17 Jan 2026 12:44:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
Message-ID: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116101648.377952-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_034410_455145_D7D882E6 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> so add fsl,amix-bypass property for this feature, besides this there is
> no power domain defined on i.MX952, so make power-domains to be
> dedicated to i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> index 3ad197b3c82c..50fb08460b4f 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> @@ -34,7 +34,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: fsl,imx8qm-audmix
> +    enum:
> +      - fsl,imx8qm-audmix
> +      - fsl,imx952-audmix
>  
>    reg:
>      maxItems: 1
> @@ -75,12 +77,41 @@ properties:
>          unevaluatedProperties: false
>          description: Output port to SAI RX
>  
> +  fsl,amix-bypass:
> +    type: boolean
> +    description:
> +      The audmix module is bypassed from hardware.

I don't understand why device AUDMIX would have property saying AUDMIX
(so itself) can by bypassed. If you bypass the device itself, what do
you configure here?


> +
>  required:
>    - compatible
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8qm-audmix
> +    then:
> +      required:
> +        - power-domains
> +      not:
> +        required:
> +          - fsl,amix-bypass

fsl,amix-bypass: false

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx952-audmix
> +    then:
> +      not:
> +        required:
> +          - power-domains

Not sure what you want to say here, but disallowing properties is shown
in example-schema (:false).

Best regards,
Krzysztof


