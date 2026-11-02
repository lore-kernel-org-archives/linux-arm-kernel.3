Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A08606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nHxJ5wrx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M+DLjyfX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nT6D34lVZPsVnqv1Mv6DEijDwSntrg/yw0RnHBOVLDg=; b=nHxJ5wrx5BEthRYMFWwtyTXdz8
	nVdBuNoaVBBz9OKcgJKo1zsxS1YNe1ESavt48TnppS1lNq/2DQanJYGmdPtR4JNaCGJL6hbtWcXNN
	pbosgZyq7KG5uyB2CH8n/6jBi5JhBIHRr2MI07xOedOwpMeuZQg2zaP9KVBLbRIhb+matQ3obPF7c
	ThDNB1M5LFBmFX31UUMYcoOJwo8vWjzm575uksqfx5HdLmVfM+KLFY2MeEXDc7rdlXROv6z3LUm4r
	PNndG/eNXTSRPy5kLDqUuZyrbJiVri9PW/3BhF+02ALhYlQNWtVcny/iTT23F60oSMIBd2jgsicQt
	jqxJzyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmTF-0000000FkOe-1TZ2;
	Mon, 02 Nov 2026 07:28:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmTE-0000000FkOK-13H7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:28:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B785F4396D;
	Mon,  2 Nov 2026 07:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD91F0093A;
	Mon,  2 Nov 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793604523;
	bh=nT6D34lVZPsVnqv1Mv6DEijDwSntrg/yw0RnHBOVLDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M+DLjyfXWAl3TaZNGPK/WK3ueOVhP76TGVIsMtlHiL0RZo/a/eOGecakll5qDIOyv
	 MyWCqUbF4Lm88Ultvdq2DWrijIptk5w0MM+lj5p/dHrwXVCuFmIeDH2uiH3XmkLe0e
	 eNTf4DmiURJRGNrNtoFjpIF/HpNtQz8ktbTXpWks4qVQLbUIbuhTosPchMAxIL7/vw
	 K3tEAc6JiaGE+kxbpoSVjPbn2UpSoSnJ2AMW8gt/pGWmEtFXQJfg7cVZrwSEI1ZGgJ
	 dlNi2GApENgDIeHb6o7CcxcahQ1Uq0xnm/zuIW9YnryQF6/ow7MB8qEnJjxmeMN2th
	 /00cRKquLMfsg==
Date: Mon, 2 Nov 2026 08:28:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP
 registers
Message-ID: <20261102-translucent-elated-pronghorn-cbb73b@quoll>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-2-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101200140.141642-2-wahrenst@gmx.net>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 09:01:38PM +0100, Stefan Wahren wrote:
> +  nvmem:
> +    type: object
> +    $ref: /schemas/nvmem/nvmem.yaml#
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx93-bbnsm-nvmem
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
>    rtc:
>      type: object
>      $ref: /schemas/rtc/rtc.yaml#
> @@ -88,6 +102,12 @@ examples:
>          compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>          reg = <0x44440000 0x10000>;
>  
> +        nvmem {
> +            compatible = "nxp,imx93-bbnsm-nvmem";
> +            #address-cells = <1>;
> +            #size-cells = <1>;

I don't think you tested your changes. address/size cells are not
allowed - see your binding.

Anyway, empty node makes almost no sense, so fold the node into the
parent.

Best regards,
Krzysztof


