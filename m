Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D2C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 22:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rJEkvOzsQ6EFHSRcMaMoGcS2ovBd6hOPz5m8PrRwWI=; b=JKqQkj3bLh2NQAJIDxQqgsku1p
	Aqwdbv5HBJuhsPDZMWtWzWq++caFBIbeNRHfc5erh1EgR1OdEoohh9Hk9taDd4lZ/zJdnGVX9Btq4
	hCoQHLFxWilDB0l77sBlM//i85nb7bkSF/4piQGY83VNzLKK4jHJRwttDHJ8wK34VLGtMvMy4kpnD
	pwfDbaO5svYINTuQSrx9MIdzNwqSzHXthu0lgHqjh5VyIprjvm3Ub+4op+g8vsLrxIL2cTXJaGv2h
	nJ7A+j4yF55khS13nmBt4eNraNkgn+U41P0AF25UUaaH2AF08KcL9fPSgVzegdzaL9bHiU+uYwxy+
	Y771+Q4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj3R4-0000000BO3x-2o0W;
	Mon, 04 Aug 2025 22:13:38 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj3OW-0000000BNv1-1R2r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 22:11:02 +0000
Message-ID: <23d9f128-af95-41b1-a5b9-3c69d2df8ab8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754345455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rJEkvOzsQ6EFHSRcMaMoGcS2ovBd6hOPz5m8PrRwWI=;
	b=MQCzSAzM9MtpuH1VkSfE1ljT2IPHeHO7okXvjU9cogjVB4O6H2Q+YevKPEbGK2O/6DNpxS
	G1vgw/qjx78W+LGLPAA+ZaMtM5+/UzfBOig78/IpeIUf04tywS8DZ+tul357p8/VuYEiQa
	nv9zOBGf5D1+dyrGwXynyOjLIEBHMKE=
Date: Mon, 4 Aug 2025 18:10:48 -0400
MIME-Version: 1.0
Subject: Re: [BUG] pci: nwl: Unhandled AER correctable error
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@amd.com>, Brian Norris
 <briannorris@chromium.org>, Minghuan Lian <minghuan.Lian@nxp.com>,
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250804205702.GA3640524@bhelgaas>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250804205702.GA3640524@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_151100_942298_44CCC0D4 
X-CRM114-Status: GOOD (  20.09  )
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

On 8/4/25 16:57, Bjorn Helgaas wrote:
> [+cc more folks who might be interested in AER with non-standard
> interrupts]
> 
> On Fri, Aug 01, 2025 at 01:43:19PM -0400, Sean Anderson wrote:
>> Hi,
>> 
>> AER correctable errors are pretty rare. I only saw one once before and
>> came up with commit 78457cae24cb ("PCI: xilinx-nwl: Rate-limit misc
>> interrupt messages") in response. I saw another today and,
>> unfortunately, clearing the correctable AER bit in MSGF_MISC_STATUS is
>> not sufficient to handle the IRQ. It gets immediately re-raised,
>> preventing the system from making any other progress. I suspect that it
>> needs to be cleared in PCI_ERR_ROOT_STATUS. But since the AER IRQ never
>> gets delivered to aer_irq, those registers never get tickled.
>> 
>> The underlying problem is that pcieport thinks that the IRQ is going to
>> be one of the MSIs or a legacy interrupt, but it's actually a native
>> interrupt:
>> 
>>            CPU0       CPU1       CPU2       CPU3       
>>  42:          0          0          0          0     GICv2 150 Level     nwl_pcie:misc
>>  45:          0          0          0          0  nwl_pcie:legacy   0 Level     PCIe PME, aerdrv
>>  46:         25          0          0          0  nwl_pcie:msi 524288 Edge      nvme0q0
>>  47:          0          0          0          0  nwl_pcie:msi 524289 Edge      nvme0q1
>>  48:          0          0          0          0  nwl_pcie:msi 524290 Edge      nvme0q2
>>  49:         46          0          0          0  nwl_pcie:msi 524291 Edge      nvme0q3
>>  50:          0          0          0          0  nwl_pcie:msi 524292 Edge      nvme0q4
>> 
>> In the above example, AER errors will trigger interrupt 42, not 45.
>> Actually, there are a bunch of different interrupts in MSGF_MISC_STATUS,
>> so maybe nwl_pcie_misc_handler should be an interrupt controller
>> instead? But even then pcie_port_enable_irq_vec() won't figure out the
>> correct IRQ. Any ideas on how to fix this?
>> 
>> Additionally, any tips on actually triggering AER/PME stuff in a
>> consistent way? Are there any off-the-shelf cards for sending weird PCIe
>> stuff over a link for testing? Right now all I have 
> 
> This is definitely a problem.  We have had some discussion about this
> in the past, but haven't quite achieved critical mass to solve this in
> a generic way.  Here are some links:
> 
>   https://lore.kernel.org/linux-pci/20250702223841.GA1905230@bhelgaas/t/#u
>   https://lore.kernel.org/linux-pci/1464242406-20203-1-git-send-email-po.liu@nxp.com/

Thanks for the links. Toggling PERST does seem to reliably cause
correctable errors (however "correctable" they may actually be in
practice). With the patch I posted on the other branch of this chain I
now get

[   43.041610] pcieport 0000:00:00.0: AER: Multiple Corrected error message received from 0000:00:00.0
[   43.050693] pcieport 0000:00:00.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[   43.061477] pcieport 0000:00:00.0:   device [10ee:d011] error status/mask=00000001/0000e000
[   43.069842] pcieport 0000:00:00.0:    [ 0] RxErr                 

Whether or not that's the right fix, at least I can test things :)

--Sean

