Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA16606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JReCBihj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2dV7xBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=26kcf/vMrCHQyo7noPD3338edvr5n4vxSlfc+BWEgS8=; b=JReCBihjwe38vg
	tgS8IPMwndfZRM9dMWfPb3g9zJ286/hHPuGlqc2GabTuy4qvutisaqjMjDC0+hZkqfjiAa5YaRtWl
	fRkG6wI8eZL5LRAy8h+oR9q99L1oV5H5pXMVSmGAhVPoH3Vdcs6oPoisL0t7Y/Q69F8dAH0airHF4
	GnuoqcHoHIJGr4mnUyqa13pM5gR/CtVciESUYfCsKeX5fGQaAkp8A+VFtmnMOZ5/z85s3WRNJQ0Xo
	4BIv94+gBVqRLRQ+ws8YxLUjPccqhwXLNVa5aDMzWpICipeOoMVdxiE+6J5zIaa0NgRKPX363L7Ym
	KuoqEuyGXhpe1rrmwuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaiz-00000005RLv-3T90;
	Wed, 04 Nov 2026 13:08:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaiy-00000005RLe-0ngy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:08:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A1ED660546
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:08:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF7A1F0093A
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797699;
	bh=26kcf/vMrCHQyo7noPD3338edvr5n4vxSlfc+BWEgS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2dV7xBKvTn6FAmkqiHP6g8a6otPToHBV/wK7r0g09nz2QzboIsEpKBLayDVKWu0E
	 COu5b/inAKXVdJ47Gnw24+E6Uj8VzLaKpAZPQIdoZmOeoh/xXtVotpIDsiRk9Jy/wY
	 yAlL8j0nrt+Xzx/Kt1AgPWLWVF/RR9lTsyIRJYK07egNFo82mpwyslrp2IqqDHr5jH
	 6mueKbknplDvXYx0syMLpR3ftTPF8NJlcbbIJK+nFwnZEFmTj2kEWZlJPu7dixPdm7
	 D8LoIPoVRXP6jycqMw78xnMWLjFb8r2F7MoFzZckRsfG86ncKwzSyLkkwAwfDov7/3
	 RJt7gWChyqpaw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be47aa555cso554166e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:08:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx1wJiLuLeAhbg4Cmu4q3hge7BFgcENObKFtX1fL4z5jAoRgubf0g9S/JlzmXM8LKU7SYkEqedeG4pAn6HKFgin@lists.infradead.org
X-Gm-Message-State: APuU4Z9TLT8K5zElC1IRXTXgbX5++w2ZqF7OszFp8qp7nfZy0asIiYMI
	FWNqyievrpTXsLOrMGG2L+OZSitXZgYazZ31aVpoY/ggV8WBIPJpI2c3PZiujagTA+Sz+45oqoX
	bDDFPi297u0vHjWh0fmTwk9RvVcyTp0c=
X-Received: by 2002:a05:6512:b94:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfd95762e0mr5771686e87.31.1793797698160; Wed, 04 Nov 2026
 05:08:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021183716.718318-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261021183716.718318-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:08:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=o_DeVNGjHLxuhpDggg4dAuzzG=-UXDVMNgeUhtTYK3A@mail.gmail.com>
X-Gm-Features: AclHuK88BqPw7V6bD677Ez2Rf4GqLNeT0S1fsbGULVrD1tlIZlRJt-eflez34qQ
Message-ID: <CAD++jL=o_DeVNGjHLxuhpDggg4dAuzzG=-UXDVMNgeUhtTYK3A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nsp: support both-edge GPIO interrupts
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 8:37=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The SFP core requests rising and falling edge interrupts for module
> presence, loss of signal and transmit fault GPIOs. GPIO-A only has one
> edge polarity bit per pin, so the driver rejects IRQ_TYPE_EDGE_BOTH and
> makes the SFP core fall back to polling.
>
> Emulate both-edge detection by arming the edge opposite to the current
> input level, then rearm it after acknowledging each interrupt and before
> unmasking. Resample the input while programming the polarity so an edge
> during that sequence leaves the controller armed for the new level.
>
> Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadco=
m NSP SoC")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Patch applied as nonurgent fix, tell me if it's actually urgent so it needs
to go into the -rc:s.

Yours,
Linus Walleij

