Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9F2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RB5zo1GGCQ36hyCaggmcVYREHv1ZA2y6ofUzfaQj+A0=; b=OZpYZwO4zDaSRUPO5kfFkQ+DFh
	qe0PdXYsAcgm9kvr2VBYIK6PbjLoUGvsCcG57Ww5Jry2URuOjAAyaLoCvxlganpAsoyCP9opaLeGr
	hvTMjYi7EpfxpZFu3UV9MODsSBM89v1LFTtvUDzGNuNPgV2azAf6Z1yE8dwSLl+sg7ubhLPKEiBjK
	L5/Z11Qo0kZi4CzJenJAMbZ2dw5+GGzuxoD8/GLyvo+v/g0MOSDUVW9HlWIIVuBir48fDTGYSbzky
	6i45dBeTBmkdZ8rNcd80TzJFpJUI6/mrrlfPpHCgwsmuvlaGGjFLp4Aia07VsVqsRGiEOn0fpF6Yw
	aP9COVbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf194-0000000GFQM-31dx;
	Mon, 03 Feb 2025 18:26:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf17j-0000000GF2z-3O8x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 689F05C4D25;
	Mon,  3 Feb 2025 18:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34AEC4CED2;
	Mon,  3 Feb 2025 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738607083;
	bh=kS52tnDcHZpqiP8fWjUc+LfmksWcnjQyHD//S3efKYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ch5W8Dy+SLF9ojLRe9+SL81IEAdmVnDaBKiTKqGuHzdnTMptbW9i2Ac12YbILGmnl
	 BwPBdidWBGhx3jsx1Kk99OBDtbQItBZKGEOn+HngTSGzc5RMD5VQ76rEhub6HtXLsP
	 ygMLY24pZHnGPEWs989pXGDqny8th52xbxTBtCjdyoHCCOhLcRhsGa9kMzNL47IX2n
	 34uHR/JekrS5Ev7xwyfm0VJDQgH8g9BxQeHICKBwbVBI6Mx/SsGSevfvWEcvt67LZZ
	 U65p9ndoLXf/+sIIjA8BjRvoeihJrTjFFVNhEz/ELsvysh3locl7M756BBnaWwMJgw
	 lC6oQJ+gHUnhQ==
Date: Mon, 3 Feb 2025 12:24:41 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v4] dt-bindings: dma: convert atmel-dma.txt to YAML
Message-ID: <173860707629.3348340.8749249185300226333.robh@kernel.org>
References: <20250203-test-v4-1-a9ec3eded1c7@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-test-v4-1-a9ec3eded1c7@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102443_890511_16470E89 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, Vinod Koul <vkoul@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Durai Manickam KR <durai.manickamkr@microchip.com>, dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Mon, 03 Feb 2025 11:48:09 +0530, Charan Pedumuru wrote:
> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> Add a description, required properties, appropriate compatibles and
> missing properties like clocks and clock-names which are not defined in
> the text binding for all the SoCs that are supported by microchip.
> Update the text binding name `atmel-dma.txt` to
> `atmel,at91sam9g45-dma.yaml` for the files which reference to
> `atmel-dma.txt`. Drop Tudor name from maintainers.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> ---
> Changes in v4:
> - Modified the description for #dma-cells property.
> - Link to v3: https://lore.kernel.org/r/20250127-test-v3-1-1b5f5b3f64fc@microchip.com
> 
> Changes in v3:
> - Renamed the text binding name `atmel-dma.txt` to
>   `atmel,at91sam9g45-dma.yaml` for the files which reference to
>   `atmel-dma.txt`.
> - Removed `oneOf` and add a blank line in properties.
> - Dropped Tudor name from maintainers.
> - Link to v2: https://lore.kernel.org/r/20250123-dma-v1-1-054f1a77e733@microchip.com
> 
> Changes in v2:
> - Renamed the yaml file to a compatible.
> - Removed `|` and description for common properties.
> - Modified the commit message.
> - Dropped the label for the node in examples.
> - Link to v1: https://lore.kernel.org/all/20240215-dmac-v1-1-8f1c6f031c98@microchip.com
> ---
>  .../bindings/dma/atmel,at91sam9g45-dma.yaml        | 68 ++++++++++++++++++++++
>  .../devicetree/bindings/dma/atmel-dma.txt          | 42 -------------
>  .../devicetree/bindings/misc/atmel-ssc.txt         |  2 +-
>  MAINTAINERS                                        |  2 +-
>  4 files changed, 70 insertions(+), 44 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


