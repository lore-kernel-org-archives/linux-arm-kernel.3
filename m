Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE08A111224B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 01:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eWqCEO7F+2N6T5cVyFJeKU2pfVZJ569dBXmJ6iH+9I=; b=bMllTSBWSYRAv5xJK6A9EI/hBy
	B3c90RIf6iKDo9TR1FiZ2bhFYBw+wC8J7DU8L1bXonVjtNf7T9NSKXNId5VO125JWrQBKm/bCUNhf
	ImRmzchS+pqXGStL2k/fc6u6SsDZcaOzSuy6s91rpWCNujHiRWgTy3qXb8oW8DfBuPQKuj8efb/Ot
	6k43tErhfELWe3bLA16oN2yqZWQg8hlk6oeGXQAZxACFwWhhEGYxZ4iIA1QhwvIJ+6e49dYnTMXfM
	f+XNTc1VVrdKOqj8hfqNi4CgKXSrOHKkKGKM9e7u2lFLMG0JWP4sw7+97H5L94vfG6j/KGPk1jxHb
	HbQ2rQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87K6-0000000Ga0H-12R6;
	Thu, 02 Apr 2026 01:58:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87K5-0000000Ga0B-1HCw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 01:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28DD76184D;
	Thu,  2 Apr 2026 01:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672E8C4CEF7;
	Thu,  2 Apr 2026 01:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775095095;
	bh=OhkZb1PanLgxrZ/zVo0cHlKmip8idlqqwyDhpMPau+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TM1noMFv53UldSBvxvic6PaEjCjIeA87RrAT7bpxWnOXEj/tFNozSgokcbHXgHGTv
	 WWyZGFREuUR5frfDeV9nTJGaRuPmuRjs+bzLXLl9TVyt9tOp4dfSERSHvQtZAxbtOf
	 E7m/LxXetSeWUIApK4Dsfj3372hXiXxv1z8s7RVYXuVCOBx9wimgZ0w6Eb+qkhJF1y
	 rJBcjvJzVBZbj63x9bITk8QxhgjxSJQupYiWVpLYKOAVg565zveogZKanu4gPWD71A
	 DPp7m4X2V58HSKS5uyTiWu5bbGPY866g4VmihrP/rudgyWr3Vf1qpmt5/i6+Eva3GX
	 CZgfQdkUDDYjQ==
Date: Wed, 1 Apr 2026 18:58:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: manabian@gmail.com, davem@davemloft.net, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and STMMAC_ETH in Kconfig
Message-ID: <20260401185814.45dfc444@kernel.org>
In-Reply-To: <20260331125817.117091-1-julianbraha@gmail.com>
References: <20260331125817.117091-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 31 Mar 2026 13:58:17 +0100 Julian Braha wrote:
> @@ -53,7 +51,6 @@ config DWMAC_DWC_QOS_ETH
>  
>  config DWMAC_GENERIC
>  	tristate "Generic driver for DWMAC"
> -	default STMMAC_PLATFORM
>  	help

This is a default not depends.

As much as I'd love to make stmmac default to y this will probably
break boot for some people..
-- 
pw-bot: cr

