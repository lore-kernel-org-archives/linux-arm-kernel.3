Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D691D1BDD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a6wZTAgFjyZIQRwbpzpwrJO+mZ8x5NXtG/M2aOltuk=; b=GAN4VQIj0cLD209jtboXAsAwoT
	aaE37Xln/uUg5wFTOhydSaDSY5vV/k5aVfTyLQ7dUkOhBKhN0rBH9T1K2hIs/D56RYpzC/ZcuhaPc
	cYrjVmqePq2IUObMXo6DRNtqpdiOxBlln7/GAmcl3Hv9TqOqJ/1r4c+UzUUIh8On7g2kH2/ww19YF
	PomcAogiCNDAnFxcScyCqS2z+kNNx3+GUPnMPHgycABwo+ziiQSXpc+HiCM/MLTVkiP3Eh0owYC/9
	rP0tKuLrYejHuBNnLpwRqg44U8/o8/EulEAmjf36xf7f2+fLzpQ0pjwXzqDFS/YBBbBbNvR10j6fZ
	TUZg+DYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81b9-0000000EhJs-1Twk;
	Mon, 04 Nov 2024 18:14:43 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t81GD-0000000EbWF-1eZy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:53:08 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 81G3txN94lUew81G3tdlTw; Mon, 04 Nov 2024 18:52:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730742778;
	bh=7a6wZTAgFjyZIQRwbpzpwrJO+mZ8x5NXtG/M2aOltuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=i8Zom4zprEcgc7rXp/7A+2Gyn0tqLqyGKXS2VlQR3kkBazvYzhkgZ8pu3Fni5G0RI
	 8cPWJtRZFZdloyd3LwvCMg0vXOtGmHwRuRLsYPuJb9iYFAMq9B1ypnMpTLnQkSpzT0
	 pUTCfTkMTlSEsxkKh0/RUh3Xacer1Ma+VIP575EDx9MIJkPZ52CSsKYyZClZro+CUE
	 3H9QEybVWX5QU6FmRYi8AXnfr5AXYl4LpZBDNjZy7MNaaOTA8alh972b8qoYKFcO7S
	 FRjGI3A+kbMgZWlOcxdwqgFvrm8zPm/T1FyIumv9pJAJ6Ro/K0sgFFyLOBUk8Lvmro
	 wytD53pp5YHrg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 04 Nov 2024 18:52:58 +0100
X-ME-IP: 90.11.132.44
Message-ID: <32c796a7-7598-46d4-af78-00fcb47990f6@wanadoo.fr>
Date: Mon, 4 Nov 2024 18:52:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/fpsimd: Fix a typo
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
 <173074012615.2444105.10660252555826650982.b4-ty@arm.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <173074012615.2444105.10660252555826650982.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_095305_868843_0D0D53D3 
X-CRM114-Status: UNSURE (   9.21  )
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

Le 04/11/2024 à 18:10, Catalin Marinas a écrit :
> On Sat, 02 Nov 2024 10:31:54 +0100, Christophe JAILLET wrote:
>> s/FPSMID/FPSIMD/
>> M and I inversted. Fix it
>>
>>
> 
> Applied to arm64 (for-next/misc), thanks! I also fixed the typo in the
> commit log.
> 
> [1/1] arm64/fpsimd: Fix a typo
>        https://git.kernel.org/arm64/c/525fd6a1b34e
> 

Strange, checkpatch does not complain. I was sure it was running a spell 
checker.

After checking, it is run, but does not spot it :(.


Thanks for fixing.

CJ

