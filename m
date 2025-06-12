Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B421C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgVR19zxLh0tvc6y1S3xgdWsNzcny/WA+Xqvr4yA/74=; b=M9pk5cN2occd9WZBpuhlQ/gm3w
	oLjqeLNXfvX6Zh29KpYviSNrhSfu3xdqWkzrS5E2TvKC6wA61yln8kiT3ejGM5quZN4aZJvmGsGMy
	9SnNH0/IYPyrf8KEqXIzJb7bKotQ54EFvIbkTGq3Vy8791bC7EGXUctP2E4flSpZX6WS3mOAR9f0f
	x1raoCiyvDmUyIOHoav8DMSgEX6hXwV6whgMtUwOvLdUjv/R3r7LhlM3xdLBSsvGzS2zgrZKB7slg
	vNjRJ8nRGvF24pqchCjB0rabYuhKRs7/4YCcHLaiKbajsgjlIHRjlW4kaUj9h63VYcs3p41rSuYtq
	GGoejrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrt-0000000DQGo-3cIG;
	Thu, 12 Jun 2025 13:21:23 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhOA-0000000DIsn-0OlD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 12:50:39 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJ1zW1ZZcz9tNC;
	Thu, 12 Jun 2025 14:28:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zr2vrxnsQQ38; Thu, 12 Jun 2025 14:28:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJ1zD0n2Kz9t2s;
	Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 155E18B77B;
	Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id oyxrjpKtRtzW; Thu, 12 Jun 2025 14:28:40 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 94E438B769;
	Thu, 12 Jun 2025 14:28:39 +0200 (CEST)
Message-ID: <af4e9c8f-edd6-4baf-bb24-caddf731da29@csgroup.eu>
Date: Thu, 12 Jun 2025 14:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: Use dev_fwnode()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Qiang Zhao <qiang.zhao@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-tegra@vger.kernel.org
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-19-jirislaby@kernel.org>
 <22deb36a-ca61-4793-99b4-87f520445490@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <22deb36a-ca61-4793-99b4-87f520445490@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_055038_291486_61AA8C17 
X-CRM114-Status: UNSURE (   8.11  )
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



Le 12/06/2025 à 13:31, Krzysztof Kozlowski a écrit :
> On 11/06/2025 12:43, Jiri Slaby (SUSE) wrote:
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
>>
>> ---
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>   drivers/soc/fsl/qe/qe_ic.c | 3 +--
>>   drivers/soc/tegra/pmc.c    | 3 +--
> These are separate subsystems. You need to split the patch per each
> actual SoC vendor.
> 


It has already been Acked by Thierry Reding who maintains tegra so I can 
take this patch as is via soc/fsl tree.

Christophe

