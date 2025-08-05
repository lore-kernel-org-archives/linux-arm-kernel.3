Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A333CC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDTKpxWh8mA9JciiXpOi+Sp38j0Sfl89Pq+xG8dFeZE=; b=dxrb//8z31vGjlLydTtto72uvO
	xjsDNFTjbFpV9HJ+TPqAVLeIMSF+3QLMsd38muvEPhdJASym0GvFWuHRSDDZDJHQ42AiI+/ItV39u
	rPikhK6ly5DiM+uecjwhOm1pWCFOOCqBBNIkqEsec5E7ceaU2jVSWHAj/K1/Rx8gocOdRF+aXSpMS
	9HkqPPm3y1ADt0cHaTmdXR2+vepcQeh7uIO+8TPaD2vD6CEgwtVmWZy9NsNO+njbxPx01qYfKaO8p
	cTALbJDAkvMOZaRNnt4eoQFUShlgURwjtxVvhXuVEEkuU8d4xh+3O/6DZOM2Ymu5jiie1RZaXm24M
	Jdyxr7lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBmq-0000000BzVq-2REp;
	Tue, 05 Aug 2025 07:08:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujBaN-0000000BxaA-29bm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 06:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 398B2443DE;
	Tue,  5 Aug 2025 06:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F161C4CEF4;
	Tue,  5 Aug 2025 06:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754376947;
	bh=zRktS7tLY1en7iXMLnLj6uv8j5ngLB1dqGGyBECiblE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azlyW3FWSEQ2XP3fACoYQZrxXwn21yiJt7+f1wJiHpxnKDni6qVPsrcjO7i65RzAu
	 q4KgLoAudjJjC6o0FSZigmnj2awONCPYrX7uHlPVvYmWJkb8beQbqBAPDCjNx5qQLg
	 TQ+FA2FaeCFo9QaqtJG7SL/04Lw7/RQGBUVeEvT70gDTfPEorDLqTWJzLc57Y3OPdm
	 ZR205NeyUEiKuj4YiC0g2WE+kyTh9tHq+n9T5bGcN0A95UzGOFB93Rt9omaWAyftW+
	 QPg9myMS4CRT5oRb7aB9feZPjQMS8F3/20fLFqKRLnXR3+XOCCpD0DWjzlkd1erJ0w
	 LxDkYZMWvlADQ==
Date: Tue, 5 Aug 2025 08:55:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: eugen.hristev@linaro.org, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, srini@kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/15] dt-bindings: iio: adc: at91-sama5d2: document
 sama7d65
Message-ID: <20250805-stylish-elegant-raptor-1ac78e@kuoka>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
 <20250804100219.63325-9-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804100219.63325-9-varshini.rajendran@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_235547_567229_61F4DEFB 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

On Mon, Aug 04, 2025 at 03:32:12PM +0530, Varshini Rajendran wrote:
> Add dt-binding documentation for sama7d65 ADC.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


