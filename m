Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33707606A958
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y6VXT/2W;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WOl9N+s4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yd6kellBkouNmavPCTxgbbG4MTt15mCuT9lyTCHnvh4=; b=y6VXT/2WH0DybvEcEftGy5K5nz
	SARBgHlKwhAjnbvWo5zgTSYvZUfCgZT/yWDBZ9VMOMjgFZGTImx4GmbeMw4HY7HVM4l8JEO9GwZu3
	CB7G09QcAo9RBi2SDGoZn3Ae+hdfgcr8qMqtfUkddqk9wvEgFbJknMDdBFWdff5b2A8jRnU/CK+he
	XfsIgHuQrmhPLWrpzKoIm9+QlWrc4TcBgx+uNxNxtRqSBsl7iS0UOBs8PvZro1c8xohvDs3K+eO2P
	cZufaX+C7XjdP5FBBdO7GkOcDOIXU5vZIzjRs4WTZpJaLbvoW8eDCosCsqZAB0QeEXc2E3Vgyy65H
	ICY8xCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIcH-00000002Lbr-2fSF;
	Mon, 26 Oct 2026 11:11:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIcG-00000002Lbl-2RUS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:11:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55E0E43436;
	Mon, 26 Oct 2026 11:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511A81F01342;
	Mon, 26 Oct 2026 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793013108;
	bh=Yd6kellBkouNmavPCTxgbbG4MTt15mCuT9lyTCHnvh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WOl9N+s4DFgHhLromnYQt6oF5JKpkhFm1SXjKN2A6YDEmiC263KVR9PrIDCzSeJ7J
	 LQlrtz1WSJpeA+WWyRc+Cx72IJNEtj/RGsdqEH0amOb3CmSxcRqdL3cR+JePbDdGP5
	 4CjEp8+HWawtAAfMuDoOvJoFoX0+vcM126BGtjRlpYwSYDljQWebf3WO7w74Tad4wR
	 PIeE9yTGoOPJXgFhK9jCqrzlk1j4MzcqXQKvaENqdzdiLFC/PvrpFF7/BwUAcelgKw
	 jOQei9Tvju6qHw8Yj4XdijooVmJH7NVYvlUvMquQDLHUOBfItDp9HF+eEy3XSdnUhf
	 4WWGxbr5IwPIQ==
Date: Mon, 26 Oct 2026 12:11:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Ajay Neeli <ajay.neeli@amd.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Pedro Sousa <pedrom.sousa@synopsys.com>, 
	Joao Pinto <Joao.Pinto@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, clizzi@redhat.com, 
	aruizrui@redhat.com, eballetb@redhat.com, echanude@redhat.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 07/10] dt-bindings: ufs: Add NXP S32N79 UFS host
 controller
Message-ID: <20261026-beneficial-authentic-bonobo-a59b7c@quoll>
References: <20261024122533.3609180-1-larisa.grigore@oss.nxp.com>
 <20261024122533.3609180-8-larisa.grigore@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261024122533.3609180-8-larisa.grigore@oss.nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 02:25:30PM +0200, Larisa Grigore wrote:
> Document the UFS host controller on the NXP S32N79 SoC.
> 
> Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

How this could appear in v1?

Also, your SoB is the last one.

> ---
>  .../bindings/ufs/nxp,s32n79-ufshc.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml b/Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml
> new file mode 100644
> index 000000000000..14291c5506f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/nxp,s32n79-ufshc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/nxp,s32n79-ufshc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32N79 Universal Flash Storage (UFS) Controller
> +
> +maintainers:
> +  - Larisa Grigore <larisa.grigore@oss.nxp.com>
> +
> +properties:
> +  compatible:
> +    const: nxp,s32n79-ufshc
> +
> +  reg:
> +    items:
> +      - description: UFS Host Controller registers
> +      - description: System Control Module registers
> +
> +  reg-names:
> +    items:
> +      - const: ufshc
> +      - const: scm
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: core
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - operating-points-v2
> +
> +allOf:
> +  - $ref: ufs-common.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ufshc@4ac80000 {
> +        compatible = "nxp,s32n79-ufshc";
> +        reg = <0x4ac80000 0x1000>, <0x4ac40000 0x1000>;
> +        reg-names = "ufshc", "scm";
> +        interrupt-parent = <&irqsteer_coss>;
> +        interrupts = <211>;
> +        clocks = <&clks 0x92>;
> +        clock-names = "core";
> +        operating-points-v2 = <&ufs_opp_table>;
> +
> +        ufs_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-0 {
> +                opp-hz = /bits/ 64 <0>;

Why is this empty?


Best regards,
Krzysztof


