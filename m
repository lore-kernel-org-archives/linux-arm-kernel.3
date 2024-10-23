Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249F6CDDE5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tsV4mDXWEcA6DLH5KJpY3Kl/VfFbOy479A1uRTvdzKU=; b=NezZLWabOcvZ8R++KtdvjPVBz0
	slb3vG0mR9+z/wMnrXMx+uESVqyB22Op0X1nfFU4NpUEzzl41tkYlxsEw3n+aE4y2aofxJm7sQR1m
	tk4vQwtBbUQWe5JUaSFxA8mXY7RhaHkif82npuTPFcoDsv1420SiJViG95wrVV69A8yeTPPWR9l8o
	t+ExRoABoucWAwBOuTRWtcDvmfIJvQAg1QO3jw5N4Oa/he/rjGvTF4bRyRx6dUJ740EawvL4fo5fK
	7O3q7XlXmrx+Bek5bTtCf1DUoEGRgP3KBH/WqMDCcEh1mArOfzF5sl7n4xUx4OCUy8uGZ92aNo+ew
	gnlQYRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yhj-0000000E0S6-14XI;
	Wed, 23 Oct 2024 10:35:03 +0000
Received: from forward102b.mail.yandex.net ([2a02:6b8:c02:900:1:45:d181:d102])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YVv-0000000Dy9W-1sp6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:22:54 +0000
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c16:201c:0:640:301d:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 097A3608FA;
	Wed, 23 Oct 2024 13:22:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id eMQs7b6EhOs0-jQPVzoFY;
	Wed, 23 Oct 2024 13:22:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1729678962; bh=tsV4mDXWEcA6DLH5KJpY3Kl/VfFbOy479A1uRTvdzKU=;
	h=Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=t7k4LGPoi65xE+z+AyehS9q8r89CXR7Mahn1RgGwF5jkOr2zChOBX6LaMSc69iGGo
	 c9wFIgt2Jz5KDz7InYlVuOcoIwtZU1PBJCnuMRos50Ek+XKT94BieQ2j2LqjBKOo/b
	 BUaIjLBQDWdundy9pVqYWKTblnoIwciT/qShI9Dc=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <5605e699c215c86440972f7fe3e544816c699c15.camel@maquefel.me>
Subject: Re: [PATCH] MAINTAINERS: Remove some entries due to various
 compliance requirements.
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: gregkh@linuxfoundation.org
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com,  ink@jurassic.park.msu.ru,
 linux-alpha@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-fpga@vger.kernel.org,  linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org,  linux-ide@vger.kernel.org,
 linux-iio@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org,  manivannan.sadhasivam@linaro.org, Matt Turner
 <mattst88@gmail.com>,  netdev@vger.kernel.org, nikita@trvn.ru,
 ntb@lists.linux.dev,  patches@lists.linux.dev,
 richard.henderson@linaro.org, s.shtylyov@omp.ru,  serjk@netup.ru,
 shc_work@mail.ru, tsbogend@alpha.franken.de,  v.georgiev@metrotek.ru,
 wangyuli@uniontech.com, wsa+renesas@sang-engineering.com,  xeb@mail.ru
Date: Wed, 23 Oct 2024 13:22:45 +0300
In-Reply-To: <2024101835-tiptop-blip-09ed@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_032252_329313_EE597D26 
X-CRM114-Status: UNSURE (   5.22  )
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

>>Remove some entries due to various compliance requirements. They can
come back in the future if sufficient documentation is provided.

Greg,

Among the all possiblities you had, you've chosen the most disgusting
and shady way of doing this, with no attempt at least moving them to
CREDITS - the thing they rightfully deserve for their efforts.

As a person with M entries i deeply disrespect the removal and whe way
it was done.

