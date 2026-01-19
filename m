Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B517D29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOCclpbn4kCocxllc2wrYrlt309IZYYNaepuSlnN8Ag=; b=LPpfMDFG6OD2k6fm8ePOPXKAUC
	4Yps1yGa4JdWkHIBeHSZKMQtUWYB7JbTV46CSyzXA5HGhsLAunm4jwbfoVZ7av0DwhNkc8WN9xHAE
	sdeVgX5MQdVnd/dpnRj49y9iZgl0V8bHmJ/3rajRQuFMClNML7z+0u9S683H0mB+YetfZlNXdjDKh
	aJcbRn7U10JG7KDljZCYFwhiFSgKi+Iakw0ZA/pEuu36iUdYeQcAe+TeFzq6dJdho90k9E/VjK2eh
	+uit6zxdgtpMj095TTttrkeGZozetHf5itEXTGKaMszlIxN811neEMIFfUZw+lP2bO8jfLpNfNEaR
	q/j6Kuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrSM-00000002Nrf-2KhY;
	Mon, 19 Jan 2026 15:46:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrSE-00000002Npt-1WBs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:46:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C6DDFEC;
	Mon, 19 Jan 2026 07:46:02 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B89EF3F694;
	Mon, 19 Jan 2026 07:46:08 -0800 (PST)
Date: Mon, 19 Jan 2026 15:46:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] stm class: Fix Kconfig symbols
Message-ID: <20260119154606.GE2732125@e132581.arm.com>
References: <20251217-fix_stm_kconfig-v1-1-531fb3674549@arm.com>
 <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d48dd55-d78d-4cbf-88b0-5427a731ba7d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074615_462787_C9335040 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, Jan 19, 2026 at 12:35:23PM +0000, James Clark wrote:

[...]

> > @@ -28,7 +28,7 @@ config STM_PROTO_BASIC
> >   config STM_PROTO_SYS_T
> >   	tristate "MIPI SyS-T STM framing protocol driver"
> > -	default CONFIG_STM
> > +	default STM
> 
> The help below here says "If you don't know what this is, say N." which
> makes me wonder if this should be on by default or not?

STM_PROTO_BASIC is a must have config when enabling STM.  While
STM_PROTO_SYS_T is not mandatory, but it is useful to build it so that
users can select the protocol dynamically at runtime.

> Also everything is in an "if STM" block, so "default STM" is a bit
> redundant. It's not that obvious what the intention was.

They are two different things.

"if STM" expresses a dependency (the module depends on STM), while
"default STM" means the module will be selected by default if STM is
enabled.

Thanks,
Leo

P.s. I also tried using the "select" and "imply" syntax to enable the
protocol configurations.  Based on testing, I did not observe any
difference compared to using the "default" syntax.

