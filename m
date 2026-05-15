Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F050CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwBLKOGkR7jWr8QO42OXV7B4p9tlr1zJ37LDwpSqmow=; b=fRmgViFY+4GX8zxX9c+hAZir0G
	rIIYE5fa+dKEH3L7NOiq32iQRb8DLw8Qd0T5/oVlUh+wyeq95F0hPyTGC1CeBYwUJeHS+/AeTcExp
	BT/29gZ7ZmqZXlmS4oaipl1dDJO64t6TrzUYBBwnIxLwTxn54BlSl1TWB6VNDIcstRwbfm9bVySH2
	pQOj2L2aOvSPNTF4HpgPMFJZ0fB4iFNCCqrAddp2iMYkXBgmihkzPEANfjg3wYSa1tqxjpwVWQ20H
	NkGLKYo6BQLBfg36kOm63AU7V4GTM8iw3xL91dzsT6MnRtcKj0/OpVo8d02jWxSMVsncspCR3Ol1q
	iFam6c3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmpp-00000007bgp-0ZTv;
	Fri, 15 May 2026 07:19:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmpo-00000007bga-1fuH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DE2560252;
	Fri, 15 May 2026 07:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70600C2BCB0;
	Fri, 15 May 2026 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778829587;
	bh=t5fRpD3EnkE+Nxq5LbviM57nXqk9kkAaeHVvlVAGcXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iz8WGVuZoGyvtgFS0FCc/rRdTDLsTmyRn5uTK77uogNixh04xLVHMPw9WjkNoLMhy
	 5IsqYVx9hu/W5XjRh2fNALK+14aZevRSM2EFobC4iOJ0qWAjfJOWHo4gOfj12dpUxZ
	 e016cgHG6cufWojNA2wEidcSSnsEqD6htECQ5FOUuxzTrLLbnaCbZJhiAxlD6Xk1Mv
	 YDm+rzgs1QfpZJFw2tOTFtFkH0ea6awXR9dF3T5rm6rC+ZTjJXM8VbVdWxtSJIaoz5
	 99Rw0urcPLT6hI/D9yEu+aWP6IdEO4POUpshZvw1r3N/FU1zJVirQFUCLf+7Mbrm9E
	 n0QLFPy0zoBpQ==
Date: Fri, 15 May 2026 09:19:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
Message-ID: <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260509024846.2094049-3-chancel.liu@nxp.com>
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

On Sat, May 09, 2026 at 11:48:43AM +0900, Chancel Liu wrote:
> The NXP I/O connector represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks, PWMs and interrupts, through
> fixed electrical wiring. All actual hardware providers reside on the
> base board. The connector node only defines index-based mappings to
> those providers.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../bindings/connector/fsl,io-connector.yaml  | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
> 
> diff --git a/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
> new file mode 100644
> index 000000000000..8b5038a2332e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,io-connector.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/connector/fsl,io-connector.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP I/O Connector
> +
> +maintainers:
> +  - Frank Li <Frank.li@nxp.com>
> +  - Chancel Liu <chancel.liu@nxp.com>
> +
> +description:
> +  The NXP I/O connector represents a physically present I/O connector on the
> +  base board. It acts as a nexus that exposes a constrained set of I/O
> +  resources, such as GPIOs, clocks, PWMs and interrupts, through fixed
> +  electrical wiring. All actual hardware providers reside on the base board.
> +  The connector node only defines index-based mappings to those providers.
> +
> +properties:
> +  compatible:
> +    const: fsl,io-connector

Everything is IO. Everything is connector, so your compatible does not
match requirements from writing bindings.

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

You do not need to redefine the types. You need constraints, though.

> +
> +  gpio-map-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  gpio-map-pass-thru:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +  clock-map-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  clock-map-pass-thru:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

I do not see these defined anywhere. I also checked cover letter for
references for pulls to dtschema.


> +
> +  pwm-map:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +
> +  pwm-map-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  pwm-map-pass-thru:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":

Use consistent quotes.

> +    const: 2
> +
> +  interrupt-map: true
> +
> +  interrupt-map-mask: true
> +
> +required:
> +  - compatible

You need to require the properties. You have a FIXED connector, so it
has fixed set of features.

Best regards,
Krzysztof


