Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488E0CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItpQU1twlguNJngH5RUDn/AgPBWQC4jxXm9zogpv2lA=; b=n+8ipYz8wUiqzGw/NJuiaTWVjh
	ru64kxJ98A6jHaRHUkd4E5qEPetaHXvzrMVRjL7grdt+56bMpr5hHopMafRw72m1zpWhG8pjjYcoG
	taC0FCV9jf2b2FSf98z5HjaxSUdYtshhQ8c2mnrehvv6WzvZdSUxRpKs2h4EFHwUmltuqVoga7WMt
	c80SWgKBTT/NOvHe/SHxVVoy63dmPxTb1+L6imiHaxdjdmB/0DWkbc9gUOInc460jpNLEFX3TvPps
	NUfGKMq5Lee4PLf+NOOuOU1UoA4je80YutHylNmwIidWHP+oiB4fP6XaBJb4JsmGzHxplY/vmyTNM
	AzqrE7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1yp-0000000FYoo-2Lw9;
	Tue, 21 Oct 2025 02:20:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1yn-0000000FYn1-3fUw;
	Tue, 21 Oct 2025 02:20:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C3B562245;
	Tue, 21 Oct 2025 02:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C5FC4CEFB;
	Tue, 21 Oct 2025 02:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013190;
	bh=k0IODMQL//HmcYNybquqw9b9ocqnHrvWWX8AkSnFqHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeNkvJwsEInlT+RzdsQSNB0LwxuwjVBxqc6LUysr26l2GCxjWeKzNzW1Dff6rLl49
	 KjyWIM/N9n8xwke/FNZQovwWVUEOuuKjG92s2nl8plEaJCm1QlxuhgOavNR+9SnWKg
	 lhyx4quDVFbt7f9xgSvNTHlrzSQ41Z0TiKAGQrTcbsmsUC5A4UMJSEEGAMwGFF/NTV
	 fTQddQCIthgSROZ4ytJshXYHVWMS2j/uMRPy7fmCDkNkGwz8E9JJf1bGgiSa3+eb0i
	 eGFumVGYDCLsRPIHmayBaXrFDt87vyw1DhgPc1f19cqOrkuTTc2AQR3SuXflOixA9c
	 poLfOTgzgQ/lw==
Date: Tue, 21 Oct 2025 07:49:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: power: Convert Actions Owl SPS to DT schema
Message-ID: <e7ve2cp4x4slaqjgxyzvlc4ndgvtjbf7q5rgpcbjhxgr5ymix6@zie2hysmsox7>
References: <20251013215834.783501-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251013215834.783501-1-robh@kernel.org>
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

On Mon, Oct 13, 2025 at 04:58:26PM -0500, Rob Herring (Arm) wrote:
> Convert the Actions S500/S700/S900 Smart Power System binding to DT
> schema format. It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../bindings/power/actions,owl-sps.txt        | 21 ----------
>  .../bindings/power/actions,s500-sps.yaml      | 39 +++++++++++++++++++
>  2 files changed, 39 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/actions,owl-sps.txt
>  create mode 100644 Documentation/devicetree/bindings/power/actions,s500-sps.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/actions,owl-sps.txt b/Documentation/devicetree/bindings/power/actions,owl-sps.txt
> deleted file mode 100644
> index a3571937b019..000000000000
> --- a/Documentation/devicetree/bindings/power/actions,owl-sps.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Actions Semi Owl Smart Power System (SPS)
> -
> -Required properties:
> -- compatible          :  "actions,s500-sps" for S500
> -                         "actions,s700-sps" for S700
> -                         "actions,s900-sps" for S900
> -- reg                 :  Offset and length of the register set for the device.
> -- #power-domain-cells :  Must be 1.
> -                         See macros in:
> -                          include/dt-bindings/power/owl-s500-powergate.h for S500
> -                          include/dt-bindings/power/owl-s700-powergate.h for S700
> -                          include/dt-bindings/power/owl-s900-powergate.h for S900
> -
> -
> -Example:
> -
> -		sps: power-controller@b01b0100 {
> -			compatible = "actions,s500-sps";
> -			reg = <0xb01b0100 0x100>;
> -			#power-domain-cells = <1>;
> -		};
> diff --git a/Documentation/devicetree/bindings/power/actions,s500-sps.yaml b/Documentation/devicetree/bindings/power/actions,s500-sps.yaml
> new file mode 100644
> index 000000000000..bb942817b3db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/actions,s500-sps.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/actions,s500-sps.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Actions Semi Owl Smart Power System (SPS)
> +
> +maintainers:
> +  - Andreas Färber <afaerber@suse.de>
> +  - Manivannan Sadhasivam <mani@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - actions,s500-sps
> +      - actions,s700-sps
> +      - actions,s900-sps
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#power-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    power-controller@b01b0100 {
> +        compatible = "actions,s500-sps";
> +        reg = <0xb01b0100 0x100>;
> +        #power-domain-cells = <1>;
> +    };
> -- 
> 2.51.0
> 

-- 
மணிவண்ணன் சதாசிவம்

