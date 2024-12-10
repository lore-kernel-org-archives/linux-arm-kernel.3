Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5560E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR2mdtTaoSEy+8fSRGvh/KqzQFMgidQP+WKmP5iDzus=; b=CS8psRSvdBEMC98omhFsWMli75
	yyKqjKyAGUpUGbW50vbVMmIicDkrB4TGEPL9Bk5ZIFe+9jTBXiZX/TsB3TAW5SG5eyWUfIIcoRNXg
	4sPsN/uxD5DKp/MWMQbNvAREdwlfBQcopXfePzBQ+pwsCSPPOq7//fj9u2hGV39sXxSIM7BgCSW/R
	YvS4ek6GKhgs3hHPSMOaNnBF8b+aq7rmUBTII7mNPK2uv3ni0VjUJVtlMCg01uIEpxDo08d60zowH
	TE5WVOiJefgpbl4i0AOstsaODP0Sal9JksvVTGZ5DYlQAVDCoyD2WeurkPcpnlN5m/MxeTKF7VZUq
	tMIN+YMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpEO-00000009rOz-1NFV;
	Tue, 10 Dec 2024 01:40:08 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpDK-00000009rFW-2CbI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 01:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733794738; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=BR2mdtTaoSEy+8fSRGvh/KqzQFMgidQP+WKmP5iDzus=;
	b=kyuBoOg2zwbob9EbO3IAPw+fXVmI1FNzg2IpY+2D1X4Y/uKQ0jAvRIjsbkYNf7L03tp0zLLiGAokmhKX/1D/zuEUu9vmwoLmt7tGoA11dkh3uPoRdMZSjkZ529KggZgiKtfd3+caR3plIXA+aS0HqL/kr7EqczZjibMZ/lydC2Y=
Received: from 30.166.1.177(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WLCyrkm_1733794735 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Dec 2024 09:38:56 +0800
Message-ID: <5139818d-8e1b-44ff-bfb4-18a1aca8afed@linux.alibaba.com>
Date: Tue, 10 Dec 2024 09:38:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/5] drivers/perf: add DesignWare PCIe PMU driver
To: Bjorn Helgaas <helgaas@kernel.org>, Will Deacon <will@kernel.org>
Cc: ilkka@os.amperecomputing.com, kaishen@linux.alibaba.com,
 yangyicong@huawei.com, Jonathan.Cameron@huawei.com,
 baolin.wang@linux.alibaba.com, robin.murphy@arm.com,
 chengyou@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 rdunlap@infradead.org, mark.rutland@arm.com, zhuo.song@linux.alibaba.com,
 renyu.zj@linux.alibaba.com
References: <20241209224741.GA3206765@bhelgaas>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20241209224741.GA3206765@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173902_984900_C18E8D3B 
X-CRM114-Status: GOOD (  14.49  )
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



在 2024/12/10 06:47, Bjorn Helgaas 写道:
> On Mon, Dec 09, 2024 at 03:40:16PM +0000, Will Deacon wrote:
>> On Fri, Dec 06, 2024 at 10:54:57AM -0600, Bjorn Helgaas wrote:
>>> On Fri, Dec 08, 2023 at 10:56:51AM +0800, Shuai Xue wrote:
>>>> This commit adds the PCIe Performance Monitoring Unit (PMU) driver support
>>>> for T-Head Yitian SoC chip. Yitian is based on the Synopsys PCI Express
>>>> Core controller IP which provides statistics feature. The PMU is a PCIe
>>>> configuration space register block provided by each PCIe Root Port in a
>>>> Vendor-Specific Extended Capability named RAS D.E.S (Debug, Error
>>>> injection, and Statistics).
>>>
>>>> +#define DWC_PCIE_VSEC_RAS_DES_ID		0x02
>>>
>>>> +static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
>>>> +	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
>>>> +	{} /* terminator */
>>>> +};
>>>
>>>> +static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
>>>> +{
>>>> +	const struct dwc_pcie_vendor_id *vid;
>>>> +	u16 vsec;
>>>> +	u32 val;
>>>> +
>>>> +	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
>>>> +		return false;
>>>> +
>>>> +	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
>>>> +		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
>>>> +						DWC_PCIE_VSEC_RAS_DES_ID);
>>>
>>> This looks wrong to me, and it promotes a misunderstanding of how VSEC
>>> Capabilities work.  The VSEC ID is defined by the vendor, so we have
>>> to check both the Vendor ID and the VSEC ID before we know what this
>>> VSEC Capability is.
>>
>> Thanks for pointing this out! The code's been merged for a while now,
>> so we'll need to fix what we have rather than revert it, I think.
> 
> Yep, for sure.
> 
>> Any chance you could send a patch with those, please? I'm also not able
>> to test this stuff, but I'm sure Ilkka would help us out.
> 
> Posted at https://lore.kernel.org/linux-pci/20241209222938.3219364-1-helgaas@kernel.org
> 
> Bjorn

Hi, Bjorn and Will,

Thanks for pointing this out and fix it so quickly, I will also test this patch
on our platform later.

Best Regards,
Shuai



