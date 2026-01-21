Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20378C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6+uwvSCSk3PySK6RMZ5dDuZsIOhY4bwz+3mrYjCn4g=; b=eCk4Rmw3/zQIs0/d9KDhJJCyTC
	OeVfCVZPkprCwlPHGdjF8Ah0JwV/oTyWkHjKAfD0cNETIB1SsZfv+IezxXSFxNcv4EUA8pbFcDYgc
	Bs/VTMKo6eQv1P1WmqmJhSxdxZ4tyubqxieU1YUZfty29Cyd9zWQ961amuVo+hGCIDnaMudPneBnx
	zP1HQQwShNBM82wpukZ4vvUKBmABN0MUz/QABL4egDHcXm1LCif74P+AXS08tzmaF+Cf6lvL0SUBI
	OGYgRYdaeYSAcFMw4DitfpsMYcX/O1tW8q9Dcod1CbvSnXudCHOT3qZAR1Y2AWhq7TYjXnFf2ehc5
	fRhN8stg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibNu-00000005p9Y-1brA;
	Wed, 21 Jan 2026 16:48:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibNs-00000005p8t-11L4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29CD1429C1;
	Wed, 21 Jan 2026 16:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB832C4CEF1;
	Wed, 21 Jan 2026 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014121;
	bh=viQ/ZjRt2/nAfrGtn9g7M0a5Fvjd270JBciUGtEbosg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ubIr1egXRauYdq4ec44596HfpRg5ku9y1x9TzbovE2AagaVSENR+ncZr1bA1UhFdC
	 3p7yYIKSC+ad4KTO+u+obOZxKQJ5wNb44iBPwbNCuR0T2WRaSVOzEQHQhKdNe4FsdT
	 skmfH1rZgTgTpuZBgE852h/QsplWhnnBoGHd2AwY7m/JjVhcWtV6FhrIdadtA+oK/s
	 0pBNmdaywpsBdU7IlxX2N9GFEXzsPTKoD40EKD+unUyV2rfJQB1Gk3vp1hh6GtGO9y
	 LFK+mjqKybMyiyGjm8zZWfdVk6Tqp0p0KbeaVIglfRX3VhXRKR51fBA1wK25/tEgK4
	 kBYOCdhYNU5+A==
Date: Wed, 21 Jan 2026 10:48:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: kernel@dh-electronics.com,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: Re: [PATCH 1/3] dt-bindings: eeprom: at25: Document Microchip
 25AA010A
Message-ID: <176901406635.3440858.3601461880570246394.robh@kernel.org>
References: <20260121085347.10368-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121085347.10368-1-marex@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084844_305387_EC5913A5 
X-CRM114-Status: GOOD (  10.79  )
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


On Wed, 21 Jan 2026 09:53:19 +0100, Marek Vasut wrote:
> The Microchip 25AA010A is a 1 Kbit SPI EEPROM with 16 Byte page.
> Product page is at https://www.microchip.com/en-us/product/25AA010A
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
>  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

