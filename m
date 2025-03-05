Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DEEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vuFN/jAWUV8oSySeTeSSaiA6Uvm37tEvMJEzOIOIVc=; b=PObql4uUeUfwcWouaZAMdYBS9Z
	2iUAjABrUe/73pKSvErWmDN2f6nI4A3BLLAI/bNC+aLorOPIRXW9sktg5oRWpbu2tz7Hu8EzaWaC3
	h7hrgGyvU/pGHVrWQU/hLqxWgH55KtKFziwvXFX2ajnYyDzS0RZRkMWFvQ+b1bXYEjfU8eLHpC6kg
	x1KdvWVRpx0M0VP3nRTgXsJlRWNshZAJVvZh8CmkyHxgIkn4al76DJukgK8IxbjumSxqOWxlSle78
	grJfZ+lomszSqqew6A9Oxpx+nT+O4HFx5dqUR53UIrRi4XETlw+bab7XcQxW1wV/bylut3m+tM6s5
	f5XmH25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnJ7-00000007v9w-26c6;
	Wed, 05 Mar 2025 11:53:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmX5-00000007nAK-27u6;
	Wed, 05 Mar 2025 11:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741172600;
	bh=RGJcaalCEarW5jwI3J/1uzxBnyofX9WJFnHBzN1I0u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ca+GaY1NHRG821pXxcN2YgQThJ4wozNyL5ewinAdLGmBBu63gQ4riKGjkQoaXPy1h
	 eQsSYsnKtxuH2MRuR2tF4y/rz1OBlc8q1pp9rsyBnCFu5jp5LEo3f+0cE7D5AG0PoP
	 1NqkHaf481Ivk35YPtiZybbVokgSfncR19+jtcHfh8PKwfhCb1dsZnu0j0ELO0QfRx
	 +U880/O+Uxtq1Rjpz/ef54E3OVaFFjIo3ePswS8+azo/gVyuPNmx4bB7SOTsa3qtLf
	 5Z6c7ceG9rRTfPt7bRyt90UtUc7SLVunx9GHUUzETVutemstvWn1oDcI8Yh8MXiL6B
	 C4rVCXAnzNf+Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C09017E0343;
	Wed,  5 Mar 2025 12:03:19 +0100 (CET)
Message-ID: <8203317e-7f99-4ea5-bda0-fcd791602a9f@collabora.com>
Date: Wed, 5 Mar 2025 12:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
 <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
 <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <03c523e66fd56442f49c38456476cf18be59e8fb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_030323_725917_EA55AFA7 
X-CRM114-Status: GOOD (  20.87  )
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

Il 05/03/25 10:46, Jason-JH Lin (林睿祥) ha scritto:
> On Tue, 2025-03-04 at 10:35 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 18/02/25 06:41, Jason-JH Lin ha scritto:
>>> When GCE executes instructions, the corresponding hardware register
>>> can be found through the subsys ID. For hardware that does not
>>> support
>>> subsys ID, its subsys ID will be set to invalid value and its
>>> physical
>>> address needs to be used to generate GCE instructions.
>>>
>>> This commit adds a pa_base parsing flow to the cmdq_client_reg
>>> structure
>>> for these unsupported subsys ID hardware.
>>>
>>
>> Does this work only for the MMINFRA located GCEs, or does this work
>> also for
>> the legacy ones in MT8173/83/88/92/95 // MT6795/6893/etc?
>>
>> In order to actually review and decide, I do need to know :-)
>>
> 
> Yes, it's for the SoCs without subsys ID, it's not related to the
> MMINFRA.
> 
> This can also work on MT8173/83/92/95 // MT6795/6893/etc.
> You can remove the `mediatek,gce-client-reg` properties in their dtsi
> and cherry-pick this series to verify it. :-)
> 

This is curious - and that brings more questions to the table (for curiosity
more than anything else at this point).

Since this is a way to make use of the CMDQ for address ranges that are not tied
to any subsys id (hence no gce-client-reg and just physical address parsing for
generating instructions), do you know what are the performance implications of
using this, instead of subsys IDs on SoCs that do support them?

Being clear: if we were to migrate a SoC like MT8195 to using this globally
instead of using subsys ids, would the performance be degraded?
And if yes, do you know by how much?

What you're proposing almost looks like being too good to be true - and makes
me wonder, at this point, why the subsys id was used in the first place :-)

Cheers!
Angelo

> Regards,
> Jason-JH Lin
> 
>> Thanks,
>> Angelo
>>
>>
> 




