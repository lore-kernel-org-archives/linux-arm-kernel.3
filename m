Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35441EB48F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+XdL2z7xm/oVu7i2WPSEgyzUrgH69PnPYt94hd9dsc=; b=krILpG8FqsEz9b1suUFqbgLK4P
	iyid+saPktk0nik9QLu2Vc3Gh7sl1eIUgy5qZCC/bwB3ykJPhpjxlNwol6W/wKNj0cb0CANOU4D/S
	k/vgqj4ciy2ygogPvgzVinSqy0H3g5mqwKYq6ngv5K1IIGOwECI72K3tZ6Ir92W02W/tzaAKr44EZ
	Lnobel+LdSbizaZmQ/zZY8g8bpUo5hwDS+oslMol/bFUeE5ZgtIGwPnsXc+F1vJks5qSBlWSw7bnY
	vse6eT79gr6bW93603lbomjFaEzw7sXd0gbVoCQ+gA2gH4aFcyUPeeoJVO5A3grRjiXM64GaPmIRi
	gnr+XZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV8u-000000021QD-1Fbz;
	Thu, 12 Feb 2026 11:45:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV8o-000000021P5-3HwQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 11:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1153A43C17;
	Thu, 12 Feb 2026 11:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BAEC4AF09;
	Thu, 12 Feb 2026 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896749;
	bh=Dli/CIeO7DY3Sdyy7gMsEweRZ3dl7FnjiHHy9RR0tXQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=n7i0A7yn2AClxtrkyQQYOuIxP9Wf9+hRQH9VqmgEbOe5aFwANL7fbDeFhUdv9y88E
	 iTiupr59U/p/dCMOfgDHDjd3pPqg6exzS93YRpqtTUJtCOLGoDiMCNXSs5T8yXdTff
	 x9mR94aDS7fbM00BVVba2K/lx5U34z/NkyYLtOQ1w7ijCyQoRTTyoMqv5DdeygFaLu
	 GoWXvZZ7+n2k5489sqUVLYMo1MHscfn9Bv8jUTmudL0/3fT6atdoddnhd8MnsrxCBI
	 3xqUgcGG6WT+3cfvorxkcq+LQ1TLlGpcRDQLVnahmYn/xbynXlqRXKxg6JqRex9WeN
	 9bkY7qurYxelA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8E1F2F40068;
	Thu, 12 Feb 2026 06:45:48 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 12 Feb 2026 06:45:48 -0500
X-ME-Sender: <xms:bL2Nab7RpRrE2259is5mISjL18EDaJktv_YfTNuKfB-FkewVEZ5fLg>
    <xme:bL2NabvVwU1jzatcUIysxRMgpL9z9sCzRwTb01UYzPRwcpqyi5TggSZ7Ys5WU7EeS
    mnXwNvDwsgJPZjxXvyuh6aSX6PlIKkNlpvIIWAdmh3Cl4481kXhSkgn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepudefjeetteelhfegudekhfetffehtefhtdevkeehfefgtdehheeghfektdek
    vdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    ihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepthhonhihsegrth
    homhhiuggvrdgtohhmpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhm
    rghilhdrtghomhdprhgtphhtthhopehjmhhkrhiihihsiihtsehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohep
    sghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsii
    gvfihskhhisehoshhsrdhquhgrlhgtohhmmhdrtghomh
X-ME-Proxy: <xmx:bL2NaWxB2CG4atkoshXdltEaJ4ZtRGKcIXESffgiR65lO2fyqMQbpg>
    <xmx:bL2Naaa0adZ-PK_ca6D1E5655KrzF1JfZPZp5OekbvCA2zCYwPyo4w>
    <xmx:bL2NaX0c8ImAxHY-DmIBRyxOLCaX61cHeWTnlvWmwzBhEjeAx7_y6Q>
    <xmx:bL2NacftenBriLaeINY06PKBWntgZvGPD108kzug5isFDkM9-__EjQ>
    <xmx:bL2NaUIpXJjW2xtFagPZL--z6_mf1AHxUQbrd-CjOmaRSPDjof5ofz8V>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 64526700065; Thu, 12 Feb 2026 06:45:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AEuu_v-AJ7hw
Date: Thu, 12 Feb 2026 12:45:28 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <8a4b2d6f-acf4-414a-b695-65dd7eaa8863@app.fastmail.com>
In-Reply-To: <CAMRc=MeWgo3b8DTG3w8U2bxR6ejd2UmFVGASvRe7_tJkK2f4ug@mail.gmail.com>
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
 <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
 <CAMRc=MeWgo3b8DTG3w8U2bxR6ejd2UmFVGASvRe7_tJkK2f4ug@mail.gmail.com>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of GPIOs on
 Nokia 770
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034551_013494_CD6A573E 
X-CRM114-Status: UNSURE (   9.65  )
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

On Thu, Feb 12, 2026, at 12:40, Bartosz Golaszewski wrote:
> On Wed, Feb 11, 2026 at 5:32=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:
>> On Wed, Feb 11, 2026, at 14:13, Bartosz Golaszewski wrote:
>
> Add a pointer to const struct software_node to platform_device_info
> and then use this if it's set and there's no fwnode? It's in line with
> what MFD does with its cells.

Right, that's what Dmitry also suggested, see his earlier patch/

> In any case, I'd prefer to not overcomplicate this patch, let's do it
> separately?

Sure, I mainly wanted to make sure we're not blocking future
changes here that I had already planned, and this sounds like
we can change that later without undoing all of your patch again.

      Arnd

