Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2D1C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75jo1ATccOc9aW+qm12jP+zYXFT30Ic6m1MzSKkACUs=; b=HDdqX3dMOrtGn2xbLS6KtPHhbD
	9hlNuiwTb0t03dQJ4+X8P8qmuBMXNuRHWg3DlIoQfwzx4QNmBpUQBmwZ1MGrjdS9wvNb+hQBET25m
	o3CVtFcYTShtJFAP8WN3h1YxlT5fdX38NhEO0hIqBGsSmJSjClVRg4DywsKPRr0jmSCn2zHTUXGkJ
	ryvBX/IIbkAcjG4ZcPXn/qOJq+Lf6A+AfnS+0Qe/BXhrjtkeBNedrFL4+rILbTqG7ZInzyQKl1O0y
	CiH7Afd1e6UU3BxHsjjwwd9xcxBc+sQUAg0Q/eq7A3WLK33w9zM+RB24ziHcf9Xf+Ntl0m2amSAVP
	pgA1+S/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twze1-00000005CDU-47pv;
	Tue, 25 Mar 2025 08:28:21 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twzcI-00000005C2I-1g15
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:26:36 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0C49DA05E5;
	Tue, 25 Mar 2025 09:26:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=75jo1ATccOc9aW+qm12j
	P+zYXFT30Ic6m1MzSKkACUs=; b=jZUKmodvzicP1rFtYuKNCAsnMD9y5KhV2RWA
	A0Hdk6Xh1SNDGR9j833aE3fn5qvp5KTSRyq9kduSs6hkkOG0VGeSGR+9GYDDHsRB
	zXD11Jy5KL6OdkoLNM+zbaOf3fQWeLhl0Id9z5qAHmzrV3pNf1/u3/UKWB91qnYS
	zZ2JxbtglXa6AE5ft61G0s+iaT/r5O9gksUgJDd1zmVUmlrtJQStJoMPchM3P2UQ
	MX0MY6dPIKBz4KLxhOdbbOtnv7YcWIWcrwtui/b1PVzlyl/4V6dBO+foin1gms7A
	ovsEsy2knhaYR+WNlgq7BIIhLLyd4O7f5NI3ITer3K+zaBUMpE4c8ieX7ArB34gO
	Gm7PkO2mV7Qr3vSjeYZ5Y8bT35Wobf925bkmhbbuB9jn62iWeDK2KmN2UJ/Fgi0k
	7reWmRN1+txMo2SebooxkNw1Lsq6HPwphSo6OwGjCV2LJ2Ov5fCTDvW8lEoPqQsB
	teHJgkXPRhVZLt0l3iXvgnXMXGudpTKra4gPIGnKpbkqclDoEyETK8wRz4PjJXdR
	uyJCnTme+8/hUwJ5Qu5JGiWN8KyqI42jQObZ4dljCLNfFrE/bWjGZj96MVs4NTCb
	EkN5E+4646eXwMJEK6gvT7nTd08MVVnrgN0cl1Ew8qtvolRk5ccIkn/bLhxsq7wO
	T5AFAeA=
Message-ID: <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
Date: Tue, 25 Mar 2025 09:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] dma-engine: sun4i: Simplify error handling in probe()
To: Markus Elfring <Markus.Elfring@web.de>, <dmaengine@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Christophe Jaillet
	<christophe.jaillet@wanadoo.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.37.248]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7C6A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_012634_901583_62270542 
X-CRM114-Status: UNSURE (   9.52  )
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

Hi,

On 2025. 03. 24. 18:55, Markus Elfring wrote:
>> Clean up error handling by using devm functions and dev_err_probe().
> …
> 
> Do any contributors care for a different patch granularity?
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14#n81

I still don't understand why you are so adamant on this. It is just a 
simple refactor patch changing 33 lines, mostly in one function, with no 
logic change. Does it break something in your system? Please explain 
yourself so we can understand your viewpoint better.

> Will it be clearer to mention also the function name “sun4i_dma_probe”
> in the summary phrases?


I already added it as per your last response, did you not read the message?

On 2025. 03. 24. 18:20, Bence Csókás wrote:
 > Clean up error handling by using devm functions and dev_err_probe(). This
 > should make it easier to add new code, as we can eliminate the "goto
 > ladder" in sun4i_dma_probe().

Bence


