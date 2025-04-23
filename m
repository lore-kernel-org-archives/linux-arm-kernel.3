Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18982C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocwMdjEFp5wFZOdNnywb64kzd7AeTemeukF1Df9VU14=; b=iJfBL/ibkD8VEEOtGFDUxRiwKw
	XLMbgjOrPiQCMnp3t0MqNc2yLsYaRlsoOdppoMHFexuLtJ+6uVALQ1B70fNQmpAa0emkfSUoJihle
	XYe+cmmZO5oTRybwiV+tEzT4thNFy7BFqzFT6XadgWurvPRqHgKc09g8vUsiNvbk96m5xtemeWUDr
	rXQMp2Meq6NxQGuTO4Lvc0gKP+u2nATa2Nz1fbpDd0J9/zNu216/HjBkXu1gorZuNtkrW9gHvuehx
	O+YBy8hiYZGvLeWAmoQpAD35ruTmH2m43+iJB4rYjFacbTo+UiAER1SCHKTejgfY52p0RRBHLYkaD
	UGqT4Vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7y-0000000BMVy-2ee3;
	Wed, 23 Apr 2025 17:43:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7byj-0000000AxbN-1P1d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACCFA44F24;
	Wed, 23 Apr 2025 15:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAE8C4CEE2;
	Wed, 23 Apr 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421936;
	bh=G9/2avOv+6YP3rqQlxPZIf0rfrgI6wXZ+XhqCkNxxp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAsUjbv45Iu2JeeGdv5hD72TtTwW42t4fM296dyG+CtPvoZVAnTaYED0b8goY32lj
	 aWZiNqXe9iVgGTEOL9KN3xWV33GBVsaVUFZMKppxcX40AnZkMDv22l3SqkpWLhv2tr
	 Qv+MpHyCsz8FDxp6khYR2+Hy7FsCDIhrUmK0rsaKih6+tWoxcd8dqq8M6JlJjiN+HR
	 wheTAHqMYsswXimW6HSTYtwvtqZ+ut+aqZ0xpoEPhvE39JKABTEcbWnUVZmR6Wc8wb
	 fQATDyCq69GiDnGF/+ObuJbWZCgPyo9mPQjdwXTV4zi1KDFXWblVQl8J6PkVYx2BKQ
	 hnNhvrQ9WIAjg==
Date: Wed, 23 Apr 2025 10:25:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Scott Branden <sbranden@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: bcm2835: Add Raspberry Pi 2 (2nd
 rev)
Message-ID: <174542193386.552497.9194165667630567957.robh@kernel.org>
References: <20250418143307.59235-1-wahrenst@gmx.net>
 <20250418143307.59235-2-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418143307.59235-2-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082537_391213_2BF2C87A 
X-CRM114-Status: UNSURE (   8.24  )
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


On Fri, 18 Apr 2025 16:33:05 +0200, Stefan Wahren wrote:
> Add the Raspberry Pi 2 (2nd rev) based on BCM2837 to DT schema.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


