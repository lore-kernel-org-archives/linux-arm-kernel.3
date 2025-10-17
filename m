Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125DCCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5qHtLKm+E7guI5n5NVDVtRW6KgSdTcAiZfNx9EuPPc=; b=Vc1xyY/FppSsTOTBC8paXlxlAT
	ACDAIKR1Xbz5K4/KIhmlOJzTAzPJF0SIsNZnYi+zzxyLX41ZRhqLGibgA/6goDE0hI+ymqbtpmTjd
	HlVTGvGcTf3EBUbFdVEwIUo5QyUNKD4/Hemg0S8+hXRhyRhSyU0omnaJ9RZ+Znfh95MoHqCkNgl2a
	tKbVqTSA77BQIl0D8bDcCFsqHxyNy/o9FnJNKryC1Dqiaj+aDcBNjLhwHfa7YPSzacKoNeQ+nUlBy
	QNy1WkgIv4F573MGdF8HVGEnyKnfPChMwQdJpbTQjgFgTyRrpU76RkSlkqi+R52UkJE5U3KfwNfnJ
	BAWPi4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ofP-00000008dJ5-2Mhv;
	Fri, 17 Oct 2025 17:55:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ofN-00000008dIK-3QmD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:55:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0BF7409CD;
	Fri, 17 Oct 2025 17:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DF3C4CEE7;
	Fri, 17 Oct 2025 17:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760723700;
	bh=Frj/gTI0fCdTQ+dy0b32qZsRqI5p5lZV7D3sjsfbqFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pYVmBd20kktjdFwCdconvE+tVm0yM+G49jzgQcgB6sfnv6RWkp4bhDnZ+JxlXfQ4R
	 HIVX45WAUzhSiV6CHgz2hlsYp2pAc9yvATEGm8qZ06tBqqLjvkJcfaUfGvvpa9YlEI
	 MpbqL1Jn5PaXkebDXJJbE3UMCb1+OjF0AE47PzvxPvoLvGZvAigmuFgDEqz+CXb/VG
	 NPa4SzzoSLAaM6NlcGdgE+o/80UFibn6HI9u+5pRMWBtqvrUo2Ktv+t5X9ZuDHPMx5
	 UL0e8nXbmX2iSRE3bABxeWiwG8HqqdicEIQcakgs+xmxXO+/LEzT4/dzEXFX93uX6E
	 R9q9Fva8FgUzA==
Date: Fri, 17 Oct 2025 10:54:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: officially expand maintainership team
Message-ID: <aPKC8xg+vqB8caEK@x1>
References: <20251017143302.1776953-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017143302.1776953-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_105501_902140_4322333E 
X-CRM114-Status: UNSURE (   9.77  )
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

On Fri, Oct 17, 2025 at 04:32:26PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Since Olof moved on from the soc tree maintenance, Arnd has mainly taken
> care of the day-to-day activities around the SoC tree by himself, which
> is generally not a good setup.
> 
> Krzysztof, Linus and Alexandre have volunteered to become co-maintainers
> of the SoC tree, with the plan of taking turns to do merges and reviews
> to spread the workload. In addition, Drew joins as another reviewer.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Drew Fustini <fustini@kernel.org>

