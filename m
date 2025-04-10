Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA3CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 19:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIf52GlovbvkGrmF0yuwN/3vnWv6uH/x4VM7bLG+QCY=; b=PUtHGO/vBvp7eC5O0veSL6NDxO
	HG6uaJHYXTH1qbIvo0ho+I04rFoYLWDcFBtGNG+HDsZRrCqrvgR0traKEDPxqs0VezULeWr4Ll4a0
	NB/EMQ14bDDJUtqyGj/iAIctf/aD/p83WHtFP+n2W/w0WD7+//MUAzSCWm5GVRt/8xZAh9VoRVL3e
	0f8/P9H3sOChTJPwmU8HOyudrUkGadGiEfKmmvXe7OXII7ualzHVRpOH1kltreXtqmbsQ125g88Q2
	18PUhlOSvyYKoZA38q+bCa/SWiQD3b/Q/UTKCSK7vw7EVBivwM1lAQMYquGRHx/QmCDUaPhIUViBe
	JRDzyJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xK6-0000000Bbvb-3xqy;
	Thu, 10 Apr 2025 19:12:26 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2xIG-0000000BbfD-2H9E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 19:10:34 +0000
Received: from [10.137.184.60] (unknown [131.107.159.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id B95962114DA8;
	Thu, 10 Apr 2025 12:10:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B95962114DA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744312231;
	bh=GIf52GlovbvkGrmF0yuwN/3vnWv6uH/x4VM7bLG+QCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P7hSa02M3iPJfwyVRh9ul8Qqg3w3S9nzYdXt1Jguz+zzE2jU7vdU4NAeqNKF9CJpV
	 SLgW6C2o4uN4t7kSkTROtIOX2QqjDT3/uXC+0yxmK45wBRqoJVxJonTcXFFAeY59o2
	 mMrZ3NYMSyQOYMfz6rugX2MXe3gTtYW6AzauSq5U=
Message-ID: <fb7de79c-100c-4423-a6f5-6f7b9acfccbc@linux.microsoft.com>
Date: Thu, 10 Apr 2025 12:10:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next 1/6] Documentation: hyperv: Confidential VMBus
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, aleksander.lobakin@intel.com,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de,
 catalin.marinas@arm.com, corbet@lwn.net, dakr@kernel.org,
 dan.j.williams@intel.com, dave.hansen@linux.intel.com, decui@microsoft.com,
 gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
 hpa@zytor.com, James.Bottomley@HansenPartnership.com,
 Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
 lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
 martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
 quic_zijuhu@quicinc.com, robin.murphy@arm.com, tglx@linutronix.de,
 wei.liu@kernel.org, will@kernel.org, iommu@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250409000835.285105-1-romank@linux.microsoft.com>
 <20250409000835.285105-2-romank@linux.microsoft.com>
 <724f9f7d-137b-4cf5-aff5-bbb9727c23c1@oracle.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <724f9f7d-137b-4cf5-aff5-bbb9727c23c1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_121032_602543_AF2B1E76 
X-CRM114-Status: UNSURE (   6.95  )
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



On 4/10/2025 9:54 AM, ALOK TIWARI wrote:
> 
> 

[...]

> 
> typo trsuted  -> trusted
> 
>> +To support confidential communication with the paravisor, a VmBus client
>> +will first attempt to use regular, non-isolated mechanisms for 
>> communication.
>> +To do this, it must:
> 

Thanks for your help with this patch, and the other ones!! I'll make
sure to use the spellchecker on the patches before sending another
version out.

> 
> Thanks,
> Alok

-- 
Thank you,
Roman


