Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83186D39420
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44e76YJxkd5q+hgUlWAXtOLYIJKiZNYp0nUsEzVCRk0=; b=Yk77vXKl3c8KC/yi0a/4nJ9j4g
	qNdTSWMgg5Ovwak/ZKZGPA8caHCG6LtejRdjRPJFXDKnflyA0P5sSYUtphchkjsXk4iIka1HRUbZs
	kEMtchpP3AF3NQt5kSI+RugJeRtPQs67F4CTGTAlCvWVUiujvLbGnPULMq5nT7Bc4JxQsPHPpNnb0
	JYXryjfXzi0oucd4uNUsOCXZbT3ls/tavrh3yQRvcZhgXvSlqASD7LSdB6CvR3bi84GboOTQbz9hH
	+rua+ydN7RV4X2V66e+7gx0q3CrlLQx8hIQLwW3pQILfvIqLoUKum5U0svHQbC2RzmMypCNmfNPz0
	C9XtOWsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hnf-000000008vx-2XNB;
	Thu, 02 Apr 2026 13:09:31 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Hnc-000000008vX-3q0Y;
	Thu, 02 Apr 2026 13:09:30 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4567A7A011F;
	Thu,  2 Apr 2026 09:09:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 02 Apr 2026 09:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775135366;
	 x=1775221766; bh=44e76YJxkd5q+hgUlWAXtOLYIJKiZNYp0nUsEzVCRk0=; b=
	FBxYlgk5LwTbC6Hd0pYsekY+cj/43xfDic3Nq5KUYXIuAByjWcQC/4MynK8EvGyv
	Uexk61LrbgEEKfXkfTlK/shMDYl5tyAn5shj5yTVpfPkur7h2UHMqxssu5nPxFoa
	8vRfS2ciCetboKjFIxSqY/FCKB4xHDco2m54AOjrLpQIp74wqvRjCB/NWCddnFbT
	0OTw/HpU2+VuBssb4bSjrLHtUqxuTg6rsGhW5fhjLiN2JmVBTYGLY7+coU3dR9Xh
	kqkSyJqdDab0AXssZVE+URd2eVr0yDCGcxJxKLmiq6mHj7HSPdlt4CCQUxUTgVUD
	sPIHM0gA5KivuyxhzN/y+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775135366; x=
	1775221766; bh=44e76YJxkd5q+hgUlWAXtOLYIJKiZNYp0nUsEzVCRk0=; b=a
	gPYXQIZnT60HzAt2D0PVne9tKUzCK0FsozqUq7cu6ndYiCt4Z/zV7H3GR6snL8YH
	Nia8I0kaiAnShNcTT/6fGyjj95fpYvgUCc2AH+6xSurhsnlZ0/6xukuewVctmEsx
	caolHX6d3alkzc44sfHAEk/0YOY+sjm4Ulbwnunt1Z9c/aHUj2GGIQ5OaUk7ZUqB
	qY8rSjZg92tjU6RaPqkWQnkAXLL5Jlys5BzrZH/DGIlwyuvhzujN3faH5snylGiP
	c8fS9Rb3CO+ArMxP1zOFsIDznAp7cTRsV6Szkag3nisaBKJyi+L/Guz8OyI468i/
	XwUvWnLeDj7G6x+YHKoMg==
X-ME-Sender: <xms:hWrOacBTCxdDYIcJJmzYbVFEnnKq3VZJ2svW2EbxtuMV_IEV78GleA>
    <xme:hWrOaZX8n43r1AuPAp20ZIPd-3JBc8md8Q2lCb8q6ld8xW__eIdTD4wKGkj2WLlkC
    RaGDhtaQ6b9vmBnJwRoYLO0DM2MVb-fENcE3LIWtDZK0VG9hguYe8wA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhlih
    gvugesghhmrghilhdrtghomhdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhr
    tghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhgvnhhhuh
    grtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepfigvihdrlhhiuheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepihhlihgrshdrrghprghlohguihhmrghssehlihhnrghrohdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhm
X-ME-Proxy: <xmx:hWrOaRJECYk7puPdfEJsTZFmLUHJ2_Z9AuyoEdU1gXrkS-yMyi0yeQ>
    <xmx:hWrOaYk5-wfc0FB5RtkxmKUuvjk5TSISjWQ-QCF72nf8aIeKlC4K2A>
    <xmx:hWrOaYa75UPVpD3coPM_gSmGfD7moZUk6STsXIaichwb1GQ5apWUDA>
    <xmx:hWrOafhqdbusxY3d9sJNkItrflm8nihdTYsks40u3x14gzVAeZ__yw>
    <xmx:hmrOaavXLi6cH6_83S9pbfjqCQNQGiA5wxCo72vsfMgeAep0jKjdGOSp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 462A2700065; Thu,  2 Apr 2026 09:09:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ATYY62_w4Fts
Date: Thu, 02 Apr 2026 15:08:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, longli@microsoft.com,
 "Helge Deller" <deller@gmx.de>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Message-Id: <78f76717-8f1e-41d6-92f7-261df96b84b6@app.fastmail.com>
In-Reply-To: <20260402092305.208728-4-tzimmermann@suse.de>
References: <20260402092305.208728-1-tzimmermann@suse.de>
 <20260402092305.208728-4-tzimmermann@suse.de>
Subject: Re: [PATCH 3/8] firmware: sysfb: Make CONFIG_SYSFB a user-selectable option
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_060929_545475_3DAEB415 
X-CRM114-Status: GOOD (  12.71  )
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

On Thu, Apr 2, 2026, at 11:09, Thomas Zimmermann wrote:
> Add a descriptive string and help text to CONFIG_SYSFB, so that users
> can modify it. Flip all implicit selects in the Kconfig options into
> dependencies. This avoids cyclic dependencies in the config.
>
> Enabling CONFIG_SYSFB makes the kernel provide a device for the firmware
> framebuffer. As this can (slightly) affect system behavior, having a
> user-facing option seems preferable. Some users might also want to set
> every detail of their kernel config.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I don't really like this part of the series and would prefer
to keep CONFIG_SYSFB hidden as much as possible as an x86
(and EFI) specific implementation detail, with the hope
of eventually seperating out the x86 bits from the EFI ones.

In general, I am always in favor of properly using Kconfig
dependencies over 'select' statements, for the same reasons
you describe, but I don't want the the x86 logic for
the legacy VESA and VGA console handling to leak into more
architectures than necessary.

Do you think we could instead move the sysfb_init()
function into the same two places that contain the
sysfb_primary_display definition (arch/x86/kernel/setup.c,
drivers/firmware/efi/efi-init.c) and simplify the efi version
to take out the x86 bits? That would reduce the rest
of sysfb-primary.c to the logic to unregister the device,
and that could then be selected by both x86 and EFI.

      Arnd

