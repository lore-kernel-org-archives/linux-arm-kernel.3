Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B549D6DDFD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7g3cSkvm0PW3SmedMT5JjoODC5Qn0jSLN8FBVFZMrc=; b=aA4cK4UFKflhm0EsfMjcJTrgqd
	03WYFFu3Ys0vBs2YmMDX74TArBQl2V7wJIAtM2Xy0A5QY5K7U8DioAen+79tL0lDWQPR38yHWO/mK
	RCy61ZrBkEeBd5/I+PMDZQfemI0RsbLOTYNYoSRYp4+RzKo7fNUOqFHnjiZRtxZf0ojSBL6wTgTCP
	qUbPGI+5ICoNU8l58Hq3W2UFwDfNniFhId2GmLRiRcho/a827I2/FWrNHxH4KvGjnMCYmsMxbR+a/
	710TBDWvI/hbvSPGxWPqVoMpQhO/9hIT2u36pMVmQ+Qk1HnAsvQRqxfVqoWUWyyIctI2cLHJeGUmM
	4TutWYJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwJX-00000002ms7-3LeC;
	Fri, 15 Nov 2024 13:24:43 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwI3-00000002mRe-0lVH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 13:23:12 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A63A9A03F3;
	Fri, 15 Nov 2024 14:23:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=t7g3cSkvm0PW3SmedMT5JjoODC5Qn
	0jSLN8FBVFZMrc=; b=PFvfaJ3xeTl6gtIjREgawA/1osfrZCQzzu6svm3jRurrp
	fwjOC+fWaTEmfeTKdVclPoqCPVufqzunplLFZ4QiOx8IcgMHpY0IBVnGkWHs1IcP
	yWoQlZOno4gyYnQDE8epR1eLCjd7bk2DTu1QT4pYk0IqFBuWua5kxgyU+UpaHQq3
	XdspBRA9GWnACidej7QHU6DaMLDWLsmi9CMPN4AX3EPNY4dnnLdmgxcNrMnlcBSZ
	767l3vjFFtU2rkkM1ts7d7vJxzzPeCfPmObI7Z3kwfjgta/rMI/TxK77G2HBHEGJ
	06tzFbkF9Z342iSRqe5RsSoZkdeuzOQIw+Shtf2uGIkaRybarLertzJncph+Tisb
	lGvV1ZcL+cAo52Pj32xePQR1tkaSQZtPPYIMJMzj71De/LYh6TVveEikCy+rNsJj
	sn/1kM7YfmK4r1YMXMCyXiDz+s7lUSMy11Gq05o8A1lnxKqqH9izS5PtSf+EzXvl
	Ms6+FaVz+yiZA5qAnFZxytF82ozZNXc9Xvh0WXImhlW/84ClrkGfofOnDm/IpAls
	xk4idtz+FFTchHwTCibhcYyW29glXBWh2t7+PvD/2e3XiUwwmTPRsNXYl9paXpkb
	vkd+EDgBdtHVnSUtWkTy9FFQCTGgia1xnZ49jtIamnd6VtD6RUSB21LGisa4XY=
Message-ID: <32a5c58c-f318-4c02-ae76-421b9cca0875@prolan.hu>
Date: Fri, 15 Nov 2024 14:23:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support
 newer SoC families
To: <Hari.PrasathGE@microchip.com>, <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Varshini.Rajendran@microchip.com>,
	<alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
	<claudiu.beznea@tuxon.dev>, <Nicolas.Ferre@microchip.com>,
	<Patrice.Vilchez@microchip.com>, <Cristian.Birsan@microchip.com>
References: <20241030084445.2438750-1-csokas.bence@prolan.hu>
 <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
 <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
 <20241104-vanilla-operating-de19b033f0a8@thorsis.com>
 <ad585127-9e3c-414a-84c2-c4ea3e6d3c7d@prolan.hu>
 <78f38031-1723-4474-9bea-1c23918a75f6@microchip.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <78f38031-1723-4474-9bea-1c23918a75f6@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855617C6B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052311_404781_2643CE1C 
X-CRM114-Status: GOOD (  14.66  )
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

On 2024. 11. 05. 8:47, Hari.PrasathGE@microchip.com wrote:
> Hello Bence,
> 
> On 11/4/24 6:26 PM, Csókás Bence wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> Hi!
>>
>> On 2024. 11. 04. 13:48, Alexander Dahl wrote:
>>> It would actually be better if vendor would bring their stuff
>>> upstream, so there's no need for a vendor kernel.  Did you talk to
>>> Microchip about their upstreaming efforts?  What was the answer?
>>>
>>> Greets
>>> Alex
>>
>> Agreed. Though in this case, the original patch *was* submitted by
>> Microchip (by Tudor, originally) for upstream inclusion, but it was not
>> merged. Hence this forward-port.
>> Link:
>> https://lore.kernel.org/linux-spi/20211214133404.121739-1-tudor.ambarus@microchip.com/
> 
> 
> Thanks for your patch. We are planning to revive this work at the
> earliest. While I don't have specific timeline for this, we at Microchip
> are fully aware of this gap and doing everything we could to keep the
> delta between the upstream kernel and vendor kernel as minimal as possible.
> 
> We will discuss internally and provide you the feedback. Thanks again
> for your efforts.
> 
> Regards,
> Hari

Did you reach a conclusion internally regarding whether to support this 
patch? Since then, I opened a ticket with Microchip, but haven't got a 
response yet. I have also been in face-to-face contact with some of the 
engineers from the Rousset office, and they have expressed their 
support, and even the possibility of lending us a SAMA7G5 to test with. 
So really, all I'm waiting for is this patch to be merged, and then I 
can submit the SAMA7G5 parts, at worst as an RFC, if we don't get the 
real hardware in time.

Bence


