Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14392CD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yolk7fPVSsosJ3+V1HG/g+3kb5mEYUGoiAatqyto7So=; b=Ho4v0PdwvxVZ4bGtrV3yAjFpER
	uL4YlOk7fR+is3fEAQ8wz9Wh60Fc3KGRQFRBKW/u0TAcufjuMubE5dqKV1eTCHaM8G4TaAK5XHAFc
	KPpXA+g4vTZyb5N2QFdbKykfw1/1bJoU+4FvTaPK/Mj8DTmifFUNfFnEfftJrG6OOXzXdF7w32paX
	YHu1C33z0ahZhUmGxU/xaSU+EZcz1343zwnitlQKVDoV+9JkfMUKh8p/mAxrje3g7Af/QiE3zhwAH
	4ilusVI8Kp7uGzh56vpXo8J3d+Vwv5myKuIVhdSRaO4qojGUr+pfG0sVP57Ia5JfcsgfnBSBBVDX8
	Fhc6BlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkVF-00000009G2q-2YhY;
	Sat, 09 May 2026 16:26:09 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLkV9-00000009G1q-0VFU;
	Sat, 09 May 2026 16:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=Yolk7fPVSsosJ3+V1HG/g+3kb5mEYUGoiAatqyto7So=;
	b=QNwnNxprHHJUW4PbRByVgKv8H/imUdQGoJjvkX/EUA+Eo4EOgoN3fXXG/YFjUD
	RCZw7p7hHvAFaD7xgsZA0twZgcRMC0emc+V0FzVJidZqk4Clo93Xmta7ExoLcWQ1
	mMZ1Fx0EyXnaAa2I8HKBo3TN9DpBamsrne72PUdUBxsnk=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnQtTpX_9pIRSmAQ--.47405S2;
	Sun, 10 May 2026 00:25:14 +0800 (CST)
Message-ID: <4f063568-0f5c-42ad-acc5-2d6ca5b546ad@163.com>
Date: Sun, 10 May 2026 00:25:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-9-18255117159@163.com>
 <bd0f4589-b586-4f01-b12c-6ae5c19ec21b@tuxon.dev>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <bd0f4589-b586-4f01-b12c-6ae5c19ec21b@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnQtTpX_9pIRSmAQ--.47405S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFWxAF13Cr4xKF48ArW8Zwb_yoW8Wry3pF
	ZYv3WjyF1UXr4Y9a17X3Z8uFyYq3Z8A34UJ3s3Wa47ZwnxuFZrWF98uF4fJ3Z2grZ7XrW3
	t3W5t3WUGa15AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEPfQUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7ApsEGn-X+qp5wAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_092603_526952_0C908907 
X-CRM114-Status: GOOD (  14.56  )
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



On 5/7/26 00:52, Claudiu Beznea wrote:
> Hi, Hans,
> 
> On 5/6/26 18:23, Hans Zhang wrote:
>> The Renesas RZ/G3S PCIe host driver currently does not enforce the
>> mandatory 100 ms delay after link training completes for speeds > 5.0 
>> GT/s,
>> required by PCIe r6.0 sec 6.6.1.
>>
>> The driver already has a 'max_link_speed' field (derived from the device
>> tree). Add a call to pcie_wait_after_link_train() in
>> rzg3s_pcie_host_init() after reading the link status, ensuring that the
>> delay is applied before any Configuration Request is sent downstream.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pcie-rzg3s-host.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/ 
>> controller/pcie-rzg3s-host.c
>> index d86e7516dcc2..6ab59c5464cf 100644
>> --- a/drivers/pci/controller/pcie-rzg3s-host.c
>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>> @@ -1390,6 +1390,8 @@ static int rzg3s_pcie_host_init(struct 
>> rzg3s_pcie_host *host)
>>       val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>>       dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>> +    pcie_wait_after_link_train(host->max_link_speed);
> 
> There is an msleep(PCIE_RESET_CONFIG_WAIT_MS) after 
> rzg3s_pcie_set_max_link_speed() call. Shouldn't that msleep() call be 
> replaced with your pcie_wait_after_link_train() ?

Hi Claudiu,

Sorry for the late reply. Thank you for pointing it out. It will be 
replaced.

Best regards,
Hans


> 
> Thank you,
> Claudiu


