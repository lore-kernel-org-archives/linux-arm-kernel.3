Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5BAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ch8j7lconE7Q+17xeJwcn9PR4XpssZ/Vb4GmgUL3Ds=; b=Cc7utLq8foRS42y++MGMRkNRj2
	nX7AB1LXXsceAmYTwIIeseVVv2RyGbFBQlWvKe3dJFyoR2oFhKpYEOx6N0P6ZM3fXERYZ5gq/MzzW
	4ILcT61r0n3wgo/ZLjzeFtZnAJfeqmOtAn5LkpKZVbWhc38LB899E83aaONNzKzremhi2bzyylQzH
	K4+5jWK809//Rs/z7JpIRa3mkw2NCMEEvAMHEzSv0d0jLkqPrEzowxyWnMYgMFjmJmhwbq2f5PxEa
	NrUGXRkCFDGi4sJ26bhV04Kg7jkV0GXrdCG+FmJ6DuTf3PCerHobRN3x/hBI3qR2nnLJsxb6rhXaq
	W9aA0Dpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiOY-0000000AQPI-3jMg;
	Thu, 27 Mar 2025 08:15:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiKG-0000000APph-2rAq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 08:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 026ABA41D83;
	Thu, 27 Mar 2025 08:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0274DC4CEDD;
	Thu, 27 Mar 2025 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743063055;
	bh=Baey/hKY5HeNZzCvhgM16Y64uCaysLM93MUTBAsSK/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2BXzZvCAjK77VxMI8ldwW7U8QzkapYQy+l+RKYxMuIQVQqhs442AMGE/sADpcZHg
	 8F4D/VGF1S7By4eTe7SE+tep1iG3EAX80qTm4uyZFNMNYEHmz8l5HTMO3TLmztP3H1
	 EOCl9y9bK8U4CUmKWc3JmUbYyG5zZIEBQ5Io07GUK6Lwzl7pGZSHxA6l1Nwxv1bDJg
	 Slr6jkQI0h5uMOOb0k7uX5G32VHj8EKF9uysbmhH/1po0KnePVjD5ZgJJWqpUGwUSL
	 QGuNF1WXIY6z70rQUuuX6WGNULZ1M7woMG+mA+SWxL6plj4gAC5PklwJ01MaL3BbuS
	 g4/NbmDN0LkNA==
Date: Thu, 27 Mar 2025 09:10:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 07/11] dt-bindings: mfd: syscon:
 atmel,sama5d2-secumod: convert to yaml
Message-ID: <20250327-skilled-beluga-from-mars-b7fda7@krzk-bin>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
 <271b23440f79bfad3e902689a9f4b240ab43eb28.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <271b23440f79bfad3e902689a9f4b240ab43eb28.1742936082.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_011056_780421_03DE814C 
X-CRM114-Status: UNSURE (   6.85  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 26, 2025 at 08:35:40AM -0700, Ryan.Wanner@microchip.com wrote:
> +
> +examples:
> +  - |
> +    secumod@fc040000 {

Use generic names, probably tamper-protection@ or security-module@

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


