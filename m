Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBCCC71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hi8NmveLt0EIbXXmweSdj1TgK5NDSmE12/wlpzHrKXM=; b=VUeRe4kPmWIitdN03/LbU3Xiq2
	hhuBcoOcazkky21TFXG8nW7c4UKjHwhVwiUBbg7l32bqt8kwnxZyNG1xjblXPs+K/7t8r41B3/r0E
	5jlNCJDgDIsszNL6KoY/fjOQpgZWY+5f3V2KpU91fqKDrcoepcNEy+4W/m9Jn51KhA7t/4JnoaHoY
	Ug420hspFVh/Hac6Avv3/flhjBb+5J1KYICWa5kz9Bt46VcC2xIQNnFpfBPRxD67f6TsQWleKq8no
	CIADn8FJbt4gQ4EGAJxNv5r5bqq7hciZZaHd2qs43yT6WFqg6QII2n4Co/Sp0lkKqfpNyL1OTkF4P
	X9ipPMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjKX-00000008tho-0r9D;
	Wed, 18 Jun 2025 03:19:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjHz-00000008tSm-0a50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 03:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC9875C5679;
	Wed, 18 Jun 2025 03:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD01C4CEE3;
	Wed, 18 Jun 2025 03:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750216598;
	bh=mO4bX51LKNX5EEgsyUopGw0LWqy2fcUXFuyIbTyu3AE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=seo0w3q3u3UK6Ruz4gJ28sl0+l/YBW10C0wfIiQS6ojTYQKZWSnWAT/hGxJVJcI6e
	 fDS7a4XUb0bKww9sJ2lbuW1rE8jpvO6i4g6qPk9IlBYKmj98OuHNwzH8UmLc+QL/zT
	 /h4d1DDD391oKdNVzqAUuqvDYeWaERSNiIX0o1ky2IL8bv0AqDORfs2/nH/mvTQ+sH
	 tJdaqcuaU/bCphKwyWg6wjTnxOCePSE00+V6GV6XZ1sgreRCEHaQA20DLygq2JOccV
	 63aH+XSdtbnbcA41jbS+K5BKc4ZhSKcUZdRTgBzfT9W7SE5+AgR9XR7TvT6miVbPLE
	 P6idJjoInMDPQ==
Date: Tue, 17 Jun 2025 22:16:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: arm: Add qcom,qmi-id for remote etm
Message-ID: <ugxijerhh5yfgpvmuaatvenh7yrk5uoiracfp7xknsxrb73dcl@hwsatze4rjuq>
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424115854.2328190-4-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_201639_217341_41395257 
X-CRM114-Status: GOOD (  19.24  )
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

On Thu, Apr 24, 2025 at 04:58:52AM -0700, Mao Jinlong wrote:
> qcom,qmi-id is required for remote etm driver to find the remote
> subsystem connection. It is the instance id used by qmi API to
> communicate with remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..947fe33738a3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,13 @@ properties:
>    compatible:
>      const: qcom,coresight-remote-etm
>  
> +  qcom,qmi-id:

Why isn't this "qcom,qmi-instance-id" if that's what it represents?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This id is used by qmi API to communicate with remote processor for
> +      enabling and disabling remote etm. Each processor has its unique instance
> +      id.

DeviceTree describes the hardware and firmware interface, so don't
describe properties in terms of what Linux will do with this value, but
what it represents.

> +
>    out-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      additionalProperties: false
> @@ -32,6 +39,7 @@ properties:
>  required:
>    - compatible
>    - out-ports
> +  - qcom,qmi-id

How can this suddenly be required, did devices described by this binding
up until this point not work?

If this is the case, make sure to clearly describe this in the commit
message.

Regards,
Bjorn

>  
>  additionalProperties: false
>  
> @@ -40,6 +48,8 @@ examples:
>      etm {
>          compatible = "qcom,coresight-remote-etm";
>  
> +        qcom,qmi-id = <2>;
> +
>          out-ports {
>              port {
>                  modem_etm0_out_funnel_modem: endpoint {
> -- 
> 2.25.1
> 

