Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733EECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9LuJtlyVxPJhHT/WYbeGudzGNgkTAxPFbkh2SdZG50=; b=MMSwRzXAWpjyj28+NQLOAKjoBT
	CzR5vktYsDdvvjafRa4jfhCXnrb3mFWQQWJWYObcnzG3BDjg2Pv3fZBM7feyb4JtTt9rSNdnK8M0W
	PiANYpbDtxUk2UuuFwMwN2PaDJw1HD9RMmE5FvOTfqerqcKj4GXVRjr6TdtgSEqnT3SyAopK1YHwU
	wPZ1LHBK/x7V4oacxq2z32N1i+BYpBivTg9h1tBLL0B51vwDhU2K+xl3Z/9BMCikx3jWLAK1sF24Q
	39bXPdif5/5jn00fAnagX9/8dEz94TCkeGskGiJd8JuueHk3hjZhz+Xd4tjgHqQgguPrPY5ph5Ml8
	ZU5T6VEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjF8-00000005lT4-2usd;
	Wed, 03 Sep 2025 08:53:27 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiMx-00000005Jsl-0lm7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:57:28 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id AEB01A0AE8;
	Wed,  3 Sep 2025 09:57:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=G9LuJtlyVxPJhHT/WYbe
	GudzGNgkTAxPFbkh2SdZG50=; b=W/FEEsSfmuCfkCG0oEWET5i9SdjR+Z0hvfnD
	919tOq99XHewP0Qxui/gVeTMGHVF+bAraGIUssL4DjV3wPhiMWjXY6wsd6R3IHJG
	RrWJpi0osuY+ejwE+x128F/NtgLzQH+zwIU9rL7L6ddeLx8swhRjX9OGUBd+kNus
	/Jpy+IXIvZm/72mCZgnQi3IO68KBYNnOusbDZEYp5J0PX0w3JlLG258yJpHITK2e
	4fxm7IlwRESqtaTuTqnjf0VxPxGtMkdV2YgL9KuHoLRlO1CZFkAxLiO8gNpOAre9
	SGH0m+ZLq72p+eOJqA474r5WhVUBkw2RRm4mBSo7sN6JzqTAnss+T1VMT/AFcq6M
	1M9/GwtSaqWxhg+YPw1Kvm2bNF2Infl214GRQCmt0Ywc1csgo9Ucg1e6LUMEW38f
	52c/acGWhU5oNA8/FEGNN0XhlzlaKzVABqO8xJKnTBnaDANfSwNEbGEdaG2MlFmA
	gQGVycQpR7SccNLHkGJtuhc7nqBH+atmeDsa/d6xqtAoRs/mhHP3eb3eKpV7BWCh
	MG3g0giYeSF3brw1etx7ozIrhO5BGshnl0ydzwoiWDSCYR62WYOFHCk1mIqgeacB
	0YcEQglvKToDXPJ7syEfUzPjzBWS6iaQ8A6S4KL7NnHRauOicMemAL5gJ3tooSKJ
	EWvW6/w=
Message-ID: <57518c46-2e92-4689-80a3-ae4c99b9fc32@prolan.hu>
Date: Wed, 3 Sep 2025 09:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>, Csaba Buday
	<buday.csaba@prolan.hu>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
 <fa7e2cef-5242-4f3b-84ea-d77b959f6bdb@pengutronix.de>
 <c85a94ee-59e1-47d6-8200-813bb434caf2@prolan.hu>
 <1bf75411-4a51-4103-b314-a8a7253bafca@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <1bf75411-4a51-4103-b314-a8a7253bafca@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.11]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155E637062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_005727_381048_88F74E6C 
X-CRM114-Status: GOOD (  17.50  )
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

Hi,

On 2025. 09. 03. 9:50, Ahmad Fatoum wrote:
> Hi,
> 
> On 03.09.25 09:43, Csókás Bence wrote:
>> Hi,
>>
>> On 2025. 09. 03. 9:28, Ahmad Fatoum wrote:
>>> Hello,
>>>
>>> On 15.08.25 17:17, Bence Csókás wrote:
>>>> The Ethernet PHY's reset GPIO should be specified in the node of the PHY
>>>> itself, instead of the MAC (`fec`). The latter is deprecated, and was an
>>>> i.MX-specific extension, incompatible with the new reset controller
>>>> subsystem.
>>>
>>> One reason to do it this way is that the PHY is in reset when the OS starts
>>> and the external phy-reset-gpios allows MAC probe to get the PHY out of
>>> reset, so it can be probed after reading its vendor/device IDs.
>>>
>>> Does switching to this new binding address this scenario? If so, it should
>>> be noted in the commit message.
>>
>> Yes, but after it has been reset, if the platform supports Power Management, the PHY's clock will be turned off, which some PHYs (in our case the LAN8710) don't tolerate. This has been reported many times, just search LKML for "lan8710 reset".
>>
>> So we want a more general solution [1] where the PHY subsystem resets them before enumerating. However, if the MAC driver claims the GPIO, then it can't be used by the PHY.
> 
> I agree that it makes sense for a PHY reset to be associated with the PHY
> device and controlled by the PHY driver. I am wary of regressions though,
> which is why I wanted the commit message to clearly spell out the implications.

You're right. We'll put this all in the message.

>> I will clarify the commit msg with this in mind.
> 
> Thanks.
> 
>> [1] https://lore.kernel.org/lkml/20250709133222.48802-4-buday.csaba@prolan.hu/
> 
> Is this mainline yet?

Unfortunately, no. It apparently still needs some polish.

Bence


