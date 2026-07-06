Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEDDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyB9aCHXC1YLIWVcaiWcQ7R8f4piKDYM1vagMqasKdU=; b=bqw+rR7x5nnnwH5f7DoXqRkkt/
	jhbvQIyDqK9U5aviTLQkpfeo0zVE4K9xlnO950Wpj6YFhbrkV5kheVSGazWUNcOZCaz4TSgV559dF
	5T8fBGNc/5i//D6S8sy3HQ82PeetcKQeLGPIANO8KDR3iPDDS9LZzMpb4j/dpcpuFE3th1cjyYjPQ
	PFkcIMM1Kh1pcAoK7/uOo/Q8ra0R0KXDWSnLdnKHuo6jrAsJmMFmyM5qeZTD6Tg783FBoqT5menN5
	wXxXaCHOmEiGo8cErlxyALp6BdPQZLiwUHJk2LyAocphD1MKi27C8tLajceCe+N81Kt0uRrlt+uPP
	yROC6PEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggNc-0000000CAcI-0yc4;
	Mon, 06 Jul 2026 10:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggNX-0000000CAZ7-2UeY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:16:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C119E2454;
	Mon,  6 Jul 2026 03:16:37 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A544A3F85F;
	Mon,  6 Jul 2026 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783333002; bh=qxuireiW5qKIf6Uiq+r7eLyBQv+2n9MoALxEyD38NAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ka03qQ9fssFq//9ek6QkwhtFwQKGu0aNOpRQBqEQwN+TH0cvyIo86Gy5nCP7l27JJ
	 2SXR3IHho8xhJKw+tqVKYSjDQZ5C8AfOBcgRmlrs0fNrgLggf2dvQYEQojCntGnfmO
	 DqYf5JssOo66S7YBr92EBQzuK3fmL9vMTImf4DeM=
Date: Mon, 6 Jul 2026 11:16:39 +0100
From: Leo Yan <leo.yan@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tnoc: Constify amba_id table
Message-ID: <20260706101639.GB710301@e132581.arm.com>
References: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705171934.116425-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031643_699930_14B3C36B 
X-CRM114-Status: UNSURE (   8.00  )
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

On Sun, Jul 05, 2026 at 07:19:35PM +0200, Krzysztof Kozlowski wrote:
> Static 'struct amba_id' table is not modified so can be changed to const
> for more safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

