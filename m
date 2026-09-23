Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0EEC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5qEuMX2AgfVj/zB737wgvO3fczJP+9mZX4O+p7Gui8=; b=Keu1x8NJgeBbHcY+h3yYwYBlqu
	jjPpcnKLJ5L6EEV2WzOpTSg51iAD2kObOcq2xc0AgpxOxLCiLcJ6jVVr6s2EVzD+MN0IIPu7iLI0n
	YMLqs6UywKioYfR3ttcCJJrRS7GDKMUtyZGO2nUjl3PInbdMG74QuEoaV0v+YWuWhwxV4nl6SvVo3
	QZyN9ozxa2DkTtkJeY5itiB/bTlDtDrC+fGkjGN0Yv6GuODtorxdo/dWbPG3It1ExB2quud3l1IqO
	C5kh651cyJGh4UPUF65sU2ErHthF5Jjsj0qWiTNRfQjj6hATID/N7SC4lIXvkNUgMbaBEI46Z5E93
	oTyo26aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OaH-00000008dI9-1Kwh;
	Wed, 23 Sep 2026 15:08:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OaE-00000008dHn-0UV8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:08:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5311D1576;
	Wed, 23 Sep 2026 08:08:25 -0700 (PDT)
Received: from [192.168.4.158] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 911EE3F86F;
	Wed, 23 Sep 2026 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790176108; bh=edtWsNHFqIjdvZULam1O7IB7K582ntmW2xvpX9oL22I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iU4so09VsYwG4mfgnfjgyscGoaIH5dI/auxUcOj5+WeOxNFbRV3D/N0hk7AuSemUr
	 LzjaY2DjeMua/Z1a8HVVBcmvGoUMrZN+AS9DP8LD+OMC4rRwpiX0pC65rMWXmRR6I9
	 UIwmVo7MsWUDnfODGoK/v7dAInTdKjmgt4XguVcc=
Message-ID: <c8819aea-d0a2-45ea-a4dc-54e2f9aa2df8@arm.com>
Date: Wed, 23 Sep 2026 16:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 7/8] coco: guest: arm64: Add sysfs ABI for CCA Realm
 guests
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>, Andre Przywara
 <andre.przywara@arm.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Olivia Mackall <olivia@selenic.com>, Russell King <linux@armlinux.org.uk>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
 <20260923140405.1111554-8-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260923140405.1111554-8-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_080830_283138_E7AB0C6A 
X-CRM114-Status: GOOD (  10.75  )
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

On 23/09/2026 15:04, Aneesh Kumar K.V (Arm) wrote:
> Userspace has used the arm-cca-dev platform device to detect Arm CCA
> Realm guests. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel
> device-model details.
> 
> Add /sys/firmware/cca/realm_guest as a stable ABI for detecting whether
> the kernel is running as an Arm CCA Realm guest. Create the file only in
> Realm world, where it reads 1.
> 
> Document the new ABI in Documentation/ABI/testing/sysfs-firmware-cca.
> 
> Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


