Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01C1105A591
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ty54VHF8yvxuGGhYDMh9gmHeinItwH7ANN23MMH9uWY=; b=HUO/0t2kFv7wdTu4XZLK/VEbWE
	t9auXg2GeWl5+4hNqBrYCWL2resHgCBs7b5VHVQPsHASOCPYExCrqmf2mOSkKz34KVQ59nhSIQenL
	CKSszdTRMv1Rx+Dhq3u+ZgjuDZHZdVOauOQIGVVw2zzVp0VTx479YNu8TmFRQZWJlVoP/SIMDc/C1
	LgLawB9Q7pH4GfAIuJ9cthpmKlVku8qS3zxJ2c7VmR9Ao7wSpzqKY/ILWGWVqqo1iKa46vOdSAotW
	3Lh/JnJrP+1a4vQvuhX9WI8dqXVi6IziawxZuk7Jls6gTfaglBXg+uiTFjvsQQqvrjUiKCdaePh7i
	hDQjVzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fYj-0000000E5CB-3yfb;
	Thu, 12 Mar 2026 12:54:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fYi-0000000E5BX-3Mmu;
	Thu, 12 Mar 2026 12:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ty54VHF8yvxuGGhYDMh9gmHeinItwH7ANN23MMH9uWY=; b=kMtNQ9z2CnLqEMO6QVI6AsYFu4
	p4vCkcIYP0BRhQX6mi6YmMOpRWN/5HDZwIiByI+fiTbEOUagbmItK+vCKRedXnHjPUWFED1yvMaDb
	K5NpY0FiOkdqGJ4JXnWq+a/WBlufnF8Px98t3WqNJnlRewwF4I3yihNeuwHVsFASSMNMH4mfIJlIO
	bxPSMqxS4T6PPjfSHBLEb4PTHcAgXBL8ZArqW8B6dR3EQH/zch0z1JNSnQwgQkU0N54jIhGN8Vrb7
	rMBjd7yiXwLRYBkaeeGueFOC9FFEHgwX3bj1k96o2SnpTO7NyxnOTv+qB2Qr8uXZb1hI0Ec5M78Hq
	QZLDuh1g==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fYf-00000001Aei-2b4P;
	Thu, 12 Mar 2026 12:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773320062;
	bh=C/NkVQNNGo4EQd299QTibe2nPSsMByDx86rINHtzd0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a9/GnhF43SOshCt13goOtyiT7ex3KghXkeWXTMkpgmNGBt3q6iEvZMer3LCfCIrEU
	 K9aV3S3iQ6AarYvHvlc5ASgRi7zLQxukgD/xlaJIYBp/jZplWE2jClMpwA9sssn1TC
	 VwwE2ahGtr/lW/cSWg+tygIXyXeVWuW5G/m2/4PmuuBk/qT4KySus/vDAExMOS1T8X
	 PsuLEQ+LQ3hUFjZU71nLdz0rTocJ4aBUMXL7Oqy8pGhY6AQ6xySHkrfW3VSFfcBvei
	 CJgbXTQpULor4IwYL1rWqitUy2qzZySClowt+dveTv0CsqAyfObtIHQYrKJpo4VrIO
	 wBipJWp1+ye0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D89D517E0E6C;
	Thu, 12 Mar 2026 13:54:21 +0100 (CET)
Message-ID: <f5b3a8d9-cb5e-4341-a89d-0a07bd4207ac@collabora.com>
Date: Thu, 12 Mar 2026 13:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for
 Lenovo B8000-F
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260304192417.818211-1-akkun11.open@gmail.com>
 <20260304192417.818211-3-akkun11.open@gmail.com>
 <94465ca7-b3dc-4736-9d58-4024f2494e54@collabora.com>
 <CAKr_iV5cmE-GBp679Q-=bZi+186BvMvD41ctxnxNC3mTKEzuRw@mail.gmail.com>
 <0994fef0-88f2-4277-aa46-0b6a33c53bfa@collabora.com>
 <CAKr_iV6tVkT1be8EjXoNjMerTek0s79W2-n2shzt-wrmB1bYgA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAKr_iV6tVkT1be8EjXoNjMerTek0s79W2-n2shzt-wrmB1bYgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_125433_757292_DCE28809 
X-CRM114-Status: GOOD (  22.49  )
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

Il 12/03/26 05:36, Akari Tsuyukusa ha scritto:
> On Fri, Mar 6, 2026 at 11:06 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>> Ouch. Well, it's mostly done then, hopefully sooner than later :-)
> 
> Thank you for your consideration.
> 
>>> - PWRAP and MT6320 PMIC RTC
>> Start upstreaming the RTC (and MFD parts) right now maybe?
>> That all depends on the actual state of things, of course.
>>
>> Remember that you can upstream whatever is clean and works fine, that doesn't
>> have hard dependencies on other components.
> 
> mediatek,mt6397.yaml says that "regulators are needed",

ARGH! Forgot about that :-)

> so I have to complete the regulator driver.
> It will be completed soon.
> 
>>> - Power Domains (scpsys)
>>
>> The power domains should be handled by mtk-pm-domains.c - not sure what you wrote
>> but if you did it on mtk-scpsys.c that's wrong.
> 
> Ohno! I wrote in mtk-scpsys.c, thank you for telling me about this.
> 

I really have to add a comment in that driver saying that it's deprecated and it
shall never be used ever again, if not for already present legacy SoCs, which
should get anyway migrated to mtk-pm-domains for good measure (but I don't have
any of those, and I can't do that myself).

>>> - eMMC/SD (MSDC)
>> I can confirm that the MSDC controller in MT6589 will work with mtk-sd, there may
>> be some very small modifications to be done.... if any.
>> The mtk-sd driver does support "very old" SoCs already :-)
> 
> I forgot to add "CONFIG_REGULATOR_FIXED_VOLTAGE=y".
> SD is working and can boot from it.
> However, increasing the frequency causes errors,
> so adjustments are necessary.

Told ya! :-)

Cool to know that you're getting nicer and nicer progress over this!

> 
>> Keep up the good work!
> 
> I will continue to do my best!
> Further news will be sent via patch.
> 

Patiently waiting, and excited to see the news!

Cheers,
Angelo

