Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1686DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 06:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC77WlJiY7xDNwuW+a/NNVnjeTtDmbfZWKvyKnOLc0A=; b=Ua9HjFNgZhQdBmIy1dz8XiHluX
	PC22Bk7uys4oSYN+uhw+xkEBpcfwKFtVkYgSPYywew3slYfifi6c2U9HtPvd+zhAyiH8O71ls90+3
	emq9xJUDz4eaWoQMldE6T8lmO5izATINRnPbS65rWoa++7YBpE4Hp0f67lrX+OtIaXy2rUvfYUWyg
	sHuzWeVFnIuD9prEc/lfiJ2kctyEn5LVEgMPfyEMundtDzIT7lCSKEyeEeuAW55Muff5N/RhuPYHA
	t1IP2Cypc0QYHxrOM3eoGJpkXslwQPLmsHJjFilO5jlonAThQttPCmpEEPqRUcmq2SDfxqqR3/16c
	KGp57+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untEe-00000006ciU-4C04;
	Mon, 18 Aug 2025 06:20:49 +0000
Received: from bg1.exmail.qq.com ([114.132.79.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untC5-00000006cXE-0F22;
	Mon, 18 Aug 2025 06:18:10 +0000
X-QQ-mid: zesmtpip2t1755497838t1fd5a6b6
X-QQ-Originating-IP: K5v4RAVWugn23UNjkoicspSCFboAu0bRGFTZhubq0CM=
Received: from [IPV6:240f:10b:7440:1:e696:3c18 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Aug 2025 14:17:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3725019992298414931
Message-ID: <F46196958466A8A7+60461f17-bd3a-4e17-be6e-b4f22dddcde5@radxa.com>
Date: Mon, 18 Aug 2025 15:17:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 jonas@kwiboo.se, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, ziyao@disroot.org
References: <058E04574291144B+66620590-b680-44b9-92c5-7dc4c43080e7@radxa.com>
 <20250815100110.1302357-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250815100110.1302357-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MhFAoh6gmjppIABUC5Nr7UHdRf/PRmw0CsLmh7kyn1LFXlDeJUL+F7tx
	zcvPEfG3jVlTRSFOYE9ETlGYW41Ak57STppNhCURMf4ZvYd3uzOGCNPEb535vSJ985qlQW7
	E6TQqdNMlgQ6C7lWWqXq5+Hs0YgOz3OTrj6jxQyVD805kJhZSdOOJRZFSoqBQHYWQsv6BAU
	HkGP2/dp7yzi9Yyg7eLZcC3kB4idAgxuZN+/pEv965vSgejW+6/ecdgoxdAgC1LAhsN5qoj
	0ctBbn8zm7LkEauVLVRPnRrCspdMP2iuIC/M+Xz0ue1Ow3GzITVy1n9TXL3Wa6Vr36xn0ws
	6CPeHR6Ma+Rx2ukHvxjh1Zu/hKMUeed2iJGKUzi+ZFibA3aYbTmSEEQdKNQlnDq01blJjf4
	RkRxdjrFoa9rWNo0FfT45yB5zShYUF/OpOq34ZaPoKyLMkjPCZrw59V46ddS1VtF9YC4Ecq
	khoIlMnfLNP8eXy8pAT1vYSA6vfjYMHZxNQkAtztXGAKr5GrbXCeX+/fUd7yzbubcbp14X0
	nvJTuEkFSTPMq5ltKmLMTtoA+JPdh3EDKOvP/LDBgkv6vlDgBRCb1GF9wZLr3oZdRCrnXdp
	5KwTXyLz0rtSA7bgb+81xOqJCutXJGsH136p90NZJEhxIBE3bWpndnE4yg8lWSiXoaw/BkV
	bys+Su5ou3bfRCirxmwfG2VFRecRhf/YaVh6mAtVViAOuVUom5He7zsiRnqoZrVcZCklvfs
	OTNF3xjw+2OBT7WXnrFiZ/Dr0EcWk/u8ur1zyy1RL5j3Sgel3A4EjOXTwW1hasavhoHR5XZ
	m/O6cVo3cg4cGeL+0SHTJyAG71dmCh3RhGC6No7vXGkXaN4zQNm3lGsDLKu97RzmwAp/YIM
	BHLu5vXDMJ8ZKay4HtD9mO6IGZ47/ftWE0GfdB0e4i/NfW58tXsThUDYONoMGIJtz+02TPV
	wFg128RFydSKMTd9gzAaSrFU4
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_231809_455793_A334E5EC 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

Hi Chukun,

On 8/15/25 19:01, Chukun Pan wrote:
> Hi,
> 
>> "label" is deprecated. "color" and "function" should be enough to
>> explain what they are.
>>
>> (Personally, I prefer LED_FUNCTION_STATUS to LED_FUNCTION_HEARTBEAT)
> 
> BTW, will there be versions of Radxa E24C and Radxa E54C with
> onboard eMMC? It seems that they are all onboard SPI instead
> of eMMC. If there is no onboard eMMC version, we can remove
> the sdhci node in dts.

Although optional, there are also E24C/E54C versions with eMMC.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Thanks,
> Chukun
> 
> --
> 2.25.1
> 
> 
> 


