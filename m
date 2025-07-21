Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375AAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0WeBj2bGuuRDUrwwzYEPFuv3oAaANMb0rzB3x/zEGs=; b=3ng/+iwW6V8xPyffchX+rPtT5K
	o2vTz7To7CrskaPXq1c/UU2bHXkTc2c7dJkPb7/3smUVmIpXLXNQSKWoNNWqClf3sA1TtlKAXfCnq
	DxOrDmPwCCKQxPXKCLtzbTIP3CjZ9sshSWV5CwiaX+/a5p45kVsgyVkm+0OP4DxVilyCtjrbbIRJr
	pWiUIv2lgEGKuTOIKuH5f9NAo8pr+AWcychwccBA7NRIYcHLxAze3V82Wix+4Xb/STq+wajnuGA/C
	SWz2uzoYltPDYG9i0Eb8ZSfRW+Z9RJiQ8as1Sx/clur96SHJEG4laTjfFOXe67SRl3zjGGYlCgvCw
	Pqyll7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ududU-00000000Mcd-0m5S;
	Mon, 21 Jul 2025 17:49:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduC9-00000000It1-2BEB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 17:20:58 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 82C482115836;
	Mon, 21 Jul 2025 10:20:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 82C482115836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1753118454;
	bh=F0WeBj2bGuuRDUrwwzYEPFuv3oAaANMb0rzB3x/zEGs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M6lAY38nEFF6SPpxTb0jBP9+abnYKMYir5Krk+urbD9Y4Z3t0/8JxNOMoSNX0fUsO
	 FpNzv3YTYyKxz1aNCxTInjwirrXdr/tAAFV9m67PV5iaHZKfIqy5hqXiBd9RY4hSKN
	 QIvH+QrTMRImtRgveFS0jbwSC3/UPzX3dY5iu3vc=
Message-ID: <55e5f8d2-2b81-4883-a9ac-ad1a426c4222@linux.microsoft.com>
Date: Mon, 21 Jul 2025 10:20:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kvm, smccc: Fix vendor uuid
To: Sudeep Holla <sudeep.holla@arm.com>,
 Jack Thomson <jackabt.amazon@gmail.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, arnd@arndb.de,
 wei.liu@kernel.org, mhklinux@outlook.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maz@kernel.org, oliver.upton@linux.dev, kvmarm@lists.linux.dev,
 roypat@amazon.com, Jack Thomson <jackabt@amazon.com>
References: <20250721130558.50823-1-jackabt.amazon@gmail.com>
 <20250721-proficient-carrot-cockatoo-393ae1@sudeepholla>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250721-proficient-carrot-cockatoo-393ae1@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_102057_597919_B791E61E 
X-CRM114-Status: GOOD (  15.65  )
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



On 7/21/2025 9:15 AM, Sudeep Holla wrote:
> (I can't see this original patch in my mailbox, got only Marc's response)
> 
> On Mon, Jul 21, 2025 at 02:05:58PM +0100, Jack Thomson wrote:
>> From: Jack Thomson <jackabt@amazon.com>
>>
>> Commit 13423063c7cb ("arm64: kvm, smccc: Introduce and use API for
>> getting hypervisor UUID") replaced the explicit register constants
>> with the UUID_INIT macro. However, there is an endian issue, meaning
>> the UUID generated and used in the handshake didn't match UUID prior to
>> the commit.
>>
>> The change in UUID causes the SMCCC vendor handshake to fail with older
>> guest kernels, meaning devices such as PTP were not available in the
>> guest.
>>
>> This patch updates the parameters to the macro to generate a UUID which
>> matches the previous value, and re-establish backwards compatibility
>> with older guest kernels.
>>
> 
> Nice catch. This is result of classic confusion with UUID and GUID especially
> coming from Microsoft who tend to use GUID more.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> This also makes me wonder if the initialisation in arch/arm64/hyperv/mshyperv.c
> is also wrong or may be that's correct only MS guys can confirm as I couldn't
> find the UUID string for that.

MUCH appreciated!! Apologies for that miss in testing of the older
kernels. I'll check on our side and will fix what needs fixing.

> 

-- 
Thank you,
Roman


