Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A893DD6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chy0U98YujTE4skT16FtbSNL6/V2xlciIfzWJXaJeC4=; b=qYX+9bxgpcQN+1PoqakutF34Ec
	bgErXZ052LiWXQ2VK/y0INbVqhcIcnjZa27v2PCb2wf61IIzd2utxnBlJnGKW9GpdDAAUMINQLGnt
	5bGIY5M6rh+U2JbgSEB1Hx/20C8tA2wyh5r7v5nepJDHoOxt6QD0et5pcocGMcydbdP5kv0DHmY68
	FxlHtctfZlgak8toA/Bca2VVwV9//HZNt5Rzxx28IHetdhMfcfS4u3agpRFT3jhrJ+Dsh0R3GlK21
	XnnxjyQKl/qI4wnseF2pyg2hAPUpFdlEYhr37g9Roaq415hYmD6i4DIRy1fy4i9ksI9xcVh5SG/HN
	5+3GTWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgYl-0000000EpbO-1r48;
	Wed, 20 Nov 2024 08:59:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgXo-0000000EpQ3-3ZMC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65F2E5C5490;
	Wed, 20 Nov 2024 08:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17523C4CECD;
	Wed, 20 Nov 2024 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093120;
	bh=LkbTewK9y9FgQpIpn6FxzD8GeeGKuw9teOC1wFZlEIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8G/IvZSeEN6SRunWHKDMW0hs6cXQs1BWbXrI6z3OftWVjB/fmT6KMeQatQrvhR3+
	 5p0VDfymfaotgM+ypHVfHhUKyORadIPW5MES6y4K//6PO87Hep9K5pqWyW7sbX68gU
	 SevZLn1H59aSuRygcWwm2YK8xy553fkK7QsVWUAItHh+ICdx6klIpFUEStqGWofVrl
	 9TGw1BTm8Q3e/VetHaXsdghZ32sLv5J5LkgD5yh+LD7gWyb4mRwyBuENYs95TCsTK1
	 ThbOkJU3EDMJgM+IcEWAAkkfAZZf2cj/G+uVIbnUXLsqbmxbVlrniLpTWx+n8g/m8D
	 AAL2G0GcI8ltA==
Date: Wed, 20 Nov 2024 09:58:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,sama7d65-flexcom
Message-ID: <ce4rq6gefqrsaubpab573qi2r6ozagxvgjcdpslo32gvnxjapa@tbvdzcrsbmme>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <46928aa2d15d05fa3046c270a51a10cd56c2e919.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46928aa2d15d05fa3046c270a51a10cd56c2e919.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_005840_931830_C9AFF256 
X-CRM114-Status: UNSURE (   6.82  )
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

You also consolidate entries into one enum as preferred coding style, so
this should be mentioned here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


