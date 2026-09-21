Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBA1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrimYz7WyjtBcj/HkK+xOiLxCG21DGbqHUT10/ckkkk=; b=sBkowbqOMn3pC7eZz97sSNuuff
	mLL5JP9pK8u6Aurn+C+HzPXD6vT1iKHAyvpgiE+ULz/wHA3V7lbWn0Ojp4y3b0nh2HP7YAX+kAlgH
	okgVMzbUfwQDWfxU13UN4a6XbHaqvlFxudOtbvy1AtmF8gZ+ye9pmGLsNISEjKxC2vsRU9s1hKhZA
	TLmCBhrOT4TbeyahUHsQFOcOLH60zxO2TpDDG0WXiTj0eQfTC0jjFGD3In4HozQKwPbeysrLVnRVT
	91niSELfC+7oYoBoPZnVdSFHRxPr4n3GRljv2EN0nLcGJrc41mbYL9uF18PJP6cjHucSgtQXsCWYR
	ll3a4U0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mf3-00000003b3G-1rtS;
	Mon, 21 Sep 2026 22:38:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mf0-00000003b2R-3FS3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 22:38:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E2416A3;
	Mon, 21 Sep 2026 15:38:47 -0700 (PDT)
Received: from [10.57.9.187] (unknown [10.57.9.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0551A3F632;
	Mon, 21 Sep 2026 15:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790030331; bh=3g0q7Ij9nzRcg2zVM4o/E4Ackcg7ngcc2tKqZAwliBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mwK/wwZMN6yHUYXxM1HJ7kFXqzV3zwL8DSbcAGQh0dzeQjRE0daZvgBihhsFgCzmQ
	 o6RvVhDa6Pq3B2Pgf6skBdfv33eDcsdpg8RrD3Jec4uDn045zelu7Xq4amMww+CfBv
	 lY5k3bKOBitGl5MXvPr0OZk5aqqwTIcKlRpyhz2I=
Message-ID: <994feeea-87ab-44a9-bbc1-091e93fed8b6@arm.com>
Date: Mon, 21 Sep 2026 23:38:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI support
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260921145338.000070e0@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260921145338.000070e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_153854_957933_F9A30A9E 
X-CRM114-Status: UNSURE (   7.18  )
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

On 21/09/2026 22:53, Jonathan Cameron wrote:
> 
>>
>> [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
>> [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v18
> Not seeing this branch.  I wanted to sanity check on discussion in the thread and
> was being lazy so didn't want to check out the branch I built for review.

Apologies, I missed it. I have done so now.

Thanks
Suzuki

> 
> J
> 


