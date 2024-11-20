Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE06D6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87A6jKjdMykUuhoirE5rfPzwyr1ZepiBZiSgzp+TUbw=; b=TLAN3I4hF0WCaPltLYpo6zbDNR
	TTc2ZWd/P3YfWUFMV7ZUP1NhAQ6NGyDhsZOTSUoPJM6dmxHPR0fYY8Sk1U5PEdbi7IM5QIiyFCxCi
	kkeXz8z2k9mVdPikdlFUKbLSA91qclOqkZRxi+QHOc8p4bVqEM1g0YapmT6kukNN1FPHao/AeB2UG
	JtfVMOheBcqTuxaf8ymI7OujQnsez3AlJf8ZNbvfMHO3AuGGIwI8XW3FuPPOqkwA/Ayeywbafii8c
	K2EXWpyRmoLo3Yr3FN9sw1W0ua4vNZIMaJ+0Yq0/Djk57J1VoBgjaLzKfUSSmoLm1kUc2YMz6JdSx
	S5SFw4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgbU-0000000EqC1-1W0o;
	Wed, 20 Nov 2024 09:02:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgaH-0000000Epva-1Muw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2153EA42E3F;
	Wed, 20 Nov 2024 08:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409A0C4CECD;
	Wed, 20 Nov 2024 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093272;
	bh=cXF+85jJaXoTpaetQcfN+ouYOFAfHJvV0CrdvqEAJWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7Q7gOiFKqHq29LdQjzhkBkVjanwxYRRhyiY1zRfG4Ap4lhzKiuuoGvs2nhiWWuuC
	 F+U9PPetCiJdR/CtyG2H3T6VuAz2mZNzmZB2LW630ugkQOTzcVwUWZkr4txVej/kLQ
	 oaCOzBB4K6hP6CDmw5o0NND4yOHaFZArpTXhJHrR6hRdmdDkYR7oFGX2LduZFFfge5
	 ilEeYps1apekLptPxR7pr4Z2whma4cLEyaS8T6iCYknohmyOL7lfKrgmVvkoCfJoZ8
	 eRLL824FKNGCeYKpYWvvh5u67mdjLaU1EHSbV79VzGqZm8eJv3LoeTpcW0ecyO/eNu
	 FTg3Su8R/hsbw==
Date: Wed, 20 Nov 2024 10:01:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 00/15] Add support for SAMA7D65
Message-ID: <uskwi3uzowtbm6o4y2blcnktacvymasf53ppzxg5su4shvt6e6@bpuejjtwuczw>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_010113_428211_450962BF 
X-CRM114-Status: GOOD (  10.46  )
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

On Tue, Nov 19, 2024 at 09:40:06AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This series adds support for the SAMA7D65 SoC.
> 
> There have been patches in this series that have been tagged as
> Reviewed-by or Acked-by, I will link these threads below.
> 
> 1) https://lore.kernel.org/lkml/20240829-sama7d65-core-dt-v1-1-e5d882886f59@microchip.com/
> 2) https://lore.kernel.org/lkml/20240829-sama7d65-sck-v1-1-3e7b19e3cbf9@microchip.com/
> 3) https://lore.kernel.org/lkml/20240829-sama7d65-next-v1-1-53d4e50b550d@microchip.com/
> 4) https://lore.kernel.org/lkml/1da0abbb-94e5-42fd-a2d2-71d5d7d253fb@microchip.com/

Merging everything into one thread makes it more difficult for
maintainers to apply patches. Some maintainers don't like cherry
picking.

In any case, this is at least v2.

Best regards,
Krzysztof


