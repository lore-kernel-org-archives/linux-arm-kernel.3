Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0728CCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+AvzqL2PUg5/KNJsIM8y5ZcgxOgqaHEyRCBU7/z2OY=; b=QJRwWMEJWBHgK/zD3NbODeP8wW
	5275CztnAuDYJLr85/CPF50qs6h1digzjld8qjp/krfAYYiyxQvqCOnUpcYWTkMYERZSPMWQDzQuK
	Fxi3MyXD8l8mhBHfMwz+M5JNvGFHyHYHxPZTXbilGV1T87KeHYaXGrL8I0ISHsClYhmLRa5xGoRjL
	A2pvYKoJPSeWU9yuj4wWB3fjc2m11YKSFKvHP/ePuclhb/YhOEmGoJ9wDqJUPLxksy7INT+5g3UUQ
	Il6wgmA/VCFd6XTXQcKjP+b4TkcrU/Fr7cse5W13EOOu7zVTx0hY+WWZSfilYuNg3pEwhiPml7PsF
	W1LaW2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfi2-0000000Fc6E-0Rk9;
	Tue, 28 Oct 2025 09:09:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfi0-0000000Fc5u-0wHR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:09:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55895601AF;
	Tue, 28 Oct 2025 09:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74176C4CEE7;
	Tue, 28 Oct 2025 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761642579;
	bh=ZeszJ3G5pFbOJEm0PLsqfPwRQuGZps8vSqiFmYtwyKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MS8HsA3gHTzSFAkqVuH2/l8x1ouMjR1uDE4ZkKX7gH9k7EojJyCK4fKjjovw27RTp
	 A1c4+6iqPHZjJW0zXOtiHS0TV+vlW37gAldPWA/ImTJljpZHvNLVI4Jpgs667xo6lH
	 s6PVRRtHGv1l2bngpH5Qr3X8nQbgInqUMxD3jS+U9DMtXvfp9N5u06k0wpc4ZwpDqE
	 BLC9iKNMcNuKGU5nfR/s2rAprUa7Wn4sKzQykkWjXuZcUwNPiZ4XW3I3VHby96bEtl
	 whB5SVnoVtD8+xHnOA63yI7RY2LpBw23xPm2x+Ixy/LtxcDvzhi8dEG4SBVU7s7JcT
	 EmlAuKIT3Mi6A==
Date: Tue, 28 Oct 2025 10:09:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: arm: coresight: Add cpu cluster
 tmc/funnel/replicator support
Message-ID: <20251028-enigmatic-astonishing-husky-f2c47a@kuoka>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-1-31355ac588c2@oss.qualcomm.com>
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

On Mon, Oct 27, 2025 at 11:28:03PM -0700, Yuanfang Zhang wrote:
> Add the following compatible strings to the bindings:
> - arm,coresight-cpu-funnel
> - arm,coresight-cpu-replicator
> - arm,coresight-cpu-tmc

We see that from the diff. Explain here the hardware instead.

> 
> Each requires 'power-domains' when used.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml | 23 +++++++++++++++++-----
>  .../arm/arm,coresight-dynamic-replicator.yaml      | 22 +++++++++++++++++----
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml | 22 +++++++++++++++++----
>  3 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> index b74db15e5f8af2226b817f6af5f533b1bfc74736..8f32d4e3bbb750f5a6262db0032318875739cf81 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> @@ -28,19 +28,32 @@ select:
>    properties:
>      compatible:
>        contains:
> -        const: arm,coresight-dynamic-funnel
> +        enum:
> +          - arm,coresight-dynamic-funnel
> +          - arm,coresight-cpu-funnel

Keep alphabetical sorting. We asked this multiple times already.

>    required:
>      - compatible
>  
>  allOf:
>    - $ref: /schemas/arm/primecell.yaml#
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: arm,coresight-cpu-funnel
> +    then:
> +      required:
> +        - power-domains

Just move the allOf to the bottom like in example-schema.

> +
>  properties:
>    compatible:
> -    items:
> -      - const: arm,coresight-dynamic-funnel
> -      - const: arm,primecell
> -

Why do you remove this?

> +    oneOf:
> +      - items:
> +          - const: arm,coresight-dynamic-funnel
> +          - const: arm,primecell
> +      - items:
> +          - const: arm,coresight-cpu-funnel

Hm? Why do you need custom select if this is not primecell? And nothing
in commit msg explains why this is not primecell anymore.

You have entire commit msg to say something useful, WHY you are doing
this, WHY you are doing it DIFFERENTLY. Don't say what you did - that's
obvious, we are capable of reading diffs.

Best regards,
Krzysztof


