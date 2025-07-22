Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745FDC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w1P97+uvlP8IZDUFdXDkwv6dEvpnqzqT8HmQhlIG/c=; b=vM8uZLWC11v6SvD8m3kFV30wb9
	te3nee3/KyItVoA5adBZmmyiHPz4hyQs+L0mAJw7D4nfMRcwKajSQdGsrH6X+xZ+Qrp1X+5R2ATDD
	X2SAGt018HWZz+vBsGX9NlRk5oq4Y4ZRQeWuSM7JROOKtp3PHUJLdAc0/vvh18MoukHpLK0CXjk5D
	nqBJR+hYnGxlMUyGm9MuNZxw17DYkcnJL5vq+4eYxykc3mHxQcYVB+AnbYHk/Pe1h02ESb3hoHWNz
	cFEjPW0D0j33Fxfnrs/JUB/Kke/GC8HVn/9q10t/xfad7GO3+ODBMDyNQx/9/yyGES+aJ6ZIIiphH
	SvupV0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8q9-00000001vUA-3ZJC;
	Tue, 22 Jul 2025 08:59:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8go-00000001t9I-0NJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 08:49:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC97152B;
	Tue, 22 Jul 2025 01:49:26 -0700 (PDT)
Received: from [10.1.36.73] (Suzukis-MBP.cambridge.arm.com [10.1.36.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22D583F59E;
	Tue, 22 Jul 2025 01:49:29 -0700 (PDT)
Message-ID: <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
Date: Tue, 22 Jul 2025 09:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_014934_178661_17B38B96 
X-CRM114-Status: GOOD (  12.32  )
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

On 22/07/2025 09:14, Mao Jinlong wrote:
> From: Yingchao Deng <quic_yingdeng@quicinc.com>
> 
> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> extended CTI supports up to 128 triggers.
> 
> Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2d5545a2b49c..1aa27461f5bc 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -84,7 +84,9 @@ properties:
>             - const: arm,coresight-cti
>             - const: arm,primecell
>         - items:
> -          - const: arm,coresight-cti-v8-arch
> +          - enum:
> +              - arm,coresight-cti-v8-arch
> +              - qcom,coresight-cti-extended

Why not call it qcom,coresight-cti ?

There are no other "qcom,coresight-cti", so "extended" is not required.
Is this specific to CPU (i.e., CPU bound) ?

Suzuki

>             - const: arm,coresight-cti
>             - const: arm,primecell
>   


