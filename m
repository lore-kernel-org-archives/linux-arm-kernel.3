Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D3C79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAb9H6PboC1iB7CxS1P1uaGviy58ws+pZ0PmE+nPja0=; b=YugbI9dYHpqTAN5XPclYBITlVp
	cjK0q1Kv63igaHqFaxQLATnd+lSldc3HwVj5xmZo6e4GPcob2RGfUHlJ38o8aA6nAlFa8oXI9CsU2
	mzYBdgIV4OwiEvrPS5ZV8z7ZYsaq8uB8EYBDYlfwddAW9FASLKrgK2ndJs+Q8rXxJnk4zvodLb66Q
	AlTxt5Aav82ndE8CY4NYe0scpDfjsHYdjaN/s5fmJorsVwNdf3SCW/MzH3z544ghop9SdXjj6Ltyu
	/TfZp5sCtjSyHULAvDP+3k9bPTG9O573o/h45qYeWRx3PQc+FtszQrkXCzwsOUT/BtGOB/+BD8Aim
	1P4dacDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnx0-0000000BmBi-1lqa;
	Mon, 05 Jan 2026 17:01:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnwy-0000000BmAy-0m8B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:01:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC344339;
	Mon,  5 Jan 2026 09:00:51 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C06A03F5A1;
	Mon,  5 Jan 2026 09:00:56 -0800 (PST)
Message-ID: <819a6bf5-438d-44ae-a730-77252e92080b@arm.com>
Date: Mon, 5 Jan 2026 17:00:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] KVM: selftests: arm64: Skip all 32 bit IDs when
 set_id_regs is aarch64 only
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Oliver Upton <oupton@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
 <20251219-kvm-arm64-set-id-regs-aarch64-v3-4-bfa474ec3218@kernel.org>
 <363e440d-4e29-4286-ade4-b4be2f856859@arm.com>
 <90fb25bd-fa79-4980-902b-497346a3e6d5@sirena.org.uk>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <90fb25bd-fa79-4980-902b-497346a3e6d5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_090100_265443_C131200A 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Mark,

On 1/5/26 16:45, Mark Brown wrote:
> On Fri, Jan 02, 2026 at 02:50:07PM +0000, Ben Horgan wrote:
>> On 12/19/25 19:28, Mark Brown wrote:
> 
>>> +			if (aarch64_only && sys_reg_CRm(reg_id) < 4) {
>>> +				ksft_test_result_skip("%s value seen in guest\n",
>>> +						      get_reg_name(reg_id));
>>> +				break;
>>> +			}
>>> +
> 
>> Unnecessary? The decision for which regs are testing is made in
>> guest_code().
> 
> The guest code has a fixed list of registers it reads blindly and we
> skip the write for these so our expected value won't be something we
> explicitly set.  The actual test is done here in the host code and it
> seems both more maintainable to keep the skip adjacent to the live test
> and clearer to be more explicit about nothing actually being tested.

Thanks for the explanation, it seems like a sensible decision.

Ben


