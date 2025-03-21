Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74086C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CT0xeUxPK7M0JEJD3aEAdaLenW2othheeKIqp5BaoVE=; b=egrRVq4lDB9kJyjWNvouCIevmP
	T76LQF/098a8tkC2wVVjFtd2j+oCeQAIKeas1h+IvSBBAoEglY3exsPFSwuwpB3y9rEkTJt7IXKde
	ya9hPJbXTAzdlyII0xWZPU9S7MSXC62TBr/w+9SZHL++wEIhebUecaYJ74pHYwpR4vzF5uGgICKAv
	JDTp8ZmAMZdkYiHgNzraqNdQ1kkjnpFZSrHdNIp43j+9V0Pd8tDREkyeqNbKs+0wxNexF2Si12jqf
	W/j3LI2I77qseV5eb51kri15k5ZUYf1Wn5Mi0Yefu/4X9R0HLXdopJQi9nHN7+7oWmT9mo/M5OZEL
	KN/IUvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvm3G-0000000GZkH-0KTj;
	Fri, 21 Mar 2025 23:45:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvm1Z-0000000GZbB-0oil
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 23:43:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AA87113E;
	Fri, 21 Mar 2025 16:43:37 -0700 (PDT)
Received: from [192.168.20.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71F853F673;
	Fri, 21 Mar 2025 16:43:25 -0700 (PDT)
Message-ID: <e8ada81d-0e10-412b-8792-035bc63113a6@arm.com>
Date: Fri, 21 Mar 2025 18:43:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: uaccess: Add additional userspace GCS
 accessors
To: Mark Brown <broonie@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 thiago.bauermann@linaro.org, yury.khrustalev@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-4-jeremy.linton@arm.com>
 <50a0920d-3e3d-4e96-b68a-a7a0d78c3695@sirena.org.uk>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <50a0920d-3e3d-4e96-b68a-a7a0d78c3695@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_164337_281948_23FF5CEF 
X-CRM114-Status: GOOD (  19.55  )
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

Hi,

On 3/19/25 8:24 AM, Mark Brown wrote:
> On Tue, Mar 18, 2025 at 03:48:37PM -0500, Jeremy Linton wrote:
> 
>> +static inline u64 load_user_gcs(unsigned long __user *addr, int *err)
>> +{
>> +	unsigned long ret;
>> +	u64 load;
>> +
>> +	if (!access_ok((char __user *)addr, sizeof(load))) {
>> +		*err = -EFAULT;
>> +		return 0;
>> +	}
>> +
>> +	gcsb_dsync();
>> +	ret = copy_from_user(&load, addr, sizeof(load));
>> +	if (ret != 0)
>> +		*err = ret;
>> +	return load;
>> +}
> 
> A GCS load done by the hardware will verify that we are loading from GCS
> memory (the accesses are marked as AccessType_GCS in the pseudocode
> which is then validated in for example S1CheckPermissions()).  Sadly
> there's no equivalent of GCSSTR so we'd need to do the permission check
> ourselves to match this behaviour.

Right, except that if I grab the VMA as a placeholder for the page, 
check to see if its a VM_SHADOW_STACK under any of 
map_read_lock()/lock_vma_under_rcu()/etc and then perform the access, 
the resulting possible fault will have problems with vma locking. 
Otherwise there ends up being a few different races that at the moment 
I've not yet figured out how to fix without making a big mess. For 
example, we can reduce that possible window, by reading the 
value/locking and checking shadow stack state/dropping the 
lock/rereading the value, or some other construct but it seems pointless 
because the suggested problem is that we might be creating a way to 
bypass some of the shadow stack security. In which case, leaving a 
little race is likely the same as leaving it wide open.


Otherwise, maybe we can ignore the problem, or just refuse to allow 
probes on 'RET' instructions which seems to be the main problematic 
case. Although, given we don't really know if GCS is enabled until the 
probe is hit, SIGSEG'ing the target process is a big hammer.

Ignoring it might be a valid option. I guess it could to be one of those 
"if the user puts a uprobe on a RET some of the shadow stack security is 
reduced" footguns. If an attacker can also manipulate the address space 
in a way to exploit it then its probably game over anyway. Ideally, the 
kernel would warn on this, but per the conversation around patch 6/7 
that seems to be off the table.













