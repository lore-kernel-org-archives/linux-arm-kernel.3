Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6EDCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IANMv7sMsuJ933QfOBzi7RkPmbnivtVNGpmkVnqW8C0=; b=VFMlEo5Hg9ypzlgl8OOvAB2Zdi
	lmsQhYO5IpAfZQzhV2xIxtrHJgEecNpXLE+3Mg9x0nOjFco8Nzzg48R9bOEfyV9W1b+MV3hZN0Hlx
	RWLShLfVegy2MNwC9ok5pr0akU1E5wQfqFKnzNkDaIuWihLylazHOrZM4zNEK42Emuvwstrr89lAB
	MkVcq+en93pXcn6bfczpulvxWZypdGf7tISQ/rm03UJx0jfMRdtys7ausT4Jya5dBAtgqVQLj74Ak
	eZ9QVYmvwISVdckacaoWynrJICDi3o6UK00Ysqa08pUouNyB4t0iuBw7vgxDJVkJcpCNaF0PGF2W0
	DFuUsJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQEa-00000005Knu-1gop;
	Mon, 10 Nov 2025 11:38:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQEY-00000005KnZ-406d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:38:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68AB560008;
	Mon, 10 Nov 2025 11:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01475C116D0;
	Mon, 10 Nov 2025 11:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762774732;
	bh=AgqRNHlM28QFo1a1gtxVwTp0nGA/pHQtS0abwMu9VOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EJaSqtLgJoBnUagiGNQVs62D7nvbF1c6hPdzeseRRY0g4NowPmn0yP2ilFRqTGqUW
	 sPzkkTwJN5cjPQUratvqSN/q4oUc88lzC+xgup0xuMr47TNPr85oYO4t0K8e79SH5D
	 ruSwgoiq59BcaR0tj0vsS65NNiWAPw1gwHLyExzon9keUMMA8f+r7l7qifUYC2Gi+d
	 mF3mBDe4tSInlDj1+LN0ADjIht/yti36STMl1jUDDEq6SDnTJNUFZbx59UwbDrMoig
	 jdDJS0HlpPJS0ysSAD9mfFsm9LvUEmrRe1v7u9afR9zdxlTsvSINT1gbgQewAVAa26
	 Shp8A7TPwDztQ==
Message-ID: <6a57032b-3726-4074-9212-f0f16269f11c@kernel.org>
Date: Mon, 10 Nov 2025 12:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUEFUQ0ggMi8zXSBSZXNldDogY2l4?=
 =?UTF-8?Q?=3A_add_support_for_cix_sky1_resets?=
To: Gary Yang <gary.yang@cixtech.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
References: <20251107033819.587712-1-gary.yang@cixtech.com>
 <20251107033819.587712-3-gary.yang@cixtech.com>
 <69efdb9a-c03a-42f4-a78e-18c8a2b29322@kernel.org>
 <PUZPR06MB58875805D441AF3213189979EFCEA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <38e8e068-d06b-41f0-9cae-5dfdf0fcce6f@kernel.org>
 <PUZPR06MB588726F24E6193ADD6CF224CEFCEA@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <PUZPR06MB588726F24E6193ADD6CF224CEFCEA@PUZPR06MB5887.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 10/11/2025 12:32, Gary Yang wrote:
> Hi krzysztof:
> 
>> -----邮件原件-----
>> 发件人: Krzysztof Kozlowski <krzk@kernel.org>
>> 发送时间: 2025年11月10日 19:22
>> 收件人: Gary Yang <gary.yang@cixtech.com>; p.zabel@pengutronix.de;
>> robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org
>> 抄送: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; cix-kernel-upstream
>> <cix-kernel-upstream@cixtech.com>
>> 主题: Re: 回复: [PATCH 2/3] Reset: cix: add support for cix sky1 resets
>>
>> EXTERNAL EMAIL
>>
>> On 10/11/2025 12:18, Gary Yang wrote:
>>>>
>>>>> +static struct platform_driver sky1_reset_driver = {
>>>>> +     .probe  = sky1_reset_probe,
>>>>> +     .driver = {
>>>>> +             .name           = KBUILD_MODNAME,
>>>>> +             .of_match_table = sky1_reset_dt_ids,
>>>>> +     },
>>>>> +};
>>>>> +static int __init reset_sky1_init(void) {
>>>>> +     return platform_driver_register(&sky1_reset_driver);
>>>>> +}
>>>>> +subsys_initcall(reset_sky1_init);
>>>>
>>>> This should be rather just module_platform_driver. Does not look like
>>>> part of subsystem, but looks like regular driver.
>>>>
>>>
>>> Some modules depend reset module. When boot system, these modules
>> can't probe before register reset.
>>
>> Which modules? You statement is so imprecise that my only answer is:
>> sorry, deferred probe is old thing now and everyone should use it.
>>
>>> To make these modules probe earlier, we use subsys_initcall() to
>>> instead of module_platform_driver(). Do you have better suggestions?
>>
>> Look how deferred probe works.
>>
> 
> Yes, you're right. But deferred probe needs to take more time on booting.
> To make the boot faster, better experiences, we have to use subsys_initcall()

Again, imprecise statement. How faster? With such arguments - twice
(first list of unspecified modules and now of unspecified boot faster)
the answer is the same. And I will not wait for third imprecise
argument, because this is not a ping pong game.

Anyway, manual core ordering is not the solution.

Best regards,
Krzysztof

