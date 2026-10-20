Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765CF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 02:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kip5jrlf;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PrJl/E5X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7U0HqiaHhO1m0861+/gW/QJicAZ/PhQcq0hpT521/s=; b=Kip5jrlfYfKNKMMlnanWaEX1cB
	ZSXIwB4Fai7cTJQvnqDKzMtv5aHOkUZYA/6iyp81+sGpGYbXRSclkxdjXjuVPxKtP8ibnPlMO1Khn
	hVWW3XX2kqaL9ZEi0/5eJMNWLRHshT/sWfxVjfF/HtD5dzXhC+B3Zs0Asw5vmUQmVFEkjs8cbVqxg
	TGLuPTpxd+xViT9CFt4+rbk7/ppHRPoSEQshJETYrsOKrY6GyghR2iRpj8Je+phPpvxHRdm9r1a3c
	AE+69zVTwVHPumbEUuVFid59gULVQiBDiXVp1jonMnFPt90OKcR9zkzHZuOYvHX1tpD+Aypm11BAD
	s/8R0k2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzT7-00000008g1S-2oCO;
	Tue, 20 Oct 2026 02:20:49 +0000
Received: from mail-m81175.xmail.ntesmail.com ([156.224.81.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzT4-00000008fxF-0mON;
	Tue, 20 Oct 2026 02:20:48 +0000
Received: from [172.16.12.99] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51a2dc0ed;
	Tue, 20 Oct 2026 10:20:34 +0800 (GMT+08:00)
Message-ID: <fb24d2a7-0077-4560-83aa-f957551a3f6d@rock-chips.com>
Date: Tue, 20 Oct 2026 10:20:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: rk3x: Disable the controller between transfers
To: Shawn Lin <shawn.lin@rock-chips.com>, Alexey Charkov <alchark@flipper.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
References: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net>
 <bfe8baa4-e740-4908-9d2a-4defc5240a82@rock-chips.com>
 <CAKTNdwFYxPeaG6pZn3SYoR6cPAtON37ajo4nZpPE0Hm=y2c6Lg@mail.gmail.com>
 <9c18acc0-2b4b-4f19-9928-de1632718f15@rock-chips.com>
Content-Language: en-US
From: David Wu <david.wu@rock-chips.com>
In-Reply-To: <9c18acc0-2b4b-4f19-9928-de1632718f15@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1571c494409cckunm07388fb3343522
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQxlNSVZCQkxLTUkeTU
	8aS01WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PrJl/E5XisJvbfnc9+7tFf7oJI4BEsiNbiAl0y2cjIN4VdvW/WveXgzocZyORanuMX2zpU5gwWVyhhTbk+L2WN0QnwTuLnk1hh3AWY2XGlycbMmy1KwTuOWL95oanpwe0obe/IwColaKBCbgHQQ21acbKqTqJjhQYwNE77MWbRI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=O7U0HqiaHhO1m0861+/gW/QJicAZ/PhQcq0hpT521/s=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_192046_948666_AE69F51D 
X-CRM114-Status: GOOD (  17.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexey,

There's no deterministic way to reproduce this, looping suspend/resume 
seems to be able to trigger it eventually. The problem case is IEN != 0 
while pclk is already disabled: the irq handler doesn't re-enable pclk, 
so it can't actually clear the interrupt, and you get "irq in 
STATE_IDLE" printing forever. So the extra IEN write here is just a 
belt-and-suspenders safeguard.

在 2026/10/20 08:48, Shawn Lin 写道:
> Hi
> 
> 在 2026/10/20 星期二 0:50, Alexey Charkov 写道:
>> Hi Shawn,
>>
>> On Fri, Oct 16, 2026 at 4:33 AM Shawn Lin <shawn.lin@rock-chips.com> 
>> wrote:
>>>
>>> Cc: + David
>>>
>>> 在 2026/10/15 星期四 22:00, Alexey Charkov 写道:
>>>> The driver leaves the controller enabled once a transfer completes, and
>>>> an enabled controller keeps tracking the bus. If the lines collapse 
>>>> under
>>>> it while idle, as happens when a target's supply is switched off while
>>>> its bus pull-ups stay powered, its state machine wedges driving SDA 
>>>> low.
>>>> Every later transfer then times out, since the timeout path only 
>>>> requests
>>>> a STOP and never disables the controller, and the stuck state even
>>>> survives a kexec.
>>>>
>>>> Clear the enable bit once each transfer is done, successful or not, so
>>>> that the controller does not watch an idle bus and starts every 
>>>> transfer
>>>> from a clean state.
>>>>
>>>
>>> I checked the vendor kernel tree and saw another case that you perhaps
>>> need to fold something similar below into your patch, along with your
>>> disabling controller?
>>>
>>>       In some case，log like this:
>>>
>>>       [   12.393926] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd = 
>>> 0x51
>>>       [   12.416592] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd = 
>>> 0x51
>>>
>>>       The i2c clock is disabled, so the pending irq clean is not
>>>       worked. Disable the interrupt after the i2c jobs were done,
>>>       the error log would not happen.
>>>
>>>
>>> /* Disable i2c all irqs */
>>> #define IEN_ALL_DISABLE   0
>>>
>>> i2c_writel(i2c, IEN_ALL_DISABLE, REG_IEN);i2c_writel(i2c,
>>> IEN_ALL_DISABLE, REG_IEN);
>>
>> Thanks for looking into this! Do you happen to have a reproducer or
>> any additional info on how this state gets triggered? I haven't run
>> into it in my setups - did I just get lucky? :)
>>
> 
> Unfortunately, I don't. That came from what I found when checking
> the vendor kernel commit to see how we handled your case.
> 
> So I have looped David who made the internal submision for the same case
> as yours 8 years ago and hope him could have a comment here.
> 
>> I see the same write of 0 to REG_IEN just above my changed lines for
>> the case if (time_left == 0), which makes sense because a
>> too-long-running transfer might eventually complete and trigger the
>> interrupt with the controller disabled, unless the interrupt is
>> disabled too. For other cases I'd be interested to know what can raise
>> the interrupt.
>>
>> Best regards,
>> Alexey
>>
> 
> 

