Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F33E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf1jtwA5s9Kuvee6XNz5QQ+/lKsfJQW1ss9Ok/atYUE=; b=LoK79mb7F8HImd/8LHpWk+lllU
	qkfDQEG8pVIz/CCa80/a2dIKmIbrOnjrOTRysldONTy+ZPf03j5KnksliGBXE4tJetJnpRwtCgUp7
	plo45lERbL8fu1Jd8LVnXwrA9IQtS/DIB3ptYOD9eLM6OmiE49Cmv3zdF6/fKRWmuxdLdWwu05o6g
	lNtM0fIv1OM259Fc7Xn9pudzebgzhQkCb0G+tysWPrqzuaE1kyL+pT9/pnLGzwvQCWhj3VfSWPIg9
	D0cVJp120rbHnqQD8hh8vN2CsHtfqN3QIaNTkJzM0uZmOtRqbTgQhxkhtIcU7942+YL/Rcv9A18TO
	AF9q4gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3IL-0000000FbX3-1g9P;
	Tue, 23 Dec 2025 14:23:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY3IJ-0000000FbWc-1YWS;
	Tue, 23 Dec 2025 14:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C02B043D1F;
	Tue, 23 Dec 2025 14:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3F3C113D0;
	Tue, 23 Dec 2025 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499802;
	bh=dL54WGAJEIPqhAAVO0KPXAc3S1Hb2d8e3/d03vmvnlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtU9/nfasD0eBgjUmrrugR/NgKFFqaTCSHn7CNmgNpQCtkqI7WV+Did2wNuBM7sG4
	 Tozeh/wrBBl3HS3lz2KobxeXmLseRP0KXcA9puHc9MhUZiEqbdEHpAfwVaiz3CpX5c
	 TIcP/4NVd5VrIvIaXsRaNOtRUwHKPN4h/Q9nN4GqfG/kGW0veOGEnJhqeJrHTJAVHz
	 g3aqkPwTYPZcYt86izEa34vmhdec68+owZG98ABGYpaWtZKRCVyxUC/1eRbuPnPEka
	 eQ/8WUSiUkDAeRMwZGVw2+b0wTJe5/CBwiRyIxANJgk3YgrRPpUIB8CyIwXumXaqpP
	 jN4cZf2uZ7aJg==
Date: Tue, 23 Dec 2025 15:23:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: SriNavmani A <srinavmani@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Michal Simek <michal.simek@amd.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY document
Message-ID: <20251223-nondescript-horned-mouflon-36ba75@quoll>
References: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com>
 <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-1-5457d0ebcdb4@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-axiado-ax3000-add-emmc-host-driver-support-v1-1-5457d0ebcdb4@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_062323_489916_073C77F2 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, Dec 22, 2025 at 04:45:00PM +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Add device tree bindings for the Axiado AX3000 eMMC PHY. The bindings
> define the required properties for configuring the external Arasan
> eMMC PHY, including register base addresses and clock references
> needed for HS200 mode operation.

Do not say what the bindings are supposed to do. We can read the diff.
Explain the hardware.

> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f88941ce60cbd99a73e8c504e0bf36c626bbf674
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/axiado,ax3000-emmc-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Axiado AX3000 Arasan eMMC PHY
> +
> +maintainers:
> +  - SriNavmani A <srinavmani@axiado.com>
> +  - Tzu-Hao Wei <twei@axiado.com>
> +  - Prasad Bolisetty <pbolisetty@axiado.com>
> +
> +description: |+
> +  Bindings for eMMC PHY on Axiado AX3000 SoC.

Irrelevant

> +
> +  - compatible:         Should be one of the following:
> +                        "axiado,ax3000-emmc-phy"
> +  - reg:
> +      maxItems: 1

Entire description is not correct. Do you see any file written like
this/

> +
> +properties:
> +  compatible:
> +    enum:
> +      - axiado,ax3000-emmc-phy
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - "#phy-cells"
> +  - compatible
> +  - reg

Wrong order, use the same as in properties.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    emmc_phy: emmc-phy@80801C00 {

Drop label and node is just phy@

Also, use lowercase hex everywhere.

Read DTS coding style - Axiado already received this feedback, so you
should follow it in all your submissions.

Best regards,
Krzysztof


