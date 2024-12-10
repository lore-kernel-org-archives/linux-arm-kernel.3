Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE09E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQG1XVlgkndbCHd5Y4LBVUfaI9dprRMxelH1RJz2Px4=; b=p4lU5xB25SKYR19cIzq7sgtPuX
	6HNFuG/4UVoxCKuR2UqFYlhvtCdWJajGl0mLu5zi/6njoJ8vkZ0vp4ntEMMJ5mTUsNKxr54VvnXmp
	7//EC0LphSHB1BjVsnSm6cFY0boaAvvPiuNiH7r+3wNsgEHhgMYJwyNim5CFHtiXS59YVqCBmjSJA
	ZKM9ltI8BrCnn1Dxzjaex1DRDFHyiugEbqpX91m1RkBj4w349rjL+BTpNJkiP0sLhKJhcAUqycieN
	4G7MeiUh3+v2AY7KqyihD9S1WGJv2oqmIgp29gU+7e+R+MzIEA4TZqvHbzg9E2SmSOxO56O+Y4Kb8
	QOrwXNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Ok-0000000C9Q2-3xtX;
	Tue, 10 Dec 2024 16:47:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3Nh-0000000C9DZ-2Qij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ED7CEA40BEF;
	Tue, 10 Dec 2024 16:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED50C4CED6;
	Tue, 10 Dec 2024 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733849200;
	bh=xgERl4/Z/66jiwMWRjWIFEY1SmEy62AiuwqklbX6Mh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jY1bMSAMUj5wxQYYb0Yj0ZX+3F46nKMK2ZGNKWWZVadFmPgEGv44gw0mKheU91h/0
	 RDIJUe2w4VwuV/uAQcleLsaWnIQr0R9CLsX9L2A2T9YD1/YGpHEFxs2drB/oKkTXth
	 DZ2QWNZdhhE/K3aeNbkRVJICsY8UG+j2kc6ZPZCQ15Yku23bAPJTexPwYE/PSpgt1v
	 J2vaQG1wTnUypGJkZjkT4PdETR5g/5mP6nRwXaJxJuQ06vrXvIPvK01A8iPQN0V+7D
	 q/gVdUDjoJIXzQRZ9j90ZNdnkQIyPUvPiXSmO2TuywSd41Cwjh+PSk8sMqk6WH8APT
	 bgRJp5mM8+73A==
Date: Tue, 10 Dec 2024 10:46:38 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
Message-ID: <20241210164638.GA3770349-robh@kernel.org>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_084641_678879_C2FFCDD0 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-spi@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 06, 2024 at 12:59:52PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> since the SAMA7D65 PMC shares the same properties and clock requirements
> as the SAMA7G5.
> 
> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> the clocks property for sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Missing Conor's ack.

