Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFABC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ArCQuD0LHJCOT/vDQzA0zaRWRQYAqfbZJick9D1EII=; b=yKjP9PvV1sBLCrN/BdQrLD4QuU
	NxEHOtJEZ5+Qs3m1W6Ex/we9MBygxwGREWN/Xsm4dzEw4QLMD+6/7VUBlPoic6HRkdVlicmo4Ko8p
	CXWnALGkTaUEvLM6tMKzpCgoDwqL931l8cmnCyST4cRA58jUHB4FufhiOA+I2kC+4HSRgXtnJXAg4
	Ig/fiGsGZ/Qt8I7osRTT4SPF6AjMAaP3ieWErbtZFbvYAwp8snA8s+vHSg3HZELl5RdPkl3LmJbij
	TyP6I+q8TKlUvRUTEpDyXJWwa8ftP82qQJeWlEUe6EhtfjmSre1zQ8O/OQkSG/j5IUkbpI5dgvD6B
	IZJgvqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8Bb-00000001mwU-3bcp;
	Wed, 30 Jul 2025 14:53:43 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh88Y-00000001mV0-1zca
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 14:50:35 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsZFZ1tCWz9s92;
	Wed, 30 Jul 2025 16:23:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yTpZs2Ci7_Z8; Wed, 30 Jul 2025 16:23:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsZF53rFRz9sZD;
	Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EB158B76E;
	Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0bwy9QcKhoSZ; Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A8928B763;
	Wed, 30 Jul 2025 16:23:05 +0200 (CEST)
Message-ID: <0b738b01-8574-49b1-b89c-3c96e9a56b28@csgroup.eu>
Date: Wed, 30 Jul 2025 16:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patch in the fsl tree
To: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>
References: <20250723094558.5bcfca69@canb.auug.org.au>
 <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
 <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_075034_669117_FF410B46 
X-CRM114-Status: GOOD (  14.00  )
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



Le 30/07/2025 à 15:55, Arnd Bergmann a écrit :
> On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
>>
>> Le 23/07/2025 à 01:45, Stephen Rothwell a écrit :
>>
>> I was going to send a pull request for this fix but I see the duplicate
>> patch is already tagged in the soc tree:
>>
>> $ git tag --contains 12702f0c3834
>> next-20250728
>> next-20250730
>> soc-drivers-6.17
>>
>> Shall I do anything or just ignore it and drop it from my tree ?
> 
> Linus has already pulled the soc-drivers-6.17 tags, so I think
> both copies of the patch ended up in mainline and there is nothing
> left you can do to change that.

The one in my tree is in Linux next, nowhere else for the time being as 
far as I know, as it was not included in the pull request I sent three 
weeks ago.

Christophe

