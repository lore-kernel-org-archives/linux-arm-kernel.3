Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C383C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQrUAITU93VrAiphJdlsU3OfsTIWVD1xNqBO+RHHd7E=; b=iGVAaIV7k4QqIbQcyuDoY4tYLT
	s7HlXGV/LgxY9DRgt218kW/mXHGR9HqKhl1GuyvvnAv0jkawCFFaRxV2qWRr901QKzQU3j0t/xmOH
	T5uZ7jdnfKwzmRBayS/ou1oL1QuTYqOhcrWZ71KigBP9/37uvZpNZ0Sp6TPALXdNnpFP8yHrbqtZ6
	PlRofKg7jdgxewgeMxQ/hdFIS/vU+7ATZXsMoiCYsoFSrHLgGuS/LO3r0G6hRZY0/dgLZ5bkHyolC
	GPwSeL0NuwAX6Jk/fIGVwi/xmuHwsvEwVb1V3J7KNMfaveDuEIDRnK4u9Vi8htIqSUegHcLQrGyOI
	2ngEy0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcIQ-0000000EdIb-1D6x;
	Mon, 24 Feb 2025 17:31:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcGr-0000000Ed2b-0TcD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 985055C0348;
	Mon, 24 Feb 2025 17:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23093C4CED6;
	Mon, 24 Feb 2025 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740418172;
	bh=ZE/NEtbynjcPPwiQn6F5zBRoR3rxw4L9qULJd2Dyna4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9jOf27sh5BxkMJnzTSGKLkK3hX9UoVHBuhMfVa85W0SbmoxIouYZh/1xTg46QW0t
	 3kQYJhAXzTvFqFUUH/w4Dl/4IcPbiBoZXNPU53neJDI6FDevXvA3TJUPhjd4Lw9mkA
	 ZbdJmESM+8VETxkughSaDzHfMqZurlcKcG+3brIhAwzaTI7Yn1GNEWeOL+mfc7i5hH
	 0qOwgOz4wKxs6xFNSPwb7aghuEaIAOf8hZoWFu+nSvHC3qbZxAv+uh29erCRd6IIjy
	 t+Tyr6EYF2HRENtHVzp3pDlQTiWQkdQSuX1TAFBaAIPBsM17mFHwIK7mg6IiVS2nm/
	 OJD6Idl/Y5lxg==
Date: Mon, 24 Feb 2025 11:29:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 03/10] dt-bindings: arm: Add Morello fvp compatibility
Message-ID: <174041816976.3560154.3926708156600957732.robh@kernel.org>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-4-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221180349.1413089-4-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_092933_192503_55977208 
X-CRM114-Status: UNSURE (   9.02  )
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


On Fri, 21 Feb 2025 18:03:42 +0000, Vincenzo Frascino wrote:
> Add compatibility to Arm Morello Fixed Virtual Platform.
> 
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,morello.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


