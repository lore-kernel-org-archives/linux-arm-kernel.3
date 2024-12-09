Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ECCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8WWOcaQASX+3jJQLgEK7FH9yQNyk5gvheR7425uRTE=; b=Z3LJlIp4KPtaH4bKJ7mE6HD/4R
	n8XeNODhOg7WB0/QeFYyUs2jnB9NcxJayriu3lYxPVsKuJFbaBG59bbwpSY8IizTCek3l3KWAARD/
	HNr3LUEOuBtvEBWhboVfVvLgHLx3lQJfWui9DY3u2THkAxOM3pGR99593yqp09c6huZBX1kD67gtT
	3+lWUziRfc5etBR7Mej5OGrN+T88m7qSe9/vTdvLwfQQ4Z1uEV5oe+5As6y7obUKjZbCk4hETK9M2
	PBR8AFUDGdbOzR+K2yQ5daaAfe9a5Jqn5cnnIJkCwKMJp7frlN2fJd7Z3s0A+/RJ4TRtf1zyXoukG
	zOey8fHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKftX-00000008Q7t-14F0;
	Mon, 09 Dec 2024 15:41:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfrz-00000008Pqd-3gkF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25320A41778;
	Mon,  9 Dec 2024 15:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCA1C4CEDD;
	Mon,  9 Dec 2024 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733758822;
	bh=NXv2kZ+6ea8xYm0jQ8k8JDr041Cwb8mryXemzF+bjlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fdx6g1ojyc0L2SkxZDCTO002TVnWmRHi2OTGtVQUTYCnm5t7DqW3R973eYt6YB+CE
	 4+D5iQcF1CPusPEkIL7gMYMQ6OxfKQkB/EaFfBaTEm9yhGCO9EQKCJ3WEw5A4ywqbk
	 CVDP2H7AUD4lfGXJPs/Ydmoy0RVnQwfH6rBbqNs9Aw1AM2cbMOyW68QL/z9Zmlgvlm
	 jixnZLjQF+PdlyNJTEuUX2XgNLxdeZ6TBUYV1ri0UyC+XhhnqjOWEoVuPwuK9aWoNv
	 OuHkWmK8jJT0u0gd2mMAv8LmeYOCoKrbYTIf8WT/mPcFH7GWKwq4Aq/44r7pZp/7gR
	 2sQ5F3I6SaS2g==
Date: Mon, 9 Dec 2024 15:40:16 +0000
From: Will Deacon <will@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, ilkka@os.amperecomputing.com,
	kaishen@linux.alibaba.com, yangyicong@huawei.com,
	Jonathan.Cameron@huawei.com, baolin.wang@linux.alibaba.com,
	robin.murphy@arm.com, chengyou@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, rdunlap@infradead.org,
	mark.rutland@arm.com, zhuo.song@linux.alibaba.com,
	renyu.zj@linux.alibaba.com
Subject: Re: [PATCH v12 4/5] drivers/perf: add DesignWare PCIe PMU driver
Message-ID: <20241209154015.GA12428@willie-the-truck>
References: <20231208025652.87192-5-xueshuai@linux.alibaba.com>
 <20241206165457.GA3101599@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206165457.GA3101599@bhelgaas>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_074024_051638_28E3AE34 
X-CRM114-Status: GOOD (  24.67  )
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

Hi Bjorn,

On Fri, Dec 06, 2024 at 10:54:57AM -0600, Bjorn Helgaas wrote:
> On Fri, Dec 08, 2023 at 10:56:51AM +0800, Shuai Xue wrote:
> > This commit adds the PCIe Performance Monitoring Unit (PMU) driver support
> > for T-Head Yitian SoC chip. Yitian is based on the Synopsys PCI Express
> > Core controller IP which provides statistics feature. The PMU is a PCIe
> > configuration space register block provided by each PCIe Root Port in a
> > Vendor-Specific Extended Capability named RAS D.E.S (Debug, Error
> > injection, and Statistics).
> 
> > +#define DWC_PCIE_VSEC_RAS_DES_ID		0x02
> 
> > +static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
> > +	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
> > +	{} /* terminator */
> > +};
> 
> > +static bool dwc_pcie_match_des_cap(struct pci_dev *pdev)
> > +{
> > +	const struct dwc_pcie_vendor_id *vid;
> > +	u16 vsec;
> > +	u32 val;
> > +
> > +	if (!pci_is_pcie(pdev) || !(pci_pcie_type(pdev) == PCI_EXP_TYPE_ROOT_PORT))
> > +		return false;
> > +
> > +	for (vid = dwc_pcie_vendor_ids; vid->vendor_id; vid++) {
> > +		vsec = pci_find_vsec_capability(pdev, vid->vendor_id,
> > +						DWC_PCIE_VSEC_RAS_DES_ID);
> 
> This looks wrong to me, and it promotes a misunderstanding of how VSEC
> Capabilities work.  The VSEC ID is defined by the vendor, so we have
> to check both the Vendor ID and the VSEC ID before we know what this
> VSEC Capability is.

Thanks for pointing this out! The code's been merged for a while now,
so we'll need to fix what we have rather than revert it, I think.

[...]

> I think the table should be extended to contain the Vendor ID, *and*
> the VSEC ID, *and* the VSEC Rev used by that vendor, i.e., it should
> look like this:
> 
>   struct dwc_pcie_pmu_vsec {
>     u16 vendor_id;
>     u16 vsec_id;
>     u8 vsec_rev;
>   };
> 
>   struct dwc_pcie_pmu_vsec dwc_pcie_pmu_vsec_ids[] = {
>     { .vendor_id = PCI_VENDOR_ID_ALIBABA,
>       .vsec_id = DWC_PCIE_VSEC_RAS_DES_ID, .vsec_rev = 0x4 },
>     { .vendor_id = PCI_VENDOR_ID_AMPERE,
>       .vsec_id = DWC_PCIE_VSEC_RAS_DES_ID, .vsec_rev = 0x4 },
>     { .vendor_id = PCI_VENDOR_ID_QCOM,
>       .vsec_id = DWC_PCIE_VSEC_RAS_DES_ID, .vsec_rev = 0x4 },
>     {}
>   };
> 
> This *looks* the same, but it's not, because it makes it obvious that
> the VSEC ID and VSEC Rev are defined separately by each vendor.  It's
> just a lucky coincidence that they happen to be the same for these
> vendors.

[...]

> I suggest updating dwc_pcie_match_des_cap() to iterate through the
> dwc_pcie_pmu_vsec_ids[] table and return the capability offset so you
> can call it from here.

Any chance you could send a patch with those, please? I'm also not able
to test this stuff, but I'm sure Ilkka would help us out.

Cheers,

Will

