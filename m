Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C23BC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0E8FGeYyjvlJUb6BQlVYyq0Swb3VCsPDTFfPjL4w8bI=; b=yMgnMWN16td5Uxo2Y/IwH2ht/Q
	fW85KorH93L2HZePwYXLjrN78ft7d7fgj+KpphtkX0mdOcFQDRFE3MSonBAwGrV3S84CzBfCZfiNM
	VCj3F5hwB4BQbZA8z5Bt/LW6Jn9wdP/ATaAEgUEOKM7cIk2zZb8ClEPVHMXBr/ionjJ6O/T92f0I8
	7mC0xUzPj0v1275qrjM9VNSBB4sbUplXdJG2XDE/DCVludu2+xeti9aWdC4bkxXcf55FMxin8w47R
	LFa2FJYHxSBvTR4fpJyuG2cqgqvGxWnz4OeiUPxXNhjb8Az7bx+iQHH3Gh+MyqdgPdUllOBHvEND/
	7xBEwbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmpt-0000000GV1p-3XHw;
	Mon, 03 Aug 2026 07:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmpt-0000000GV1h-1Kn4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:11:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD7EF60A60;
	Mon,  3 Aug 2026 07:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A13D1F00A3E;
	Mon,  3 Aug 2026 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785741104;
	bh=0E8FGeYyjvlJUb6BQlVYyq0Swb3VCsPDTFfPjL4w8bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j+lYewYOZHPhzaR5Yy3GpSJfJ0FML3s9cA8hZ9/IAR9WoPJKSs7E3uexH54PlhYgn
	 lUe4pdDqwAVGDDid+d6AxoyvSdILNpJwW36et4hIdAlLEHZ+1rCLcEj3ygEK8ZboEr
	 js8m7odWK36pttD37X8aPgbK2Kmx3uitXjscsq4ApQxyYeogruJxW6dOyZzmV98XFs
	 Q1LIvt8GLOXhjngXj8dDYC4OxDndfVt8im+8WgOOpuFBOWpnnyhuETrp/EgjNyLVSm
	 /LIQWfsQEV/Iffp0WVQnLEInXKlIdfHHQWav7FcsePSLK0sFFq7hORM3TX2jb41oZs
	 Frl+RZLeLPPYg==
Date: Mon, 3 Aug 2026 09:11:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: iio: proximity: add Sharp GP2AP070S
 proximity sensor
Message-ID: <20260803-unstoppable-capybara-of-respect-1bdd4d@quoll>
References: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
 <20260731-gp2ap070s-v3-1-d1f5cecf9fe7@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-gp2ap070s-v3-1-d1f5cecf9fe7@disroot.org>
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

On Fri, Jul 31, 2026 at 01:37:00AM +0530, Kaustabh Chakraborty wrote:
> The GP2AP070S is a proximity sensor designed and manufactured by Sharp
> Corporation. Unlike the other GP2AP* schemas, this is strictly a
> proximity sensor and NOT an ambient light sensor.
> 
> For power supplies, it expects two voltage supplies, one for core and
> other for driving the infrared LED which is used to measure proximity
> distance.

Here you briefly mention resolution of previous discussion, because it is
non obvious and without it, you will get the same question - why vled is
not required?

...

 +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Voltage supply for the internal circuitry
> +
> +  vled-supply:
> +    description: Voltage supply for the IR LED
> +
> +  proximity-near-level: true

No constraints for the values?

Best regards,
Krzysztof


