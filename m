Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DB81062868
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njkHqGx9S4YhUB47dy2QLnBnURzMQi8ylZsgVChRvDM=; b=Y+tmfxV4zl3nvIuEHWWFx4IdM1
	lalpB/qRUQdIlVeKGnMkGEhswvyxHd0RTSVzyQ0p7YJWBUkAIfaPsZD6MDb58Tx5hnhINLBDxhruF
	vVuKGQOBmC8FSuuywoMDH6G4tX8UB2hL9uXq5GiUqntw2YnexO5U6dbEFNrDOuNPlsthVcCFvl/WG
	/YdbNwOhwaAN+8HoEmAn9kQgON3WkLgiExdDx8GkIqIN4J7dI5In5VqLMAOoySrf8PEjZreaw7Nfz
	A0AofIy4Wdn56rtN19ZIFvvbsqiD2lKoEm/M4lJxZV7uUVq6bwFUi6qBaDcCwHP5m5DedNC5Km05Y
	qngYMOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hok-0000000BUx7-3aMb;
	Wed, 11 Mar 2026 11:33:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Hoj-0000000BUx1-0Jc8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 265E06111A;
	Wed, 11 Mar 2026 11:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B8EC116C6;
	Wed, 11 Mar 2026 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773228811;
	bh=7ax8f8Z2suiY/ClnmYcNqzxiW1dr6PEtqi/ot5nvoOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GPXgoORFGrta/iwANuGICTrla35yAQ1ga0gDJllpRjNU4SsJDhgj0ZQUlJKdaFKSG
	 sxZsIg7qLtEx6QH/gdVk7mfsIwCSVcY/gmLqkHE1h6c7mdl5WYFOANsx21Nk0K31bY
	 GgdSoV6nl8fgV5pz+1cm4WIiVoeUVoKH9PUNJtrOqCXQwpGR01JIahBAhnrBHZjS6w
	 RIi9ZL6i4b7TJYMjCujXLxjPzoDP8Mh0BfRGpkBtcLRGoQGGv0PN45g9u6oRykW8GE
	 TDoSHY4KQEXPfUI1ZarqtsXY/0u1h9TCSPuFVON6Mee6/N0yrOjMNK+f9pv532od90
	 ESlo6scDTsnCw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Remove the Kontron SMARC-sAM67 board
Message-Id: <177322880885.2191403.16034538452371689446.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 11:33:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Mon, 02 Mar 2026 13:24:45 +0100, Michael Walle wrote:
> I was informed two weeks ago that this product is discontinued
> (without being ever released to the market). Unfortunately, this
> collided with the merge window and I had to wait two more weeks.
> 
> Pull the plug and let's not waste any more maintainers time.
> 
> On the bright side, the board upstreaming brought some driver fixes,
> too. I'm really sorry for any wasted time.
> 
> [...]

Applied, thanks!

[5/7] dt-bindings: nvmem: sl28cpld: Drop sa67mcu compatible
      commit: b7ad72258857a3afa0e116b26d0d3ff6ef42ba94

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


