Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635C4606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d0B3wAqH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E9ek7HXm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2YGEq7yMAkzCJ7AWvTtLlTFsQxxR0DtnZuHVN93H/rY=; b=d0B3wAqHEywnNIVvlQpvHu1AHp
	fP/WS/qU1khbnwimnvxYKmkFklG2M1/4b2lfGmiDgrBWTjCcWntDtykMiwq4rrcR8U9j7TcIt51vr
	7YIZxznnVc3IxL2LU6QBkS2tae3ut4R+pFIyzVWXtRYhLOUXjvGNcnb3TBqhgjUlIhqRsIeSdbTgF
	wgLab8nYp44sUnXR4dAuddhe7zzFQMRC1iRgbHEvk5yibAfYqY+tDHGTbjyRh/szBhDghmxz0D/23
	9x+i4psnLYIWwc9kDkd3p2PUrOiU/+Ul4N+dybSLB4F9c+8eTaqnV+zcGAJZD2VaAkJFriZkuyyQD
	xghb0kPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNosr-0000000G7a5-1lRv;
	Mon, 02 Nov 2026 10:03:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNosq-0000000G7Zu-097K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:03:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 67B014400F;
	Mon,  2 Nov 2026 10:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3491F00A17;
	Mon,  2 Nov 2026 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613799;
	bh=2YGEq7yMAkzCJ7AWvTtLlTFsQxxR0DtnZuHVN93H/rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E9ek7HXmlKDrt+9Nsevchyw2AYqqlIabzlTWy0RvTQhcI3BS9M0og+wnlDHDQBe8O
	 fGj+nuxZSewsoCijUBzEkhxt44uS09gYz4Xhd58RvKajYZ0zEZaRJ/zYDQ7K7yBWJD
	 Vpx/N5GK55N33cj2mhRnaSIM/6ZMN8tzUkWs2HBg5hgxnn4bs7b6jRtboZo9d84qjt
	 tAoBWlZ4j/00omnc40MYDhOZh9kobrco975mAl4yIA7+EjGfe06e7XTBF9eVNx64DG
	 Rx+zjTgTRW7iNt6DlgZNmimTOIKLN9iC3QVAKR462Apqsef7S4aZFZOuY9bBARo4Oa
	 cZnqlZW8elz4w==
Date: Mon, 2 Nov 2026 11:03:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20261102-bald-mysterious-alpaca-13b8fa@quoll>
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030031501.130290-2-cwweng.linux@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:15:00AM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add a devicetree binding for the Enhanced Analog-to-Digital Converter
> (EADC) found on Nuvoton MA35D1 SoCs.
> 
> The controller provides eight external analog inputs which can be used
> as single-ended channels or as four fixed differential pairs: 0-4,
> 1-5, 2-6 and 3-7.
> 
> Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
> ADINT0 through ADINT2 are associated with the corresponding conversion
> interrupt flags, while ADINT3 is shared by the ADIF3 conversion
> interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
> sources.
> 
> Also describe the functional clock, optional reset, optional external
> reference supply and optional DMA request.

Don't repeat the patch contents.

> 
> Expose the controller as an IIO channel provider through the
> DT #io-channel-cells property. The cell identifies the logical EADC
> channel selected by the reg value of the corresponding channel child
> node.
> 
> Restrict the channel binding to features supported by the MA35D1 EADC
> hardware and use the common single-channel representation for
> single-ended inputs.

And here even more.

> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 000000000000..97144a8eeb5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
> +
> +maintainers:
> +  - Chi-Wen Weng <cwweng@nuvoton.com>
> +
> +description: |
> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
> +  12-bit successive approximation converter with eight external analog
> +  inputs and one internally connected VBAT input.
> +
> +  The external inputs can be used as eight single-ended channels or as
> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
> +  connected VBAT input is not described by a channel child node.
> +
> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
> +  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
> +  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
> +  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
> +  compare flags.
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-eadc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: ADINT0 conversion interrupt output generated by ADIF0
> +      - description: ADINT1 conversion interrupt output generated by ADIF1
> +      - description: ADINT2 conversion interrupt output generated by ADIF2
> +      - description: >

Drop >

> +          ADINT3 shared interrupt output generated by ADIF3 or by the
> +          ADCMPF0 through ADCMPF3 result compare flags
> +
> +  interrupt-names:
> +    items:
> +      - const: adint0
> +      - const: adint1
> +      - const: adint2
> +      - const: adint3

"int" is redundant, so honestly names should rather go away completely.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1

Best regards,
Krzysztof


