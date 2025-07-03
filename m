Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwoTgEey+xgnou75Nab2N4qPS2k7RZR/irHhEaV1Zh8=; b=131AGIgD1gPK57IAAhYCOuN41h
	depxRBssKUEAJi++mWrH9A3IFCvFF6kPAW52YPxvWCEBHGIapLPHxFb/X08Td1n4rW5OdlEah8gxi
	XF7jAsH5qH9c3+S8bfmtcGWXJETXaOqOfec4dkTP1QcDFi6KJkZCIknGTJZZTEF1KtkpOxcVQsEks
	y90hElclmmisOUL3m6dVHEToz4hmie8/tHX6x9GwBSN08MbgAfL5gs24y4aQqNdj0NUyI2Uj++SPq
	mICYYNk1B/9feG3B6UxPyPV0s+dyUqCtAt+3G+zUwI0LS6ijLRj20a33tymxycApIBd3nCl13eGrF
	tuMrzSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR0A-0000000CUFN-1FLl;
	Thu, 03 Jul 2025 20:57:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM5v-0000000Bs9A-43a3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 642B261151;
	Thu,  3 Jul 2025 15:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBBCFC4CEE3;
	Thu,  3 Jul 2025 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557407;
	bh=KPNx93oq+EW5S/Omi2rpiF4iPr+uVFbJwi4esUMXMw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQokQwHYANLecf4Ib1umWY+AGlxYxq08A9BPwAQDmyMGnOEUzkN/i53aQU3zQ84xb
	 qv5GXEFWKjqnfFKbc6ztk2zDSqi7lZANLS7jPwGPQ7+rtWKbR+Wd0l1zm3y7khDZze
	 R8gzRR/l97lxaGYKzf0GhHjeMyMzPgtW82oHPFRgWfPXvInAjWbGjbDOmWRqQnH+aU
	 dJH/jQOUVXgvC//Ma3uGHV68ZQB3kcxLNUX5wvX8fP89FPqOWoZ/aLZcb1p3K5X8Nn
	 Bs/xJLWmppAhz5Q4n/RAWKVvjM8hA1JUVLpI3DgLY3eVW7qAU+kOUdwTZqWqfKbs7j
	 yl0xlGnRr51KA==
Date: Thu, 3 Jul 2025 10:43:26 -0500
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: Add label in the coresight
 components
Message-ID: <20250703154326.GA1674898-robh@kernel.org>
References: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
 <20250703130453.4265-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703130453.4265-2-quic_jinlmao@quicinc.com>
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

On Thu, Jul 03, 2025 at 09:04:52PM +0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add label to show hardware context information of each coresight
> device. There will be a sysfs node label in each device folder.
> 
> cat /sys/bus/coresight/devices/cti_sys0/label
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> ---
>  .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml   | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml          | 6 ++++++
>  .../bindings/arm/arm,coresight-dynamic-replicator.yaml      | 6 ++++++
>  .../bindings/arm/arm,coresight-static-funnel.yaml           | 6 ++++++
>  .../bindings/arm/arm,coresight-static-replicator.yaml       | 6 ++++++
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml          | 6 ++++++
>  .../devicetree/bindings/arm/qcom,coresight-tpda.yaml        | 6 ++++++
>  .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++
>  10 files changed, 60 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2d5545a2b49c..5ca6d3d313a3 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -98,6 +98,12 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  label:
> +    $ref: /schemas/types.yaml#/definitions/string

label already has a type. Drop.

> +    description:
> +      Define the label which can describe what kind of HW or system the
> +      coresight device belongs to.

'compatible' tells us 'what kind of HW'.

> +
>    arm,cti-ctm-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:

