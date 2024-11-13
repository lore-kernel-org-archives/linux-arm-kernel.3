Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E74D41C3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WGkoxpdlGltrv5j0hax2Q+c7Z6AIT0yjaqckMPWh9A=; b=eK7jC++KxEzrQ8uxm6PhN3vT/N
	o/reUejcLG8MQixCLaa2+QUttf9Prvdo82T94nzXMHIEbOhHdKpwHhIFS4vNF9eL6Ey+KhixhNomM
	r/wjEBOD2CQXOUKwbwVroE0oCSuZ+nDXaQGXTghCU5gZfukqN/D1dMvcmr9cnyfOnzgiKdI9NnWjS
	HfhYfySnJDAt8ynKy2MIvGrbhMacXbj7Ah90PiQB/y0Sb9jCtjFGVRR7MVfTFbMJu8dtGdHBvgM51
	8YgU2piPd53h0gSwohZEVTtrCrnJlQNdT9f6wr05H0fAuWaRdGn1qEkDhQyxm7FmmdPxxVkdxTDmm
	dvJn6PGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCkS-00000006oNV-475J;
	Wed, 13 Nov 2024 12:45:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCiO-00000006ntD-3HE1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F57A5C004E;
	Wed, 13 Nov 2024 12:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759A5C4CECF;
	Wed, 13 Nov 2024 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731501799;
	bh=Q4Q4ybEfBqgLRDPVB7Zw53fPxqgmPSshebKB+JwBp8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfhHWOHAWXbfue7LMZwl9fC6h+g3T/79kEYzpLytgqH4lGn9pUAKy8xKvgLwyVLay
	 a8BmAEX8Lg+DIX61KRWvCDM+LJ33sfY2T2b+bMPcSm4slf8Wn7L5jezibzouJtq/kW
	 ZURyY9WVzEQoMI1fUkLLK72C6OU9VEM82brwQ2BgGpfi6oPUQ2xMJ9eeTiqzFKmtYt
	 xPHonkUjE3eWZl9mJxWELMHSVwp6hN4XE/R72q4V+pDD9fRCUnuBMjD/ZU8anv9zU1
	 7NjRlmzL7hHh52l4gsvtj52tMb3ZmqWPW90KrA+abBvg70mZXPvcgky9ckfT1Ctuid
	 9DunVmtJCqvHQ==
Date: Wed, 13 Nov 2024 13:43:13 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
Message-ID: <ZzSe4UAyil8KUm85@lpieralisi>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_044320_974058_EDE6DA3C 
X-CRM114-Status: GOOD (  17.90  )
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

On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain firmware implementations (such as the ones found on Qualcomm
> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
> optional PSCI_SYSTEM_SUSPEND.
> 
> This really doesn't work well with the model where we associate all
> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
> CPU_SUSPEND suspend parameter value that is to be treated just like
> SYSTEM_SUSPEND from the OS's point of view.

For the records, the info above is not relevant.

These are generic firmware bindings for PSCI specifications - how CPUidle
is implemented in Linux must play no role here.

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
> index cbb012e217ab80c1ca88e611e7acc06c6d56fad0..a6901878697c8e1ec1cbfed62298ae3bc58f2501 100644
> --- a/Documentation/devicetree/bindings/arm/psci.yaml
> +++ b/Documentation/devicetree/bindings/arm/psci.yaml
> @@ -98,6 +98,12 @@ properties:
>        [1] Kernel documentation - ARM idle states bindings
>          Documentation/devicetree/bindings/cpu/idle-states.yaml
>  
> +  arm,psci-s2ram-param:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      power_state parameter denoting the S2RAM/S3-like system suspend state
> +    maxItems: 1

NACK

This is nothing that has ever been specified in the PSCI specifications,
see above.

>  patternProperties:
>    "^power-domain-":
>      $ref: /schemas/power/power-domain.yaml#
> 
> -- 
> 2.47.0
> 

