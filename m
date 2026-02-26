Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397AAFC5926
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3WEZrYfla4xz+1nx4sbFXm09bsKMdAQd/62PrBV4VdQ=; b=eOGAXQGSB1nc8l3M3KnCe6T6HV
	A8YkhD/3gqBv8aMjwZXJxVILkHris3lRK5h7COzJly0s+Zf+AJmnpelhjnhbw4f/hxn22N2V3S5vg
	RmShQKSaGyecTJcsV2MljAzmrCdjLnlQWJo18Ob64XJbtrZkOlhyXnkU4NKTXwGGb2bHEEO/PVzhR
	RGckbqpjDBD64UPYgG9eHNy5/HmAKQp0NTS9+fB/1NGZ8Q39qfjNb19q+eq/XV/iXt3U1G5mFvQjJ
	UwR3gb9BUUAU1DBhwnog1/mAUHW7azwxLH4T4EVFKgH7N9kevgKif6tZ//pMkcsPIRXR9bHBn/ZXJ
	K0fkqF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYsH-00000005wre-0hEq;
	Thu, 26 Feb 2026 10:45:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYsF-00000005wrD-0iIC;
	Thu, 26 Feb 2026 10:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772102736;
	bh=6YFT7Dv9/RPthcEUnhhwy5zDoUaHap7U9kpRpUeIPV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aOKhl1gYmC58Q5XnPaaVFV4AX+HRZb/FaZT8kvMrbAX4ocU8UvOwkOrmxuMbZExjm
	 q/5pxtHOPqwZtl4qTw/eJkvwmwu5Yj9BE8qGvk6kr1AVqhRzDERERpxn0XgjJTSvtj
	 wPWqCgfmYc2RdUxfhGerzWAUOPfTrzvqV1AHbpTXLngoKvpWhap3qPd5vgpOjw+QmD
	 jnx5GXl85lesOX+SfuCKuFHcINonNKENolDlEjaEzUzEdf6A2Y+z2QRqnjOM6Ck3Ao
	 xcyP/cF9XTE1tbDfDSOKNbv0yQ8lZjCVnr0uv25vTWPWTLA0Vw3Efc6/I3SM5fQhuC
	 zmAai5oTQnjcg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C83017E0029;
	Thu, 26 Feb 2026 11:45:35 +0100 (CET)
Message-ID: <84f22f00-e3eb-4ea5-999e-260c81f29338@collabora.com>
Date: Thu, 26 Feb 2026 11:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/23] scsi: ufs: mediatek: Clean up logging prints
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@hansenpartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
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
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-16-b5f2907c6da7@collabora.com>
 <c333898413d249c017430d4ae98bc7be3bf33a64.camel@mediatek.com>
 <2575185.irdbgypaU6@workhorse>
 <f0e97a38-a11b-4e69-902a-e0ccd0dc4540@collabora.com>
 <259b24885e5e721ae562d27dd761b02e6a68c971.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <259b24885e5e721ae562d27dd761b02e6a68c971.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_024539_501159_D7FB9098 
X-CRM114-Status: GOOD (  19.15  )
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

Il 26/02/26 08:00, Peter Wang (王信友) ha scritto:
> On Wed, 2026-02-25 at 14:18 +0100, AngeloGioacchino Del Regno wrote:
>>> Depends on your view of what's useful information for the user.
>>>
>>> I can change both of these back to _info if I have to send out a
>>> next
>>> revision, just to get this through though.
>>>
>>
>> Definitely don't change that back to dev_info() as this is debugging
>> information
>> that spams the kernel log for no reason.
>>
>> This has to be dev_dbg().
>>
>> Regards,
>> Angelo
>>
>>>
> 
> Hi AngeloGioacchino, Nicolas,
> 
> At least, "device reset done" is important information that
> users would care about, and it should not spam the kernel log.
> You wouldn't expect device resets to occur repeatedly, would you?
> 

Sorry Peter, but I'd argue that the users don't care about how much and when
their UFS device resets. Users just want to use a device, without caring
about any implementation detail.
The spirit is: "radio silence as long as everything works good".

Power users might want to check the kernel log in a problematic scenario to
seek for a message that says that "something went horribly wrong", but other
than developers, nobody cares about when UFS resets.

 From a developer standpoint, I do agree with you in that we do *not* want to
see device resets occurring repeatedly, but we're talking about a user here.

See it like this... imagine if all of the device drivers in the Linux kernel
would say "device reset done": how many devices are present in one SoC (of
course, ignoring subdevices on a board)?

Of all those many devices, if all of them would print a message saying that
their reset is done (and operation is ok), the kernel log would get quite a
bit clogged, you'd need to have a bigger RAM carveout just for .. well, the
kernel log itself, and then you'd have to grep the log, hoping to find the
one single line that helps you finding an issue that you're having.

This is the reason why keeping any message that is not exactly a *single*
indication of an error (so, an actual issue) as a dev_dbg() is a sensible
thing to do (and of course, with dynamic debug in the kernel, you can always
activate that on-the-fly without recompiling to verify functionality should
you have any immediate doubt).

So while I agree about your reasons, I very strongly disagree about having
this message as a dev_info(), nor anything else that is not dev_dbg() really.

Regards,
Angelo

> Thanks
> Peter
> 


