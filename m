Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8064CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XXa+HnCx+EvL2zpZfTV4/ly5SJjDsiYcuCwIf54NbE=; b=sH/YeMzJXRhJcFcUuSdm82W+oL
	cv1HfaFYVVBVthEd/cO2aVZ/IGhUTMkj1tjdxTPXKY6SGnhlED60M3cVSWCSG/19R1/wz/gUjQEUB
	ACQMsP6w71jJWt4dYR/dyNMmF67OnpA4Rn+VxiM1COe0IBCPPQsEwtnh/pn8D1nkqtFcugH/RC1z1
	UPtBG7zEwrZ/+i3JB3cBm2Pvba52rjRwsEW684fxQL07VKQkb5XVfnrEVmWVt0q0YJnGteJBD8SR9
	+cwn8EtEQK+35Cna/w37jqLECROh/QYZ4gDWdReoifsudVbR0Dx4SwmJMjn1uZMIfNiMuGSIQL8LW
	HFh6dXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0M3-0000000687k-211h;
	Tue, 09 Jun 2026 17:35:11 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0Lz-00000006875-2X4M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 17:35:09 +0000
Received: (wp-smtpd smtp.wp.pl 25410 invoked from network); 9 Jun 2026 19:35:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1781026500; bh=3XXa+HnCx+EvL2zpZfTV4/ly5SJjDsiYcuCwIf54NbE=;
          h=Subject:To:Cc:From;
          b=IlJYvbCNTdYpAfzFSwUACkDF5GDE9kEZ4Unr/1alPuWctQTriJCAXxhYftxgD1Ekm
           GNAwewaH3s1tsTYaCILYEhLWxXuLY7aHeQPtHzCCxPk+aYvzsB1NHy2hvcvqqQ43UE
           ciCEA7QbVmof13Edp0JJDbJpY+vQnIOsdoLTxgFibhnwl/VkwlmKiZU544hBQQLw26
           1cLZh2pQP2NtTABNBLiEkB87JXmtL1PQSNieIpm3wIsiMCXOQl2vOA1wBf+z2fzLzc
           xZ+znJxnNRXPzuJHOi/zYB9ilLGrvFMVHrnw4nrJuKId7R49GGP41piBHXl/aH6VnU
           2GI/aUxSqeLYg==
Received: from 83.24.121.144.ipv4.supernova.orange.pl (HELO [192.168.3.203]) (olek2@wp.pl@[83.24.121.144])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <arnd@arndb.de>; 9 Jun 2026 19:35:00 +0200
Message-ID: <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
Date: Tue, 9 Jun 2026 19:35:02 +0200
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
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: cabdebd1a1134808a63f1e9b82ce9f8e
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [YUN8]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_103508_379177_E3441CDC 
X-CRM114-Status: GOOD (  19.39  )
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

On 09/06/2026 18:11, Arnd Bergmann wrote:
> On Fri, Jun 5, 2026, at 17:20, Gregory CLEMENT wrote:
>> ----------------------------------------------------------------
>> mvebu dt64 for 7.2 (part 1)
>>
>> Mark EIP97 as dma-coherent for Armada 3720
>>
>> ----------------------------------------------------------------
>> Aleksander Jan Bajkowski (1):
>>        arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent
> Hi Gregory and Aleksander,
>
> I'm a bit surprised by this oneline change. Since you successfully tested
> this, I assume the change is correct, but I have two questions that
> I would like to have an answer for before I pull it.
By the way, the upstream safexcel driver works correctly only on coherent
platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-512
selftests fail. Since the selftests pass on Armada's SoC, I assume I'm 
right.
I have a plan to send a patch upstream, which has long been maintained
downstream in OpenWRT[1]. But I need to think a bit more about how to do
this properly.
[1] 
https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/patches-6.18/401-crypto-fix-eip97-cache-incoherent.patch 

>
> - I would expect a missing 'dma-coherent' property to cause data
>    corruption, as the DMA master may write directly into the L2
>    cache, which is then invalidated before the CPU accesses it.
>    Do you have any idea how this one ends up working even when
>    the property is missing?
No idea. Don't have access the Armada SoC TRM. Maybe the folks at
Marvel will be able to explain it.
>
> - I see that the Product Brief for Armada 37xx mentions that it
>    has a "High-bandwidth, low-latency IO Cache Coherency" interconnect,
>    which also indicates that the patch is correct. However I don't
>    see why it's only the crypto engine that needs it. What about
>    the other high-speed DMA masters (neta, xhci, pcie, sata, ...)?
I didn't test to determine whether the other DMA masters are coherent.
But I'm assuming you're correct and they are also coherent. My recent
work has been focused on improving the Rambus/Verimatrix/Safenet crypto
drivers :)

Best regards,
Aleksander

