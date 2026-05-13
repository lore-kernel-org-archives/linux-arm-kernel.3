Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD098CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eoo5QvpB4Eb9ga+kJJMqXt8kq4OH6TS43RPJ0eaFgI=; b=i3JiafT2Ime2O4cCvZ1PlrOzPl
	ODDWapc8G7x0hqc+Lwd1ibPYXQ+Jz+nXLSboNlBFXbx8/4afunQokAEI97FhfukYQ+fNU5SRcmwWn
	DPsz2zQGaVJUEmgfJDvmgz6ywRyeOpXGcr0q4+ZXm8oNc/kpCIRoJA+I/RxcqJ7+capnOG0emE75R
	ERMk6ewyqy+B9xUW1dS8lcne9NfSLZ8LAF6I44c062PEZQHDMKhObtLnooixxQiHVZHnqTnwEQ57N
	b3br+NMJQP6UD+7Cdmbrwa0URQorLAj68efVFG58DScGMAdvgHkeNIsJXl4I3y9DVDpn2NmQqzpU0
	I5MBk99w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3aW-00000001VMH-1V0G;
	Wed, 13 May 2026 07:01:00 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3aR-00000001VI5-1g5a;
	Wed, 13 May 2026 07:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=8eoo5QvpB4Eb9ga+kJJMqXt8kq4OH6TS43RPJ0eaFgI=;
	b=RD99yJzu1OO09ZP8mmikLZxFnwdZQWaFTFeVn0Q4qXID1jguibJcDy+kX+1gYW
	opV5fmUjR3oop3oNQ4+rrB7hBP5ScnplUnQE2q08Qvv/WyzgYcTtSpkrq1rC5dhH
	MLX7jLYVcaioWBn4K7QvxOoeVYKRF8t770p+INk1exn8Y=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD35zZ1IQRqoYBUBA--.57222S2;
	Wed, 13 May 2026 15:00:06 +0800 (CST)
Message-ID: <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
Date: Wed, 13 May 2026 15:00:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link
 training
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com,
 thomas.petazzoni@bootlin.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-7-18255117159@163.com>
 <20260512212531.jupoocz7acv22qyg@pali>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260512212531.jupoocz7acv22qyg@pali>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD35zZ1IQRqoYBUBA--.57222S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw15GF4xZw1kGr1DZryUtrb_yoW5Zryfpa
	y3GF1SgFZ5tr45u3W7Xa1kuFyYganI9345Jrn7Kw13ZFnxCryUWF1jkrZavFy3Jw4kAF12
	vw42qFy8ua13ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEPfLUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxYBpGoEIXa5zQAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_000056_818597_5F0C7C6F 
X-CRM114-Status: GOOD (  24.37  )
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



On 5/13/26 05:25, Pali Rohár wrote:
> On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
>> The Aardvark PCIe controller driver waits for the link to come up but
>> does not implement the mandatory 100 ms delay after link training
>> completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
>>
>> The driver already maintains a 'link_gen' field that holds the negotiated
>> link speed. Use it together with pcie_wait_after_link_train() to insert
>> the required delay immediately after confirming that the link is up.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pci-aardvark.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
>> index e34bea1ff0ac..526351c21c49 100644
>> --- a/drivers/pci/controller/pci-aardvark.c
>> +++ b/drivers/pci/controller/pci-aardvark.c
>> @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
>>   
>>   	/* check if the link is up or not */
>>   	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
>> -		if (advk_pcie_link_up(pcie))
>> +		if (advk_pcie_link_up(pcie)) {
>> +			pcie_wait_after_link_train(pcie->link_gen);
>>   			return 0;
>> +		}
>>   
>>   		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
>>   	}
>> -- 
>> 2.34.1
>>
> 
> Are you sure that this is correct to do? Have you checked the A3720
> Functional Specification which describes how to bring PCIe link up?
> 
> A3720 PCIe controller is buggy and needs more timing hacks to make it
> behave. Playing with random sleeps can break its internal logic.
> I'm not sure if it could be safe without proper testing.
> 
> And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.


Hi Pali,

1. This driver does not support A3720.

static const struct of_device_id advk_pcie_of_match_table[] = {
	{ .compatible = "marvell,armada-3700-pcie", },
	{},
};
MODULE_DEVICE_TABLE(of, advk_pcie_of_match_table);

If you need support for A3720, please submit the corresponding patch so 
that Bjorn and Mani can review it.


2. If A3720 only supports GEN2, you can configure "max-link-speed" to be 
2 in the DT. This will not affect the functionality of this patch.

3. This patch is a common delay requirement stipulated by the PCIe 
specification. If it is greater than GEN2, then msleep(100) will be 
added; otherwise, there will be no such delay.

4. For instance, we often come across the situation where some common 
APIs are modified, and in many cases, their functionality does not 
require the actual development board for verification. I believe that 
many other developers and maintainers have modified different parts of 
the code. For example, the recent submission:

commit 750277048afe7ce8ebfc0b120de7dfbc745058a7
Author: Nam Cao <namcao@linutronix.de>
Date:   Thu Jun 26 16:47:53 2025 +0200

     PCI: aardvark: Switch to msi_create_parent_irq_domain()

     Switch to msi_create_parent_irq_domain() from 
pci_msi_create_irq_domain()
     which was using legacy MSI domain setup.


And many controller drivers have been modified.


Best regards,
Hans



