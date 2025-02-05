Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFD6C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMffe2cuyieFMT/ZvHdJ4Q+mva2yTWC26VFHFOFlKeI=; b=Lk5p1J6feSEdPVMpf3JgPhY2ys
	IZiOf+zceI2ICTqDwMPHDYGt9FIb3wrWns8Wc2Olt78QjovH051qxX/qtz6QchhcvMVxIAxFPb0TS
	pLEhYEWo8V4g97tzvDBl95FglnOeDN6ClD1beLq1fsQ7cvUoMchBuB96DaTr35PULqwA9SKntAeqW
	NrBKLlZr8KmRcw6fSW+w/WeYnNbeau5i/+ZA2PwgSJWHCBHPk+A6BrlorNwNz+bUyOsTaQXrporoU
	5JRXdXJGsJxNnj800m/b2Xeq0EzQMalytIhI2cndmNDHlkfD/cS3PZ474uJvMII8SnPoDKCaPIsNg
	NOMuh7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSwj-00000001t9k-47sI;
	Wed, 05 Feb 2025 00:07:13 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSvO-00000001syi-1Kl1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 00:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738713948;
	bh=aMffe2cuyieFMT/ZvHdJ4Q+mva2yTWC26VFHFOFlKeI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=LRIFxGFFHQUulv7+gJaJmDaWZ/PPEQJVmMZGlxQsy7SG15tOvvOCxT6hHwupywBAO
	 bFTs9JIdo0/N5USrIdXdMxDqzfYs4LDT+w+9d2V2E6DVvPhUXbKta2mrcRSWADjZjJ
	 IFHRP+OSir09zKCOJGmq5BNwhrDamJW5HcnePqwfJgdo1JUjcRR3AruwfHcdOG7cnG
	 qKxX8ddUePxs12+jcVYZTdNBiXM3WMdrbFtjW2Xca+mLz/lRWd4bOXsBk568jKtjeo
	 SrzUlAatdu22ie+tuIF/MRU3W8Vf34yIuNph5y4IBwrSBZ+EBo8i/jo1WRRyHZfnjV
	 O7vCiBEdMjeRA==
Received: from [192.168.68.112] (ppp118-210-185-209.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.209])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 941067104E;
	Wed,  5 Feb 2025 08:05:46 +0800 (AWST)
Message-ID: <acf79ff017d7648d4d502b7031b88c4853bf724c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 0/9] DTS updates for system1 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, brgl@bgdev.pl, 
 linus.walleij@linaro.org, minyard@acm.org, robh@kernel.org,
 krzk+dt@kernel.org,  conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net,  edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com,  openipmi-developer@lists.sourceforge.net,
 netdev@vger.kernel.org, joel@jms.id.au,  devicetree@vger.kernel.org,
 eajames@linux.ibm.com,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Wed, 05 Feb 2025 10:35:46 +1030
In-Reply-To: <66e2e5e4-5ce5-442c-ba0f-d12cbe79e868@linux.ibm.com>
References: <20250203144422.269948-1-ninad@linux.ibm.com>
	 <79b819b6d06e3be0aa7e7f6872353f103294710c.camel@codeconstruct.com.au>
	 <66e2e5e4-5ce5-442c-ba0f-d12cbe79e868@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_160550_558446_90E1B232 
X-CRM114-Status: GOOD (  16.80  )
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

On Tue, 2025-02-04 at 13:40 -0600, Ninad Palsule wrote:
> > This one needs an ack from Linus W or Bartosz if I'm to take it.
> > However, it's also causing some grief from Rob's bot:
> >=20
> > https://lore.kernel.org/all/173859694889.2601726.10618336219726193824.r=
obh@kernel.org/
> >=20
> > As the reported nodes should all be hogs the name shouldn't matter
> > anywhere else (as far as I'm aware). It would be nice if all the
> > warnings were cleaned up before we merged the binding update. That way
> > we don't cause everyone else looking at the CHECK_DTBS=3Dy output more
> > grief than they already get for the Aspeed devicetrees.
> >=20
> > In order to not get bogged down it might be worth splitting out both
> > the IPMB- and GPIO- related patches like you did the FTGMAC100 patch,
> > and then I can merge what remains (from a quick look they seem
> > relatively uncontroversial).
> >=20
>=20
> The warnings are fixed by different patch by Krzysztof. As there are no=
=20
> more changes then I will wait for other responses. If I don't get those=
=20
> response in couple of days then I will split it.
> https://lore.kernel.org/linux-kernel/20250116085947.87241-1-krzysztof.koz=
lowski@linaro.org/

That patch fixes a couple of Marvell systems. I think you might have
meant this:

https://lore.kernel.org/all/20250116090009.87338-1-krzysztof.kozlowski@lina=
ro.org/

In which case, I've applied it.

Thanks,

Andrew

