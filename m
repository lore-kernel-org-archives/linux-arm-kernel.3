Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634860A2622
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=10AXjECD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZ7I/7Ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TNiX7MAgORnhNq15HmODad+Hr6noQTrwj5f5jdgl51A=; b=10AXjECD4gJoWS3jjhaDOg6vut
	vBunRw7QKK2SA9oNDb0TO9EI9M+KAM3wX8wFc7Dv1kqjMZKnHkrv52Dp66+aRIPX9hoXD1n7L5X0D
	3bAOETJGBglEHCmBlOA3yYrW/sEBCcQTC3C3PbWdh3DUFAnynFe8PP/4xeM8E4duk/30bmnHXmRAl
	LNo3+bgajjmB4VdSORUfJg5ynoFosj/KdkiMwx1ZcheFNPDXZxpORXAPDfF95B2Ev2DsEFgXI6WDB
	oOgvq97yim6st/TFpAPK+/SuLFmZrFtnQ/yi3ZIetTC7t7H8jhModJKc2iXSxKA3CxYe3LfO4pZZS
	6vEn7fqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkAC-0000000BRfC-2eJw;
	Fri, 30 Oct 2026 10:48:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkAB-0000000BRf4-3rWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:48:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DC2E41490;
	Fri, 30 Oct 2026 10:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479ED1F000C1;
	Fri, 30 Oct 2026 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357326;
	bh=TNiX7MAgORnhNq15HmODad+Hr6noQTrwj5f5jdgl51A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kZ7I/7NgbOrLtfxupPns58mCsz986hH3wi+7BppUh5UbJASTVJpYtn6xzS/z8VPJ9
	 tn4Ih+DziQWb/8wJF2YDCxZh/4KrIdPnkZ+RtTvaTF02JeLellY5pOr6saj+rIFSs2
	 taNEeMn2j0HD7aiz5RchHQ6isPLqeq3H/H5vbJxvsPyRIZ98lYuBb33fbFa0RZEi1d
	 qUEtUlOFVr/7qoJV8rgAM0KmNTnsJBnSs/fVSnd8rXvnCwugwZbRm9rPasxIwrBfS5
	 mRgwEz29tOK2utF2hkqHcg6U6hqb85P2MT/HOtzhp5bsos6UkIf8KUvduPA63R8Eu0
	 XZTrbjcFz2baw==
Date: Fri, 30 Oct 2026 11:48:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Brian Norris <briannorris@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba
 mailbox bindings
Message-ID: <20261030-terrific-quartz-bumblebee-e36da1@quoll>
References: <20261023235408.3063350-1-dianders@chromium.org>
 <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 04:52:20PM -0700, Douglas Anderson wrote:
> +properties:
> +  compatible:
> +    const: google,lga-mailbox-array
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Host registers (not accessible to client)
> +      - description: Global registers (not present on newer IP blocks)

That's still confusing. Last time you said:
1. You identified 4x instances of MBA
2. Each of the instance has global registers (quotting: "Each of these 4
MBA instances has its own "global" registers."), then why does the
binding say otherwise?

You repeat here again "newer IP blocks" so how many versions does your SoC have?

> +
> +  ranges: true
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +patternProperties:
> +  "^mailbox@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Each sub-node is a single-channel mailbox.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      "#mbox-cells":
> +        const: 0
> +
> +      google,rx-payload-words:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 256
> +        default: 0
> +        description:
> +          The number of 32-bit words in each mailbox message from the remote
> +          processor. May be 0 for doorbell-only. If not specified this is
> +          assumed to be 0.
> +
> +      google,tx-payload-words:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 256
> +        default: 0
> +        description:
> +          For queue-mode only, the number of 32-bit words in each message we
> +          send to the remote processor. If not specified, this is assumed to
> +          be 0. This is only for queue mode where we need to divide up the
> +          message buffer into chunks.
> +
> +      google,mba-queue-mode:
> +        type: boolean
> +        description:
> +          The remote processor is expecting the shared memory to be treated
> +          as a circular queue and that there may be several outstanding
> +          messages at once. Only usable on instances with counted doorbell
> +          interrupts.
> +
> +    dependencies:
> +      google,tx-payload-words: ['google,mba-queue-mode']
> +
> +    required:
> +      - reg
> +      - interrupts
> +      - "#mbox-cells"
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - ranges
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      mailbox-array@5240000 {
> +        compatible = "google,lga-mailbox-array";
> +        reg = <0x0 0x05240000 0x0 0x00010000>,
> +              <0x0 0x05250000 0x0 0x00010000>;
> +        ranges = <0x0 0x0 0x05260000 0x00020000>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        mailbox@0 {
> +          reg = <0x0000 0x1000>;
> +          interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +          #mbox-cells = <0>;
> +
> +          google,tx-payload-words = <4>;
> +          google,mba-queue-mode;
> +        };
> +
> +        mailbox@1000 {
> +          reg = <0x1000 0x1000>;
> +          interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
> +

Please make the example complete. Last time you wrote:

"If we tried to represent the mailbox array as a single mailbox with a
bunch of channels, each instance would have a different number of
"reg" entries and a different number of interrupts."

and I do not see that. I see each instance having exactly one reg entry,
exactly one interrupt with difference in RX and TX.

The DTS here:
https://lore.kernel.org/all/20261026144346.1.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid/

has the same.

Best regards,
Krzysztof


