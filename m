Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96456FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNCjgyiie9deKPPCS2xm/U0PFWn0dgx4E4aS3Inqd+k=; b=L5A6xty6OJ6XrRADyvik3vD5dx
	5aKoMX7CZTkwymCe418nuPPuMCkZtqEWMqrcHyei1M+RHm4wN2oKTLgpkh+Xxw8dSjapMdESbXXtu
	Jl4zFcO4cTmKYIBDuOQGMtIBQrlzkNun5Y1PuRDdqyVFVnQnxGAre9/Ouk2Yj4nIEtRdw1PumsC9c
	8HJw+uA9KpAxm8iatFqCI3nG0Doo0esjdkM/m2I/evEdAesh8ZZiU6VshP4xZGyYVZmvpatAD1YrV
	aDpncQ4C7FGXw2R00p1w1mazHkqiZbqNxRMHioZN8neHfH0eFsMnfQVOAWoskaaEwBSJrAlXUDA9O
	ynn9AcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJXW-0000000GjDY-1rh3;
	Mon, 27 Apr 2026 10:50:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJXU-0000000GjCx-2AZ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AE1F76014B;
	Mon, 27 Apr 2026 10:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF30BC19425;
	Mon, 27 Apr 2026 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777287007;
	bh=1hX/b439XJu3neaOGCNItjYEWihyYPz8zGNcqekTqhk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=EP4K5fvSOfvcO1vit+mQwmlq5vl5Sn1aJflpn1Qs1aDyq2vKdwDwlJLiwJbiYJZ5q
	 RYWqATmFvmvcrDJ6OwdDJs6v3hQL5FtHl2Fti3pW3SqkHur4CuTBSCIx9fF154rzfd
	 Z84Lh7QJ/nmLxWMR/uZPP/2d1wSuih57LxagMWiScvw7PBvv8QEPe6vciBGvuvfkJy
	 4YTqrkF1baS9KTtdSa9qEwwNTvEV9nYKdC5L5Y9PwP+wa/s0vWzebgrS6OXxXBGpgv
	 Av596uIFSDnAcVnkOsp0eiBqpd2GsYhgt7n3GTfLdBvtpoRMlq7JysVRb5vRG7TbkV
	 a7YOfGtu/Ehkw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id D0C5EF4007B;
	Mon, 27 Apr 2026 06:50:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 27 Apr 2026 06:50:05 -0400
X-ME-Sender: <xms:XT_vaRH82v5EUmQqfEPn5-fnFbNO3tkKLbIuYmd7LohHF7qPFxOoog>
    <xme:XT_vaRJt7zrDtRfd8dsMu-8JoNxSxE_XGgwxh9bFXbH--leZJ9rIeyH5IRCfm47oP
    o8X9A__TucnBGtJe6p7mr1cuwPig1z18mY8IE1gsKiU-0wXksgPR1yZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejkeeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhi
    nhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehrohgsvghrthdrjh
    grrhiimhhikhesfhhrvggvrdhfrhdprhgtphhtthhopegumhhithhrhidrthhorhhokhhh
    ohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgrnhhgse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrghhlsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkihesohhsshdrqhhurghltghomh
    hmrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:XT_vaYfArF4kiNhUKlqtDAdHcC4BhWh8fnoUm8wOX20GVNtjNkEBsQ>
    <xmx:XT_vaSUV-j2tAXQseNRPp3odmGLfR2jCZfvQDTdwWTcHTFM2GSrRvA>
    <xmx:XT_vaZBML3CpnY5pUR4VZ9akGXfAzpU7Ton_jjqr_dHuFHyCXyrQRw>
    <xmx:XT_vad53FwogDmhvsqFgA02nGUwXyzPkrDEZGfIxSoC7cGZES2MpyQ>
    <xmx:XT_vaQ2fR-Mfg00TOQwuFvJ3Pq5pIWFTULuqvgN2drYFrpMysZFoby8t>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5E04700065; Mon, 27 Apr 2026 06:50:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0jK6RsUegvB
Date: Mon, 27 Apr 2026 12:49:23 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Mon, Apr 27, 2026, at 12:14, Bartosz Golaszewski wrote:
> Convert GPIO controllers and their consumers on the PXA platform to using
> "attached" software nodes. Since everything happens in a bord-file, it's
> quite straightforward. We technically now have a way of passing an
> unregistered software node to platform_device_register_full() but that
> requires using struct platform_device_info and since the existing
> platform devices are either referenced from other places or defined in a
> different compilation unit, I wanted to reduce the impact of the changes
> I can't test and went with the older method.
>
> Signed-off-by: Bartosz Golaszewski 
> <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Bartosz,

These patches are individually all fine, but I was hoping to
finally get around to removing the pxa board files completely,
sorry it's been taking me so long to rebase my series for
that.

The only remaining board files I expect to have soon are for
the omap1 and s3c machines, so if you are going through the
board files to convert them to over, I would suggest focusing
on those.

      Arnd

