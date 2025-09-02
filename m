Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7485CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dZBmnZLlRmk5OvM03gX8pPWE48sZfMKFsj6rryLjOM=; b=SZOJFznXTowgjtFGesJNwqAa7K
	BOMm5JThBgqoxGfM6MFnEtfmZt5Fj5TRcYnX8bd7QmAoafhni7hTK8hokgPsPjln8z8rkaW7d37Wn
	JC05hAAzjtoHHjJzqyjcs4uGI7CjuyaF2t0WoOELE4/EXMmAghQaaSwVizfB1Jo5YJDT1BvXALXSr
	1p7nwPJENrwMUPF0YrzJoSp3W7Lfoi8mAYAB92W+XmV2TYx8toGfC0FlREmSmBIhdPJLNHJx12vbS
	iqOksKupp/xItKCcAbNJPREhw5D+bCkqaJ6ulGRi6pSXd7ZsOYAOG0U0xknrVWACd/+yjt13qIfO1
	4vPQXw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ73-0000000HESo-1B87;
	Tue, 02 Sep 2025 12:27:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utND1-0000000GKWe-3cfM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1234D601FE;
	Tue,  2 Sep 2025 09:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2624DC4CEF7;
	Tue,  2 Sep 2025 09:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756804906;
	bh=HUiiWQDITg8+MQmQcEFhCfgm6csIP75981a83wPC3pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eod2bVdZA1JoFnBpSlGb1uMtFbmpo/S/3ll6IHa3mIRnUT710Ldv3oYumW7C7bXp0
	 X7ZQ7eeLbYKbuhvYxs0Tm5/o3C2Hc2NgdU6aFyIpgqXmxTA2Hstdwgx0Sd6JeY07pb
	 QE97kDpMCLIWNZqiHPDHa1D6nvT8EJWhMdhKaYWMfy8e3xdi0LncKk83CrT1WGWYAB
	 ZMW9eYATgQMhKpsi0Fow5oX+NDHBNSd1LMYZ4pJ5V96ii1Ov9wzeGTK9ndR3W3T8ia
	 ExRT+VZC4Ed55yDJIVTF6IeSOok7n0XCfbClwBF0VtBM7NcGgJR2aAgLScmQ3hdC86
	 kI9EhS6ixVPqg==
Date: Tue, 2 Sep 2025 11:21:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] spi: atmel,quadspi: Document sam9x7 QSPI
Message-ID: <20250902-macho-violet-orangutan-faac78@kuoka>
References: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
 <20250902-microchip-qspi-v1-1-37af59a0406a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-microchip-qspi-v1-1-37af59a0406a@microchip.com>
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

On Tue, Sep 02, 2025 at 11:22:18AM +0530, Dharma Balasubiramani wrote:
> Document the sam9x75 quad spi that supports interface to serial memories

9x75 here...

> operating in
> 
> - Single-bit SPI, Dual SPI, Quad SPI and Octal SPI
> - Single Data Rate or Double Data Rate modes
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
> index b0d99bc10535..c17114123034 100644
> --- a/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/atmel,quadspi.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - atmel,sama5d2-qspi
>        - microchip,sam9x60-qspi
> +      - microchip,sam9x7-ospi

... but 9x7 here. Confusing.

Best regards,
Krzysztof


