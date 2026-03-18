Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE3AFCD0A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 04:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIlEsLdaVR+40flaYcqMAVD3R9hzK0WAVAtp83OthA8=; b=rFXP1jxHmKUmtGz8lsi7SzVXeu
	FObNV3fizeqEqdlo1pn55dhyNBioUrl8U7DPrVX+1lVcpgrdp8QkrF7RPEiW4WqDk0PdRk/bcj3O2
	0qq+tkbUrgsCKiOzOisnuy7563ckY6gjMZLNSDJkV2p60AOHothujZTrjY/pBtFm5375LXVpmUQUu
	b7NjH15yZrUogMO5P73s41vw2i5ZDw1z4HgdXVcZolvHz/iKprcOMOjwYJbXDiDfDoZ9rpRVyKdWX
	qw2LvnA+/s+LKHh7HvEIoFHcz8fprJS8qMADBfQ9J2x1BgnWPOcOdicBAFf0l1iwjTnq2bqPvPbwe
	ypg0HYhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iRU-00000007lJZ-350m;
	Wed, 18 Mar 2026 04:23:36 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iRR-00000007lJ3-19RP;
	Wed, 18 Mar 2026 04:23:34 +0000
Received: from [100.79.128.244] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0F74A20B710C;
	Tue, 17 Mar 2026 21:23:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0F74A20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773807810;
	bh=RIlEsLdaVR+40flaYcqMAVD3R9hzK0WAVAtp83OthA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q0D96+mYZKhqvtohnIYX9Y0wSlgpN8qU1rA60SHesDeVTj+lbqezoEYn259Go3cBt
	 tb2emd1Se7lI85zK0MIxEXzim0+tteQa/7P9ao/ynPs8My+J4WELDxhQR4CI4Nhd+i
	 8OvFhet4gQExD7pKSmVle52vjr2liCLVPCauJW7I=
Message-ID: <a8f856a0-49a8-4041-9036-4e9ade79532b@linux.microsoft.com>
Date: Wed, 18 Mar 2026 09:53:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Drivers: hv: Add ARM64 support in mshv_vtl
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <SN6PR02MB4157DFC7B7CE94500C89664BD441A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157DFC7B7CE94500C89664BD441A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_212333_347691_EA1811B3 
X-CRM114-Status: GOOD (  11.81  )
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



On 3/18/2026 3:33 AM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
>> The series intends to add support for ARM64 to mshv_vtl driver.
>> For this, common Hyper-V code is refactored, necessary support is added,
>> mshv_vtl_main.c is refactored and then finally support is added in
>> Kconfig.
>>
>> Based on commit 1f318b96cc84 ("Linux 7.0-rc3")
> 
> There's now an online LLM-based tool that is automatically reviewing
> kernel patches. For this patch set, the results are here:
> 
> https://sashiko.dev/#/patchset/20260316121241.910764-1-namjain%40linux.microsoft.com
> 
> It has flagged several things that are worth checking, but I haven't
> reviewed them to see if they are actually valid.
> 
> FWIW, the announcement about sashiko.dev is here:
> 
> https://lore.kernel.org/lkml/7ia4o6kmpj5s.fsf@castle.c.googlers.com/
> 
> Michael


Thanks for sharing Michael,
I'll check it out and do the needful.

Regards,
Naman


