Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B360BC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1laLqgjUnaUcnFjk9BLHpqbDdGmR3XvSwWmqyqO21wM=; b=KRkq++OtSQJtEQ9KwyGRQaMRF5
	wMyoV6iGAkGsEnk7gyzwd/l45VvJ/rg06+YV5PVBdny7IMu+2rkLFwBWwcE8bFPE0EO/8fenB+3Ss
	JlzNWMfQLv8dVDVDMGcxeDp0I7SBZtzqjCKnmvnsGRFB3s1U+waKqawPO0VgCCEaZoOIIjzI24AI2
	7SmVrqUTu2rL5MY2iVYFZT/QcQ9nKT8nwf3zSqsGLWFd2f43SKaH1EwPy26pchGGfuujc7WvkYgWH
	62xpH/m/DBR60EJFvEawEg17qDJSVw0g012t7ICte9JWOu31hp93uJTJ/ZGVn4UaCKDaMzK6Q/dQp
	tswp+l2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJRf-00000005bQf-48NL;
	Mon, 12 Jan 2026 15:03:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJRd-00000005bQE-3Pkd;
	Mon, 12 Jan 2026 15:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768230178;
	bh=L8or3v6iZqrpLG7v8P5SZLYbYdbPGHmvZtbWstQCXis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oFuM3PXQ6KC4yt+dpdSV2jD9qpBTJQN12cbkZTyofIHJdFu9irgkEQSzuepDTp0Nz
	 0xiVCTtGtze+t+mMgNP/5st2JUv49OKCvT262OVD9VW9/0MI+slisJ3rLKCt5lHz9h
	 eN3PsNhsKw1Opd9tANFEcqIR9TYM/cOUz4ZY0tPlULcjDTGGEQLnY3ikCV/SSElYs3
	 d+NqlbjVFzZJo/IN7bGWmE7Okj5upYx9tEjamPNv60ZWu121Vi5Z1wxlgkKmCH+T2U
	 7vSwxZn6HnR55FYLoCZORcxBQmcsEU8Eu/nm1wjdFDZstYMPbFESsCgU83Um6MJ9OA
	 DGRQ62xDTZ+LQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9529717E138B;
	Mon, 12 Jan 2026 16:02:57 +0100 (CET)
Message-ID: <26c68bb1-1e63-4b47-babc-21ae27e3205e@collabora.com>
Date: Mon, 12 Jan 2026 16:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/24] scsi: ufs: mediatek: Rework probe function
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260108-mt8196-ufs-v5-0-49215157ec41@collabora.com>
 <20260108-mt8196-ufs-v5-11-49215157ec41@collabora.com>
 <81ed17eb-2170-4e97-b56d-488b5335ff5c@kernel.org>
 <dd2eba99adaddf7517f06acf7805d32e261fafa4.camel@mediatek.com>
 <87887adf-2c94-48c2-8f83-4e772ab50f60@kernel.org>
 <e9a6da3998195b9dbda5abd26bc6dd5d3aca07ff.camel@mediatek.com>
 <66ca211a-c909-4d0c-a22c-9cbd3489d372@kernel.org>
 <46cb450f92887ceba07614dc85ed495f6af7f602.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <46cb450f92887ceba07614dc85ed495f6af7f602.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_070302_039764_E027927C 
X-CRM114-Status: GOOD (  13.01  )
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

Il 09/01/26 10:16, Peter Wang (王信友) ha scritto:
> On Fri, 2026-01-09 at 09:43 +0100, Krzysztof Kozlowski wrote:
>> On 09/01/2026 09:38, Peter Wang (王信友) wrote:
>>> On Fri, 2026-01-09 at 08:24 +0100, Krzysztof Kozlowski wrote:
>>>> On 09/01/2026 07:22, Peter Wang (王信友) wrote:
>>>>>
>>>>>
>>>>> Is it sufficient for us to supplement the ABI document?
>>>>> This ABI might affect the ability to reset and recover after
>>>>> an UFS error in upstream world.
>>>>
>>>>
>>>> In normal case yes, but I cannot imagine arguments justifying
>>>> your
>>>> usage
>>>> of TI properties. Basically it would not pass review.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>>
>>> Yes, this part is indeed because MediaTek’s reset hardware
>>> implementation is the same as TI’s.

No, MediaTek's reset hardware implementation is not the same as Texas Instruments.
It was *very similar* to TI in the past (years ago, around the MT6795 Helio
generation times).

MediaTek's reset controller - by hardware - is definitely different from the one
found in TI SoCs.

Regards,
Angelo

>>> That’s why we used “compatible”
>>> instead of actually implementing MediaTek’s own reset controller.
>>
>> So that's another purely downstream code. Additionally very poor
>> quality
>> downstream code.
>>
>>> So, are you suggesting that we upstream a MediaTek reset
>>> controller,
>>> even though the code is almost identical to TI’s?
>>
>> If you ask about DT, this is already answered in writing bindings
>> document. You cannot use someone else's compatible. Was also re-
>> iterated
>> on mailing list bazillions of times.
>>
>> Best regards,
>> Krzysztof
> 
> Okay, we will correct these incorrect usages.
> 
> Thanks
> Peter
> 
> 
> 



