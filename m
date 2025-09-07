Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C6DCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFIcbNvPEoCpucJAgPEBDI5ghiJH/mZZqi/qt+FRAtI=; b=CpDaCjbuQc0rgS03ep0hpnQydo
	oZbqYHce/XGrF0WsTHyUcTX+/GKQvmm8wmGVpfkRScHJtkYczb089Fz5W50D3Yp1OP4lqQ0jJ8qFE
	w7z7ojwVy/ZtFHrFv3OugoBtIaqRww5LwRGMT76b+qXNnAa+s2e8u3U9dU/5eOU7DeR8dfdmDmgSc
	DVg1pI26cJ4m3KfTEDhjs21c0DS8yij5PCN5WJFSPt6wu8h0IZf/WTenlB/1zSXodThvAAEU02QJg
	jcR+DPy2MZwABvcxvXF1BHWHpfBBf4lZqn6FTFy3jHKK73eJV5iBVDlnW61N5RSJQBj8cYsc2tec3
	15uB4cRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIjL-0000000C0CV-1JO1;
	Sun, 07 Sep 2025 16:59:07 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIdL-0000000ByqH-0eUi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 16:52:56 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cKbjs0S9dz9tHp;
	Sun,  7 Sep 2025 18:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757263969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFIcbNvPEoCpucJAgPEBDI5ghiJH/mZZqi/qt+FRAtI=;
	b=gPs9V00X0uyp27qkyqUpw2vp2emOp9nNNpJ2k6uT6pgZAMarP9kSnE4FLdYuOYmqHL7MbG
	fuL16htgJImg3pXpwZMO5rRTCwqapalIt2zEkPkS6cs5f1a7QVgV8w9ajcjtluIrPh+Eqm
	Uxv9oL77Oqu8SXDHaOradOiztXJMkx+Ym93dACPKDO8lvBDuRPc+xNkxLa7gn/GO7eg+6s
	L+aJZzTzvkLsQ4l/i9uL7c48ojTK09HTDtXJ6mmX4z/RAn2dSh6zMrJlIhtOk1J+n7PPvq
	P5yJctAE7l1Y7V13vGhrk9te6woEGdqWG3272x65q2AkuIBCK3ZvSCAn8gAspQ==
Date: Sun, 7 Sep 2025 18:52:44 +0200
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukasz.majewski@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v19 4/7] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250907185244.7eab9640@wsk>
In-Reply-To: <20250827111651.022305f9@kernel.org>
References: <20250824220736.1760482-1-lukasz.majewski@mailbox.org>
	<20250824220736.1760482-5-lukasz.majewski@mailbox.org>
	<20250827111651.022305f9@kernel.org>
Organization: mailbox.org
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MBO-RS-META: y5a5h3eezse9k4uczes6z1epofcg74go
X-MBO-RS-ID: 4f2f62b6c2bc268ccba
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_095255_337767_30ED02B0 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi Jakub,

> On Mon, 25 Aug 2025 00:07:33 +0200 Lukasz Majewski wrote:
> > +
> > +	/* On some FEC implementations data must be aligned on
> > +	 * 4-byte boundaries. Use bounce buffers to copy data
> > +	 * and get it aligned.spin
> > +	 */ =20
>=20
> Almost forgot, the word "spin" appears here rather out of place.

Thanks for pointing this out.

--=20
Best regards,

=C5=81ukasz Majewski

