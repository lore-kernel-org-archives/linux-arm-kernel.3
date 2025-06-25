Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E58C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv3Jrlba1Q5NJHC7UTCrafnP2OO9Eml6D91DS+adPuo=; b=FSUZcITDqKFnzzQVRs1/S6rlzq
	z2NlV/N5H8T6VN3syOtFStxGIHwCfGAIClbivw8q7I65eaqtifgo3pEJKEtVO2stD895SKFjr8vX0
	OOMlRqJoT0ohiMly+6PffJU6KoKZfzFx3sdYnXg8ieTq30R5nlopawUbZ9VKgkoZLd8U15ixjGLH+
	xHbD4S0lqFW0oHMzjZLjDtE+JobrVbAe4I5MSlSLj9MHhiC/TqyEDdPEtmpTMP+Vicn1AI4wQYMgK
	G3LPQYkcDmHPDuwRjvRNuJmhoN6qgW3rvm2j1eYeMt983Gwr8HXROzn1Hn08RbBbv/AqOSyQZWDoC
	u/G3twug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ04-0000000A7oY-3L0y;
	Wed, 25 Jun 2025 22:53:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVdQ-00000009jSr-2dqj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F3185C5E9F;
	Wed, 25 Jun 2025 19:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E7C4CEEA;
	Wed, 25 Jun 2025 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879095;
	bh=gHCQBjUalx0Y3g9T4zD8PIbtEQMq7KaGuUuK92H4mtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCJ9peai6qZRUopyJ5ElBV4r1lltdc0dVDpADSySrOBflEpNkyeVbM5/KJkQzUNPA
	 GXLF/HQXVepjn7UohLf+lSwlMo8djXj9hKAvJ/BTvCpvcvLnGdiORr/r9+saHV0yxG
	 p5OzrhMfg77kT4tnXYoVhRl2RJcw8b2nohcrBiKZ6dIuM5cPi/jtRixgzPpeA72MFf
	 D2S3ASK/Wx/rjY/E0woF48+/hbXcMhoH0E4Ta5yZWSBVIBj/7UtvH/UkcuAbN5dF7q
	 AQmFYDVt93M08ALe/mSA4LvdRkq42glIC3C4d/xqCUZf/deToaA12xNQqMLZwlkuJN
	 IfjJ2W20UYDnA==
Date: Wed, 25 Jun 2025 14:18:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Meng Li <Meng.Li@windriver.com>
Cc: linux@roeck-us.net, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@nxp.com,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	s.hauer@pengutronix.de, shawnguo@kernel.org, meng.li@windriver.com,
	krzk+dt@kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v4 PATCH 1/2] dt-bindings: watchdog: fsl-imx-wdt: add
 compatible string fsl,ls1046a-wdt
Message-ID: <175087909415.2065485.13242460443229220947.robh@kernel.org>
References: <20250608030616.3874517-1-Meng.Li@windriver.com>
 <20250608030616.3874517-2-Meng.Li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608030616.3874517-2-Meng.Li@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_121816_708995_45DAE602 
X-CRM114-Status: UNSURE (   8.02  )
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


On Sun, 08 Jun 2025 11:06:15 +0800, Meng Li wrote:
> Add compatible string fsl,ls1046a-wdt for ls1046a SoC. fsl,ls1046a-wdt
> allows big-endian property.
> 
> Signed-off-by: Meng Li <Meng.Li@windriver.com>
> ---
>  Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


