Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7884BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 08:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biJVVJd8iiPFwBe6utu1Ou0L7rbKN2LSCC+UFVTe9ng=; b=XJTa5gxS16kO8gl63kp24YUXUo
	/nRzkp+SK+QQDG9uHqI0LmaYofnwnpLwyMNVhIP5zfBQBtAMM2A9Ijei3CkVL7hyP2lv5/Rl4Tj5P
	jyG7cLzcTu+cfxPwjLYC9Vtk9q7UNYGIsEe5JgLvnVbC9f57TYSaID4+oVgMftD/RF4PHI41mldgA
	RbAIyvBRXWAUd+4SkSYazTcnKyikF9bZS45yoNuph9CGr/rCpbj+hNWLblmliy3Bc25fSy7SCe7Mn
	avKVqGQ0d0CWnp+gwMVNTmwi2AfTRgRCGPdbVm/6IW0tb/N1fJrJBQ1EJKV7lkIrFt9RVSbcgHiC3
	fESU0ncA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHCU-000000080iY-3fjz;
	Sun, 22 Dec 2024 08:20:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHBI-000000080RD-0uk8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 08:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D31DBA406CB;
	Sun, 22 Dec 2024 08:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322A5C4CECD;
	Sun, 22 Dec 2024 08:19:17 +0000 (UTC)
Date: Sun, 22 Dec 2024 09:19:15 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
Message-ID: <yngf4ngbnkcmohjfkd6muynfr72v5yhynmyqfjmxh6qbxidmo7@bsvimplmpwsl>
References: <20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com>
 <20241220-qcom_ipq_cmnpll-v7-1-438a1b5cb98e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-qcom_ipq_cmnpll-v7-1-438a1b5cb98e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_001920_399143_161F1187 
X-CRM114-Status: GOOD (  17.22  )
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

On Fri, Dec 20, 2024 at 09:22:42PM +0800, Luo Jie wrote:
> The CMN PLL controller provides clocks to networking hardware blocks
> and to GCC on Qualcomm IPQ9574 SoC. It receives input clock from the
> on-chip Wi-Fi, and produces output clocks at fixed rates. These output
> rates are predetermined, and are unrelated to the input clock rate.
> The primary purpose of CMN PLL is to supply clocks to the networking
> hardware such as PPE (packet process engine), PCS and the externally
> connected switch or PHY device. The CMN PLL block also outputs fixed
> rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ as sleep
> clock supplied to GCC.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 85 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 22 ++++++
>  2 files changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> new file mode 100644
> index 000000000000..db8a3ee56067
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Luo Jie <quic_luoj@quicinc.com>
> +
> +description:
> +  The CMN (or common) PLL clock controller expects a reference
> +  input clock. This reference clock is from the on-board Wi-Fi.
> +  The CMN PLL supplies a number of fixed rate output clocks to
> +  the devices providing networking functions and to GCC. These
> +  networking hardware include PPE (packet process engine), PCS
> +  and the externally connected switch or PHY devices. The CMN
> +  PLL block also outputs fixed rate clocks to GCC. The PLL's
> +  primary function is to enable fixed rate output clocks for
> +  networking hardware functions used with the IPQ SoC.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-cmn-pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: The reference clock. The supported clock rates include
> +          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
> +      - description: The AHB clock
> +      - description: The SYS clock
> +    description:
> +      The reference clock is the source clock of CMN PLL, which is from the
> +      Wi-Fi. The AHB and SYS clocks must be enabled to access CMN PLL
> +      clock registers.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: ahb
> +      - const: sys
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  assigned-clocks:

Drop

> +    maxItems: 1
> +
> +  assigned-clock-rates-u64:
> +    maxItems: 1

These wasn't here when you received review. Adding new properties always
invalidates review.

No, drop them.


> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +  - assigned-clocks

Drop

> +  - assigned-clock-rates-u64

Drop... or explain

Drop all review tags after making significant changes like that.

Best regards,
Krzysztof


