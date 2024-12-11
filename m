Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B945E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n65L3FVkXtAMVJmW6RpKHYZNhtACxY/ZURZZaoDAwOs=; b=mt/JKLEmBVX1rrw+W/cmoGo9K3
	DWOgZgZQKePXjKtLBRCjMxNHTi8MzVIZhzHlmYiYwejZ7ZzBrKDDj+9330P84cEc4w+wFYDbOh5Rv
	TI0yA0EkvWPKs5NpUoaJW62nven8OJmXEclGWzbP8F178Ykjob0sbre9WfIXGqtm2KC/y6HHXQFe2
	+m2/zgK2Fidu9xb9FNFtYQfcpLX4fhc6DOfTsMmqyjWNtwl53sIteQFKpNcYMT+a2QfFxwOOJqHx+
	WBCCaJlrRpmd65gk0oS5sL5fZWo3d9IT36097vF3iY5aAqAr+Q3/EwFe92hYQljfD1LOdxd3Xde9Y
	BvxYRCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPQn-0000000FQF5-1dkt;
	Wed, 11 Dec 2024 16:19:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPOL-0000000FPw4-2NYi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85500A40C92;
	Wed, 11 Dec 2024 16:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E77C4CED2;
	Wed, 11 Dec 2024 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733933808;
	bh=Fmred6fUcb7TjJVoN8NQW5ty6Zr9ba4jWUa9fBGMiL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GbLOeWpsMoHd2n5mf6AXEQnTPJqARwZoXiZ+itBu93QX6acM6YS8Z13p4EOCUUGua
	 C9Wz9s2hD6habHNUzA7S5zfQHx4HSp1KzRVHa59O5UNC2NxOW9N10jA6epPY0v9+bE
	 tUvrREm9OAZ51OsfKiB1798C+AWQlC9Fff8juSJgwLeE8upMEpVGJDV1i0ih8jt4Kj
	 rm9jO+KyvjQvocbjw0/+Cdgr37RWSHCmCo2oZpF9aZ+1brOUT6c2QIBVNIrvrsN1iW
	 DFmoowtrd0Hs40SO0ZN5yCtUCgKtOb+oxcAZetWskreuvViEN5UY/sfrO/MWd0/5yd
	 QhjiungYNnMYQ==
Date: Wed, 11 Dec 2024 10:16:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 05/13] dt-bindings: pinctrl: at91-pio4: add
 microchip,sama7d65-pinctrl
Message-ID: <173393380185.3240760.14016997587827186442.robh@kernel.org>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <b41307089b72fd92f8e2d314e4750194df9c888a.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b41307089b72fd92f8e2d314e4750194df9c888a.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_081649_667710_D29F3FF4 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, arnd@arndb.de, sboyd@kernel.org, mturquette@baylibre.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 06 Dec 2024 12:59:50 -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add pinctrl bindings for microchip sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pio4-pinctrl.txt      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


