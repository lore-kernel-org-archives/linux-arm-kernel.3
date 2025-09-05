Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AECCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifEmDZV2kRYkcKBuyELvCClfwZcqzO0o4xpts/GJUhw=; b=cYDmVnRfByw7lWPByLKqultCfS
	CiJKejPsUEp0Ge0LNRbbbl4CgbWsC36fy3V2CCNBvwctMCnsVHmVDSsYtGJFDFTZhL8jhEGbpS8Y3
	K7FXqEA3WC+OGjVzf6hIqMJN/Dq8KU6alD7LUKGdXVkWLcJU3EL21dBgtncLN1tl/B6ypiJva4a7A
	iLXy7CaBwuu/kWQyqxvkIHOPsNTbxhu7hIsFgqRbOxuOC0BbKelBRcRdhA9cTVZ6A07l8DACFYzyM
	4wFQ1lKRz48A0nhyEgU/VGsgVCGhM9ktnvOWyheNNwVZBUGDg1envFcZZ9ph88TTnIc8C8CdBdX96
	+VN/hr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXM-00000005V5g-2IM8;
	Sat, 06 Sep 2025 00:12:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubYH-00000003w3H-3N2U
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Sep 2025 18:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ifEmDZV2kRYkcKBuyELvCClfwZcqzO0o4xpts/GJUhw=; b=NMI2KjMF75wwv8Js/O+3MiYX6Q
	ZY8U8t44LWyIQssC+Q5H660zNjBqtkXyZI7nANgKpTWdXWTKPF0JQB2vCZXh6en4dxZ3U/MK1IyKg
	XQB1lWBetbsBEd24hbKW377HJxuf48VXgsNR26KPyfN/tH2B/8CZ/WKtIB+NSYA0eTdqkUMWT3nJB
	M7IE0+0UxLlnrv1+aXrEmdIEgRYqvcQpR/boSCAZT3Py7nGAC0YXjKAWLtvBWsvO9YzdPUTBBCbD9
	q3zEEZKiMCmRmKGw5XqLp7+4Nys3AuD1Wu29nnhGyJtFBaWAlpsoNv78EZjn6YX94RvUpqpSdWgQi
	357Ik5sA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubYE-00000004fov-2f4q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 18:52:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E1241BC0;
	Fri,  5 Sep 2025 11:52:35 -0700 (PDT)
Received: from [10.1.197.69] (unknown [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28DB93F6A8;
	Fri,  5 Sep 2025 11:52:38 -0700 (PDT)
Message-ID: <d4aa5d0d-da66-4350-a9e1-ce7fb39f2961@arm.com>
Date: Fri, 5 Sep 2025 19:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-11-james.morse@arm.com>
 <CAL_JsqKUSJjmyj-E6eduZt3S=x6v7VUR5JEJV_Ow6O-O49TgEg@mail.gmail.com>
 <CAL_JsqJDpEHBcWeCqxSiUjpyBs0gEJKVyyR70xJO56x-pYQHMw@mail.gmail.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <CAL_JsqJDpEHBcWeCqxSiUjpyBs0gEJKVyyR70xJO56x-pYQHMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_195246_924543_1032F2D5 
X-CRM114-Status: GOOD (  12.97  )
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

On 27/08/2025 17:16, Rob Herring wrote:
> On Wed, Aug 27, 2025 at 10:39 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Aug 22, 2025 at 10:32 AM James Morse <james.morse@arm.com> wrote:
>>>
>>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may
>>> only be accessible from those CPUs, and they may not be online.
>>> Touching the hardware early is pointless as MPAM can't be used until
>>> the system-wide common values for num_partid and num_pmg have been
>>> discovered.
>
> [...]
>
>>> +static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
>>> +{
>>> +       int err, num_ris = 0;
>>> +       const u32 *ris_idx_p;
>>> +       struct device_node *iter, *np;
>>> +
>>> +       np = msc->pdev->dev.of_node;
>>> +       for_each_child_of_node(np, iter) {
>>
>> Use for_each_available_child_of_node_scoped()
>>
>>> +               ris_idx_p = of_get_property(iter, "reg", NULL);
>>
>> This is broken on big endian and new users of of_get_property() are
>> discouraged. Use of_property_read_reg().
>
> Err, this is broken on little endian as the DT is big endian.
>
> So this was obviously not tested as I'm confident you didn't test on BE.

'not tested' is shades of grey. I fed the FVP ~6 different DTB files to hit the different
paths through the driver. The FVP only has controls under RIS-0, so all of those only
defined RIS-0, and unsurprisingly didn't notice the helper isn't endian safe.


Thanks,

James

