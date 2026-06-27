Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF39C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mImsURL/xNZVlxINAFt8hNVYTcNTARXrkLajjIw43gA=; b=3cFd4b9f8OOdmEK29ymnKOGvrD
	CqKjmA4xdKoGRELX8zll2HWbRGMSA3tdkI3BKWgKEX3zrPgyFeEE3yxyi0c0YTJhugn97sdM10/s8
	OkwT4hTYdTLgK0AaIE8iQbszuZ7s6fPDD/gxzRkcrq4dx88zx7Oz1n2ztM6zupf1W8A6ygeRvDPXa
	5VOunSPxHYeCrZSSk9y1qvq2jfOlsIQMeB+PXwv8z02b4jnAs/mHNlzLPUrHPN7UcvYGxnDwmCzjZ
	glULe5dffhK0UEkHIz8AMOUbLwjmTjKY4ZO5lHZKKm5+tKJkONdhWFKc21oIiLlwSGydpDcjWHArv
	9rEirsuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTLs-0000000CWAd-0HL0;
	Sat, 27 Jun 2026 13:45:44 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdTLo-0000000CW9C-3Vyv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 13:45:42 +0000
Received: (wp-smtpd smtp.wp.pl 13402 invoked from network); 27 Jun 2026 15:45:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1782567936; bh=mImsURL/xNZVlxINAFt8hNVYTcNTARXrkLajjIw43gA=;
          h=Subject:To:Cc:From;
          b=IlHf0kT4yTo3/HAPOqwi7oHDjxKJV1/2xPnWh3koR5c5ajQpfC+bfgnzIrg+88oes
           XpKmtGGkFFH9limMxIRsJ/Lld4s+krebinBUnZ7f7rVMCq1LImiau1R9Ezh2uC5vOt
           DSaUmra/vdc5+Nm7n4YidAI/QzlI2prcEGh5xvp/73M5tWs6syyd4wVao7lnkz1hvx
           CctzMxvReFZZtMZoya/B/Z6iyBALmpziQDt4ElUEbWxFL5RjahBo7qdtfmqGABVmrV
           ofBh03zbAUmOdRGPLPnuaFnf+4ZrPHibxFMdu61rA4LE6e6zhl2SJSLO+gfHvMQy8b
           bqbfHVqoiipNg==
Received: from 83.5.235.152.ipv4.supernova.orange.pl (HELO [192.168.3.224]) (olek2@wp.pl@[83.5.235.152])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <arnd@arndb.de>; 27 Jun 2026 15:45:36 +0200
Message-ID: <6079065f-8fbe-4dc1-bec3-bc3ef9d7a5bf@wp.pl>
Date: Sat, 27 Jun 2026 15:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
To: Arnd Bergmann <arnd@arndb.de>,
 Gregory Clement <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
 <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 5aa5d5f268651f9b93b0272d375535c0
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [ETOc]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_064541_349951_D53A8752 
X-CRM114-Status: GOOD (  24.76  )
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

Hi Arnd,

On 09/06/2026 21:29, Arnd Bergmann wrote:
> On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
>> On 09/06/2026 18:11, Arnd Bergmann wrote:
>>> I'm a bit surprised by this oneline change. Since you successfully tested
>>> this, I assume the change is correct, but I have two questions that
>>> I would like to have an answer for before I pull it.
>> By the way, the upstream safexcel driver works correctly only on
>> coherent
>> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
>> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm
>> right.
> It's not necessarily proof that this is correct, but it is quite likely.
>
> After checking the datasheet some more and finding that this should
> indeed be coherent everywhere, I remembered that even the old
> 32-bit Armada 370 had a coherency manager. At the time, we used a hack
> in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
> since the original DTB did not contain the correct annotations.
>
> I suspect that the Armada 37xx started out with a copy of the
> old DT files and also never had the annotation, but then never
> had the same hack because arch/arm64 does not have platform
> specific code.
>
>> I have a plan to send a patch upstream, which has long been maintained
>> downstream in OpenWRT[1]. But I need to think a bit more about how to do
>> this properly.
>> [1]
>> https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/patches-6.18/401-crypto-fix-eip97-cache-incoherent.patch
> The patch is basically correct, I think you should just change two
> details:
>
> - instead of defining your own SYSTEM_CACHELINE_SIZE macro, just use
>    the existing CRYPTO_DMA_ALIGN macro that is used in crypto_dma_align
>
> - move the 'state[]' and 'cache[]' arrays to the beginning of
>    safexcel_ahash_req so you don't have to manually align them.

My biggest concern is the increased memory overhead. On Marvell
platforms, this increases the structure size by 150 bytes. I’ve
checked, and both CRYPTO_DMA_ALIGN and ARCH_DMA_MINALIGN always
have a value of 128. On MIPS platforms, ARCH_DMA_MINALIGN is set
per SoC in the mach files. I assume that on a Marvell platform
with coherent DMA, I should set the value to 4, and on a
non-coherent MediaTek platform, to 64. How should this be handled
on an ARM platform?

Best Regards,
Aleksander


