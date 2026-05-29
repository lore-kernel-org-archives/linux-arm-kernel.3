Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBF4CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4w68myDVDCrwprHXf4Bm9v0v2jfwDW6DRk/H7qnl/M=; b=OmzGjNNcB4//sQ2vWYGFJwki64
	r4TnnHi3Og+GTTT+baZXiftspKWXXHB2dLLCqNBFgACGgNtHOvfCk5Ju9m/i6tmfVZ9uoKAPQ5nBG
	dql1a0PYoKL7ZbBrm5ZnFT+hztXyVm6gtYJb+MSp0NtbfYqtqQaIVW58OfNjvsKtf7ZrhcF5kGSny
	To8/I5ey6LcKl8guJsq/5wuz27qxIt9DX1MhW+dVfzMhx6OmZx5mB+lKQv+oW7yu9qNOo3ay5A2Nl
	VVf6SKSSa7xpxWQWHK5IvkUlru79Ak8sUuXlcvmd6lHVphW/6T5oQxpEWPrgA71BXH5L5GeDtrXgD
	ZmMuBV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStoU-000000075w3-4A3B;
	Fri, 29 May 2026 09:47:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wStoT-000000075vZ-1Cpn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 09:47:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2E2A1DB5;
	Fri, 29 May 2026 02:47:26 -0700 (PDT)
Received: from [10.1.26.144] (unknown [10.1.26.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 526073F905;
	Fri, 29 May 2026 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780048051; bh=ybmvzCzXntZRoRn1SxSPm0ifKdn3SMRIbhENixtHroo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ecq9esxF7UMec/lltYpS+pKeKOSO7uP9tNC3wEeWgM3wnF1tK+g00pmu3R8vpx8fv
	 oNdtl86zLRBUwuNY4taUq79pJqzJ/guIdhm3HvI2UZwZJcuJ1UowwG/Ufskl6R7ksw
	 Jor5hp6PypWUcywqvA0WIh+8ncqrd9zgadmp2/WI=
Message-ID: <82df53fd-c6e5-4bc9-b653-3d6451f3ad1a@arm.com>
Date: Fri, 29 May 2026 10:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BOOTWRAPPER PATCH v2 1/2] Introduce --with-gic option
To: Sascha Bischoff <Sascha.Bischoff@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "maz@kernel.org" <maz@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>,
 Mark Rutland <Mark.Rutland@arm.com>, nd <nd@arm.com>
References: <20260324125906.67012-1-vladimir.murzin@arm.com>
 <20260324125906.67012-2-vladimir.murzin@arm.com>
 <a39930aac3543e2866a5a0f8e8a9e98ee94a0026.camel@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <a39930aac3543e2866a5a0f8e8a9e98ee94a0026.camel@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_024733_364266_4EA01A59 
X-CRM114-Status: GOOD (  10.21  )
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

On 5/28/26 16:06, Sascha Bischoff wrote:
> Hi Vladimir,
> 
> Sorry for taking so long to get to this!
> 
> On Tue, 2026-03-24 at 12:59 +0000, Vladimir Murzin wrote:
>> We are about adding support for another GIC version, so introduce a
> nit: We are about to add support
> 
>> new --with-gic option to select the desired GIC version at configure
>> time. The default remains v2, preserving existing behavior. 
>> Howevere,
> nit: However
> 
> Aside from these nits, this looks good to me, so:
> Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> Thanks,
> Sascha

Thanks Sascha, all fixed locally.

Cheers
Vladimir

