Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F305C1067043
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNYXguC+2IsbJjdIIjjBWU1TxFjM2sOx3ZtkELEtAOU=; b=WcubdlD6dR9+KUeGBCb2jV+qrQ
	SF4mEnbH9BpyzCoOhLpX5lEwohVMYsA6hEBiKCu6wB6b9MlEpECDNDHqH4ypPG0sC85FTWxT3rb2X
	6heSQkcDn5u9UDg5I2gy50xOAWcYTUSSfh0dQYXaXp7OIYN6KaXYfbLdYD/rLsnU7b+8qKf24tGKC
	CBfUMjT1Jfbq7lVzeBc12wCSpAJc/geUAreZk/FYp8BnTa8uD275tx+zuwDJlUpAxngie/IShS1fM
	u5exyqJH89ib0/OXhSA+A8l4DzcidT+8kd/MN4Upp9s/HJUx0qldr77gBLnAKyrFAP2N4XCKiT0VK
	1V4jqGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hiC-0000000EKYn-2XjS;
	Thu, 12 Mar 2026 15:12:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hiA-0000000EKXl-2P5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:12:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D886044499;
	Thu, 12 Mar 2026 15:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE37C2BC86;
	Thu, 12 Mar 2026 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773328349;
	bh=OFQkSwxZOQTDuacP85eO/H76W4BsofYz+Vr8zvUhZss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bo506PWqIcT26ISjH6rrBUPGkXjhgqjAHzoarDnOYVpQsajPlcZiwwN/9V76E6z0u
	 LHZZXtz207GTup8BM5hEvD1fNuZ+bsa0maUCc01JFbscA1fGZo7Ndu34koaw7NS4nW
	 OsZXqmq5ByCJGcgcKY5inFwW+7p3k3cZ3HgDuPqVhfgcMGnawXSP0MEJo65OLa/mb7
	 7DqNOMSD7EyKmxloJzEk8iJxCS+dXWm85d8sIn2RsmdE1p0hnXaDLsTZsrQmeqw/yZ
	 dcuHyKTYnDhNF8A+9m7kjkj6DmSmjDtzmh1AlIv7uph1rGH9XYcADRTAC/LvfGtczf
	 TdA50RewHETyg==
Date: Thu, 12 Mar 2026 10:12:28 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Juan Yescas <jyescas@google.com>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v7 04/10] dt-bindings: soc: google: gs101-pmu: allow
 power domains as children
Message-ID: <20260312151228.GA3136988-robh@kernel.org>
References: <20260306-gs101-pd-v7-0-03f7c7965ba5@linaro.org>
 <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306-gs101-pd-v7-4-03f7c7965ba5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_081230_674012_ECDD0C23 
X-CRM114-Status: GOOD (  22.15  )
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

On Fri, Mar 06, 2026 at 10:29:55AM +0000, André Draszik wrote:
> The power domains are a property of / implemented in the PMU. As such,
> they should be modelled as child nodes of the PMU.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v7:
> - really be consistent with quoting (Krzysztof)
> - drop invalid tested-by tag (Krzysztof)
> 
> v4:
> - consistent quoting using " (Krzysztof)
> - add samsung,dtzpc to example
> 
> Note:
> Because the properties added are 'required', this commit breaks DT
> validation of the existing DT for Pixel 6, but a) that's simply because
> the DT is incomplete and b) a DT update will be posted once the binding
> is accepted.
> It is not possible to write the binding such that it supports old
> (incomplete) DTs in addition to the full version, but as per above
> it's not required to keep supporting old DTs.

This information needs to go in the commit msg.

> ---
>  .../bindings/soc/google/google,gs101-pmu.yaml      | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> index a06bd8ec3c20..dfe6f87e5949 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-pmu.yaml
> @@ -16,6 +16,14 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
>    reboot-mode:
>      $ref: /schemas/power/reset/syscon-reboot-mode.yaml
>      type: object
> @@ -39,9 +47,23 @@ properties:
>      description:
>        Phandle to PMU interrupt generation interface.
>  
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object
> +    description: Child node describing one power domain within the PMU
> +
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: google,gs101-pd
> +
>  required:
>    - compatible
>    - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
>    - google,pmu-intr-gen-syscon
>  
>  additionalProperties: false
> @@ -51,6 +73,25 @@ examples:
>      system-controller@17460000 {
>          compatible = "google,gs101-pmu";
>          reg = <0x17460000 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
>  
>          google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
> +
> +        pd_g3d: power-domain@1e00 {
> +            compatible = "google,gs101-pd";
> +            reg = <0x1e00 0x80>;

I'm assuming 0x1e00 is an offset from 0x17460000. That's not what ranges 
says though. It says both addresses are in the same address space 
(system-controller@17460000 parent's address space). You need:

ranges = <0x0 0x17460000 0x10000>;


> +            #power-domain-cells = <0>;
> +            label = "g3d";
> +            samsung,dtzpc = <&pd_g3d>;
> +        };
> +
> +        power-domain@2000 {
> +            compatible = "google,gs101-pd";
> +            reg = <0x2000 0x80>;
> +            #power-domain-cells = <0>;
> +            power-domains = <&pd_g3d>;
> +            label = "embedded_g3d";
> +        };
>      };
> 
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 

