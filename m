Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A413C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvgIM02VkB4UL9QMByctN8Vnp/226aej0vn9VyB2FVE=; b=S/qYgcZSKbcm2FUK9dUq4kRtNP
	ffWYbY/MlcDl/vYo6icsp6u2Wr3Hkml2FtFce7hbAK5a6XL+H7TrEZawGFpGuxf7mOwo2rPFoq6Sk
	cLJKPudwFUBM0405LkrkKu0neANZXBL2fWygSM7X0oYleZF0qH9agp3IYSUiUhDxUHQ+yPw2RjWKR
	wQ1ycQYzvsfoqSoWQzFldMJFcaj/l/R7YLDkPINUcSij4GdIC+rW+cUHcUju7H0AnQ9XbMNaL3NiO
	TXU12TafUcL3E9CPzlsx3Oi9FNuwszagqXp064cJuIJZbEaULBFZScOCPx/8EI7yldZOZlEnzNHIV
	Y+zw+sMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKLG-00000007clA-3Qqv;
	Tue, 18 Feb 2025 09:56:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJsc-00000007VYs-20pT;
	Tue, 18 Feb 2025 09:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739870820;
	bh=13RAFqO4JxKpY86E13TVG4O698Z/xjNecRvH9AgjNaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qX5QQxHIowTOTnz9Li60/jzpzEyrmVKngsv1UdK5BflNfVIsKlkYXPG7WDiqBtW0N
	 wrlwfNZICsMYgYLLCSDCZFgoggqWPGoNAzQNV12S1LSHlQdA7zF+X5A+PMDUAFnfN9
	 UP6nY/ePSd7y/OWZAQHdvs3CvlriheHERJNRRwawHDev7Ij+DEltRFnDLwEC9HpdbS
	 W7Gaa/kPKTVIoHDN79HMcjiz9A28S92w9F2kejmJVPjqsVVytQ9iMbpyPkPsR/XaXP
	 melHDDbYycMbcLfXgf+kh+GIi4/QYUOWSq5WrWX/11u/L8rBITZ6U2NKD3pjt3xCHE
	 QEyqpJK0Qc49A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DE217E0391;
	Tue, 18 Feb 2025 10:27:00 +0100 (CET)
Message-ID: <a286cb5c-40f8-48ec-921d-bcf0b67728ed@collabora.com>
Date: Tue, 18 Feb 2025 10:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] usb: mtu3: add support remote wakeup of mt8196
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
 <20250121145008.22936-4-chunfeng.yun@mediatek.com>
 <e63fdeba-04dd-4b88-a6d6-ca8a64e28e36@collabora.com>
 <a689f7d25fb05ba83ac2de6ba879998fe2e21bcb.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a689f7d25fb05ba83ac2de6ba879998fe2e21bcb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_012702_669105_F64197A8 
X-CRM114-Status: GOOD (  24.98  )
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

Il 09/02/25 04:31, Chunfeng Yun (云春峰) ha scritto:
> On Wed, 2025-01-22 at 10:30 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 21/01/25 15:50, Chunfeng Yun ha scritto:
>>> There are three USB controllers on mt8196, each controller's wakeup
>>> control is different, add some specific versions for them.
>>> Here add only for dual-role controllers.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
>>   From the datasheets, I can read the following:
>>
>> IP0: host -> 0x1670_0000  device(mtu3) -> 0x1670_1000
>> IP1: host -> 0x1671_0000  device(mtu3) -> 0x1671_1000
>> IP2: host -> 0x1672_0000  device(mtu3) -> 0x1672_1000
>>
> I'll check it.
> 
>> ...this means that you're missing the IP2 here, which you did not
>> miss in the
>> commit adding the wakeup control in mtk-xhci instead.
>>
>> So, since I see that all of the USB IPs are behind MTU3, and that
>> there is no
>> USB IP that does *not* support gadget mode (so, there's no USB IP
>> that does NOT
>> support MTU3), you shall add all three here, and you shall drop the
>> commit that
>> adds the wakeup control in mtk-xhci entirely.
> No, I'll still add them in mtk-xhci driver as before for the cases that
> only use xhci only, no need use mtu3 driver.
> 
> As I said before, event the controller supports dual-role mode, which
> don't mean that it can use this upstream mtu3 driver, some SoC have
> limitation and can't support the dual-role mode switch used in upstream
> driver. but all SoC can use upstream xhci-mtk driver. that why I add
> some SoC's wakeup control in xhci-mtk, but not in mtu3 driver.
> 
>>
>> This is because there will be no DT node declaring only XHCI.
>>
>> Since after the proposed change all controllers will be MTU3 -> XHCI,
>> there's
>> no need to add the same in the mtk-xhci driver.
> I think it's better to leave the selection to the customer, for
> example, on chromebook, we only use xhci driver and do not enable mtu3.
> 

Chromebooks can use MTU3 and lock it in HOST mode only.

The MTU3 hardware is there - don't hide it.

Regards,
Angelo

> Thanks
> 
>>
>> Cheers,
>> Angelo
>>
>>> ---
>>> v2: add wakeup for dual-role controllers
>>> ---
>>>    drivers/usb/mtu3/mtu3_host.c | 17 +++++++++++++++++
>>>    1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/usb/mtu3/mtu3_host.c
>>> b/drivers/usb/mtu3/mtu3_host.c
>>> index 7c657ea2dabd..d65b0f318436 100644
>>> --- a/drivers/usb/mtu3/mtu3_host.c
>>> +++ b/drivers/usb/mtu3/mtu3_host.c
>>> @@ -46,6 +46,11 @@
>>>    #define WC1_IS_P_95         BIT(12)
>>>    #define WC1_IS_EN_P0_95             BIT(6)
>>>
>>> +/* mt8196 */
>>> +#define PERI_WK_CTRL0_8196   0x08
>>> +#define WC0_IS_EN_P0_96              BIT(0)
>>> +#define WC0_IS_EN_P1_96              BIT(7)
>>> +
>>>    /* mt2712 etc */
>>>    #define PERI_SSUSB_SPM_CTRL 0x0
>>>    #define SSC_IP_SLEEP_EN     BIT(4)
>>> @@ -59,6 +64,8 @@ enum ssusb_uwk_vers {
>>>        SSUSB_UWK_V1_3,         /* mt8195 IP0 */
>>>        SSUSB_UWK_V1_5 = 105,   /* mt8195 IP2 */
>>>        SSUSB_UWK_V1_6,         /* mt8195 IP3 */
>>> +     SSUSB_UWK_V1_7,         /* mt8196 IP0 */
>>> +     SSUSB_UWK_V1_8,         /* mt8196 IP1 */
>>>    };
>>>
>>>    /*
>>> @@ -100,6 +107,16 @@ static void ssusb_wakeup_ip_sleep_set(struct
>>> ssusb_mtk *ssusb, bool enable)
>>>                msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) |
>>> WC0_IS_P_95;
>>>                val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) :
>>> 0;
>>>                break;
>>> +     case SSUSB_UWK_V1_7:
>>> +             reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8196;
>>> +             msk = WC0_IS_EN_P0_96;
>>> +             val = enable ? msk : 0;
>>> +             break;
>>> +     case SSUSB_UWK_V1_8:
>>> +             reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8196;
>>> +             msk = WC0_IS_EN_P1_96;
>>> +             val = enable ? msk : 0;
>>> +             break;
>>>        case SSUSB_UWK_V2:
>>>                reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>>>                msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
>>
>>
>>



