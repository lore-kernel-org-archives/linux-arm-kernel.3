Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD72C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAlNbnHnnY+rCKoR4N4oHsWePJ7rqAQfDgKBIG1J7gE=; b=F3BYEe/AkD1hwzGcqjEmKXB9MF
	Cx/cJykaRPvOE7Zp/ZwDBII2NIdhJlMQExNfc9MaaaOzv5XkXytg/uLtcw7Pt5qTDHy7E/eAVgGj9
	RiPAgHbp+ZhM/HOzufmc1t6OaOgB59B5y2BET5ZzoOBbUcKjxIJFGHLQpeXa0PmJLTjVAMuacfpO4
	hOer0a10HnmKE2Wa55xROTiVRUqxVWYLBMynuKf+nt007gcGjJ57kvqEwlFR8U7vpeZpq6PaAtokL
	WId2XZLZgw/bj3WSjdWZ+LRUGmOzmu5cSQX8S5YMHaNXn1CnTuWeS0oLjTtzhsilZcSk5494Pzbfo
	G5RKyi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWsf-0000000BtDQ-2nSH;
	Wed, 22 Jul 2026 13:21:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWse-0000000BtCw-2SMl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:21:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F07FF429E9;
	Wed, 22 Jul 2026 13:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A621F000E9;
	Wed, 22 Jul 2026 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784726459;
	bh=qAlNbnHnnY+rCKoR4N4oHsWePJ7rqAQfDgKBIG1J7gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFPc49IED1QI/OTrVYaTIixCKmd3bAxMGU/eYA9hwHC6OpvXki7fnsOJpl6CoFOUc
	 rdez07P4RBQhntdr28FaKT+3c8wlL+82Pf/kC1G73Qcj7mQScFf+Uu7VzlkJ+5PVHl
	 /o8HZRLTsnXg+p8Q9+RMCqI6KGtmg2MiTYG18xjha9AZaN5fJJ5ot8bc1r8ThfzFSK
	 HuGjc3KLxOitil2CSejcHTHzHIkR8osm0UmvNCxFtK27optrzWMabwKXyiCaS2Bnty
	 qqPMu53uATsEaiWQ1ciGePxwnYXcpYBkWQaTIY9BzZ9V91TzL+PYWhk9XUcnemaflJ
	 K0qXNp1l9SJZQ==
Date: Wed, 22 Jul 2026 08:20:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Zhipeng.wang_1@oss.nxp.com
Cc: festevam@gmail.com, jindong.yue@nxp.com, xuegang.liu@nxp.com,
	saravanak@kernel.org, linux-clk@vger.kernel.org, ulfh@kernel.org,
	imx@lists.linux.dev, peng.fan@nxp.com, aisheng.dong@nxp.com,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Subject: Re: [PATCH v4 1/3] of: export of_stdout symbol
Message-ID: <178472645842.281535.12263465103149751658.robh@kernel.org>
References: <20260722082522.3747962-1-Zhipeng.wang_1@oss.nxp.com>
 <20260722082522.3747962-2-Zhipeng.wang_1@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722082522.3747962-2-Zhipeng.wang_1@oss.nxp.com>
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


On Wed, 22 Jul 2026 17:25:20 +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> of_stdout is declared extern in include/linux/of.h alongside of_root
> and of_chosen, but unlike those two it is not exported, preventing
> modules from referencing it.
> 
> Export it with EXPORT_SYMBOL_GPL() so drivers that need the stdout
> device node can be built as modules.
> 
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/of/base.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


