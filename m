Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452B7C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdBRWhexXolLx9DvgVpP9EDlgW3sq+myZ2NLPsbIFQI=; b=VUDnuqncodE7xv/sPE8HToGL1C
	CRpDu9mxsKOOW1BL/U5gWY9gd/y6NCDQv+KgmteQ53OlYUqPTrW86fsWtoRMckV2LD2WVZol6XsYh
	8XjfEoi+UqGztpO/5+6F1QUVz/fs5yuruZCQ8HLvnK6Pe6YU7X8sUBqq+S5rXPZ01z22xMIPGnhbM
	B85FLHOzPSYsXgCK0Trv93HnkBdEgV0KGTvIAWO15GOH4yll2eg22Nhb3i/MXDKQft7t8U3ZQa1OP
	WaTnmURFSVQSwNuuyZpByQATNByvNfqpKxYHJ83dmLveRA/SDQ3k/4vI4O7XIux2nzZ3N6/ToB9bS
	sMKFVzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vkS-0000000G2Am-3JWD;
	Fri, 11 Sep 2026 07:32:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vkR-0000000G2AK-1MU7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:32:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 19AA940848;
	Fri, 11 Sep 2026 07:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2411F000FF;
	Fri, 11 Sep 2026 07:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111955;
	bh=ZdBRWhexXolLx9DvgVpP9EDlgW3sq+myZ2NLPsbIFQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mlKgjykTcQQAdbrc/459mbo2yqVFVB9GmvYVR5eaFYvAcHQItYrTgJWW90JZd8k+T
	 pTbPI2QeZVBaLDaWQmzmiurCITD3bA+2tyYwcrFdKXmQzH80eg4KbaOIZCAsJvSlbr
	 uJniBPHiLBMxP4VXuWANlItaASwDmQaerqXEsSPc2Rb1Xoy7jW/zVjTt/PAfKBCPlO
	 o0+yCBue2lywIoion9lOgdMSHGyWe4Jizr2mDT/7yBWAmVCqmMQVbpU6K1dC855tda
	 LkaXI5Vopf3gD0vqwdgtLeOMJPwIHbaC4yLZSlBPdq7iJDR4WOjWsMY3zODOqscnxB
	 BqYZqFShr73qA==
Date: Fri, 11 Sep 2026 09:32:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
Message-ID: <20260911-weightless-slick-ostrich-cb88ca@quoll>
References: <20260909182641.165383-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909182641.165383-1-marex@nabladev.com>
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

On Wed, Sep 09, 2026 at 08:26:04PM +0200, Marek Vasut wrote:
> Document ifm ZynqMP VHIP6 EvalBoard reference design binding.
> The board is populated with four ethernet ports, QSPI NOR,
> eMMC, UART and USB host interfaces.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


