Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B13A2pBg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+5OJid/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EaXRoxZs9PRx2wo2tzSq0ef3gNUQ37to3HPL9EgpspY=; b=B13A2pBgebpI9EkaOnQVrbsY+7
	+LJkLPYNyNj94HZPkjPQR1p2i3LPGOgiwAdZ4OdxXpD7aOeODHdIdl1gbK+MmHmixDxH3BPHbywYT
	BkxHk8zk5DTwCGIDjGx0Hb2Che5zUcSYhpN3bt3B2U7Z3QRic1ud70B8+KSurmvpiv/nae7LeC4Qy
	qcOqXwisOgzsHb45DynqhrwjD8YzqQk8GXP22+wbVQ29xkiy9ORmLt1DsuUeKlK+0mHWYxqpP7aF8
	Vb1tEWidhb9SKp2n9JOLDLowoHIGAo+cEG1w7Vgs8eHS2rwp+zyJPVqLqpqG+LW/JpHLN4MYomWrG
	G1OMj9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOako-00000005Reo-0BkS;
	Wed, 04 Nov 2026 13:10:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOakm-00000005ReS-3dh8;
	Wed, 04 Nov 2026 13:10:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A38942DAB;
	Wed,  4 Nov 2026 13:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE8B1F00919;
	Wed,  4 Nov 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797812;
	bh=EaXRoxZs9PRx2wo2tzSq0ef3gNUQ37to3HPL9EgpspY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k+5OJid/VkQ3swVXuHLrFLBfnJA0PGG4Zhrv9HJAGwkQmMgt/6YaCL5KMQvwLXSTF
	 O9yMB5ZVpxaDNFY4Gz5VlJRtuFBs8Spl04eVXVRaHh4A/crCFbpkkZwaFg+TBJbMPY
	 vG3hd8gbd64DkQGvbZH/qqqZoliTbayqqN5ENZvW84oEUeDAiEibS//xfiPUMi/WgJ
	 bjjMPfdSoFojto5KvVbOrF/ct72w7DU7ipswheAm3qrSYvTB7QTCFe5XPOIFWv4RDg
	 CeUYyoRMyVEz+VmfdJaGKIhmqsxD8HhL+5loiTZuLac9VHAJTmxp9qev2Bn/My2oSb
	 juzgE1wLbSUZA==
Date: Wed, 4 Nov 2026 14:10:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: broonie@kernel.org, heiko@sntech.de, linux-sound@vger.kernel.org, 
	luca.ceresoli@bootlin.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, sugar.zhang@rock-chips.com, 
	lxt@rock-chips.com, xing.zheng@rock-chips.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
Message-ID: <20261104-russet-stingray-of-penetration-fef32e@quoll>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101044149.2018744-2-zhengxing@rock-chips.com>
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

On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
> Describe the optional detect-GRF phandle and named interrupt resources
> used by the B/C headphone detector. Retain the legacy interrupt order
> and index-based lookup when names are absent. Document the detector
> disable and reversed-jack properties and their resource dependencies.
> 
> Describe the ADC stereo-group routing consumed by the codec driver.
> Require four unique group IDs in the range 0-3, in I2S2 SDI order,
> matching the driver's validation. Leave GRF routing unchanged when
> the property is absent.
> 
> Extend the example with headphone-detection resources and ADC routing.
> Keep machine-driver amplifier GPIOs and debug interfaces outside this
> codec binding.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
> Changes in v2:
> - Retain the original detection descriptions and legacy IRQ ordering.
> - Keep the binding change in its own patch before the codec change.
> 
>  .../bindings/sound/rockchip,rk3308-codec.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> index 2cf229a076f0..60c6140dc5df 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
> @@ -36,6 +36,49 @@ properties:
>      description:
>        Phandle to the General Register Files (GRF)
>  
> +  rockchip,detect-grf:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the detection GRF used for headphone insertion and
> +      removal interrupts on codec revisions B and C.
> +
> +  interrupts:
> +    description:
> +      Keep the legacy interrupt order. If interrupt-names is omitted,

What is legacy interrupt order? There are no interrupts here, so how
could there be anything legacy?

> +      the driver uses the second interrupt for B/C headphone detection.
> +    items:
> +      - description: Legacy codec headphone detection interrupt
> +      - description: Detection GRF headphone interrupt for revisions B and C
> +
> +  interrupt-names:
> +    items:
> +      - const: codec
> +      - const: hpdet

Why same device has both GRF to detect headphones and interrupts?

> +
> +  rockchip,no-hp-det:
> +    type: boolean
> +    description: Disable the internal headphone detector.
> +
> +  rockchip,hp-jack-reversed:
> +    type: boolean
> +    description: Reverse the headphone detection polarity.
> +
> +  rockchip,adc-grps-route:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      ADC stereo-group mapping to the four I2S2 SDI inputs. Each entry
> +      selects the ADC group connected to the corresponding SDI input,
> +      in SDI0 through SDI3 order. Group IDs 0 through 3 represent
> +      MIC1/MIC2, MIC3/MIC4, MIC5/MIC6 and MIC7/MIC8 respectively.
> +      All four groups must appear exactly once. For example, <1 2 3 0>
> +      connects groups 1, 2, 3 and 0 to SDI0, SDI1, SDI2 and SDI3.
> +      If omitted, the GRF routing is left unchanged.
> +    minItems: 4
> +    maxItems: 4
> +    uniqueItems: true
> +    items:
> +      enum: [ 0, 1, 2, 3 ]

Why are all the rockchip properties before clocks, not next to other
rockchip properties? What logic drives this placement?

> +
>    clocks:
>      items:
>        - description: clock for TX
> @@ -72,6 +115,12 @@ properties:
>  
>      enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]

Best regards,
Krzysztof


