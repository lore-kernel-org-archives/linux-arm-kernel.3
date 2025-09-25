Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75134CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIYHrp+r8l3aRY2CrSNIVxvTo+sjJh2VmGHzM0SkdFI=; b=rB9qbQKva+XRCLUWQU2MVWtXxe
	7309qukzZWct0aNVeKODABYpCpEArmNqHxjFI19ehpp11feZ+jO2KKPnjp/EahZoTWRWNG/U5Xj17
	Bs8z7ZroVBtXKr4ujpT0oKu8NeaDKs9/ioQ0B4IPl3Fw+Dg1USe5A2b2WI75I1sNyDJ+1x4XlzBy9
	wGKHaho6P3V/ay6cWcgTZ89i67f5AKr/fLjwB+RZ6831Vva70dsSXNYT5XgoElpr8yNKyM+Q9c3jt
	rS7SrJc1WVGjHUA3h3Pik/wJhUBKP1lSCr3hTub8Hw9XCOuYBYRCtDHmv9R2ptMnWLBKNm4IH3iR1
	zuGy5qZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iCk-00000007Z8s-1Rzd;
	Thu, 25 Sep 2025 09:23:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iCh-00000007Z74-2MGP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:23:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC0D41692;
	Thu, 25 Sep 2025 02:23:46 -0700 (PDT)
Received: from [10.57.1.72] (unknown [10.57.1.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BD9A3F5A1;
	Thu, 25 Sep 2025 02:23:53 -0700 (PDT)
Message-ID: <149b84c8-cdd6-4302-b3be-9cf6e69c3319@arm.com>
Date: Thu, 25 Sep 2025 10:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] perf/arm_cspmu: Add callback to reset filter
 config
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
 sdonthineni@nvidia.com
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-3-bwicaksono@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250923001840.1586078-3-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_022355_646350_581BCADD 
X-CRM114-Status: UNSURE (   6.09  )
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

On 23/09/2025 01:18, Besar Wicaksono wrote:
> Implementer may need to reset a filter config when
> stopping a counter, thus adding a callback for this.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

