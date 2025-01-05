Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FBAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 09:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jzz7lFPpFQxEifJS3TyqDuS9PnJxxcceQh7NVqWEcmc=; b=OmqCJ3pTLykllugYB6bR/c8UE1
	rtWyBuFQgIQDNdtevvR7mmlM7juGHU0EoKbgeZPH/SPYF2uRzln4ONStrtfgXLEjVO4u6gFJxPRsm
	OVITOEwJYz0+7yW3Ojcn/f470mP59jd0cr25jgc8KehXTpQp9oFJLqRabRg5XiLWevbuPt91INfxK
	W9yrwsX6Ge6Vee3hx+YYX9HHnSfkKn9nG2uRubWHEjxaaCPbYUJHNlS1hKuT5RmZvUq/hNQoPWSmi
	61LdszWjY3Czhs73IjU8E9az8dLPNiWNJVkfjLTHgWAKCOUAgRma62JTgCBRSB2E6SPlKpY6jSwiL
	icaH44xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNCY-0000000Gcpg-2JhS;
	Sun, 05 Jan 2025 09:45:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUNBM-0000000GcjU-1uqQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 09:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69A92A402DA;
	Sun,  5 Jan 2025 09:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9015C4CED0;
	Sun,  5 Jan 2025 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736070264;
	bh=DDB69pNxioosVWrYNnx6ya2xVnCZs1kpUH60CReFr8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbuHRw+w7Ne49sz17VMnYP8tCmi5gh59npTbUMM1CtuYuaahNLKhfk7VREL1ypeK2
	 igd7krPaOtp5wqQybiN1lX+bv958u4oRRtEY4cn23sIM6SeLhQ4zOktW5lngFj5iO2
	 SuyRG0Oqg9CWG+rZXFQa5yqACLr1NQEaK/o3muUdUcCzQMkxeSQKqV7H+YN3jqFCQ7
	 ChLuIj24Tn9GlF3yJtpL3Ork+DNxEm3NXE2WTVQk0ckN64aN9FPEggXPEKXFBJCi78
	 1ciKcmHxTXNwZTQiKWJrziVd9+0vJlHBZyH/M2AqVSSXLWlU7blNVtEMk1VdF3H8Xf
	 3WxbYcDlYkmfQ==
Date: Sun, 5 Jan 2025 10:44:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: timer: exynos4210-mct: Add
 samsung,exynos990-mct compatible
Message-ID: <exropoh336r5mox5liuepj6wo7meog2ct4bk3wxgsrl5femt3r@flxiqxtn7bqd>
References: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
 <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250104-cmu-nodes-v1-1-ae8af253bc25@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_014428_753849_7EEFA7D5 
X-CRM114-Status: GOOD (  10.13  )
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

On Sat, Jan 04, 2025 at 09:54:16PM +0100, Igor Belwon wrote:
> Add a dedicated compatible for the MCT of the Exynos 990 SoC.
> The design for the timer is reused from previous SoCs.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


