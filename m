Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E99CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r1MSjRRE6yUSWPMHEAUcp2VekQ/i3BRrfkltmpMLCjI=; b=E5goLpx7opcFstuAFV/BJxpcjh
	+wPJwu7ES8qsbfo4avzrxU5MUmxlkvJrtkXo9Np0WI8WcUIvRhh7c/M4llJevffUn93ELZdiLDCV9
	lqyrM2bLbyD42TxiM7eIm9rvhImEXeJGbXPEvRqq8VbILiD+Z/GuM4eoHN7kGly5uQGSG84UAyFlV
	WTc+HsfD14Xj9j2cnn8//8g5sJj26mZ5mVju0vfVGrDdWjXnB2zlwxxQwwI7IBWZ7dgnXxhaZb7ZC
	1/Q4FE6p85sRYs4/IYf4kBd49xIhUXzgau5c8EsSfXCHmfyoRx3uMO3Sw2gSdA4NaMGNzK0D8ePnu
	VrdF/erQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPrE-00000002Imx-34uN;
	Fri, 22 Aug 2025 11:22:56 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIKZ-00000001NMd-0fhU;
	Fri, 22 Aug 2025 03:20:45 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1755832841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r1MSjRRE6yUSWPMHEAUcp2VekQ/i3BRrfkltmpMLCjI=;
	b=oEPWH/gzrsp0qyfpLjduleSsCJb5NJaDYPeQ5XRapK/9fSiqFDHXyoAUnFzYvmb7xO9/vQ
	Lf4kmy4bIuCpsJUApQHN19NVC5u2P4dMDr9gXb3G0Rw/qZBHAvNb2uuEXxMDQoUjL4SK8C
	QKd6jpXXxL30QWV3paSXwCV1xb98C8FbK1zxlUPuo2DLMQf7I4WmOjeDz+5swCz4hCne8y
	OxLPVHTDuYPUqrf5Ere4y4rpId+jusXSoAjMyh06xH56khmJcCGUP3iC9QWLYNArR+fVFl
	wvE/61iNjD3lqt/CkUCkdHwLI8LkON9qs1sUe1dMOnfo9ZQv5Z5JFJrsw/mpPA==
Date: Fri, 22 Aug 2025 05:20:40 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Diederik de Haas
 <didi.debian@cknow.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: rockchip: tighten grf
 requirements
In-Reply-To: <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
References: <20250820-thermal-rockchip-grf-warning-v2-0-c7e2d35017b8@kernel.org>
 <20250820-thermal-rockchip-grf-warning-v2-3-c7e2d35017b8@kernel.org>
Message-ID: <9ca53c3ee08a0e1c25adf916376f9a65@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_202043_365092_B16B5DE0 
X-CRM114-Status: GOOD (  11.96  )
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

Hello Sebastian,

On 2025-08-20 19:40, Sebastian Reichel wrote:
> Instead of having an optional rockchip,grf property, forbid using it on
> platforms without registers in a GRF being needed for thermal 
> monitoring
> and make it mandatory on the platforms actually needing it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../devicetree/bindings/thermal/rockchip-thermal.yaml     | 15 
> +++++++++++++++
>  1 file changed, 15 insertions(+)

Thanks for the patch!  It matches what's already presented in your
patch 2/3, so it's looking good to me. Please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>

> diff --git
> a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> index
> 573f447cc26ed7100638277598b0e745d436fd01..9fa5c4c49d76e3a689f31797875124e7fb30d3df
> 100644
> --- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> @@ -119,6 +119,21 @@ required:
>    - resets
> 
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,px30-tsadc
> +              - rockchip,rk3366-tsadc
> +              - rockchip,rk3399-tsadc
> +              - rockchip,rk3568-tsadc
> +    then:
> +      required:
> +        - rockchip,grf
> +    else:
> +      properties:
> +        rockchip,grf: false
>    - if:
>        not:
>          properties:

