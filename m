Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83CBCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP8XnB6qkssZJt+D4zB5DGUt2mX+eiPxGGvhHeEZZ6k=; b=sKi9RUCOzn6Gn6SOpN32wA92Ue
	iQ3Gb7k0edHVtDcDK/QTMNC45laXJjWhicgIA2jstGnlGggxCPyac64eM7zPP9JApfif1BjBnD62A
	8shJnTISSPq1ieAUigbz8v87JyDpoJy0fCTMOOPCvCBEXjceJ0ximlmyZiAQdmBVpBor/vJEr5sp7
	6upIEil4OJC4itjnkOkXuo7wThZmr79qWudl+Bq+OHosToQEqKvzggdarDuHUkcrSXRP0pItBZVJe
	LAL2d3AalRwj37nQE9hkFlqf9lWnbQcRzx5rlThINLIn3SQ6xDKO+2/4kKc2iAfs+2yQR2mJsgS+6
	z5rGAHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRuq-0000000BOOa-28PN;
	Tue, 19 Aug 2025 19:22:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNSK-0000000Alt6-1vPb;
	Tue, 19 Aug 2025 14:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DFCA860209;
	Tue, 19 Aug 2025 14:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4177AC4CEF1;
	Tue, 19 Aug 2025 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755614215;
	bh=SXLS7/VM3g85Cc5fAbqS3ubAzBGw+wA8lmhQV7doCHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okteRz2zcdDimeS21ApNqq6v+CS/6RMwuhZXKKWR1yuTYcIWMj+qA+H6AwkhhlgqT
	 9kYUVSg+NVWsVfyKKdnQL59/ROppZkfDljgWRv/W2CEePS4A8vAnoqayNz7NdHtDVo
	 D+FQQt0zigCRATb+yXcBKnurX6uJhLUZANrEqP12q6kaluBaylRKGvJFm88p59jd86
	 V8HdL0G69vl+/iyp5TDuDV90jND0y4GyudFOV3hcGuzSgn/HmWGu2Oh6UMNRsThdTo
	 zQbX0fHErNuLswwR/yD+wMiyY1Y6LJQubS1/mD5nKUAr9Sz/nqaexQOOipk3rU70HI
	 +tI2LzmtW9fUw==
Date: Tue, 19 Aug 2025 20:06:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	jianjun.wang@mediatek.com, ryder.lee@mediatek.com, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, manivannan.sadhasivam@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] dt-bindings: PCI: mediatek-gen3: Add support for
 MT6991/MT8196
Message-ID: <6q3gp2hyg3bzogpg3igjkqzkcnfxvzf5zpid2sssi2nu6mc5er@yi7ewqi2h33i>
References: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
 <20250703120847.121826-3-angelogioacchino.delregno@collabora.com>
 <20250707-large-nocturnal-dormouse-c93deb@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707-large-nocturnal-dormouse-c93deb@krzk-bin>
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

On Mon, Jul 07, 2025 at 08:46:16AM GMT, Krzysztof Kozlowski wrote:
> On Thu, Jul 03, 2025 at 02:08:46PM +0200, AngeloGioacchino Del Regno wrote:
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +
> > +        clock-names:
> > +          items:
> > +            - const: pl_250m
> > +            - const: tl_26m
> > +            - const: bus
> > +            - const: low_power
> > +            - const: peri_26m
> > +            - const: peri_mem
> > +
> > +        resets:
> 
> minItems: 2 is needed (that's a change since some time, comparing to
> what was year or earlier)
> 

Will do 's/maxItems/minItems' while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

