Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D8ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4zHfxABVFo6xnbA6ngAoQPZ2T4lrOz8689P7N8visk=; b=CH0fBIV9Wic/E5rhF+2LR7v+ib
	Hds8mBeSOPU/XHtvUn1CyH7XsmVJxk9tx6RtROKANe+kdSF/qhS3JWuqbNy7qmORPgf+7nKsyEHKf
	ozfpzIVLXoGUhSBPTgqyKinuAwh1/gcnKnT3SpQ+dbZh1Qy98+phOC+csIZZNeof6OafUUFV1dnba
	RHFKAAyyygiHQ+RBy7snoyWjfIL4ezu5qQhsktyHMrpzpjrH4HynprimbMrRpWOsjRBG6QPLKyR5E
	SMoaKIUGCg16++7GQEx7kK8OpPeESQEa/j0eOXWSrSxYt/KPmJjAlyuyBO6+AdxYD5kg4U1yFxfHc
	UYXEVzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9bY-0000000BOLr-0neS;
	Wed, 10 Sep 2025 01:26:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9bW-0000000BOKr-3idJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 01:26:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DDF5601F8;
	Wed, 10 Sep 2025 01:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08B0C4CEF4;
	Wed, 10 Sep 2025 01:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757467594;
	bh=yIRu3Ue/IKYOYSOl6HV7wEi1g8o7rUFyW17908DZ2As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnGlidRujmGdz7aCbupfuOeM1TrmuEG9czEo1ZnMcmdIdumimh8hZstGJwRcpVzBP
	 1W/ccJXF5QBqNGKUNyQ43LOUBVoqkO/ilq7YaitxXMigsRUMZJrVk08oDp2US+PTm4
	 DlOos3K8393/PParXcEndl9u9TZw+myADyCM4IwRgFLVUPGnQhtEdtJYuIoOEta8Hg
	 tXsyMSWB3DnckF0dReJ0jwK7213Zrn5OFD5VMEyqWSuddBq3Vy5HyQLX40hPYsMaTJ
	 dME/nCMFmiGiJ9KeA4K+Cl42gmDigy1nbgCsRZRkGZ1i7AFZ02WLKc6kNSlMePtu2c
	 wOh3YjFhAUqlA==
Date: Tue, 9 Sep 2025 20:26:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: spi: Define sama7d65 QSPI
Message-ID: <175746759249.3565236.61405716277670882.robh@kernel.org>
References: <20250908-microchip-qspi-v2-0-8f3d69fdd5c9@microchip.com>
 <20250908-microchip-qspi-v2-2-8f3d69fdd5c9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908-microchip-qspi-v2-2-8f3d69fdd5c9@microchip.com>
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


On Mon, 08 Sep 2025 09:44:17 +0530, Dharma Balasubiramani wrote:
> sama7d65 has 2 instances of the QSPI controller:
> 
> • One Octal Serial Peripheral Interface (QSPI0) supporting DDR. Octal,
> Twin-Quad, HyperFlashTM and OctaFlashTM protocols supported.
> 
> • One Quad Serial Peripheral Interface (QSPI1) supporting DDR/SDR.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/spi/atmel,quadspi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


