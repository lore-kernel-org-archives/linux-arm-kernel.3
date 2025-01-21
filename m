Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74ADC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S7T36GEwE5TPH/zBo8MboQHexNJu4mprTzr5taXiRI=; b=o398RP5c5pBK43+63kPUjuUJj5
	K7gCKVLJ8Af8NIYQo0qAGArpmQfEOgGrPxqcNmZI16JxAMM4+syRKyIrqfBz9YozVxGDCBxfPur++
	gKHYbmTyvGhdefzYJ8DVGu46cO1SNCY7ZX0MgZhbaRq2TpxTnj9UKuQPdH2x6kroChv1xm5OJyp1C
	ah95JO2TSQlXtl771aImfujVVYXn0BAK7QxCaD/f7fFMxStMpIc/aafuJxnAWpqDe0cD5ncGk/tVu
	uy7WyCxXc3uo5dRJSfNc1MUZvKxsaoPlifg9ipWdWiDsm6747QK0qfkyDsQQ/bbfThRSo29uoYtk2
	DHHwHOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA5Z-00000007L7t-2vBr;
	Tue, 21 Jan 2025 08:58:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taA3h-00000007KoR-0FMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:56:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C86B5C54B8;
	Tue, 21 Jan 2025 08:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A755C4CEDF;
	Tue, 21 Jan 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737449788;
	bh=/J6s1LPc2A+MK8K/dg/0nl/LSBtqgegJ1hbMkv85RD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQyJN2kNdstDpvP79pHO5Kom+dwnM4QNbgqNRDTvx+HfQ8wWa/0EiA/xETBhP9CiH
	 o+Wr15OOGYWDQ7OkJTIy6ayF1l7fwiBkVGs5xzQfFBEDVoRb1Dwz3stsVwFNChqQaD
	 rlyGtiOGg1Rs04rKxHB8RCzq8Weu6ViGNlWyccMmtcV+zuCtZCrR3PnmkZCSYTPaut
	 kK/pbgZw5AXmwLPBGVrrNN8mqfQxScjzfc3vdW9tEuE+73ZD3B1pvw2fgdOE/9US4T
	 6JlaDCOXuOee4fci8vIyIlNqxJDVB6Hg9PzzgVFyvMEqYhUOCgRp2G0v8AHul7ziNh
	 241haYhAiu2MA==
Date: Tue, 21 Jan 2025 09:56:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: Update compatible for remote etm
Message-ID: <20250121-prudent-cornflower-owl-261faa@krzk-bin>
References: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
 <20250121063900.3211-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121063900.3211-2-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_005629_155309_9624D50F 
X-CRM114-Status: GOOD (  14.31  )
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

On Tue, Jan 21, 2025 at 02:38:59PM +0800, Mao Jinlong wrote:
> Use different compatible to distinguish between different remote
> etms.

Why?

Every second time for qcom. Don't say what, we see that easily.

> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml       | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..199f2ca4b8a9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -18,7 +18,14 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,coresight-remote-etm
> +    contains:

No, you are now saying this is "qcom,pink-pony" as well...

Sorry, this change is neither explained, nor correct.

> +      enum:
> +        - qcom,coresight-modem-etm
> +        - qcom,coresight-wcn-etm
> +        - qcom,coresight-adsp-etm
> +        - qcom,coresight-sensor-etm
> +        - qcom,coresight-modem2-etma

And how anyone can understand the difference between modem and modem2?

NAK for entire patch in this form.

Best regards,
Krzysztof


