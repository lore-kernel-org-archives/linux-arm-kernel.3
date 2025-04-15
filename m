Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4BFC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pz07/EufaHtw7Y9w3Q7VjGlp62+uDZLE2jtAqUUE6v4=; b=SAPvr/1V6uvuMV3ujO6n+NaZ8U
	ZQOZINM/nAZpcqDOKa1lDVIC4e3sZT092FymPqoek6ATHW7XUv3oMi9vcjLiF9si+4HlARIv3sX9T
	uX4hUtIEL9G+Iu0r0cquntPiI2EbTTgKd+lOOnk2GqUU5KfYrzyTLNOsPV1/Vgbbrl99jXH4y2cRM
	TjhplEpYNzxlni77GOnH9wHcbcJfhkXs/13OgvgnhLCjmATNTKdRZ4StDCqwZuLgvNl4+fXGm4D1t
	0Lt6iCNb70/WhlxDOARMvBq9VgnD8R/wWSDesLIJwNmQlw6GIyeyM+y0GkYKBz9GR3TZ85KDbwUTz
	ugK8Ad1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oMX-00000007H01-0nrJ;
	Tue, 15 Apr 2025 22:02:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oGZ-00000007G2X-16MK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 21:56:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36A79A4A0F5;
	Tue, 15 Apr 2025 21:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEFFC4CEE7;
	Tue, 15 Apr 2025 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744754186;
	bh=Vo/YKkJ/8t7MWgy4qvcqRwSc3jZbe8FFEUN84uQGTQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2IDSzD6Kl5nwaZoIdLcD6+WF8g5Tmol0Ffd8tTdPEvmDuYHUNBw1OpU5UFDwATzk
	 Zjx4aAYSKftDnaFVDbDnTRyCuBDgZkqDyPWyFXbYLlZ2Uk+NL4NheyqZ1fnMWs3Fwm
	 xV2gmbhNDCKmID211P2qWYsl0MtDHx7ad3WFGp7nHhi+UGv+iK3FdrCr/zxWW27gF+
	 pHWq+2EmLIg42/vj0cTNWCfR4FBqAU/Wwkfec9nhJCXdzmqWgsmMdOTB6q+xqz9QpU
	 SCoLm0bHvqWPtQ0eTzp/xV2zQHyaL5kt1SY9kIvQ3is+C7Ld9dHGoD0kDUlyDv/1MA
	 FLADkDwxK1Afw==
Date: Tue, 15 Apr 2025 16:56:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, wens@csie.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
Message-ID: <174475418391.894498.2952286031502803448.robh@kernel.org>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250413134318.66681-2-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413134318.66681-2-jernej.skrabec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_145627_362531_8DC05442 
X-CRM114-Status: UNSURE (   9.65  )
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


On Sun, 13 Apr 2025 15:42:56 +0200, Jernej Skrabec wrote:
> Orange Pi 3 LTS board is similar to Orange Pi 3, with slightly different
> hardware but mostly same functionality. It has less options than
> original variant. eMMC was optional before, now it's always included.
> 2 GB RAM is now standard, previous variant also has 1 GB RAM version.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


