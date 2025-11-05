Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B392CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmDdE65+QlnOS4G0yAjzPnPuNohxoXTbUlyWLgArmqY=; b=T/twyc5rRBwUyyUWOLtdNC8Mc6
	1szBnLZU3basrXrmcVfHyAhbb/TbCAzLNl7CAWxnCi4hH9CJajfx7fxzE0qxrrgcb07FScykTB1OS
	yWhH4O7dB0RXU1ZmMhz0q2ApEOdD42jelt3i2h3dNRfLC1FfQWMbIC04nspPeo2UG7opRY4rYY0b2
	nL1f201raY4vus2TyvLWXhfhr13u32XBr+WkyKEJf74+ce2DjU1fZwK1lS+cAgaEV2/9UvgHM5SAu
	vniWT/aofiCt6LO0nwn2lnwFe7FwwhWLAwydD3hS7vrV67fcXoyz/vK2NAVD92vvFMI0d4bR11bFi
	I6wYp/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZMS-0000000DL4g-0h4S;
	Wed, 05 Nov 2025 08:59:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZMQ-0000000DL4V-2WMJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:59:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0694A60202;
	Wed,  5 Nov 2025 08:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293A8C4CEF8;
	Wed,  5 Nov 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762333161;
	bh=R+46XLhZWIOTOB+yJZKWT6BNdn0bZgAdYGeql5q9uo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5rEvPgLtiZgP6Drgj1xMpWAfIAzfKbYkr3fpk4qAAzc5VjqmLyczNxDurdaYR/K3
	 UksMDbqrw0cy3j6yrfRwu2kEZVAOCjh3E4e7Xz0xe0HNjZoiA0KoffiNfDeEl0v0JS
	 P9enYt94d8Esy5hI82o/52SjygMoJx+pBK7tqREk63xs+T2gwIhXavGj0kLQu30EYK
	 Y7KFegE+Bb+WRnALIf/Ms06M77X7F7h9WqmfCY+rN4AW8D7tBfAn7mLDWvZh7JGUJ8
	 qkT3MLdw24aIm4tSOC6Rc4494yEZDB6iTr95beNjt6mph5UWe3JS+4rJj1e1V7aPm7
	 bq71HEiRZjdRg==
Date: Wed, 5 Nov 2025 09:59:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-binding: arm: add CTCU device for hamoa
Message-ID: <20251105-proud-pearl-gorilla-8a40db@kuoka>
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-1-af552cfb902c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-enable-etr-and-ctcu-for-hamoa-v1-1-af552cfb902c@oss.qualcomm.com>
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

On Tue, Nov 04, 2025 at 04:10:17PM +0800, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 460f38ddbd73..57dede7a90e9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,hamoa-ctcu

There is no such hunk. Dependency should be noted here, anyway, this
cannot be tested by tooling so no review. Please be sure your patches
can be actually tested.

Best regards,
Krzysztof


