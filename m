Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D832BF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 14:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D55HdNBFgogkbxZ9B6R/xFqNQaywSSEdDJEMT48Flw=; b=nfe4+hhtU2KiM1L+l+6Oo2ohr3
	uiXVbxDP5yQlW0Z9iftl1vnmQqi+DHhg4tF/MBEsxOCUoa9yb21F+8YMdOwECdmylxiEi4ZYOAwQq
	WWvWhcUJcvfrQZtoyWWUbUYLvQ9NmQS5A5nDvcT2kqWn88ZeT8bsui8t20PG159gBRLMMPx6HWfxe
	Me0PG9+cABpwfM8mNoQIxx5lHGAKiVIe/ubrD0va+kqakB22Ctl5cdpydsc2Rk9OsJhjLmTuuHs0Z
	MujDvxvyPf4vZ/hIxvWP4ECYVUqD9aVt30uYJbMSsoWrOcEmDW1E9gkCLVf7fhuLgvf5vrVcXADwp
	lv4D4Atg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rRg-0000000A1yu-02Ol;
	Sun, 29 Mar 2026 14:48:56 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rRO-0000000A1v3-27HP;
	Sun, 29 Mar 2026 14:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=6D55HdNBFgogkbxZ9B6R/xFqNQaywSSEdDJEMT48Flw=;
	b=F7yvNXzLWcYYggmho/921Cdsj6BQqjQJgBSJHBEj4Vw9puKVQlnetagQ5l37K3
	8ux/HqhEJB2aARWpwEBywajYM6gLq9/+4k1oxuO6opefsdSeHpQCrA3AzY1QeNfG
	Klrgdk9QPyY/3nPqdQs2t6q70aBKgd0j18K2DHtpBNzRQ=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnr9J+O8lpUdKTCA--.51946S2;
	Sun, 29 Mar 2026 22:47:27 +0800 (CST)
Message-ID: <fbff8f2a-f4a9-4e06-b5ae-cfb554e73664@163.com>
Date: Sun, 29 Mar 2026 22:47:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] PCI: of: Remove max-link-speed generation
 validation
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
 kwilczynski@kernel.org, bhelgaas@google.com, florian.fainelli@broadcom.com,
 jim2101024@gmail.com, robh@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 shawn.lin@rock-chips.com
References: <20260327164250.GA1513325@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260327164250.GA1513325@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wCnr9J+O8lpUdKTCA--.51946S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFyDCr18WF1UtFyfJr4rGrg_yoW5WrWDpa
	y2kF40vry0qr43Xr4DX3W5Z3WYq3ZxurWjyryFg3s7Z3ZxCrsxXFyIvayFqF9Ikrsxury2
	qF12qF4akFW7AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7fHbUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AC7X2nJO4BGqwAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_074839_025244_31CFDCFF 
X-CRM114-Status: GOOD (  17.20  )
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



On 3/28/26 00:42, Bjorn Helgaas wrote:
> On Sat, Mar 14, 2026 at 12:55:17AM +0800, Hans Zhang wrote:
>> Hi,
>>
>> This series moves the validation from the common OF function to the
>> individual PCIe controller drivers.  To protect against out-of-bounds
>> accesses to the pcie_link_speed[] array, we first introduce a helper
>> function pcie_get_link_speed() that safely returns the speed value
>> (or PCI_SPEED_UNKNOWN) for a given generation number.
>>
>> Then all direct uses of pcie_link_speed[] as an array are converted to
>> use the new helper, ensuring that even if an invalid generation number
>> reaches those code paths, no out-of-bounds access occurs.
>>
>> For several drivers that read the "max-link-speed" property
>> (pci-j721e, brcmstb, mediatek-gen3, rzg3s-host), we add an explicit
>> validation step: if the value is missing, out of range, or unsupported
>> by the hardware, a safe default is used (usually Gen2). Other drivers
>> (mainly DesignWare glue drivers) rely on the helper to safely handle
>> invalid values, but do not yet include fallback logic or warnings.
>>
>> Finally, the range check is removed from of_pci_get_max_link_speed(),
>> so that future PCIe generations can be supported without modifying
>> drivers/pci/of.c.
> 
> Thanks for this series.
> 
> We still have a couple references to pcie_link_speed[] that bypass
> pcie_get_link_speed().  These are safe because PCI_EXP_LNKSTA_CLS is
> 0xf and pcie_link_speed[] is size 16, but I'm not sure the direct
> reference is necessary.
> 
> The array itself is exported, which I suppose we needed for modular
> PCI controller drivers, but we probably don't need it now that
> pcie_get_link_speed() is exported?
> 
>    $ git grep "\<pcie_link_speed\>"
>    drivers/pci/pci-sysfs.c:        speed = pcie_link_speed[linkstat & PCI_EXP_LNKSTA_CLS];
>    drivers/pci/pci.c:      return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
>    drivers/pci/pci.h:extern const unsigned char pcie_link_speed[];
>    drivers/pci/pci.h:      bus->cur_bus_speed = pcie_link_speed[linksta & PCI_EXP_LNKSTA_CLS];
>    drivers/pci/probe.c:const unsigned char pcie_link_speed[] = {
>    drivers/pci/probe.c:EXPORT_SYMBOL_GPL(pcie_link_speed);
>    drivers/pci/probe.c:    if (speed >= ARRAY_SIZE(pcie_link_speed))
>    drivers/pci/probe.c:    return pcie_link_speed[speed];
>    drivers/pci/probe.c:            bus->max_bus_speed = pcie_link_speed[linkcap & PCI_EXP_LNKCAP_SLS];

Hi Bjorn,

Yes, I also realized that this array is directly used in other places. 
So I submitted this series and I would appreciate it if you could review 
it to ensure its correctness.

See also this series:
https://patchwork.kernel.org/project/linux-pci/patch/20260315160057.127639-1-18255117159@163.com/

Best regards,
Hans


