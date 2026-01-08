Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612DFCFD635
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAaxMmTxSBHvnrJ6U5HuuqtaCUK/N4Qz5yDmrIPkpc8=; b=iR2zByQL4u2jtVTBqqIBiaYS/o
	p4gCNuyMKdnVMGyGLcfFiS56EsBHcFNevL9CJbSiWaOifMMWL1l3oXHafDFIX6EqBaXb9/8P4L0jE
	jNgk/amh8mZV9vo1sD5SYKG6Clmr+RHKzMq90TW53z5K0er1/Ra5UydGUi66DrMwLIuYTDZ35p353
	Ff9APVrfHUCPWIL1CaM8SX9mB5mhl/y97Se6u57BOqatFBPNAx5aS46CpdFT1DCkJ9mOJwwQxNyEi
	ZoTP+q25z+FxT1oKf862dckb3UkOjFofk1fXb6HQao/JjVTZVih0MlD0sFHpYtm8Sr3IftnMdwJHL
	4vLNBBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlDP-0000000GFsO-38xa;
	Thu, 08 Jan 2026 08:17:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlDN-0000000GFrQ-0tUu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:17:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 480CD4400C;
	Thu,  8 Jan 2026 08:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944C7C16AAE;
	Thu,  8 Jan 2026 08:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767860272;
	bh=1/gBImOJBnxvpdIanR4Ug777313epe/xx8uTuJUSptE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4UW5WSx4T1eAxC7ka226/gGeMfrYhBD67vvxglu/vckB5Nn4A5xmN/jzZgazyYsd
	 /1bcLL+Ghbj8YJZ4jEcQIIrqcdL8TMLTVcEFCBP+OQnfT5O9YCAaniC/FWI5FN4ibf
	 LUXHBqpnMbuH1Yxoo9XejgOoJNJnyAeSHwJ7bpActjkiwj6wfDdhL5CqYH/8o5oqag
	 aV43dkpJMbUZyYABqtIuZucGadeqEBlkuTtRPd5uirs8BCK51W5bi1M3FIV2VC/gc3
	 zGZ1jvzLTGAT5cxOiO4FYYGeq/JED+jbWpnGySYhnNFvN45SJqOSzgmveQCNw6jNUT
	 wGv2hCdUeZF/g==
Date: Thu, 8 Jan 2026 09:17:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: qcom: document the
 Kaanapali GPU Clock Controller
Message-ID: <20260108-eminent-rich-mink-6acaf7@quoll>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-7-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-7-8e10adc236a8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_001753_291546_C40B25BC 
X-CRM114-Status: GOOD (  19.62  )
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

On Wed, Jan 07, 2026 at 03:13:10PM +0530, Taniya Das wrote:
> Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
> Power domains (GDSC), but the requirement from the SW driver is to use

Requirement of what? or of whom? DXCTL requires to use GDSC?

In any case your driver requirements should not really shape new
bindings. I already said this last time.

> the GDSC power domain from the clock controller to recover the GPU
> firmware in case of any failure/hangs. The rest of the resources of the
> clock controller are being used by the firmware of GPU. This module
> exposes the GDSC power domains which helps the recovery of Graphics
> subsystem.
> 
> Add bindings documentation for the Kaanapali Graphics Clock and Graphics
> power domain Controller for Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 63 ++++++++++++++++++++++
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
>  include/dt-bindings/clock/qcom,kaanapali-gpucc.h   | 47 ++++++++++++++++
>  .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    | 13 +++++
>  4 files changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..5490a975f3db7d253a17cc13a67f6c44e0d47ef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics power domain Controller on Kaanapali
> +
> +maintainers:
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
> +
> +description: |
> +  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
> +  Power domains (GDSC). This module provides the power domains control
> +  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
> +
> +  See also:
> +    include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,kaanapali-gxclkctl
> +
> +  power-domains:
> +    description:
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: GFX power domain
> +      - description: GMXC power domain
> +      - description: GPUCC(CX) power domain
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - '#power-domain-cells'
> +
> +unevaluatedProperties: false

additionalProperties instead.

Best regards,
Krzysztof


