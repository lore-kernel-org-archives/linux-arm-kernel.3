Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1001D42BAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ilbiR1LTSr8MaiCS3H5R9F9puN+o2EZNbjzmk++nRo=; b=Cx6IpLch76rpYQ6nL+qTgRRBNI
	oZtj/i2P4JOyBIXHF1GUhryw8KxxgleYAr6iVC7TyElcHASty0CIsSDZdBWtjWzRcfY21xvMIdmLJ
	MKKUsdliMNNjmOEkpTSv9LdMKhztcIY0H6vpsYcG6J5bq3vwDisRURhaTIrdHoSr1dfoffo87bDzt
	w2pE3jK4XBeTcbhB8/z1BwPKJgzczwNyAiq6fq29yVE+uxKcWF3FCMOKh05JGOQkMVBYDE9pd38TK
	a7LizVPObZXjMVptqKd01Sykwdd9uCYngVUVXm3NubSwmXXwEHBH3+cZ12JV/AAkMQ8ZDa/l46aA4
	PQG4rzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu2l-00000004CiA-47I3;
	Tue, 12 Nov 2024 16:47:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtx4-00000004Bkn-0jfy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:41:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD6275C5805;
	Tue, 12 Nov 2024 16:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930D6C4CECD;
	Tue, 12 Nov 2024 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731429672;
	bh=L5ldS4qQz4W5QvNCrfffGW9Naq9k4ElQOSZrO4XMMwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Is/MmXS6AkEPeM1VuJ4CdWet5pUVJmJg/wIcnK1ZJJC6TKrqpbv1ps5xesKx7vmC+
	 OO4F9hY8mM5n9Jy+/DemwoNL4YoSmIOpVEXEF0Eg8SE+zjz+ndV/FAvNBNq00bugwh
	 QuAqsvC1248JLaB2b/RuM1Wri1fkHcW9eYkD/CBdduagI936+3zmP/krklHu0Z/65a
	 JpLdObB59VTLdcNfx+CP8JDeJ1oOKS/m6KZ53ndVBfBHMYzaDLmu2DKSjbrKHJLkEb
	 mMtu+3yqFdTpmvny1nNkMv1pjMTFG+ddqcJ2UY8Qi8s7nYfXYw8D01Ym0YSbqnfDXW
	 0U+SclGKC5cNw==
Date: Tue, 12 Nov 2024 10:41:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, upstream@airoha.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, ansuelsmth@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/7] dt-bindings: clock: airoha: Update reg
 mapping for EN7581 SoC.
Message-ID: <173142967018.1156530.7241636919526215529.robh@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
 <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_084114_334468_52686D70 
X-CRM114-Status: GOOD (  11.11  )
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


On Tue, 12 Nov 2024 01:08:48 +0100, Lorenzo Bianconi wrote:
> clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
> while it is configuring the chip-scu one via a syscon. Update the reg
> mapping definition for this device. This patch does not introduce any
> backward incompatibility since the dts for EN7581 SoC is not upstream
> yet.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../bindings/clock/airoha,en7523-scu.yaml          | 23 ++++++++--------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


