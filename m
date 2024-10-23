Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878D3CFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SzYEtbkvar/9qy8viZQUBSF8XVaHhUuPTC9h6bIsq4=; b=bxupBHpzbcVQZbcqE/md1EVLyb
	lmPydhPP7cEE0vrQICKyZIEk0wOgLwaTijD0Sh0pnIyKRiH6Hnjd5vLGp2J67JJWvHY09VSlT0tpd
	lMV6Am0h/k0D3olX+0dn7YSSkpacKiK2P8A7DJUyUtEVgf+pmE96WMC3lGnVgXrdQmMKBtq/LjGHZ
	5Q2KJRQJao1FyTxcAgKqGac80FI9XMh7solskk8CbNKmw4Sk3++eG7Z7u5KnIdYf6mEoPnaHtils1
	JS2dqkhorU/l5ldWEQjATKzu1MioPdd7b6tIu3d6Er/fCtLaGYyVHfno4dkG/s8d5EQ5KhLnTQgJG
	sRIfwOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h2d-0000000FguR-1vlo;
	Wed, 23 Oct 2024 19:29:11 +0000
Received: from vps.thesusis.net ([2600:1f18:60b9:2f00:53ac:1e74:4794:50c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gXI-0000000FbSo-0yQa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:56:49 +0000
Received: by vps.thesusis.net (Postfix, from userid 1000)
	id 1964E54936; Wed, 23 Oct 2024 14:56:45 -0400 (EDT)
From: Phillip Susi <phill@thesusis.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, Tor Vic
 <torvic9@mailbox.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io,
 gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru,
 conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, hoan@os.amperecomputing.com,
 ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 manivannan.sadhasivam@linaro.org, mattst88@gmail.com,
 netdev@vger.kernel.org, nikita@trvn.ru, ntb@lists.linux.dev,
 patches@lists.linux.dev, richard.henderson@linaro.org, s.shtylyov@omp.ru,
 serjk@netup.ru, shc_work@mail.ru, tsbogend@alpha.franken.de,
 v.georgiev@metrotek.ru, wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
In-Reply-To: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org>
 <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
Date: Wed, 23 Oct 2024 14:56:45 -0400
Message-ID: <87bjzay7f6.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_115648_360296_558D57FC 
X-CRM114-Status: UNSURE (   7.08  )
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

Linus Torvalds <torvalds@linux-foundation.org> writes:

> If you haven't heard of Russian sanctions yet, you should try to read
> the news some day.  And by "news", I don't mean Russian
> state-sponsored spam.

I am not a lawyer, but my understanding is that sanctions means you can
not buy things from them, sell things to them, or otherwise exchange
money.  It does NOT mean you are forbidden from emailing them or
mentioning their email address.

And even if, somehow, legally they must be removed from their maintainer
role, the commit doing it should still be clear.

