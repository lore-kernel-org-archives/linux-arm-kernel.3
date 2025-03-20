Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D28BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9wjFtN/UiAwYKf7535BXVeEtdcg9gR+wxHgNlX5kO0=; b=aNCYBUryF0ck8j9wCkuBh3T83M
	cbsU9lWXfv+XFClw1D79qAbzMkxB6Ag6ijuurGGz1x5GO7Ax0J3YlS83Lh/CcL27umPetH5ocklYd
	WioV8OFRJYMtGQ3F10EeIALwiUULMVHxJzZPDqQd/1QA8k5DFde83hYXYHiQlCV9Z7luD3fOLpjhE
	C0GQZNfeoBaCb2MDdi4Zak5eC+as+vINAWwGhxRH3cZMCZ2L0n0vL2qI1Jzq7TVOqPm6QbjtLD/JL
	KseilT7pHpsVHGzzB1TDmnRuslAnP4uZlDYww6lqWigapJavNnL5/6xIy8Iiu+6K4gkqV4e8a4L3k
	tEQHkysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOKy-0000000DMQ9-0TP5;
	Thu, 20 Mar 2025 22:26:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvODX-0000000DLY9-1m5M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:18:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C9DBA495BB;
	Thu, 20 Mar 2025 22:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79299C4CEDD;
	Thu, 20 Mar 2025 22:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742509102;
	bh=9O3RydOB0ZVkYcXG0exlOsEH1A3gmr9V7HhCFrKPCOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mn+ulCetMTCG/4qlZQDzsJJ76CiHhF7e65TYAlrI3mDPFud0vAmTpVdCb7ysQT4ty
	 EipVvGI55DH1LqgdhCekIm/e+uose39lI9y7t8pjUjhyKeQtr8+YgYv1JRUas7mbgv
	 MeZb58JTBta1WtCD8N1RO3jxAn4PqepAnXCHvGVFfWGZrSl1so86czajaryIsZaUUc
	 Z4Dm1UPlPQ/+pv7sOy/Rz5yPNERuWeutubxfMq5pOFlKIw9fRutQcIqdzYfBSHfUNY
	 gvtA3qZX9G21P3GfnnrZYDa0Sy+/T21l5wEOZH6b4GVeT7+hypJoIQcJ/bYXjiTRoM
	 bBBuLTYPXhkMw==
Date: Thu, 20 Mar 2025 23:18:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	ludovic.desroches@microchip.com, andrew@sanpeople.com, mhoffman@lightlink.com, khali@linux-fr.org, 
	wsa@kernel.org, peda@axentia.se
Subject: Re: [RESEND 0/3] i2c: at91: Fixes and updates
Message-ID: <odbnk4zvjprs4ipdtxjeurdrubx3eu7zcmxkpwodlz6idnw3t7@6d2a4hl4dpe2>
References: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614101347.16910-1-codrin.ciubotariu@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_151823_522597_DD89EE09 
X-CRM114-Status: UNSURE (   6.67  )
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

Hi Codrin,

> Codrin Ciubotariu (3):
>   i2c: at91: move i2c_recover_bus() outside of at91_do_twi_transfer()
>   i2c: at91: keep the controller disabled when it is not used
>   i2c: at91: add advanced digital filtering support for SAMA5D4

if you still have interest in applying this patch, may I please
ask you to resend it?

Thanks,
Andi

