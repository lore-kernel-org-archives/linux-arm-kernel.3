Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E80BD6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83O6MjNig1s33tu2L1VAV6E/5TECXqEjNiRhyHSB6cs=; b=gZQK+LUP+NJvodaSlwaHYLPb59
	rthdBm6QM8zWl6bdoTAOzY3ldslGjO/c39QZBb2WjwDvny9vGEu4rlAm8ssHRWuqYMxvslCaz9C7f
	wXD90QMP64yOUjETRJ/Fp15zPWLNz4NacKBlle5QiyxCJ4oBY77CLqvjK9OjeyF4/TEKpj6UGyjnM
	gAvIzGKIv0WB5732d1DDmA9zpw2G7ThviET8zPnAgmdSB0hiXIoMLxaPxTl02pHReUTXDos44bhnE
	8GmjTCc6nctX/fVUMoDP8PtV/tm0OmT2dNBT2GTFgjVKd83vI7LlQr7hfshxCY4+8oZcqmqg11R4j
	gItyIvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgZg-0000000EpoG-0D6k;
	Wed, 20 Nov 2024 09:00:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgYB-0000000EpUt-2Xhr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:59:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D9CDA42E27;
	Wed, 20 Nov 2024 08:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B7FC4CECD;
	Wed, 20 Nov 2024 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093142;
	bh=FSqB6Ma9NEk5mchTyPwpPByw+/YUgMeVPc7CFRfOzu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyXlp+xbycTok0UduEZaqH5btL55Hkbe5ORaILAS+UywoVb1ocVl70OTaqUBM4ApG
	 vrmHHJgI4hOHLrjicoS2ZazPLPGde2mkKPvV8RixZUfAsraYOHbWx6vxkUPDLYWpSi
	 GwQKHRUgiRM3R9cee1/LKjLtHRDCtA5zpx9A//JP4A4kCP4FQmJFxKYcNemWf8fSCR
	 I+7PRm1Yj8l8fhO4diJcD+onrRnn4qa66SBqYBPTHqnUv4s+o5vOaLNzlAzSWD5Nx0
	 EW1nc0yHDGNZg3Qdebd/ZCLgtrEM7YmYQuOt4S4k2krH1FRl26Ra8XqNNfJRd7uZD/
	 HLB4hvw0XMzGA==
Date: Wed, 20 Nov 2024 09:58:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,sama7d65-flexcom
Message-ID: <3ftlfgfumjcpkkowg4cj3ehyo4oonpingpdpz5usg37wevg7xb@n4ytc3vuvr3n>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <46928aa2d15d05fa3046c270a51a10cd56c2e919.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46928aa2d15d05fa3046c270a51a10cd56c2e919.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_005903_702176_30921637 
X-CRM114-Status: UNSURE (   7.15  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 09:40:08AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add flexcom binding documentation for sama7d65.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

I retract my Reviewed-by. Missing SoB.

Best regards,
Krzysztof


