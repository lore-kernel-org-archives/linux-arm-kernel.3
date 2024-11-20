Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B6CD6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwOfrBoDy3gDK70XWPMNOZai60/KfUqRxwEKrHorOHk=; b=UBKLhanC69ARNh9ps3z7xn9aKb
	GmdJttmnycKUhQpow4ae93Y1Uay6HpkSPYL7LnAON2ez9Ax+kjapuv73M7GOd95qYdhHTWBZ3n/AK
	8BdLLgVWaYCG2A/eXnJ8emOOF11U9gwcCeJA1x3snSbCX8lsexiG1XofzwP4/WlDh4P1Xa6dN7T4B
	+roup8y7s6sUjoJYwoQZnl2fF0IQhvJKOO7aiH82ERcykCYdfnqR4f0Ln9d0Bm5fAamnjUXqK9Mmi
	4gvqM4CxeKKYGqkrhZ3EbsN5RYrMZ7mlCwHoyl33EuLXJOImyMoI+9knFyp4ZKW6WTyevwC0PZw6F
	ucyKCxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgcO-0000000EqQY-49e7;
	Wed, 20 Nov 2024 09:03:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgap-0000000Eq1x-0chv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1E88A42E3C;
	Wed, 20 Nov 2024 08:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2056EC4CECD;
	Wed, 20 Nov 2024 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093306;
	bh=vQmb3ozX2WozvazAM/jZQXfMfq96gf5MaCAgcdpd67I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYmZIND2yOy1iFWp44uBlwJOLVf2cM+qLsT5Knw64J0vnTm1tdn4jUbjLVg5PpuEH
	 Z+xFcQk6f0GW5SkJD8wGG2Bs6wOqKjfmKc1yIe6ksRpt+0k7NGZsTe/1zBDhcw+/G5
	 q4ihjk/S58QajLWEEsCakj+NzPMWMk//UIdmaWAghRS3oqEbIPAxfAWzqW1qjkKcGR
	 pPqou6gVBDdbJ0l5V8r39OY66vzyKVS+Bi/txfDim9GHMllrmc0zN39j/jFDSh8usX
	 WV2uLixBcLVFgrN16s+U/hZnmEHpgjbzYrQCIretzIJTVI7c7renQf2RYltj5K72lZ
	 NeF8f5Z5ohiKw==
Date: Wed, 20 Nov 2024 10:01:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 09/15] dt-bindings: clock: at91: Allow MCKs to be
 exported and referenced in DT
Message-ID: <cxcurxzeiygafcmrieqvsmt6f6svplzya2qxtltgnbj3t7s3av@xdpnuf5eohlu>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <726533dbd5663e95b768bd19d2d544a197e5781d.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <726533dbd5663e95b768bd19d2d544a197e5781d.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_010147_255293_3591B473 
X-CRM114-Status: GOOD (  14.27  )
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

On Tue, Nov 19, 2024 at 09:40:15AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Varshini Rajendran <varshini.rajendran@microchip.com>
> 
> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> the clocks property for sama7d65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  include/dt-bindings/clock/at91.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> index 6ede88c3992d..e37f1b9cdabf 100644
> --- a/include/dt-bindings/clock/at91.h
> +++ b/include/dt-bindings/clock/at91.h
> @@ -42,6 +42,10 @@
>  #define PMC_PLLADIV2		(PMC_MAIN + 11)
>  #define PMC_LVDSPLL		(PMC_MAIN + 12)
>  
> +/* SAMA7D65 */
> +#define PMC_MCK3               (PMC_MAIN + 13)
> +#define PMC_MCK5               (PMC_MAIN + 14)

This goes with the clock binding.

Best regards,
Krzysztof


