Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCFECD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ41baRs8dt4vXUStMjUU2dF9+GvVFWPYjvHOD9xHbo=; b=SfxhCn5FxxryYtXCj8dS8Fmx9l
	0L3o42hDStKckx7hR2B7eK5qa/gPjWF4lxJLzTyAMx0pS8V0kXNo/WH4pnUuMKIReKEweqAOVOvHg
	7YKQCT5H2s75whzg2y83LfbXruEXUFh3+0qKIOFKKtOXSCaV5t8b34sTQw36G80OrczGj2ldD6XD2
	UEhwuwluqbGUpzPjGDBpZk2evJ7+4W2xBZWyC+0QwwV/Z0GCJ9VK/wlO4Dqoz3Vh9kb/NYuUFN9Vv
	SeKCO3c5SoRljlIvNsAwypa5KAxz4FZaPf3psq90TJZ2x5QRZWs3s8DoFavGDGtNrHgCQXKoa6aIw
	ztwj3+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb4x-00000005oD0-1QUr;
	Thu, 28 May 2026 13:47:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb4u-00000005oCX-2xq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:47:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 867DD4402;
	Thu, 28 May 2026 06:47:10 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 680E13F632;
	Thu, 28 May 2026 06:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779976035; bh=4blMPJwO8wOgJek48r7tcv6T2jD7ndmGe7fMN5J+ilY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2xLgRODdfoPHiXTSmqVM2SrsVgXP8/vfiTbZ+vNcIhotjt7bipm9FPmuyZDaR209
	 SNZ92h/q6JN43x44S7OqdrbCdMfChNFnYdtzukljI2GG5rf0QWTH+5LFox/SrqWFiA
	 7Z3FGZ5wdv7MHtjkqgjv5M7CpQwhFcU9HVJJwjVk=
Date: Thu, 28 May 2026 14:47:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v7 03/13] coresight: etm4x: introduce
 ETM_MAX_SEQ_TRANSITIONS
Message-ID: <ahhHYMeKlPnHUqJJ@e129823.arm.com>
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-4-yeoreum.yun@arm.com>
 <20260528125856.GC101133@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528125856.GC101133@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_064716_784562_54A7FE44 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, May 28, 2026 at 01:58:56PM +0100, Leo Yan wrote:
> On Tue, May 19, 2026 at 04:48:02PM +0100, Yeoreum Yun wrote:
> > According to IHI006H Embedded Trace Macrocell Architecture
> > Specification [0], n could be 0-2 for TCRSEQEVR<n> when
> > TCRIDR5.NUMSEQSTATE is 0b100.
> > 
> > Therefore, introduce ETM_MAX_SEQ_TRANSITIONS macro and apply this
> > in TCRSEQEVR<n> relevant fields.
> > 
> > Link: https://developer.arm.com/documentation/ihi0064/latest/ [0]
> > Suggestedby: Leo Yan <leo.yan@arm.com>
> 
> s/Suggestedby/Suggested-by

Bad typo.. I'll fix.

> 
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> The change looks good to me:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

Thanks ;)

-- 
Sincerely,
Yeoreum Yun

