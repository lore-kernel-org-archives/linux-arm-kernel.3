Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3509E92FE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kw9dqhLYKDz6VJe8Npy40jBk0DCSkg9KNFojUe/q9fg=; b=yn7UcohJdqpLRDAscfGFGOLanD
	f4asAonwx7IXvU6cU+vzDZCxUeUUQDBYDZtNAtfzL6CqV3e6ZT/NhA7RTXwjCh/f1bWf+OQ3GOuQD
	SESOFQzRd4dRSWGGZH2s2CIY6YHaWEu9Ui0cxr0LDIWZ992/u9CQwTrc6dLWbdYaS8h9OzzE5IXM3
	FJ5u/uFoD93/GVQ5Rsl1RhW3BqIOLt2mxWgLeJ0R9h2tUy+sjKFHTrIIbeI5Y+sM6ErVhiYTC5J7J
	m8e1VYEJEF4Hiq89LucF8TYFOiRGK7DH1Kqi5iDDQhNNyV1ZmmRwwJ0xJpg7TQ0t1HFhOkqKCVzVY
	xPWgX5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaL6X-0000000465g-2VNo;
	Mon, 29 Dec 2025 21:48:41 +0000
Received: from nick.sneptech.io ([178.62.38.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaL6U-0000000465H-3AOH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 21:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=philpem.me.uk;
	s=mail; t=1767044916;
	bh=hS0/GRkjIL3hECkczn9y1rerST4aUxNoyXMR6WKxCtg=;
	h=Date:To:From:Subject:From;
	b=WFNvTKuBG4yM7OcEt96Qk3/e0IqBuaSSCx7Q4dFaEyJI1MgcBvpGizVvy0Ciqyphq
	 nm5A275SID+j3yMhpFRur9/U+rpkrfuQnqtYr3my64/xN3wvFQGtDppcdklvwNIMGZ
	 KMK1VKZNHmIkDPhVa4pI4tba62ecOcXJ8YdN2c64=
Received: from wolf.philpem.me.uk (81-187-163-148.ip4.reverse-dns.uk [81.187.163.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mailrelay_wolf@philpem.me.uk)
	by nick.sneptech.io (Postfix) with ESMTPSA id 1CACDBD0D5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 21:48:36 +0000 (UTC)
Received: from [172.23.0.2] (unknown [172.23.0.2])
	by wolf.philpem.me.uk (Postfix) with ESMTPSA id A47E75FD01
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 21:48:35 +0000 (GMT)
Message-ID: <022f07dd-9c48-42d8-b5c2-172cf755f30f@philpem.me.uk>
Date: Mon, 29 Dec 2025 21:48:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org
From: Philip Pemberton <lists@philpem.me.uk>
Subject: EP29xx (TS-7200/TS-7300) board status
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_134838_928056_734D60DE 
X-CRM114-Status: GOOD (  11.05  )
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

I wondered if anyone knew what condition the EP39xx kernel support was 
currently in, and whether anything special (configuration etc.) was 
needed to get recent kernels to boot on the TS-7300 hardware?

The latest kernel I've had working out-of-box was 4.17.19, which gets as 
far as trying to mount the root filesystem (the initrd the TS bootloader 
loads doesn't seem to be recognised).
4.18.1 also works works, so long as I run "make menuconfig" after "make 
ep93xx_defconfig" and set CONFIG_STACKPROTECTOR_STRONG=n.

4.19.1 and 4.20.9 crash before printing the "Uncompressing Linux" banner 
and eventually reboot. This holds for every later kernel I've tried.
I've also seen this error while bisecting from 4.18.1 to 4.19.1:
   Uncompressing Linux... done, booting the kernel.
   Warning: Neither atags nor dtb found
Which doesn't make any sense. But nor did the bad commit:
   # first bad commit: [9a76aba02a37718242d7cdc294f0a3901928aa57] Merge 
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next

The boot sector loads the compressed kernel in SDRAM at 0x218000, the 
initrd at 0x01000000, and the ATAGS end up at 0x100.

I'm using the gcc-linaro-6.4.1-2017.11-x86_64_arm-linux-gnueabihf 
compiler as it's a similar vintage to the 4.x kernels and I wanted to 
rule out issues with the gcc-13 Debian gcc.

Thanks.
-- 
Phil.
philpem@philpem.me.uk
http://www.philpem.me.uk


