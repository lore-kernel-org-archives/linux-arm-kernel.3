Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C9D0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21ozGVKPYTmOqYBKOcOmOK+mSJIkuon14lUJ9oaW7vM=; b=s92lTbY0lKN17yUDOSaTMWLzMe
	vJwX3AXoNwv7BXwVFZwQiPDoka03CTu8j1mrBQi/Mb4qfILIG9TFye3qY/HlSfWYqxpt+h+4mARvk
	TDdzLPnji7UTzMQ1h95EWJ2Tp8dig9bOcOV9ggBOZEcPlOks3siOKeSeQUIooV14N3rHGY7YSk6UG
	6Do1uvy2BaKgfd9e6rRJ66iX4EcUv2Pf+JkFtvfzGT+zD50XRBrSciuspcJGnhTbCoQHpYywg29sK
	X84OcIneBjBwp7GS4qwyh7J+SoZi3M/xLZN+rJZ0l99ULJaHhz+2hHz59C/6F7isZP5LFyUW08tO+
	bku2dgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3juV-0000000G6PP-1k7Y;
	Wed, 23 Oct 2024 22:32:59 +0000
Received: from mail.notyourfox.coffee ([92.63.193.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jef-0000000G4Ik-0p7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:16:38 +0000
DKIM-Signature: a=rsa-sha256; bh=21ozGVKPYTmOqYBKOcOmOK+mSJIkuon14lUJ9oaW7vM=;
 c=relaxed/relaxed; d=notyourfox.coffee;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@notyourfox.coffee; s=mail; t=1729721693; v=1; x=1730153693;
 b=Qzx5NnIVSz7GYrDq8cD6l5rVz4+yd3Yy0awiIXQ74n7AFlsPGnqrWQg6R6416QT+gDRK9zC8
 9xhmK/sXgtRFfrZuRTrJT44F2y0hvsfoeDKX+jvRt/xYJezg0GvKvAfTGTChJHSFh9G5Px8JJDQ
 ItihhXdHyhCSdjbd56F+uiNFCT1zCuJG/Ri/sCwEuVj440Wyh1yTbfFA2uTKwQh8BGf1pSB7Ve+
 G1ukignizWPp5P6QKWyCjWYu/mi/HkS83y71a1L99yqksWnODf1S+p7ekZij6dMqSGCUF0KoEae
 Q6vlmTQmE/I5KlptBRFhJuu+uy+Wxrv/d/yn77tWE1ZEg==
Received: by mail.notyourfox.coffee (envelope-sender
 <contact@notyourfox.coffee>) with ESMTPS id 9d61df4a; Wed, 23 Oct 2024
 22:14:53 +0000
Message-ID: <bd0c85d0-6941-4693-bae5-a3f6613f829c@notyourfox.coffee>
Date: Thu, 24 Oct 2024 01:14:51 +0300
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
From: NotYourFox <contact@notyourfox.coffee>
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_151637_433438_D71A973D 
X-CRM114-Status: UNSURE (   5.87  )
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

Dear Linus,

Yet another of probably a million "actual innocent Russian bystanders" 
is here. For quite a reason. While I do not contribute to Linux kernel, 
I am a long-time user of Linux and a big fan of FOSS. You may consider 
it a spam, and it might as well be, but this just blew up our IT-related 
media.
I am, or, rather, many of us are disappointed in the way you put 
politics over software freedom now.
This move did nothing against Russian aggression, but rather 
disappointed a lot of us, who don't support or have anything to do with 
the ongoing war. The contributors you dropped for, as it seems, no 
reason other than "compliance requirements" have done some actual work 
to improve Linux, so kicking them for apparently just being from Russia 
is... just plain discrimination.
If that's the law you have to follow, go on. If it's your own actual 
choice - you need to revisit what "free software" means.

If I am blatantly wrong about all this, knowing it would only be a balm 
for my soul.



