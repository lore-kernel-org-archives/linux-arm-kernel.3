Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BDD0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bmf93KccZco1vkeephdnqfRykS8tBowUwbPty2fku8=; b=A/yRBUz+XSmtL5bS0yXLLNDSoK
	dqOkdIil37AsZ+w0uxBXhwIbvhfO1Uq6xrcZqDjtnRc4xVbt/Ow9IJZrjXbTg7Bgra0HAHuxUtWDK
	eNnHNyjywFfNLGKauZBDvw1vPoZAMn/aNQVfmBndbgAcWyNUipTqBmewyqyHZFWKWANPflp/fGUMm
	BRTNpMjZyrZ26nnP22hqe3vtzg6QvqtlUd98FHmKL8efTN3deQXy+dYp168lWydlMxKUgEOLBVjv9
	iSe5maUWeKs6FMP595nK7CA8HJAgN7uV1hAdbJ+xmA5vhxelk8J7Dyt6RaQZcs9PPtciGGKjWe8u7
	C0iJLCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sDk-0000000H5Hg-1uz3;
	Thu, 24 Oct 2024 07:25:24 +0000
Received: from wiki.archlinuxcn.org ([104.245.9.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s3q-0000000H2wS-1xsF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:15:12 +0000
DKIM-Signature: a=rsa-sha256; bh=7bmf93KccZco1vkeephdnqfRykS8tBowUwbPty2fku8=;
 c=relaxed/relaxed; d=archlinuxcn.org;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@archlinuxcn.org; s=default; t=1729753926; v=1; x=1730185926;
 b=dHW1x1n0wG8iytTW0EtHnAKJ8f/nOq6kGNnSckz5fjAWcpJ28byWz0l9i0Y6P6HFyHUjVHVi
 YPyOz4J7jlvpfuD+XWmq7sx+9KIg8cpk8q4N307s6vpqIrEckYupyow4Vg/6tHxdLgx0qTW56kM
 B7yLaTLwNE2lq4wIEr8BQiDTeIiIV7x38//B1pkUd7b4JVQMgdu0oii1iXQKN4mf/FaQkNvu1W9
 VUcKxpttvs7rqGfpHb835X5NWaCWQA/RhAL4nOpyvocEl1wZU9isPtmKu9rktyE84W0qgWV9deE
 5EGdlnrEeQgg/75GzH4IXgpYK54ZtoSI+k9tHRrXQAYVw==
Received: by wiki.archlinuxcn.org (envelope-sender
 <integral@archlinuxcn.org>) with ESMTPS id 5251ddab; Thu, 24 Oct 2024
 15:12:06 +0800
Message-ID: <1ca0a261-c3f1-4cb5-ada4-8125ec22cdf6@archlinuxcn.org>
Date: Thu, 24 Oct 2024 15:11:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev,
 patches@lists.linux.dev, richard.henderson@linaro.org, s.shtylyov@omp.ru,
 serjk@netup.ru, shc_work@mail.ru, torvic9@mailbox.org,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, wangyuli@uniontech.com,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
Content-Language: en-US
From: Integral <integral@archlinuxcn.org>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_001510_683459_3F9FCBF0 
X-CRM114-Status: UNSURE (   3.15  )
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

Dear Linus Torvalds,


We are not paid actors. Most of us here are just common kernel

developers or Linux users expressing our own opinions about the

removal commit.


I can fully understand your disapproval of Russian aggression. However,

the true responsibility for the war lies with the ruler, not these innocent

developers, right? Removing them from the MAINTAINERS file neither

really assists Ukraine nor cripples Russia. Those who are removed are just

developers, not politicians or soldiers. On the contrary, this silent 
removal

will damage our trust in the transparency of kernel development.



