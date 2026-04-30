Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A85FFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBZUB+FMgJz39j6RxqqwfDm0aUpCNC8CGEWjveNGpGY=; b=B4nxitAtUZWZHgb1q/IBzOAs9x
	DUIYFyXaWuiDuGprOEJtw6dbPLBIiU7ZCSqIYQ2XtzHR53GFmFPNa6QaeZHwAO4H6GA3StgSPbWXS
	2lWX3JEkhScQPAm+h4DfOYvGA8gASEUCkgqy7VggEyaszUgLDteyrEodxsxHeOrTq94DcHJdm0Xni
	H6AmTjqOUFORh9DbJwGKbZGGdc5Lswc6r/6zeiVnrH+jn2ekJpPxk5vklJxN9xK4DqFUOQIRb2ydd
	7jeGQ6cWQSOQY/B20CpN2Ys48yIZ/53SYIC+Td4wkq21uGEea2s2qZaa+tcpXR3k0XHP+tqqXTD90
	SzLhmpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ21-00000005Pgd-3joR;
	Thu, 30 Apr 2026 11:58:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ1z-00000005PgB-3LyY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D93D16057A;
	Thu, 30 Apr 2026 11:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BC6C2BCB4;
	Thu, 30 Apr 2026 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550290;
	bh=zhzqGeOnKGkLchTGAvyrX7SDhoGMT1bGUR4nOm0dXqE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mSrBfL/V0uv1Eh5wd53H9iwpi4qJD6g/GDdl0JJqaPCxyp5IoQQtyWSY0Z93Pa0zE
	 XhzmaQK6iec7aIIvzkSCymX6XMkNnS6LB/jKxoa8jMaadlZ3/kLL3X1IRhvF/JWv/+
	 GjVIFIGepPwu0cwi/nKjB3VR9e4Mm0ymxofLH4eN9q5zoYp3Hzq06XSkpfRzU6fVES
	 MbPx9BIBKNJptmOLp6nqthKpsgncUi4cqeLwnmsXiCq4zRKS3HUBcwTgMrh7CFWAHF
	 yLkcuwBe01M1KKWB2lijYGE9z+wYReflvaUkquoi2ScKpjXESZ3yYf2e+MS1Q++lye
	 FFm4lKrYfvm4Q==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 50BBEF40068;
	Thu, 30 Apr 2026 07:58:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 30 Apr 2026 07:58:09 -0400
X-ME-Sender: <xms:0UPzaZgG-7T1xRJwXmfQD12kwbHgrV_ELwRB9-YbSjovZXuObBH62Q>
    <xme:0UPzaY0yfVYVKe0PYzBNdCkIu1ksr8CP4XVH-ZtWI9yiiQiXKoGV1rkfw88LE0k3Y
    bk3A2isMwyHOiKQKdX8Vru1ZVcaMqLCl8MoZJgC35-7Zi0HSB3Xv2co>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekjedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedufeejteetlefhgedukefhteffheethfdtveekheefgfdtheehgefhkedtkedv
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
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
X-ME-Proxy: <xmx:0UPzabYwMqpiugEpAyXvU0d06ZqyDkm_nF6O6cPHCpF2sKuLB7As7g>
    <xmx:0UPzaSgT6XXOYNutd7_PiDlt-pJ_UYgHZ3G_ay4zJIDkiEUoXGUkhQ>
    <xmx:0UPzadcl7L0plzSKwLyIMHwyn65HK7tPiWxr7d40kh6TWrXMyv2zMw>
    <xmx:0UPzaRnFKa6T-EEJq5_akrKvG9Hqf04zXwfI5jP9IXSvuZrLSjcSEQ>
    <xmx:0UPzaSyD2YwQtR5imEEcSQjC4kZK_MQ4XkU7Lv1xiGD6G7JQvvc5NNFS>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26CC9700069; Thu, 30 Apr 2026 07:58:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0jK6RsUegvB
Date: Thu, 30 Apr 2026 13:57:48 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Linus Walleij" <linusw@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <dd8faf98-4c1e-4e08-a41a-849c59a903e7@app.fastmail.com>
In-Reply-To: <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <da7ea88f-845f-49e3-852b-3ca352c1790d@app.fastmail.com>
 <CAMRc=Mf9M_eoPzsqBdmnXLd8Eqw_cPcnXWN9xjC-+x5ZA5Qb_Q@mail.gmail.com>
 <CAMRc=MeKn1_pMAyx_bQfMczqRJ1s28s3R9dAVMG5he97R_q4Dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ARM: pxa: attach software nodes to the GPIO controllers
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 30, 2026, at 09:14, Bartosz Golaszewski wrote:
> On Mon, Apr 27, 2026 at 1:01=E2=80=AFPM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
>> On Mon, Apr 27, 2026 at 12:50=E2=80=AFPM Arnd Bergmann <arnd@kernel.o=
rg> wrote:
>
> Before I address Russell's comment in v2, can you please let me know
> if pxa will be removed in v7.2?

I'll need some more time. Not sure about the schedule, but I don't
expect to remove the board files in 7.2 now, sorry.

      Arnd

