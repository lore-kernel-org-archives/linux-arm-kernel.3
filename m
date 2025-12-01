Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB1D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaD1K4Evjw49bakP8J08eW3wnxJvfeVv0cmhmrAczos=; b=mYFvkGz6DgjQh6qN6EQR7J4UO6
	9xUx5nFbbhK+2A9RacO8XOEMsMV1HZCUSx9IsSj1PtqdiMK9IjucrtcUFFS80X1JLdPPjokWwOfau
	XLCaK09/sZWVM5L+IKpG5RQ7FtIalX0yZRgWgg1ZeAwe381GBT0iaRe06ADoT5gU0pZaHeSINiMFi
	Y4Wm/tnHqQ0UjMWjEmCBhCJ2fg9qKLip+ddBf85ZYgTPhCJAoH7JgvjGVeLFC2ArcEnfqBaGUjUMc
	b73LgKBeGGQcT1ieoeCg+PjK0HMPXFPaN6ur2HO3PH7kT6FCO6mS8TkCbb0Pvh+Zc6uJPqDkQn3B7
	JAa+wFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4eO-000000043wq-33AR;
	Mon, 01 Dec 2025 14:13:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4eL-000000043w8-298N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 14:13:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13DE6153B;
	Mon,  1 Dec 2025 06:12:59 -0800 (PST)
Received: from [10.57.88.78] (unknown [10.57.88.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76F723F73B;
	Mon,  1 Dec 2025 06:13:03 -0800 (PST)
Message-ID: <b66e1993-fe07-4826-9bf4-728e640ccacd@arm.com>
Date: Mon, 1 Dec 2025 14:13:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] arm64: dts: nvidia: Add nodes for CMDQV
To: Ashish Mhetre <amhetre@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 will@kernel.org, joro@8bytes.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolinc@nvidia.com
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, jgg@ziepe.ca,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20251125071659.3048659-1-amhetre@nvidia.com>
 <20251125071659.3048659-4-amhetre@nvidia.com>
 <dff3a962-82dd-4aac-ae11-69f0e95ba04d@nvidia.com>
 <acae92d8-3394-436c-be8e-8bed7a923e85@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <acae92d8-3394-436c-be8e-8bed7a923e85@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_061309_584903_2F302096 
X-CRM114-Status: GOOD (  14.63  )
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

On 2025-12-01 9:36 am, Ashish Mhetre wrote:
> 
> On 11/25/2025 3:52 PM, Jon Hunter wrote:
>>
>>
>> On 25/11/2025 07:16, Ashish Mhetre wrote:
>>> The Command Queue Virtualization (CMDQV) hardware is part of the
>>> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
>>> virtualizing the command queue for the SMMU.
>>>
>>> Update SMMU compatible strings to use nvidia,tegra264-smmu to enable
>>> CMDQV support. Add device tree nodes for the CMDQV hardware and enable
>>> them on the tegra264-p3834 platform where SMMUs are enabled. Each SMMU
>>> instance is paired with its corresponding CMDQV instance via the
>>> nvidia,cmdqv property.
>>>
>>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>>> ---
>>>   .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 +++
>>>   arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 55 +++++++++++++++++--
>>>   2 files changed, 58 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/ 
>>> arm64/boot/dts/nvidia/tegra264-p3834.dtsi
>>> index 06795c82427a..375d122b92fa 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
>>> @@ -26,5 +26,13 @@ iommu@5000000 {
>>>           iommu@6000000 {
>>>               status = "okay";
>>>           };
>>> +
>>> +        cmdqv@5200000 {
>>> +            status = "okay";
>>> +        };
>>
>> This needs to be ordered in the file according to its address.
> 
> Hi Jon, Thanks for the review.
> cmdqv nodes follow same ordering as its corresponding iommu nodes.
> I have added them immediately after corresponding iommu nodes.
> Can you please check and see if it's fine? Same applies to your
> similar comments below as well.

It's fairly standard practice to order DT nodes by unit address where 
applicable (and alphabetically by node name otherwise). The platform 
maintainers aren't necessarily familiar with the intended usage of every 
individual node when they have to resolve merge conflicts etc., so 
maintaining a straightforward consistent pattern is generally easier for 
everyone.

Thanks,
Robin.

