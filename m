Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9822CC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sOvELaY1aZJTewIgm34TTNGoydZHHQrExKUpRVX1RA=; b=uS1aAXKMgpOnSEZZXEwJtwXDza
	hXKGgVVIZrs6a0YXNN/WTwMWwXKfGFXjxiEM3Bn+YXOk/dHaoJdWaMFWEuIYQIplRAEAszSfJ+1Rs
	IU+6kJq7a3OSJkwvT42OH4hrcOxCwK8P8I28sIWoBYEDOhcvm08hP2TVNtr5ZD8IZm3W6pasx+D7A
	HZ0puw/Amjck4DURWN8UjBY1Z6Woomnr3VfGZMXwRCGphlD260ODMdlIjLaARfR+yaBbPtHynGa2R
	B3GKGHShBCZo6MdcySz6/n6gXlxPFJAajO6M7f7pGeOTn1Hg8exhvCNu7ne4GLaZzk9I1u9yybJwL
	0+GOg5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwZ6-000000059J7-2N4R;
	Tue, 11 Feb 2025 20:09:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thwTR-000000058a7-1FqK;
	Tue, 11 Feb 2025 20:03:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 284F513D5;
	Tue, 11 Feb 2025 12:03:33 -0800 (PST)
Received: from [10.57.35.63] (unknown [10.57.35.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC8EA3F5A1;
	Tue, 11 Feb 2025 12:03:09 -0800 (PST)
Message-ID: <c9f1eced-679b-491e-9014-a1ea14120081@arm.com>
Date: Tue, 11 Feb 2025 20:03:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: disable IOMMU when running rk3588
 in PCIe endpoint mode
To: Niklas Cassel <cassel@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Damien Le Moal <dlemoal@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250207143900.2047949-2-cassel@kernel.org>
 <7996d1ec-6ceb-4d8a-bf03-1911ac5f8f0c@arm.com> <Z6uomtzSVTOmAB8X@ryzen>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z6uomtzSVTOmAB8X@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_120313_433949_CCD98B1E 
X-CRM114-Status: GOOD (  27.49  )
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

On 2025-02-11 7:44 pm, Niklas Cassel wrote:
> Hello Robin,
> 
> On Tue, Feb 11, 2025 at 05:49:29PM +0000, Robin Murphy wrote:
>> On 2025-02-07 2:39 pm, Niklas Cassel wrote:
>>> Commit da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU
>>> on the rk3588 SoC") enabled the mmu600_pcie IOMMU, both in the normal case
>>> (when all PCIe controllers are running in Root Complex mode) and in the
>>> case when running the pcie3x4 PCIe controller in Endpoint mode.
>>>
>>> There have been no issues detected when running the PCIe controllers in
>>> Root Complex mode. During PCI probe time, we will add a SID to the IOMMU
>>> for each PCI device enumerated on the bus, including the root port itself.
>>>
>>> However, when running the pcie3x4 PCIe controller in Endpoint mode, we
>>> will only add a single SID to the IOMMU (the SID specified in the iommus
>>> DT property).
>>>
>>> The enablement of IOMMU in endpoint mode was verified on setup with two
>>> Rock 5b:s, where the BDF of the Root Complex has BDF (00:00.0).
>>>
>>> A Root Complex sending a TLP to the Endpoint will have Requester ID set
>>> to the BDF of the initiator. On the EP side, the Requester ID will then
>>> be used as the SID. This works fine if the Root Complex has a BDF that
>>> matches the iommus DT property, however, if the Root Complex has any other
>>> BDF, we will see something like:
>>> arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x1600 ssid: 0x0
>>> on the endpoint side.
>>>
>>> For PCIe controllers running in endpoint mode that always uses the
>>> incoming Requester ID as the SID, the iommus DT property simply isn't
>>> a viable solution. (Neither is iommu-map a viable solution, as there is
>>> no enumeration done on the endpoint side.)
>>
>> Well, strictly the controller should own all the StreamIDs it's capable of
>> emitting - if that's just one per possible bus number (as the iATU
>> FUNC_NUM/FUNC_BYPASS stuff appears to suggest?) then 256 "iommus" entries
>> isn't *entirely* unmanageable. If it were to support being arbitrary (or
>> multiple) devices/functions, though, then we probably would want to look for
>> a different solution, because nobody wants a 512KB DT property... :)
> 
> Well, FUNC_BYPASS and FUNC_NUM is in the IATU_REGION_CTRL_1_OFF_OUTBOUND_i
> register, so it is for outbound PCI TLPs, not inbound PCI TLPs.
> (Only inbound PCI TLPs will get sent to the IOMMU after passing the iATU).
> 
> There is FUNC_NUM in IATU_REGION_CTRL_1_OFF_INBOUND_i register, but it has
> a different meaning. (An inbound PCI TLP will only get translated if the
> FUNC_NUM matches the value in this register).
> (This check is only performed if the "Function Number Match Enable" bit
> of the "iATU Region Control 2 Register" is set.)

Sigh, the "i" in iATU doesn't stand for "inbound", does it... major 
brain fart there.

> The SMMU on the rock5b, when running the PCIe controller in endpoint mode,
> has printed the following:
> arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x1600 ssid: 0x0
> but also:
> arm-smmu-v3 fc900000.iommu: event: C_BAD_STREAMID client: (unassigned sid) sid: 0x20 ssid: 0x0

Yeah, that one pretty much settles it - we can certainly expect host 
root ports with nonzero device numbers, so that's at least 13 bits of 
the StreamID space to cover, which isn't going to fly.

> depending on which host system we had connected to it.
> 
> So I'm a bit worried that 256 "iommus" entries will not be enough.
> 
> I don't have any idea on how to solve this, but right now I don't see any
> other option but to disable the IOMMU when running the PCIe controller in
> endpoint mode.

Agreed; FWIW, for the patch as it is:

Acked-by: Robin Murphy <robin.murphy@arm.com>

> (We have no issues when running with the iommu enabled when running the PCIe
> controller(s) in Root Complex mode.)
> 
> 
> Kind regards,
> Niklas


