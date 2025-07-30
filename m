Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEBBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YNieAz+cZECg0/LiA7zH4IgiLhsFDcVjXRAmd7ovYk=; b=GeYaoOCgzBR+cwpB9J/75vAJQn
	O2eTIT6PEmIhDPNmTR0/7SSU+4+hwWWap7X6u/A4ZnBA8RtfUbG5RDhwNm5X9D9shjYQMBKYcnY+6
	rmtVjH06KT01nDvq2nzjn9IpJ9Bp1mYkDZY4VwjfgazOQPp7xIQR/rk/A6FTAkQXs1Im/7MI8190g
	vewr0w4m3fNPUCv096K+nxaFxtM3zRVyArD4djffBaPuFt3NjLVYtLKFTgROHv10yclBT9nK8ATRE
	uFsZ6uKpoicIZVCOcCf36RUTlbQNSeAf9knwu3ZR14kFQXLm3h3LYIcYNojL6G14moO9N26rH+ZRf
	vRfhi/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7MU-00000001gCR-0F12;
	Wed, 30 Jul 2025 14:00:54 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Cj-00000001e6S-2ySb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:50:53 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bsYDJ1Vh3z9srp;
	Wed, 30 Jul 2025 15:37:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTOaUPuVAapB; Wed, 30 Jul 2025 15:37:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bsYDC13bxz9st0;
	Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1EEA78B76E;
	Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rpERR39Nzj83; Wed, 30 Jul 2025 15:37:15 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA4F58B763;
	Wed, 30 Jul 2025 15:37:14 +0200 (CEST)
Message-ID: <5553bad0-2bd1-41c0-966f-98a0a4acbb23@csgroup.eu>
Date: Wed, 30 Jul 2025 15:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
 <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <907f875e-5ed0-4eca-b285-ebb7e47137ce@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065049_919958_D9D8BC08 
X-CRM114-Status: GOOD (  13.79  )
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



Le 08/07/2025 à 10:33, Christophe Leroy a écrit :
> Hi,
> 
> Le 11/06/2025 à 12:43, Jiri Slaby (SUSE) a écrit :
>> irq_domain_create_simple() takes fwnode as the first argument. It can be
>> extracted from the struct device using dev_fwnode() helper instead of
>> using of_node with of_fwnode_handle().
>>
>> So use the dev_fwnode() helper.
>>
>> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
>> Cc: Qiang Zhao <qiang.zhao@nxp.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
> 
> There must be something wrong with this patch. b4 shazam applies a 
> different patch.
> 
> $ b4 shazam -l -s --single-message --no-parent 20250611104348.192092-19- 
> jirislaby@kernel.org
> Single-message mode, ignoring any follow-ups
> Grabbing thread from lore.kernel.org/all/20250611104348.192092-19- 
> jirislaby@kernel.org/t.mbox.gz
> Breaking thread to remove parents of 20250611104348.192092-19- 
> jirislaby@kernel.org
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>    Added from v2: 1 patches
> Analyzing 25 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 22 code-review messages
> Will use the latest revision: v2
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
>      + Reviewed-by: David Lechner <dlechner@baylibre.com> (✗ DKIM/ 
> baylibre-com.20230601.gappssmtp.com)
>      + Link: https://lore.kernel.org/r/20250612084627.217341-1- 
> jirislaby@kernel.org
>      + Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>    ---
>    ✓ Signed: DKIM/kernel.org
> ---
> Total patches: 1
> ---
> Application de  iio: adc: stm32-adc: Use dev_fwnode()
> 
> You must have posted another patch with the same message ID. I had to 
> apply it manually.
> 

Applied (Manually), thanks!

