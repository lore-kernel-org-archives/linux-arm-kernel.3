Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C63C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QmKViGX05RHBEVBMuyA9VDcFmQR2P3+96a84D/yMUZU=; b=kpwoVMHHu2W8Ijd0RXamYh8ps3
	GnB/c0mQgQNFVdnUDxFSHNbQL2/c8QbyutLb9Z8dSqOUJ5iBqD4SgYri7aMOuTu50HXqYnBfp8htV
	6Rax99wWz7NBJGf6mXVaMu2dWJqKVMhjp0BhLWk7lKcl7O0dOaX+uF6ygqtw/60rzP1w+V7HERvVL
	KdVgyPLnTgkO6gUOgvy+rBcrVBISuWnzXBZnGnFo2AXXcbA3zAGYyAi5+wLreHNW5n3g9+WG80jwi
	WNMz5z20K+K5SEPfmWgHqLydND9/P+UtVkGRmPerXw7vC/V2ha7g3CpevNN60cM2K/+kWADXalII6
	tiuiSJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfU3-00000002WQO-2Adp;
	Mon, 23 Jun 2025 11:37:07 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeI7-00000002KVP-1syn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:20:44 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bQkGv3dTSz9sp5;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCJuaHhYGyDk; Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bQkGv2shGz9snk;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D0F18B764;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GRsg_LSFRtsh; Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1F91F8B763;
	Mon, 23 Jun 2025 12:05:27 +0200 (CEST)
Message-ID: <f527c6a8-faf2-45b8-81f5-03def802e485@csgroup.eu>
Date: Mon, 23 Jun 2025 12:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soc: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
 <CAMRc=McVV=VBw0DRiz-4tTjh7ZtRLWg=N_LQ2-7O1sKyW30rxw@mail.gmail.com>
 <c6eece57-8767-4435-beda-c9f399e3fa80@csgroup.eu>
 <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAMRc=MdYuk_O3P1QtepvF-6m01jn3xpDP4YxttQSp1-J-J2GvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_032043_663718_AA5F9394 
X-CRM114-Status: UNSURE (   9.98  )
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



Le 23/06/2025 à 11:55, Bartosz Golaszewski a écrit :
> On Mon, Jun 23, 2025 at 11:54 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Hi,
>>
>>
>> Le 23/06/2025 à 09:33, Bartosz Golaszewski a écrit :
>>> On Tue, Jun 10, 2025 at 2:38 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>>
>>>> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
>>>> values") added new line setter callbacks to struct gpio_chip. They allow
>>>> to indicate failures to callers. We're in the process of converting all
>>>> GPIO controllers to using them before removing the old ones. This series
>>>> converts all GPIO chips implemented under drivers/soc/.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>> ---
>>>> Bartosz Golaszewski (2):
>>>>         soc: fsl: qe: use new GPIO line value setter callbacks
>>>>         soc: renesas: pwc-rzv2m: use new GPIO line value setter callbacks
>>>>
>>>>    drivers/soc/fsl/qe/gpio.c       | 6 ++++--
>>>>    drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
>>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>> ---
>>>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>>>> change-id: 20250523-gpiochip-set-rv-soc-14e1d9414f70
>>>>
>>>> Best regards,
>>>> --
>>>> Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>
>>>
>>> I see Geert queued patch 2/2, who would take patch 1/2?
>>
>>
>> It is in my pipe for v6.17 but if someone else wants to take it I can
>> Ack it instead.
>>
>> Christophe
> 
> No, that's alright, I just didn't get any notification nor is it in
> linux-next yet.

Don't worry, it is not lost, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=&submitter=&state=&q=&archive=&delegate=61610

