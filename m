Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336B0D339A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUyzXCGSJmAfKsc+TphuidLw15bOjkjT5xynFWN21GY=; b=XYv+qqemuvTRcPReLN8SRunzK3
	cPkX8KCEqAv5+B163Sw8jJRiW1KdF48YBpO384O2iER2vvgqKQ15jennmZX0GBn8eAZxMmHtJiVaq
	At+QnKxe9ni+7fVacNxH3rYjxueMNtpVZeuSVkktSq40a8ypa14jEAbxHAV2TvCfaB6B20WhfQ1ne
	pOEeK8eHnFJ1MpAeIUj5c96g9b/ijL0HO+8sG95oMihr+UBRE1Z7KPf9wup7cgW9waKdZZ3omN/oe
	uTT89MnbGM5IPxCyIG/TdDNOuAP7db7q04qZtgV8ZJytNF4XALfcs3inU8FwS12RjtHq8H6+RXKqq
	JFImgEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TLg-0000000BdAc-1MHe;
	Mon, 28 Oct 2024 17:16:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TFL-0000000BcEN-1brS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 17:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC7725C5B06;
	Mon, 28 Oct 2024 17:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BAEC4CEC3;
	Mon, 28 Oct 2024 17:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730135378;
	bh=WJDZhRtwghKuue3Ou1x958utvll99lUFzlZQbjrclpk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=gLeItSA3fn2FDDa5nKD3HQn3kGWUx7nLbl492Fr0hM8uBGwuaa9HIRUnUsCTgLlSj
	 gPOlTSXQNRRXdcuNjXI2pd0Pn4xIIArp164mNdhgkDTHa1ei2flF3eRE4iVNrdVz3a
	 lBrfqDgYMI7h+hS+w2ECYH4VRGfinwWeliufn/mPq97hE5o+coSwPGemjeeoD9oojo
	 mjBE1CCych3FIRr7FvQW1o7uRjhTCMkY1/+vAZ9XVj/AV9NYygA5kgyzRbtNc3wAXC
	 K1RB3d1wJicYj7GHvBom3zQfyMELpqvdxIzJoWuMsiyqqDIHmhW9Mg9FRS/YUyDSZb
	 6iFDOhOT+ecQA==
Date: Mon, 28 Oct 2024 12:09:35 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
Message-Id: <173013537587.887084.8594386084996855802.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_100939_493906_413E7381 
X-CRM114-Status: GOOD (  13.96  )
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


On Mon, 28 Oct 2024 15:22:57 +0100, Konrad Dybcio wrote:
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
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/psci.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/psci.yaml: properties:arm,psci-s2ram-param:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


