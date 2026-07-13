Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE03C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTYK72QIub7H5rUjXxOJPbyZRnScYfhjLkDNFeXCaPw=; b=VR0om5uUJKhNl4M+pvy1UoHbw2
	71dM256nb5+9IHClbpQcyZgTNwA1E1v1GqPBCws8X99HE8y1+gxJzDiQ0RXl7/8+imWQF96180mMt
	9JOPKX5L55NptG7g3VVx5q3iCALJmHgelIfXnRr6Vi91s+RR80QqrrnR6vDif1GL0vnEQ7sQzcMix
	PFGUnpzzUfoEZMlbf4OuTUrsDIdy0Rt0G39bXg97W5xLXjeQ4spyLxZUI2Y537OtHH0UW3gUlSI4m
	BeQ/a9JH/eaclhLLpmOWDsPyGg8A4wqWLollszaRXBiShOxEPMxDWdgWg/0BJZbyp/CfUDcTe67mK
	lrQ7vqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGFq-00000009Gpy-3qwD;
	Mon, 13 Jul 2026 12:59:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGFp-00000009Gpc-0Wsx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:59:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1327C1576;
	Mon, 13 Jul 2026 05:59:20 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AEBE3F93E;
	Mon, 13 Jul 2026 05:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783947564; bh=wcDXfVk32FROq/lsYLAGJRHnaY0Qj6QchI6Y5Vyq/C0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mpoy6yjfXl0ZeCqb5O1TZ4YuxzIzKqDu4hB7IX1z9ziCRBAIkr0gTaXpVbpYMqarj
	 7YCGMjEbRC3yqK/A96DojrSn1xFU7x0teIh6lIPzGTJsD5M/Ar5eX2spERBUL6FNkC
	 P/oUkIQNzx6Dju8nKwEfhzT2t8yJrhn3QLFSvbYM=
Message-ID: <3f3e6dec-9e37-4731-8de1-bd9f3cee9b80@arm.com>
Date: Mon, 13 Jul 2026 13:59:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: perf: Add Arm Bus Monitor Unit
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: will@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1783439341.git.robin.murphy@arm.com>
 <1cd17d9c07e9695e1dffdeaa5409f0a1db8ccb81.1783439341.git.robin.murphy@arm.com>
 <20260713-noble-jade-wapiti-20ba9d@quoll>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260713-noble-jade-wapiti-20ba9d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_055925_219961_B6D0F06A 
X-CRM114-Status: UNSURE (   9.50  )
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

On 13/07/2026 8:26 am, Krzysztof Kozlowski wrote:
> On Thu, Jul 09, 2026 at 08:22:07PM +0100, Robin Murphy wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - label
>> +
>> +additionalProperties: false
> 
> You need an example DTS, unless this is a subdevice and part of other device as
> subschema.

I still fundamentally disagree with the necessity of "validating" my 
ability to understand my own trivial 3-property binding that I wrote, 
but whatever... v2 can have this which I've made up out of thin air 
since I have no real-world reference to hand:

examples:
   - |
     pmu@12340000 {
         compatible = "arm,bus-monitor-unit";
         reg = <0x12340000 0x40000>;
         label = "ddr_ch_1_2";
     };

Thanks,
Robin.

