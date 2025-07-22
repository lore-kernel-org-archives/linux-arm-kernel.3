Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3CCC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zlU1QEnD+GWl8jLtn5YK4PZ5fpcfWzBw9uHGSBFh90=; b=XJND6yiE/sMfA1ufsGyQVYYx0q
	VmFixVo7qHe79g3nEUf+Cis62XpXccr5yqZCeyoW932ghRI6auZKoYds6vLrF/zEdszjp8fbdFNSD
	t83VWA25bjs6Re8QBIZ/hVa5obsE2CvEk/tx31oRf0QYA9tO5kPqz4kiDG+/rbr5JXCW/UMKrhj3Z
	y3t390Q8aHI7eh0yBLB9mgU8jIaIUmQqaIblF8pj9hfc3oHUB9eHH8CUxiskpkT989QMHS+wOvrxd
	764VUexmACU0myPO6Og2Hxj41mhnEzwhHVhmmphNs2hc5EVIBNQQV5GECfwRb7w1PRBPorGRfdJcz
	RWyqyxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7c8-00000001hmt-2HYJ;
	Tue, 22 Jul 2025 07:40:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Ze-00000001hHQ-0nrN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 07:38:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0zlU1QEnD+GWl8jLtn5YK4PZ5fpcfWzBw9uHGSBFh90=; b=eibaBKwUqWBKDv+Pr4/R9KiOCP
	VwcBWjShe8CaXzqygJ96UpxY3YGN0aayoIwXStiejcJ2qkecDySy7nr7jyCPHws4+ItGL/JzA1iJA
	I6oLMcV3XQYkagT61bltjJK1PyF2D7iqJDljKbevR+s7oFJ7tv4GYapF8qBoOXTTP6SUJ3MGv3toh
	zQxQ12RcnSMvKdDQHv2wOSbrfkADnIypOsn0uvGrobSYADtpKFpavzzM5jVIbefksZgxD2tgErdaY
	b2Tnh0JUo/NGRUajOJ1nz6WlS53h65Ynm+cZyCT7oNutZAioXu7zayEjd2wzUsW+YGX+cedx0WEmp
	MrXORFgA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7Za-0000000BE9f-1bGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 07:38:05 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7YcI1017113;
	Tue, 22 Jul 2025 09:37:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	0zlU1QEnD+GWl8jLtn5YK4PZ5fpcfWzBw9uHGSBFh90=; b=6eOnM2juSbRcr0EU
	IFyVZkojXeQ6Q+YR1EBl3sKBCrityklC8iGDAreH+nVxIlQpGGJ1de2LWFwc4l+l
	GHdzI1aEcjrUG02EEdibktt04EsuROdoHalxZc6A/VFGiV2d32zsW/LP3ZkEoX8L
	ed7/sijJ7vkE5DhE2qQgYCwZk7ehjOBdHFYiVBGxRKng/BGeMgMSFprH5ze62kZr
	rdI9euM21E3mDHLQTqM0HE2BU2fY7b1L1YSL/0CRLPYRX5Nqjz+RIPRaUovQk6Au
	arroznHHnk0RY1lQ6URTxAejKDuzunNFX2iACfiTmpBsv3BZltL9HBZqRv3WTZUo
	DVCk5Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 480mx4hq09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 09:37:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 571CB4005B;
	Tue, 22 Jul 2025 09:36:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1132476DC2F;
	Tue, 22 Jul 2025 09:35:09 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 09:35:07 +0200
Message-ID: <ed0efd83-8471-4fce-9745-54d85d6268f9@foss.st.com>
Date: Tue, 22 Jul 2025 09:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] dt-bindings: memory: add jedec,ddr[3-4]-channel
 binding
To: Rob Herring <robh@kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-5-cdece720348f@foss.st.com>
 <20250721200926.GA1179079-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250721200926.GA1179079-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_083803_060941_4C812130 
X-CRM114-Status: GOOD (  21.16  )
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

Hi Rob,

On 7/21/25 22:09, Rob Herring wrote:
> On Fri, Jul 11, 2025 at 04:48:57PM +0200, Clément Le Goffic wrote:
>> Introduce as per jedec,lpddrX-channel binding, jdec,ddr[3-4]-channel
>> binding.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   .../memory-controllers/ddr/jedec,ddr-channel.yaml  | 53 ++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
>> new file mode 100644
>> index 000000000000..31daa22bcd4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr-channel.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: DDR channel with chip/rank topology description
>> +
>> +description:
>> +  A DDR channel is a logical grouping of memory chips that are connected
>> +  to a host system. The main purpose of this node is to describe the
>> +  overall DDR topology of the system, including the amount of individual
>> +  DDR chips.
>> +
>> +maintainers:
>> +  - Clément Le Goffic <legoffic.clement@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - jedec,ddr3-channel
>> +      - jedec,ddr4-channel
>> +
>> +  io-width:
>> +    description:
>> +      The number of DQ pins in the channel. If this number is different
>> +      from (a multiple of) the io-width of the DDR chip, that means that
>> +      multiple instances of that type of chip are wired in parallel on this
>> +      channel (with the channel's DQ pins split up between the different
>> +      chips, and the CA, CS, etc. pins of the different chips all shorted
>> +      together).  This means that the total physical memory controlled by a
>> +      channel is equal to the sum of the densities of each rank on the
>> +      connected DDR chip, times the io-width of the channel divided by
>> +      the io-width of the DDR chip.
>> +    enum:
>> +      - 8
>> +      - 16
>> +      - 32
>> +      - 64
>> +      - 128
> 
> This is duplicating what's in jedec,lpddr-channel.yaml. Refactor or add
> to it rather than duplicating.

Yes I wanted something unique as "jedec,lpddr-channel.yaml" is 
specifically for lpddr.
I think I'll refactor and rename it "jedec,memory-channel.yaml" so it is 
more generic.

> Is there some reason regular DDR3/4 doesn't have ranks? I'm pretty sure
> it can...

Yes it does but I wasn't needing it and they are not required in case of 
lpddr. It will be fixed by refactoring jedec,lpddr-channel.yaml binding.

Best regards,
Clément




