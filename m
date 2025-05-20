Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9663FC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/qiRQAj3p/Erq+O1jTYWqtuscfZfQGd1J5JzHXwaNE=; b=ACo7jmvdXfO4/+KYnnW2bPNsM6
	r7gNti3kr2xP7U0L/HxC1zOYoq/54V23WSgXukhYYTSczc2da9pU0n6MuQ8Pt8DQkpL+q65Pku7bE
	/4bWRAn4ZzCzpeKqFoUIqVU43eT7NwlwZtKPcylg4sM4wgRkE3cwI+ZVs66uGIU2ajGD2uqKyNErs
	a+knxo947uOgVMZnyqZsjMtiLp+dZIRnPZoRNp6RkwFHINjS08GLZMwokDtyWp3e1yKL7/OB6pBvn
	4QfzGHLB9eXL6z1OOzzdI2QoC5HO0k/H+M1PfGxyw6l16oOVJGUJXkMZv5RUDuDQ43gPuWNKI4IoI
	gdZzQ4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJzI-0000000CIzq-1xP4;
	Tue, 20 May 2025 10:14:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJWm-0000000CEyo-1ZeO;
	Tue, 20 May 2025 09:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734291;
	bh=gjINz9uiF82laonOGCkrVhCsstIccSKEkL8/9FoB2Jg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qki1B+iDnNJlHSVPEnvwDNvY0SpzsE5W7asy3yFGY/r5+EirpGYlvGx7VXNrf8Ba4
	 WVtVPwJyC5X6HGSdFJbptixBER+eIZWxo1EGRC4RDJXLmAiNoOEnMiSnLVd2mmi4hm
	 bhBYuOWiPFpQc1geBJuQghbL3dCy7ZdmKdaoSEkwlIgxrqzyZvvqNg9pBy4xOsfrGj
	 /xdTpTGrVvwEmyECRYlv9GcJLBsAortbL/JeIFH18uDfAROifqW1H44tRZLECycdTs
	 1P0bXlJHa4NTZ0ft75F1P63lE7gkSabQccoc695xbEE50a6PWhKiEj9cG6XT99IORX
	 xuvQQ3bMcCeVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92DD717E1045;
	Tue, 20 May 2025 11:44:50 +0200 (CEST)
Message-ID: <c3162ca8-2539-409f-885e-a08696c72e27@collabora.com>
Date: Tue, 20 May 2025 11:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable configs for MediaTek Genio EVK
 boards
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
 <174773424476.2901578.7109647684484482687.b4-ty@collabora.com>
Content-Language: en-US
In-Reply-To: <174773424476.2901578.7109647684484482687.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_024452_559080_47C45397 
X-CRM114-Status: UNSURE (   9.31  )
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

Il 20/05/25 11:44, AngeloGioacchino Del Regno ha scritto:
> On Tue, 13 May 2025 16:59:41 -0400, Nícolas F. R. A. Prado wrote:
>> Enable the missing configs to get all devices on the MediaTek Genio
>> 1200, 700, 510 and 350 EVK boards probing, as indicated by the DT
>> kselftest.
>>
>> This includes support for:
>>
>> Genio 1200/700/510/350:
>> * MT6359/MT6357 PMICs Auxiliary ADC
>>
>> [...]
> 
> Applied to v6.15-next/dts64, thanks!

Wrong branch, it's v6.15-next/defconfig, sorry :-)

> 
> [1/1] arm64: defconfig: Enable configs for MediaTek Genio EVK boards
>        (no commit info)
> 
> Cheers,
> Angelo
> 
> 



