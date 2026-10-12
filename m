Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD283CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcx3g0NwEzlW9ix0sXkF7x69h6a98zhGM+hCucC5VEQ=; b=EMBGxpaleS9fbbOvJijyauKQ0x
	epOqJBq1pOTuzkNWrM4fB0KpYKzNlooaZBjIdjEPfjFo8+VqmSwUXPM5FvMZEiyBWXIw0NQaEw3OY
	981xNHywrSXuWrN2fQov5fNsvrtRiol9w6stHSVuw8WAKm23bdLvuOGsRdhZE/pLiRSlKgBbvtcAZ
	/QEqDFEBacVLyBDbVRu3IF9msan8yDzHNQhQ9NV2zDBweU7GuFjZZ4pYcOWlO5RNGYHvXVM9XXxpF
	1QDf19960d5k7MuHZ1WlL2a4wSk55GrXaMxDfyIZ0s78M2sfjzAjpT715hhMPwP19VWum2+goddGe
	ifrDMFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGECF-0000000ALhn-2DYr;
	Mon, 12 Oct 2026 11:27:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGECD-0000000ALhP-2tiM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:27:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B541655;
	Mon, 12 Oct 2026 04:27:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 322763F882;
	Mon, 12 Oct 2026 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791804476; bh=kQCByoVaggjb/UJQTAgFLZ8KUS15fDOUT2X+RgYa5nA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SXpM18GiGGokjVzFN66yDXwWffYyU+nyainbUrdvXUhlxb/5aoBKR/zu1Wk8q9m2K
	 BHJ6rVAmAhbWMus8lqcJ0+VVvuk0vEtCafbmbvQJ8h2GnIS+NnuRL9si8p2j3MjayM
	 3q0Q0Cr4YzezOswbyFk4QWwLY461WGXHjKeRMcmQ=
Message-ID: <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Date: Mon, 12 Oct 2026 12:27:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Drew Fustini <fustini@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_042757_811967_8C1E6069 
X-CRM114-Status: GOOD (  14.99  )
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

Hi Yin,

On 12/10/2026 11:48, Yin Li wrote:
> 
> 
> On 10/9/2026 5:00 AM, Rob Herring wrote:
>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>> directly under its L2 cache node so that the cache node is the MSC's
>>> parent device and its CPU affinity is derived from that cache.
>>>
>>> The L2 cache nodes are placed directly under the root node. The root is
>>> the root of the physical address space, so each cache node only needs an
>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>> a physical address. The two caches use distinct node names (l2-cache-0
>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>
>>> The nodes are disabled by default. Production firmware does not expose
>>> MSC register access to the OS, so these nodes can only be enabled on a
>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>> This DTS is therefore only an example for other platform DT authors and
>>> is not intended to be merged.
>>>
>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>   1 file changed, 38 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi

[...]

> 
>>> +
>>> +        msc@19870000 {
>>> +            compatible = "arm,mpam-msc";
>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>
>> The MPAM register length is 0x321C.
>>
> 
> You are right, the MPAM register space is 0x321c per the specification.
> Will update accordingly.

That is the full extent but truncation is allowed by the architecture.

Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.

Does your implementation have domains?

Thanks,

Ben


> 
> Thanks,
> Yin
> 
>> Rob
> 


