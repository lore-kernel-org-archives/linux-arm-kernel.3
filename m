Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F2ECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBGTw4DcjNIRxPKOnU2ybzQ1Uea/5xfg0gTnse7FDtk=; b=QO40LgqvsWnMnQSPgKTwFPmLY2
	R1e3tvvRRtkiUV4ogPt9KMwYG4xBcGDj+0MP//efm00j90WIZDO4E2BFztypw80V0sz1RlD/GGMea
	knCKtSnawvM459c7u2HVCg60ZS02Rg759+k3yw80W2uyv8wnqNo7/T9ow6LXGhZXu2ZXpXE3gemVG
	q5A7X4R7ZC+J2468y3mvGAatqz3jGMAlu7VgTPbGydgorXQcZbZeiaE7yIqZ46fm3r9RDwTbQ6gEM
	SrJEHuTCbzRXIC9q7XVjv5lo91rpyk3Y6QaVATrWhEqkxXiAfjhYd4bm/g8vH0VKGfcwaX6YOBiHA
	lDMpWjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fjJ-0000000CNmW-1pqu;
	Fri, 03 Oct 2025 13:21:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fjH-0000000CNm8-0CPs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:21:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F0EA1655;
	Fri,  3 Oct 2025 06:21:38 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C553E3F66E;
	Fri,  3 Oct 2025 06:21:45 -0700 (PDT)
Date: Fri, 3 Oct 2025 14:21:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Mike Leach <mike.leach@linaro.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: Re: [PATCH v3 01/31] coresight: Change device mode to atomic type
Message-ID: <20251003132143.GW7985@e132581.arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
 <20250915-arm_coresight_power_management_fix-v3-1-ea49e91124ec@arm.com>
 <422560ee-50e8-4298-80c8-de46c521117a@arm.com>
 <24600e6c-8f99-4e4d-ae68-a7927bce88bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24600e6c-8f99-4e4d-ae68-a7927bce88bb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_062147_125761_0D48B39F 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, Oct 03, 2025 at 11:15:21AM +0100, James Clark wrote:

[...]

> Unrelated to this change, I think the complexity isn't unnecessary and
> taking the spinlock could be the very first operation for any action. That
> would do away with the atomics. We don't need to optimise for any contention
> cases, because it never happens outside of artificial stress tests.

Just record a idea for further refactoring. Ideally:

(1) Maintain a mode (atomic type) in coresight_path. Remove mode from
    all device modules. The only exception is the sink device, which
    maintains its own mode to prevent the sink from being shared in
    different modes across different paths.

(2) Driver data should use a reference count (refcnt) (for funnel,
    replicator, sink) or an enabled flag (enabled only once, e.g., for
    sources) to track state; this is protected by the driver's spinlock.

So far, we just use ETM's `mode` as a global flag for a path, this is
not conflict for the further refactoring. Later we can use a seperate
series for refactoring.

Thanks,
Leo

