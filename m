Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5F5C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqwWk8wqSnQMpO+6IGHt5LbmiKGeMclC2QdKfxJbwGM=; b=VUMrdCvylDyQEcdpqQ3jCfUlAr
	E+E+3uutUDghZnEaE3vm6fpqKQF+ebKfCIQkycdzRxwClzu9J/aFbOM5djj0XYTSgMYJmL0ECxSd4
	BCgpU9zjFryxZln/1uZMnbayO/2M0GPKcbbkcj0KB640DTtdzSqXiy+7Sdby4Sh9K8hsJLZSBepIm
	t1waqlfULacYzoYnp2Tc638f4FDqPbqGpL2680lHOCQWDBrkZRcuqtSyLGBCJ2qIWHp78fzBwX7Yu
	U8MFRDBpSbR+KB81bNpCyoqddWXB+3ALAJ/t3lNVoZCYVKfYftJCHed8PKDE8U+bemE6oLkPJN3OU
	R6UoehAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpIl-0000000EUSI-1H4s;
	Tue, 11 Aug 2026 16:26:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpIi-0000000EUR7-0rvy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 16:26:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E68B1516;
	Tue, 11 Aug 2026 09:25:55 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0995B3F86F;
	Tue, 11 Aug 2026 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786465559; bh=igbvvax0JGwfrfFKY+TA5P9JX55tWlcLP0lMbQr2rrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TkVaNfBkBsx09OjMZry287mHTgG4IvVeGrC+NoF6CVHZzqXeK/hOvrYFGuPxfhgN8
	 37wSiRcXDuvsSICmaBMfN4KYuB1Zry6mPd+WKzhiFQg5GGUnhHNwd2qO0vbypVB7vT
	 Xlu7BXzk2x+K5NhJnue0J9OSeY17jaK9lrAIWo2I=
Date: Tue, 11 Aug 2026 17:25:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 05/13] coresight: etm4x: missing
 cscfg_csdev_disable_active_config() in perf enable
Message-ID: <20260811162557.GG15499@e132581.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725113645.57519-6-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_092604_417834_2C392D74 
X-CRM114-Status: GOOD (  10.59  )
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

On Sat, Jul 25, 2026 at 12:36:37PM +0100, Yeoreum Yun wrote:
> In the perf enable path, there are missing cases where
> cscfg_csdev_disable_active_config() is not called:
> 
>   - Branch broadcast is selected but not supported by the hardware
>   - etm4_enable_hw() fails
> 
> This can lead to a leak of config_desc->active_cnt.
> Fix this by properly calling cscfg_csdev_disable_active_config()
> in these error paths.
> 
> Fixes: 810ac401db1f ("coresight: etm4x: Add complex configuration handlers to etmv4")
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

