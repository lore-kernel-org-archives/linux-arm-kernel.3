Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255C0C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haP8DysK+ZsJJoO4m4ZHaZ32DNWkpdGhZARS0zG7P1s=; b=DL4kifBGR+DTl5HH5AfXGV2yiY
	vnbk+jmMfeBWvliG+69EtK3cU2yoURQuCQV2ud1yFzDVMOdNAyU1nnR6xQhD+VWa1h4c084kePZwS
	f/OZSSpBEy40iJRfA4wTHTwy8wSudzJCc4Sl7wavO7cp8MVtOl4ASyOuf9q1Cts4B9h8sRxQtAgkg
	aRvWFx10/R6pmM7LKjHQ4u2p6mfjB3ZgPpbebrah73Jcd7iscexBCj3G2B4Cqh5qn3EvR6rWhNy3A
	2SB/IMv9HTif1n4sJg3/nF0rPYikTUj8iRYTCMYNvJS5r5+z7qX5edxY2Ygg1Eh7OTHFnEZjtpuxw
	sccTVm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyIl-0000000Eh6S-2N2P;
	Wed, 15 Jul 2026 12:01:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyIS-0000000Egt2-06g0;
	Wed, 15 Jul 2026 12:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116861;
	bh=YxDIJjLunXFjPXYlZNPG+F+TXz5f9JYTX8dKFMJ8Fto=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ok9cbby4QZVRUcodeY8oSolFWZTcfJ7iK51/Ee0ySsKd+QnXmsYI3pzz5d0kuPV1D
	 cSL7S1oug0X02dy5wpsKsszBYaWLh4ASC3kUMDFAVEqN/q+BdWN3h176zGYXdJCGZj
	 H5iEG7QuP/IQsKN58oOQzBCsXpd7mDm3vwrDROHMdup1W0hgnSqhQpxvra0/9a32BD
	 EvnHeeYgROk6AYUCeMrxyA/UTnJsCwecIYnj05jtTMpN6rVTUnDux356ldgaP46iqG
	 PpspMKxeYFVp5kiBUkENLAPmuK+9rqY5uEnl3B7gWwqHq9XHb1Rdr40CautHTWctM0
	 tAbqEYZKppXyQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 41F0717E071A;
	Wed, 15 Jul 2026 14:01:01 +0200 (CEST)
Message-ID: <d2a9089f-9c86-4c92-8f6c-e85952ab8502@collabora.com>
Date: Wed, 15 Jul 2026 14:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support
To: Roman Vivchar <rva333@protonmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
 <3c112acd-5709-4144-9cab-54e0a51eefc9@collabora.com>
 <4W-fQkS-fQ5Wxua-0vkMZoLw98eklcnIN_ivaYjpWLIVX7qfCBjHGRJq8xQ59PTTIUNbzdT3EqkCsVqz_smuozi0Q3kq4antn54-rPXdmdI=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4W-fQkS-fQ5Wxua-0vkMZoLw98eklcnIN_ivaYjpWLIVX7qfCBjHGRJq8xQ59PTTIUNbzdT3EqkCsVqz_smuozi0Q3kq4antn54-rPXdmdI=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050104_281960_9AB06679 
X-CRM114-Status: GOOD (  17.19  )
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

On 7/15/26 13:24, Roman Vivchar wrote:
> Hi AngeloGioacchino,
> 
> On Wednesday, July 15th, 2026 at 1:21 PM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> 
> ...
>   
>>>
>>> +static const struct pmic_wrapper_type pwrap_mt6572 = {
>>> +	.regs = mt6572_regs,
>>
>> MT6572 only has PWRAP_OP_TYPE, PWRAP_MSB_FIRST, PWRAP_GPS_STA additional registers
>> compared to MT2701, and the three are currently unused.
> 
> GPS_STA is indeed unused. As for others, downstream kernel includes mt6320 path.
> 
> //###############################
> //Enable 6320 option
> //###############################
> #ifdef SLV_6320
> WRAP_WR32(PMIC_WRAP_OP_TYPE ,OP_TYPE_CSL);
> WRAP_WR32(PMIC_WRAP_MSB_FIRST , LSB);
> #endif
> 
> Though I haven't seen any mt6572 device with the mt6320 so far, as well as
> pwrap_init_chip_select_ext is configured for the mt6323.
> 
>> Instead of adding yet one more huge array for 3 more registers, since I'm mostly
>> sure that those will never be used anyway (happy if you prove me wrong!), you can
>> at this point just use mt2701_regs for mt6572.
>>
>> Perhaps, add a comment saying that MT6572 does indeed have those additional regs
>> but were omitted because currently unused.
>>
>> So, something like
>>
>> /*
>>    * MT6572 has additional registers OP_TYPE (0x10), MSB_FIRST (0x14), GPS_STA (0x40)
>>    * which were omitted as they're currently unused in this driver.
>>    * Apart from that, the register map matches the one from MT2701.
>>    */
>> static const struct pmic_wrapper_type pwrap_mt6572 = {
>> 	.regs = mt2701_regs,
>>
> 
> I'm not a big fan of dead code, but at some point the mt6572+mt6320 may exist.
> Would you suggest keeping mt6572 array or drop it until some mt6320
> device appears?
> 

Nah, please, drop it until some MT6320 device appears.

Besides, you also said that you haven't seen any MT6572 w/6320 so far, so it's
even more unlikely that we'll ever see one.

While at it, could you please also add the information about MT6320 cases in
the commit description?
Something like "blahblah additional registers blahblah omitted, those seem to
be used only when the MT6572 is paired with a MT6320 PMIC blahblah" :-)

Cheers,
Angelo

