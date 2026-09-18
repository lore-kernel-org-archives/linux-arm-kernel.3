Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A1CC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YovMfENuXVcxmX4rLuKB0zA8k0EptKTzSk5necfij5A=; b=G2emHdwyfE6scxI53i9ecFbDem
	3JBJCYknFuYgF3vznPnR8B36GFHoWfDdm3gu1Eh1eQcmpLv6QISsqcDTHPlYORm8fS350MLEsh7HZ
	OCIsJNwD7Hk7g77Dd8vtkJ8N2nzWnE7XfausaKehP+U9aXyC6oFsw8vZnjMOR6ixzpS4XM2EBvyN/
	3+U/Z4/8KMZ0lVt6xGbwKPW7S2v1w0BntI8brrFRTW6Fjp31H6VTRYQRweDvcuyXP8a4RNBoIZ4WW
	ZldoOS8mnEHrktOAbsGc+0PSNY2PyUr7ydir8dVRXCe9dX0k1RkVQde0fuLVmfwNOiNtTAtJZGWPB
	JC35zvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7daV-0000000FLZG-2RH9;
	Fri, 18 Sep 2026 18:45:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7daU-0000000FLZ6-3Ns0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 18:45:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F04540974;
	Fri, 18 Sep 2026 18:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D02CC1F000FF;
	Fri, 18 Sep 2026 18:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789757130;
	bh=YovMfENuXVcxmX4rLuKB0zA8k0EptKTzSk5necfij5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a8+wiRLHPrcHcb6B1jIL+TNiMkajXKzfBVTIvqEUh6Jk90hiPYGFNhR9gvZmIfXpr
	 iFOipNzyedV+QUgQXcH32fWEvrMwz39UiumDFaCF927EEe6cnNu+sNKSFqCQ8SeD2v
	 K0O1eu2LyTYZVNWIIjdHZztQdx+X9Zny5k67Ng4/oBX/B/CfIeo4E3SItCFnVBr731
	 iqFOtZjf3EbFU72kHCOqtRshXXg/wYHY9DJMT39wY/vobe/UCdsx0G5ht/MG6rPsSH
	 fkvOl6qadOOPVyYvIh2HtELime1XvIu5Y9nHYoa+QuFruJNpxkusg81LW68mZoci+v
	 U6f2TTGaObVUQ==
Date: Fri, 18 Sep 2026 13:45:28 -0500
From: Rob Herring <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Simeon Marijon <simeon.marijon@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: stm32: allow TAMP nvram child node
 for syscon
Message-ID: <20260918184528.GB1358633-robh@kernel.org>
References: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
 <20260910-upstream_nvram_reworked-v1-2-521c16175cef@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-upstream_nvram_reworked-v1-2-521c16175cef@foss.st.com>
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

On Thu, Sep 10, 2026 at 04:11:23PM +0200, Patrice Chotard wrote:
> The STM32 TAMP node (compatible "st,stm32-tamp", "syscon", "simple-mfd")
> exposes its backup registers through an nvram child node described by
> nvmem/st,stm32-tamp-nvram.yaml. That requires the TAMP node to carry
> "#address-cells", "#size-cells", "ranges" and an "nvram@..." child.
> 
> st,stm32-syscon.yaml uses "additionalProperties: false" and only allowed
> reg/clocks/#clock-cells, so wiring the nvram provider into the DTSI made
> "make dtbs_check" fail on every STM32MP TAMP node:
> 
>   tamp@5c00a000 (st,stm32-tamp): '#address-cells', '#size-cells',
>   'nvram@5c00a100', 'ranges' do not match any of the regexes:
>   '^pinctrl-[0-9]+$'
> 
> Allow the addressing properties and the nvram child, gated on the
> st,stm32-tamp compatible so the other syscon variants stay strict.
> "#size-cells" may be 1 or 2: the STM32MP21 soc bus uses two size cells
> (an empty "ranges" requires the node to match its parent) while the
> other STM32MP SoCs use one.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../bindings/arm/stm32/st,stm32-syscon.yaml        | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 95d2319afe23..8a0e751591f6 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -39,6 +39,21 @@ properties:
>    "#clock-cells":
>      const: 0
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^nvram@[0-9a-f]+$":
> +    type: object
> +    description:
> +      TAMP backup registers exposed as an NVMEM provider. See
> +      nvmem/st,stm32-tamp-nvram.yaml.

To ensure the node matches a schema:

       required:
         - compatible

Rob

