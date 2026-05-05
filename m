Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C41DCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 06:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMW8AEGhMafvz4O5+74DGobnCil6TvXWOF0reU/8wjk=; b=aHG4PU+B48brZy4bgD806NQ3PY
	QdgDllJRB+VSkcbkQqx164FvzDraxYYcnGzuexPZ6VMxMlhu36VV9YyfKRG7jSdDGJCVn9M3XgcSp
	ofYKoL5Mq1uSDeqORV2oK0ZsstXwJoFL+NVuKdb/mXqlpExosE0rvwt4c2k8IlqtG/6Z9Kiad3NFb
	PnnNN8Ovx158q4ytvyRacI45SQTKNSKVoBuHVUHWYbmzb87WBHHi/tl5QDcD63sV779qxxjey4ert
	0xKSPi6/BfwoBfX5rBNdgsGJCEmLoXiINX2HjhnhBkDjMKfaBwJ2KwtFzCX5lxB8lLUFG1Luizr3K
	ykWWTn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9Hp-0000000FIB7-0yLY;
	Tue, 05 May 2026 06:29:41 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9Hm-0000000FIAQ-0SYZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 06:29:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mMW8AEGhMafvz4O5+74DGobnCil6TvXWOF0reU/8wjk=;
	b=dGVv4kpfLQOtKe1W90YBYeq37NsDG0q3mgiZtNY4I3Vu6DXExg46Xh1QNmWoVk
	hsIzTfkoNYC7nY5yQS/HFhc2St/qnnCH5kY/kdyHPdZyulsjOovGbEqUvGttAyK2
	nUC+vzJJ3R2Wn+AXjYuZkjsGzT+P/zbgUE+HTLZEAlsq8=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCnTnkgjvlpV+DSDQ--.40732S2;
	Tue, 05 May 2026 14:28:49 +0800 (CST)
Message-ID: <25d5e524-d7b4-432d-8114-44d32b736732@163.com>
Date: Tue, 5 May 2026 14:28:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: cadence: Ensure that
 cdns_pcie_host_wait_for_link() waits 100 ms after link up
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, robh@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260504162216.GA646395@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260504162216.GA646395@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnTnkgjvlpV+DSDQ--.40732S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtF4ruF43JFy3AFy7ZF45trb_yoW7KrWUpa
	yUGF1IkF4vqr45Z3Wvv3W5XrySqr98JFy7Xw1kKryxXrnFvr17tF42gF4agFy3Xr4qyr17
	Zr1UtF9rGr1YyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5sqAUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwwGEKGn5jiEdbwAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_232938_677184_98AD7EFE 
X-CRM114-Status: GOOD (  22.42  )
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



On 5/5/26 00:22, Bjorn Helgaas wrote:
> On Mon, May 04, 2026 at 02:23:34PM +0800, Hans Zhang wrote:
>> On 5/4/26 13:08, Siddharth Vadapalli wrote:
>>> On 03/05/26 21:16, Hans Zhang wrote:
>>>> On 5/2/26 13:18, Siddharth Vadapalli wrote:
>>>>> On 01/05/26 21:05, Hans Zhang wrote:
>>>>>> As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports
>>>>>> Link speeds
>>>>>> greater than 5.0 GT/s, software must wait a minimum of 100
>>>>>> ms after Link
>>>>>> training completes before sending a Configuration Request.
>>>>>>
>>>>>> Add a new 'max_link_speed' field in struct cdns_pcie to record the
>>>>>> maximum supported (or currently configured) link speed of
>>>>>> the controller.
>>>>>>
>>>>>> In cdns_pcie_host_wait_for_link(), after the link is reported as up,
>>>>>> insert a 100 ms delay if max_link_speed > 2 (i.e., > 5 GT/s). This
>>>>>> implements the required delay at the common Cadence host layer.
>>>>>>
>>>>>> Currently max_link_speed is zero-initialized, so the delay is not yet
>>>>>> active. Glue drivers must set max_link_speed appropriately to enable
>>>>>> the delay. This matches the approach taken for the Synopsys DWC
>>>>>> controller in commit 80dc18a0cba8d ("PCI: dwc: Ensure that
>>>>>> dw_pcie_wait_for_link() waits 100 ms after link up").
>>>>>>
>>>>>> Signed-off-by: Hans Zhang <18255117159@163.com>
>>>>>> ---
>>>>>>    .../pci/controller/cadence/pcie-cadence-host-common.c    |
>>>>>> 9 +++++ ++++
>>>>>>    drivers/pci/controller/cadence/pcie-cadence.h            | 2 ++
>>>>>>    2 files changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git
>>>>>> a/drivers/pci/controller/cadence/pcie-cadence-host- common.c
>>>>>> b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>>>> index 2b0211870f02..d4ae762f423f 100644
>>>>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>>>> @@ -14,6 +14,7 @@
>>>>>>    #include "pcie-cadence.h"
>>>>>>    #include "pcie-cadence-host-common.h"
>>>>>> +#include "../../pci.h"
>>>>>>    #define LINK_RETRAIN_TIMEOUT HZ
>>>>>> @@ -55,6 +56,14 @@ int cdns_pcie_host_wait_for_link(struct
>>>>>> cdns_pcie *pcie,
>>>>>>        /* Check if the link is up or not */
>>>>>>        for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
>>>>>>            if (pcie_link_up(pcie)) {
>>>>>> +            /*
>>>>>> +             * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
>>>>>> +             * supports Link speeds greater than 5.0 GT/s, software
>>>>>> +             * must wait a minimum of 100 ms after Link training
>>>>>> +             * completes before sending a Configuration Request.
>>>>>> +             */
>>>>>> +            if (pcie->max_link_speed > 2)
>>>>>> +                msleep(PCIE_RESET_CONFIG_WAIT_MS);
>>>>>
>>>>> I think the above could be moved to cdns_pcie_host_start_link()
>>>>> as follows:
>>>>>
>>>>> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-
>>>>> common.c b/
>>>>> drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>>> index 2b0211870f02..0f885dcbdb12 100644
>>>>> --- a/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>>> +++ b/drivers/pci/controller/cadence/pcie-cadence-host-common.c
>>>>> @@ -115,6 +115,15 @@ int cdns_pcie_host_start_link(struct
>>>>> cdns_pcie_rc *rc,
>>>>>        if (!ret && rc->quirk_retrain_flag)
>>>>>            ret = cdns_pcie_retrain(pcie, pcie_link_up);
>>>>>
>>>>> +    /*
>>>>> +     * As per PCIe r6.0, sec 6.6.1, a Downstream Port that
>>>>> +     * supports Link speeds greater than 5.0 GT/s, software
>>>>> +     * must wait a minimum of 100 ms after Link training
>>>>> +     * completes before sending a Configuration Request.
>>>>> +     */
>>>>> +    if (!ret && pcie->max_link_speed > 2)
>>>>> +        msleep(PCIE_RESET_CONFIG_WAIT_MS);
>>>>> +
>>>>>        return ret;
>>>>>    }
>>>>>    EXPORT_SYMBOL_GPL(cdns_pcie_host_start_link);
>>>>>
>>>>> This will avoid an additional and unnecessary delay when
>>>>> 'cdns_pcie_retrain()' retrains the link.
>>>>>
>>>>> Instead of checking for the link being up using
>>>>> "pcie_link_up(pcie)", checking for 'ret' being zero should also
>>>>> work (ret being zero indicates that the link is up).
>>>>>
>>>>> Since configuration space accesses will not be performed until
>>>>> cdns_pcie_host_start_link() completes executing, it should be
>>>>> safe to switch to the above implementation.
>>>>
>>>> Hi Siddharth,
>>>>
>>>> I think this is applicable to LGA IP as per the method you
>>>> mentioned. However, for HPA IP, additional repetitive code needs to
>>>> be added in the following code.
>>>
>>> Yes, additional code is required as you rightly pointed out, but the
>>> problem I was trying to address with your patch is the following:
>>>       cdns_pcie_host_start_link()
>>>         calls cdns_pcie_host_wait_for_link()
>>>           Link is Up and we wait for 100 ms here
>>>         calls cdns_pcie_retrain()
>>>             calls cdns_pcie_host_wait_for_link() a second time
>>>               Link is Up again after retraining and we wait and
>>>               we wait an additional 100 ms here.
>>>
>>> Instead, it will be sufficient if we could wait just once after
>>> cdns_pcie_retrain() returns.
>>
>> Hi Siddharth,
>>
>> Yes, I looked at the code and indeed it works this way.
>>
>> Because of the abundance of redundant comments. I'm wondering if it's
>> possible to encapsulate a helper function in the file
>> drivers/pci/controller/pci-host-common.c, so that controller drivers like
>> dwc and cadence can call this API. Or do you know where it would be
>> appropriate to place it?
>>
>> Hello, Bjorn and Mani, I wonder what your opinions are.
> 
> Make a proposal.  Sounds fine to remove redundant comments if they
> cause confusion.  Adding a helper to make things more consistent
> across drivers also sounds fine, but it would be better to have a
> straw-man proposal to respond to.

Hi Bjorn,

Thank you for your reply. I will then prepare the next version.

Best regards,
Hans

> 
> Bjorn


