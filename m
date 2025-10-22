Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744B5CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rs9gC2MuUAS+IiZaGoI5syk4lSYwDHEmE+5KRFDk2J8=; b=VvoWnq1WFN5oiRTYSxIu9WJ4E4
	AKlFYRtivA/Xax1tJF/GrgOInYbt63zATQ15bG4Z4UuxIMrhSlDEydPkiOpQExA2Eq6dVyCqkJCBw
	FXUwtWWlwweYetxbV22Mp9nN2eOdeLRHQVhBw5mQf14uDdWT0AeqMBg+fw0lV+3CucTEzqIlYbdoV
	FHq4I9EdA+fdX+4pk20VCnp3HrdJytyv3XlvfPlhWanbdFOsNrf+lw7/+ZhYi5fXptVmSrWqkBkYj
	pezja3vTf8kzke3Jx/qsvPHouBE6oNTQ+VyUqN8ER+lBFvcdOOo8LmODhUiOEsQ+UM1zg6qnoGPp5
	cnougNog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVd1-00000002Mu4-41CW;
	Wed, 22 Oct 2025 09:59:35 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVcu-00000002Mpf-0eaJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:59:34 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cs4Q20Hn5z9tm8;
	Wed, 22 Oct 2025 11:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761127162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rs9gC2MuUAS+IiZaGoI5syk4lSYwDHEmE+5KRFDk2J8=;
	b=N+ivhJdUViE2sx8JFuqurvh6YesjViJsAfOk6IZ+HoHyiqnBEGcpE2j+L/CCRW0M5ucsL7
	Xon9ZukDAIY5YQjrCATS/9RJZl9VM0L6qORNgjwPpEdK92UNhxWRC2hVjlRtJSGA/wZvA+
	zAAOn+Ltj3A52VpZ+QMGuhAlFe7O22IVwr1bFg+/XWAJu+ljWO2gU3Pbfccj0XqCXb5cHH
	50KgDJH7KcL15jY7IT0SzIDTaemRvYyPk1lOoTZOSZrWsvlMxYK5eu+qhqo7sYVa8Cga6K
	UbEzSiKHdzw7JG3vtZ/PhtE6e74egcYx9dKUL9wLEw8WGv1ZnHPP5x+Vyj4TDw==
Message-ID: <72267a6c-13c7-40bd-babb-f73a28625ca4@mailbox.org>
Date: Wed, 22 Oct 2025 11:59:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] PCI: xilinx-xdma: Enable INTx interrupts
To: "mani@kernel.org" <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, "Bandi, Ravi Kumar"
 <ravib@amazon.com>,
 "thippeswamy.havalige@amd.com" <thippeswamy.havalige@amd.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Sean Anderson <sean.anderson@linux.dev>
References: <20251021212801.GA1224310@bhelgaas>
 <ab1f7c51-bc41-4774-a0dc-850e53c412eb@mailbox.org>
 <3it5l556vmfpuu6kz5yvulwosi4ecmcgfbzcizrc5wi7ifddkh@mpzfxf2v6v3f>
Content-Language: en-US
From: Stefan Roese <stefan.roese@mailbox.org>
In-Reply-To: <3it5l556vmfpuu6kz5yvulwosi4ecmcgfbzcizrc5wi7ifddkh@mpzfxf2v6v3f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6e55d69c8ea0868a40e
X-MBO-RS-META: az7nnbuxz6o4bpe17pfhm65i8n7q5a34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_025932_045423_55E9804A 
X-CRM114-Status: GOOD (  21.90  )
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

On 10/22/25 11:55, mani@kernel.org wrote:
> On Wed, Oct 22, 2025 at 08:59:19AM +0200, Stefan Roese wrote:
>> Hi Bjorn,
>> Hi Ravi,
>>
>> On 10/21/25 23:28, Bjorn Helgaas wrote:
>>> On Tue, Oct 21, 2025 at 08:55:41PM +0000, Bandi, Ravi Kumar wrote:
>>>>> On Tue, Oct 21, 2025 at 05:46:17PM +0000, Bandi, Ravi Kumar wrote:
>>>>>>> On Oct 21, 2025, at 10:23 AM, Bjorn Helgaas <helgaas@kernel.org> wrote:
>>>>>>> On Sat, Sep 20, 2025 at 10:52:32PM +0000, Ravi Kumar Bandi wrote:
>>>>>>>> The pcie-xilinx-dma-pl driver does not enable INTx interrupts
>>>>>>>> after initializing the port, preventing INTx interrupts from
>>>>>>>> PCIe endpoints from flowing through the Xilinx XDMA root port
>>>>>>>> bridge. This issue affects kernel 6.6.0 and later versions.
>>>>>>>>
>>>>>>>> This patch allows INTx interrupts generated by PCIe endpoints
>>>>>>>> to flow through the root port. Tested the fix on a board with
>>>>>>>> two endpoints generating INTx interrupts. Interrupts are
>>>>>>>> properly detected and serviced. The /proc/interrupts output
>>>>>>>> shows:
>>>>>>>>
>>>>>>>> [...]
>>>>>>>> 32:        320          0  pl_dma:RC-Event  16 Level     400000000.axi-pcie, azdrv
>>>>>>>> 52:        470          0  pl_dma:RC-Event  16 Level     500000000.axi-pcie, azdrv
>>>>>>>> [...]
>>
>> First a comment on this IRQ logging:
>>
>> These lines do NOT refer to the INTx IRQ(s) but the controller internal
>> "events" (errors etc). Please see this log for INTx on my Versal
>> platform with pci_irqd_intx_xlate added:
>>
>>   24:          0          0  pl_dma:RC-Event   0 Level     LINK_DOWN
>>   25:          0          0  pl_dma:RC-Event   3 Level     HOT_RESET
>>   26:          0          0  pl_dma:RC-Event   8 Level     CFG_TIMEOUT
>>   27:          0          0  pl_dma:RC-Event   9 Level     CORRECTABLE
>>   28:          0          0  pl_dma:RC-Event  10 Level     NONFATAL
>>   29:          0          0  pl_dma:RC-Event  11 Level     FATAL
>>   30:          0          0  pl_dma:RC-Event  20 Level     SLV_UNSUPP
>>   31:          0          0  pl_dma:RC-Event  21 Level     SLV_UNEXP
>>   32:          0          0  pl_dma:RC-Event  22 Level     SLV_COMPL
>>   33:          0          0  pl_dma:RC-Event  23 Level     SLV_ERRP
>>   34:          0          0  pl_dma:RC-Event  24 Level     SLV_CMPABT
>>   35:          0          0  pl_dma:RC-Event  25 Level     SLV_ILLBUR
>>   36:          0          0  pl_dma:RC-Event  26 Level     MST_DECERR
>>   37:          0          0  pl_dma:RC-Event  27 Level     MST_SLVERR
>>   38:         94          0  pl_dma:RC-Event  16 Level     84000000.axi-pcie
>>   39:         94          0  pl_dma:INTx   0 Level     nvme0q0, nvme0q1
>>
>> The last line shows the INTx IRQs here ('pl_dma:INTx' vs 'pl_dma:RC-
>> Event').
>>
>> More below...
>>
>>>>>>>>
>>>>>>>> Changes since v1::
>>>>>>>> - Fixed commit message per reviewer's comments
>>>>>>>>
>>>>>>>> Fixes: 8d786149d78c ("PCI: xilinx-xdma: Add Xilinx XDMA Root Port driver")
>>>>>>>> Cc: stable@vger.kernel.org
>>>>>>>> Signed-off-by: Ravi Kumar Bandi <ravib@amazon.com>
>>>>>>>
>>>>>>> Hi Ravi, obviously you tested this, but I don't know how to reconcile
>>>>>>> this with Stefan's INTx fix at
>>>>>>> https://lore.kernel.org/r/20251021154322.973640-1-stefan.roese@mailbox.org
>>>>>>>
>>>>>>> Does Stefan's fix need to be squashed into this patch?
>>>>>>
>>>>>> Sure, we can squash Stefan’s fix into this.
>>>>>
>>>>> I know we *can* squash them.
>>>>>
>>>>> I want to know why things worked for you and Stefan when they
>>>>> *weren't* squashed:
>>>>>
>>>>>    - Why did INTx work for you even without Stefan's patch.  Did you
>>>>>      get INTx interrupts but not the right ones, e.g., did the device
>>>>>      signal INTA but it was received as INTB?
>>>>
>>>> I saw that interrupts were being generated by the endpoint device,
>>>> but I didn’t specifically check if they were correctly translated in
>>>> the controller. I noticed that the new driver wasn't explicitly
>>>> enabling the interrupts, so my first approach was to enable them,
>>>> which helped the interrupts flow through.
>>>
>>> OK, I'll assume the interrupts happened but the driver might not have
>>> been able to handle them correctly, e.g., it was prepared for INTA but
>>> got INTB or similar.
>>>
>>>>>    - Why did Stefan's patch work for him even without your patch.  How
>>>>>      could Stefan's INTx work without the CSR writes to enable
>>>>>      interrupts?
>>>>
>>>> I'm not entirely sure if there are any other dependencies in the
>>>> FPGA bitstream. I'll investigate further and get back to you.
>>>
>>> Stefan clarified in a private message that he had applied your patch
>>> first, so this mystery is solved.
>>
>> Yes. I applied Ravi's patch first and still got no INTx delivered
>> to the nvme driver. That's what me triggered to dig deeper here and
>> resulted in this v2 patch with pci_irqd_intx_xlate added.
>>
>> BTW:
>> I re-tested just now w/o Ravi's patch and the INTx worked. Still I think
>> Ravi's patch is valid and should be applied...
> 
> How come INTx is working without the patch from Ravi which enabled INTx routing
> in the controller? Was it enabled by default in the hardware?

Yes, this is my best guess right now. I could double-check here, but
IMHO it makes sense to enable it "manually" as done with Ravi's patch
to not rely on this default setup at all.

Thanks,
Stefan


