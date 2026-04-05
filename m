Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690F1E64003
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9zwXgUbE8chWfX56OZRKt6UodJllnGIvZYEcTHHyE4=; b=R4yrReXGfcYhc8iu2jf3u6D820
	t72EP/2jTa4Z1MnEeP4PZTFHV2RXSLCW+IKfB/J748msY8S7xbD26WIUJdNYumrbIfhf5RnLCZaXI
	YR0rsC0IdE9FxwCeJaZi2O4fE9TKjnBEuE3+xp/vvMdVxJwKeqoOquK2kBy3y5Lcd9ufGQmVDt+JM
	eNKhaEVoZUgVecmasi8larOPHBBD+xlqRtDKvhhbmvbLiZhojPSPlcNyZUSWYg+wYMjoUtZo1dbMn
	ewUda752MCEaf/UMxQRJONbJjLYBVvuNRK5X5KAGCJJSKYBysxXCZ7seh8ybTojyStSYJit+iowWG
	slJDJAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9IHH-000000042xk-47xC;
	Sun, 05 Apr 2026 07:52:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9IHG-000000042xa-1hlr;
	Sun, 05 Apr 2026 07:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 651A7600AE;
	Sun,  5 Apr 2026 07:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8874AC116C6;
	Sun,  5 Apr 2026 07:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775375533;
	bh=i5I87xe3rCX6jakt5XfSPaCxSLCt3vmnBkAl2OH+qO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYdvxgMUJ8yNZjPasLh9fx9kB58YSGry8Q2LIW42mRsBu4vcmP/X02G982jWk9TH7
	 WJ3vXB/pYzX5/MoYbSdpDSBeRVqd01JQJK/agrV8J1AFJz7UUxiw6FsVpkGrdd7NHy
	 oCE8VDDwfDhG8MvSYD1niXsklqmiQBCp+5TIJLLy1pV/6f0z9n+38D0NEAfXMygDV2
	 zB1MAlAxhBocqKo34PWuOI2fkSN9geyXhhhHZTGQOVeIn9Ht87Ys9DLFRaWCPn6OzD
	 sgVz44yGwN7bsfkJf4P1bLDfrSVtcbGKoo9/Kh1NvA1CaaEn4OdwDrv/fnnjP7Q5dN
	 SnEGpNKi1l13A==
Date: Sun, 5 Apr 2026 09:52:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 1/3] dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
Message-ID: <20260405-enormous-glittering-avocet-285f82@quoll>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <11b5eee3c22cfd034bb4b425d28a5a3ff2a71828.1775223441.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11b5eee3c22cfd034bb4b425d28a5a3ff2a71828.1775223441.git.andrea.porta@suse.com>
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

On Fri, Apr 03, 2026 at 04:31:54PM +0200, Andrea della Porta wrote:
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +

Missing ref to pwm.yaml.

> +additionalProperties: false

and this should be unevaluatedProperties. See other files.

Best regards,
Krzysztof


