Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB1EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYIrBpMJQWQHkNBd33MWbGOnLThZyq9ymxlrpIvZAak=; b=U3SytUWvn/VIMzP9wYqEH0YxVT
	Si5F5EwFWt+328hf1FN/ugN+5t6EzNGH0cFjMWMNgpcwl0MEsMpOEiH4NtjDga4z7cgV/Ambrv5ve
	rlnT7vQpqQo4kUEFIH+Yct4H3wh02BoZzsPPYJ4lkDsK40AIwXLAu3MPksugd2iWy+7GZaeQNmurd
	aFLuTmHXl1cC2lOc0DnIMw/U1hUgY5L78wR2n+AIUqRmO5mg6nrLknt5xIgDUok7wFKHAI2q/zQfU
	nTP66fTIER9NMSPRKMUq+uNvLM6Lk5A2xqdKNlsyclmTcPPGloDgWtgI2LUNA4KBdCrkMOdVRwB7G
	1JUt75nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZyl-00000002PDV-0XUR;
	Thu, 12 Feb 2026 16:55:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZyh-00000002PD3-26Ky
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:55:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2B5E0C23DA8;
	Thu, 12 Feb 2026 16:55:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CBAF7606B8;
	Thu, 12 Feb 2026 16:55:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7559E103682C4;
	Thu, 12 Feb 2026 17:55:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770915338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BYIrBpMJQWQHkNBd33MWbGOnLThZyq9ymxlrpIvZAak=;
	b=Yf1Xjk7gSmzJVkIbmTlz0maKJ4nRF74WIw0ge8IXTs0sXCJ048Hjc2C8Xpxhy6Xs7llVMO
	OaHq77LpRZtYrnyFxOpgaCS5Lm1PhxqTs31e7N+VVV2E0YDQfa8+47pN70ibUZGgOuhEW4
	UtC3/YZuRU2nXfOxQ8UtC4maEThd9+N4dyzaB/z9hA3x201t2msIlotYSsQX+3yIeyq8mV
	Ak+ZQcXVBgpflKOg8E+aWZbhzGctaQc3PN5PYhKybWBc1JiOB0rnQpZ5cg1WaUDaE4aCNV
	pV3DYfpBZctKndkpEtD15fKhZyjjr4MSeDykZj3X8EoCOI+T+jnzLgnAiUlCAg==
Date: Thu, 12 Feb 2026 17:55:32 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Louis
 Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260212175532.0e9bb107@kmaincent-XPS-13-7390>
In-Reply-To: <bfe9f164-ac90-4647-b194-2f9b2fef2901@kernel.org>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
	<20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
	<bfe9f164-ac90-4647-b194-2f9b2fef2901@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_085543_676856_88DF1CC1 
X-CRM114-Status: GOOD (  13.10  )
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

On Thu, 12 Feb 2026 16:42:12 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 12/02/2026 16:26, Kory Maincent (TI) wrote:
> > Allow overlays to be applied to any DTB. This adds around ~40% to the
> > total size of the DTB files on average.
> >=20
> > Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
> > --
> >=20
> > Enable overlays for all dtb similarly to what has been done for arch64
> > TI boards, but we could only enable overlays for Beagle Bone and
> > variant boards if required. =20
>=20
> You mixed changelog with commit with invalid separator thus there is no
> final SoB.

Arf forgot one '-'. Sorry for that.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

