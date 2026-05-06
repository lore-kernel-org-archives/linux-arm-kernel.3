Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FE9CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYNkE5RiNNntbiGIE16X7Ew1NsSOD35A4toWoL44TXo=; b=qXXAJ062bpQ6uH5rmXQU2FpZBS
	OwwyjUKQzs8Tg/1RvFxF5rdkRY8cd1N9BYF8JIQdmooAB+qEU0GN4Zlu/FkbsAqoqHI8J9q7BAiMA
	mWwhv1qxDq3iH7d4ufsD8n3b5GBcxeesfGHck9alNGYdIvX+rAPg5kORBCTu0DY+nDN0BMeVijH2y
	yF4qn4hiaB1Z4gLXBL+QzVgOjtMlm3xM/twINrGy7irpUp9GCco38EXs7RJ/kowSMvaw2CK+09dgX
	+HY+ONJhRFOaZd4gzMhlc74AvwPqIovzO+YGbZY93AVFEJor3wD1Bxs7OSXkxGkPw6vVvB1aA7hOz
	4VmfQfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKewS-00000001UDW-0Cbr;
	Wed, 06 May 2026 16:17:44 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKewQ-00000001UBq-3uZ7;
	Wed, 06 May 2026 16:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=MYNkE5RiNNntbiGIE16X7Ew1NsSOD35A4toWoL44TXo=;
	b=gYAMi3Lf8HE9qlJdRGnWVPmm+EaDf0Ln/YZF5qFyffTiA+gD6h9VfKYBAOXxXn
	Docp4vrg+axGk+h/WsUjDoJ7HGUap6GLvWFSbdj+duBRXfzxafRPeMdZOGCmYshA
	q/sm1mQPeA00IYcGJ1zxSLNiiOzNdTlz1VfJG4l+xyvqY=
Received: from [IPV6:240e:b8f:927e:5900:dbee:26f0:1b68:48a4] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXJO14aftp0jLqCg--.226S2;
	Thu, 07 May 2026 00:16:58 +0800 (CST)
Message-ID: <a74306a3-ad87-424b-aa27-f078523ee1ce@163.com>
Date: Thu, 7 May 2026 00:16:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "mani@kernel.org" <mani@kernel.org>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "pali@kernel.org" <pali@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "jianjun.wang@mediatek.com" <jianjun.wang@mediatek.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "mpillai@cadence.com" <mpillai@cadence.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-2-18255117159@163.com>
 <TY3PR01MB1134694C0F3D14E4A69EFB8CA863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <TY3PR01MB1134694C0F3D14E4A69EFB8CA863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PygvCgBXJO14aftp0jLqCg--.226S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW3Cw4rAr47ZFyfZF4rGrg_yoW8Zw43pF
	Z5GF1YkF48XFW3Wan3Ja43uFyYgFs3tFy7CryxG348CF9xur13KF4Fg3y3Wr92qrs8Zr12
	yw15t3W7CFWYyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIQ6XUUUUU=
X-Originating-IP: [240e:b8f:927e:5900:dbee:26f0:1b68:48a4]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BvRdWn7aXspgAAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_091743_486688_3E922C53 
X-CRM114-Status: GOOD (  15.94  )
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



On 5/6/26 23:34, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: Hans Zhang <18255117159@163.com>
>> Sent: 06 May 2026 16:24
>> Subject: [PATCH v2 1/8] PCI: Add pcie_wait_after_link_train() helper
>>
>> PCIe r6.0, sec 6.6.1 (Conventional Reset) requires that for a Downstream Port supporting Link speeds
>> greater than 5.0 GT/s, software must wait a minimum of 100 ms after Link training completes before
>> sending any Configuration Request.
>>
>> Introduce a static inline helper pcie_wait_after_link_train() that checks the given max_link_speed (2 =
>> 5.0 GT/s, 3 = 8.0 GT/s, etc.) and calls
>> msleep(100) only when the speed is greater than 5.0 GT/s. The helper uses the existing
>> PCIE_RESET_CONFIG_WAIT_MS macro defined in pci.h.
>>
>> This allows multiple host controller drivers to share the same mandatory delay without duplicating the
>> logic.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/pci.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h index 4a14f88e543a..a8705a2a2d85 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -60,6 +60,19 @@ struct pcie_tlp_log;
>>    */
>>   #define PCIE_RESET_CONFIG_WAIT_MS	100
>>
>> +/**
>> + * pcie_wait_after_link_train - Wait 100 ms if link speed > 5 GT/s
>> + * @max_link_speed: the maximum link speed (2 = 5.0 GT/s, 3 = 8.0 GT/s,
>> +...)
>> + *
>> + * Must be called after Link training completes and before the first
>> + * Configuration Request is sent.
>> + */
>> +static inline void pcie_wait_after_link_train(int max_link_speed) {
>> +	if (max_link_speed > 2)
>> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>> +}
> 
> Maybe move this patch to the user??

Hi Biju,

Just as Mani's reply stated, I am more inclined to place it in the 
common header file.

Best regards,
Hans

> 
> Cheers,
> Biju
> 
>> +
>>   /* Parameters for the waiting for link up routine */
>>   #define PCIE_LINK_WAIT_MAX_RETRIES	10
>>   #define PCIE_LINK_WAIT_SLEEP_MS		90
>> --
>> 2.34.1
>>


