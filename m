Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA99AF3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFVUc9fVad54yKO/RWogvKbRsBiqevhICFPeY5LMYko=; b=X/j00F7uZx2LeycIh27QzSVbfy
	ykZjCDjko3IEl2k+UMO4g4elb6yfA7sgkWCcvNTpk2cR5BhbJw+bvh7JG889AH/L9FXmGeK5YsbBn
	uZjnGkOu+lGmTc2GaH76cwFdIdeXJOJe4CVKvIDNchxjpvLuhKNbRkOclMFpgh1rc380E2i7aDtdT
	+WKZCBhdQYamOhCl8Zg6zCl4Llg7qyhJzl4Zzq24p04xEVdPN1ULNWoR5R1Ik++JIaZ5etELn15/P
	qht8vM/qBBjPb4auYpGLGX4wcBe5N1blh9TH1+FkxAaMjEW/WXumu1qvZmvOR1JyTGqlp3eW9vPqB
	6cxe031Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PJk-00000005fgY-2eJE;
	Tue, 17 Mar 2026 07:58:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PJi-00000005ffy-1nn1;
	Tue, 17 Mar 2026 07:58:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 439BB43E9A;
	Tue, 17 Mar 2026 07:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF39C4CEF7;
	Tue, 17 Mar 2026 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773734297;
	bh=3sLvtGTLJoxK6OLcS/9XxpE1hjPcHKS+oPikARyO1ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akEovTsSC7Il9hrWdtVCsY6bhZPw4DT1j93GYxId5GIhGR5pjxPyjsAbCIs/4wr8r
	 G0PFfOHW5KbyVXQ4Kjp7GixYvGQ8WTql7qSphH0/mibVqaWRUTV05nq/RO7xk737x3
	 LOh1Zm7pE/QBqTwqro+lcXxDnybOf5KFetPl20N8IEfokwSMFH5sXl3EYsC4Mk/cNy
	 PHqm4ud+HD1SFCCYqirw399iN74vFcH/w6bdoWjUfwtScXU2bsp5iKR7WZnIzj+1Se
	 7PtCIdBURTHAJ2/wtMLQWAsW1Fs8tKsfOrPTs2JHYpYFO/njBs+CYNubJ46BGh57pB
	 0lTFto6vrNJaA==
Date: Tue, 17 Mar 2026 08:58:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gray Huang <gray.huang@wesion.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, naoki@radxa.com, jonas@kwiboo.se, 
	chaoyi.chen@rock-chips.com, i@chainsx.cn, michael.opdenacker@rootcommit.com, 
	inindev@gmail.com, quentin.schulz@cherry.de, andrew@lunn.ch, alchark@gmail.com, 
	pbrobinson@gmail.com, nick@khadas.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Khadas Edge 2L board
Message-ID: <20260317-discreet-swan-of-bloom-cecb3a@quoll>
References: <20260317040248.267154-1-gray.huang@wesion.com>
 <20260317040248.267154-3-gray.huang@wesion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317040248.267154-3-gray.huang@wesion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_005818_490373_BE4A0C15 
X-CRM114-Status: UNSURE (   7.93  )
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

On Tue, Mar 17, 2026 at 12:02:48PM +0800, Gray Huang wrote:
> Edge 2L is an ultraslim, credit-card sized ARM PC designed by Khadas.
> 
> In this patch, we will add basic device tree support for this board,

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> Only eMMC, UART are enabled, so it's capable of booting into
> a basic Linux system from eMMC via serial console.

Best regards,
Krzysztof


