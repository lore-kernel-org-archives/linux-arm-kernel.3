Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA4606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P9iYVioz;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=u9gwcwB9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=; b=P9iYViozNS0YM6PxQbNQn6Ns1I
	o+S1utv+xRLcNKsUX/fmdcmKwcC7ztnEjAH8ZEl9GwPHmwPuIVK+QtOAeQi5bdICvU7kY1YUKuvT4
	WjKCrda+4GYqCSjQq43TeigMYMARdtRMPEiGbPgHIwpzVTJgrZa3M+y64VR9SLb2E32QQAdi+R1bC
	V/YbySzUR1msuLPxi/+KUYsVu0UTMtlvxBOr3Gh01IXTxbMI5jonsaoh/3o/3n8FknQzp5/V8ZDRi
	CSOXqw+ZXZ/AZ+Hmv5YlwUKair9XR2nnHnauvKZ8ZyUtIRqmnOpJ9S66nPurHc7/glOmozfi5ccts
	K2oe4lrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwTP-0000000EZuU-0LrA;
	Thu, 22 Oct 2026 17:21:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwTL-0000000EZts-406O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:21:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2e987a2ba0cso16794145ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689659; x=1793294459; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=u9gwcwB9ZzzrbRGROI9zvg5enL+kIu4OXpKnUW2qM7ka1FD4tOjmPQ1W6Sg0FbsLz5
         3W7hJ2K7DiZuGSRQK/OPOD/cBqv/lFI+O2hKpEcMwrtMDpIOdv9fwrnTJFT3C57kwZ13
         7aM5+ouA37iLyXGZTZTXK8yA7Zkjrulr1fjm5cSZCMPU78a7Jq7JKK7ScCTOaVlRglWm
         +aSDLxJOvmzDYEla+ZxAAZ79cm92unwUV7L/QfGikmQy+a2W0VyphFV8PnSS66lHoo8J
         9S7iIXc5nWiRNwxYxgiMYzLyz5ofn4ZUL3dgCGLZ4CgIeHFQN5Zn8OtepeaZcCVeg9uB
         gncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689659; x=1793294459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=IjwcHQFD0ebwSLtoZ6VJW80kU37kkTlvaOFDZi/AyjQ+auZjjLgJ7NcNJPC69kY0oz
         uZPKmBB1UMcfAbSsE5Hw8wASRC7lLQ8MiFf0rQDQufvnuaHIMV+Jxf/OfP9G7BoBbBmP
         +YJkAhWCeeR+tvh/ke1ixJxPWfzEb1vKO2owKQtKyy/7SPdniLcnNUsWjUyL9/cuZXeU
         5enB6gRr+BrTeCBlUZKLXXVWgf//Y7lH9vml6WAk5Hhv5LCK9clMv257b6VziSKInJRY
         eR6hgnJCBecGt0Oc8kTTLzWOxzA85tObo/t7uvZag2RvHEnkBTdXddWiDFKz9mJqLMvk
         y5MA==
X-Forwarded-Encrypted: i=1; AKwUvBxLwd2EOAjtPn1X0VX6oxFTbtkcXtC1A4Pim/qsWQzZZpZrwOHRaU7yeOb/KEbYgBySn2AE4ZTTxr2ma0skyfUm@lists.infradead.org
X-Gm-Message-State: AFq9FYLeiys32qBIPLWZl4NiADDvI6xvuAfMOR2k1q1hEGy2hlNVeuf6
	HNV3dV2LG9bvQ6gNqsAVApoj+qQXMBGPXASEuDu6/gh+wpduiPW0ogC1TDPUHNU/p3M=
X-Gm-Gg: AYBFou2U5T6HcgPd4Ykn0Ay+j63oO9sXG0yGvQbqa4Mx7Fa2/Cr0vifz42QGOJFlPRK
	bZSZgfJXOYbxt/bU3/RDbS+UerptTjJhk4T43AE5tuoECoXAiG6bCxGjqep7bKI9LSv2WmB5dqx
	ljbAnWVUKr+e7vVeNO5Ya6xsyf0G46nHyYIA6n7yDSz9l/4X3FG4sBmhWs7IT4CerBQvqvBRZD/
	arhTnpOwKo4IcyyQSRA7LTj9rDhOKjHQsM/cDzlXmdcWKjEEUxwEpH/HYD8ry4QIaer4W6lS60k
	2LXLY5XK4SGIE3JoCJhoo+JwJm+xJ7OsgpOxA/5ALfBAagpNEpQvMivJWiQASrJp+90stkmyQ2S
	C8+Y99IuL8b5LsM0ygL30OOUe4IJr1vI44owmUno7ucJYxmpR83JxOm8PJrLed7chJhmjZbbXl8
	0aHiRGJnhbex8v1uCWvpIxQ0udHbptGIJfjmNyBW2qv/9uHm+ReJoLmgjQBX4Jb9fI8a81KgYeg
	2vEcEM5YatUJMJ4bw9SRPCyujIgPQRZsOZ2w7Gn2khdILFBez3By3vHosqy4pBuUopQHTA0BGVl
	OMZX
X-Received: by 2002:a17:903:2f89:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2ea437b4bf8mr47547695ad.2.1792689658924;
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b366766sm1137285ad.31.2026.10.22.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v7 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atpF91weFU11Fu4m@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_102100_041543_76374C46 
X-CRM114-Status: GOOD (  24.78  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 12:50:22PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Francesco Valla <francesco@valla.it>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..1647726893d1a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");

Get rid of dev_warn().

> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 

