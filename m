Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03C0CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlHTKFJ9nOjJ4sei8TYyoCL9woju/FNAQOM8EKr+6Eo=; b=cWJFkc9Z7eLYYbApPLzyWyezey
	0IVYr3s2Oz6z8NI/EApQBRbYuy/L0l9H0cWzpvzrQUftB+MtxVA80yqgoSO0YOW56RPqFLMYBJSKA
	g1yJdpLfgW5KcD9PXnzKLlXvsRdSO+kmnzV2aEJ5XOrpy8H3+m1eg4t484eWzmcjVP+AHZVoq+pnQ
	DtmNH1yCh8EsE0i/N91n3igoFGLV12aU6UGoI4EvKjL87Q7XsUsxueitEYYZOvPl/t1dc6FDDPrZL
	HKK5L1V2KvAYfzsifBuqWvkQ8ERCFibMYTK3AyIC1O7GNbs1lD8tYBt0cM22XllroVYNEPglfdFFr
	DFNfh26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkp-0000000GZFJ-2wWg;
	Sun, 27 Sep 2026 16:29:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkW-0000000GYwa-351Y;
	Sun, 27 Sep 2026 16:29:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7920F43FD3;
	Sun, 27 Sep 2026 16:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0663A1F000FF;
	Sun, 27 Sep 2026 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526552;
	bh=MlHTKFJ9nOjJ4sei8TYyoCL9woju/FNAQOM8EKr+6Eo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IxICCo1rUsPvmAF8mGGbFkPTJ05RBCUvmgy0UW4EUH76muN5ijdWchfDgdrhVUnJI
	 DqizfgfFeCpZ3NJm4x5u3yT0j9l14+gPWqRSeC2jaHAUC2KyzsaTn6XWRVNtZQd3TI
	 jiq839Ujj9K7/+0qMDQDFXIL28VrHq1M+QIS06NTqW1b6jQI7cpplV1F15dgONJcTv
	 DYjcDiDgcgL1CiF1fjfr+bjgrO5X+f+AhMN8MYHdKoNZHrriryVFVHnNsI5AliU08+
	 l95TAGiQbIcFCjwFMxd1qNLhC5LcrvjItGrB+3gsQtloH4zHcN9iJ2LeItn7yiTplv
	 fwKE+ITzIHRdA==
Subject: Re: [PATCH net-next v15 4/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
From: netdev-bot+sashiko@kernel.org
To: bartosz.golaszewski@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, radu@rendec.net,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org
Date: Sun, 27 Sep 2026 16:29:09 +0000
Message-ID: <179052654960.2160803.15091686199225539012@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] This patch raises the shared `power-domains` limit in
  Documentation/devicetree/bindings/net/snps,dwmac.yaml from `maxItems:…

--

dt-bindings: net: qcom: document the ethqos device for SCMI-based systems

This commit adds a separate binding for the firmware-managed qcom,sa8255p-ethqos
variant of the Qualcomm DesignWare MAC. It also adds that compatible to
snps,dwmac.yaml and raises the shared power-domains limit there to two. To
keep the old limit for other devices, it adds power-domains maxItems: 1 to the
vendor bindings that reference snps,dwmac.yaml.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 0ff9e3284a061..1f2ee684dc391 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml

[ ... ]

> @@ -186,7 +187,8 @@ properties:
>            - enum: [ahb, stmmaceth-ocp]
>  
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

[Severity: Medium]
Was ultrarisc,dp1000-gmac.yaml missed? The commit message says:

  let's update existing bindings referencing the top-level
  snps,dwmac.yaml and limit their maxItems for power-domains to 1.

Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml already
exists at the baseline and references this schema:

  allOf:
    - $ref: snps,dwmac.yaml#

  unevaluatedProperties: false

Its properties block lists compatible, reg, clocks, clock-names, interrupts,
interrupt-names and phy-mode. It has no power-domains entry, so it only gets
the relaxed limit from snps,dwmac.yaml.

Before this patch, dt_binding_check and dtbs_check rejected a DP1000 node
with power-domains = <&a>, <&b>. With this patch that node is accepted. This
is still the case at the end of the series.

Nodes checked only through the select in snps,dwmac.yaml are affected too.
That covers generic snps,dwmac* or snps,dwxgmac* compatibles with no vendor
schema. These nodes now also accept two power domains, because no vendor
schema restores the limit of 1.

One option is to add power-domains maxItems: 1 to ultrarisc,dp1000-gmac.yaml.
Another is to keep maxItems: 1 here and allow two only for
qcom,sa8255p-ethqos in an allOf if/then block. That would also cover
bindings added later.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260923-qcom-sa8255p-emac-v15-0-e82f33720737%40oss.qualcomm.com

