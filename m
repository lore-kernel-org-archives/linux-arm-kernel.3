Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7BCEE36AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arbeKzskpaZ6m1Z7FnnQ5xEvGj02M4ftvyLatuv7G9I=; b=QH9egQ8FT5YK3ewPTChJM6xkyd
	cLHDkBxjH/Gfpj7kmqC1OaiMl9gya4eewz8lwvfQTZL+8rh9K7kyLms9k6JhsUXdrZj0fn004gPSm
	a5sXXKwLtSEXJecQEn0B+aIKo+lBJYJwnXcUOspZLqBhN+8WJL4RgClzIxcZHVw5diC2X3jeqW9c2
	gCTD6pZS24GARaC07iH+P5bydCABqnSYPK8V+awXMHI6zHQkM//yVdWj7JNiQMoPSZQxaQ4Jxpq1U
	Zvs9OSjEVr1W43zM9kxKytakQqMVBknI2Cq2kgEAOMjCNe9YXD8R0Kww60tGrm6fh8w3w+yW9yc+8
	WlNYjrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqa1W-00000002Pbb-1dOS;
	Thu, 12 Feb 2026 16:58:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqa1T-00000002Par-41wf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 16:58:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4FCB4C23DA8;
	Thu, 12 Feb 2026 16:58:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 022FF606B8;
	Thu, 12 Feb 2026 16:58:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ADAF1036888C;
	Thu, 12 Feb 2026 17:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770915513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=arbeKzskpaZ6m1Z7FnnQ5xEvGj02M4ftvyLatuv7G9I=;
	b=gCSGMQvztYNe3eC6uQzYgHoD6EATkzqZfYyeAU/f3/I9mXJ8PbJkqMKFssqdEWLygsQCMS
	dYrt25axvM/8/jIlSwmcqnULBvPi4rAISiPrVLkxj+YNEZTVWSY3gcy3odJN18qPrYzf8n
	GUEK3R/XDWveteemwNH9tm5rP1yNIdo/25iGkr3yTQ1epIZ6Aa21mha9pU11JMO2E5suI3
	o8ATdKYJ79w2ge2A/kv3XrBmj0T8KdxtMVnj65EQecDiqS3moyAdyGMWghXgRt6RQyOit5
	iOr13cSb6aZ8i2HZk9yS4D076cyXKJiePiNrSYjOCrMokOGShyEW1/xObA/TJQ==
Date: Thu, 12 Feb 2026 17:58:28 +0100
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
Subject: Re: [PATCH 4/5] ARM: multi_v7_defconfig: Enable ITE IT66121 driver
Message-ID: <20260212175828.380fa3ff@kmaincent-XPS-13-7390>
In-Reply-To: <d786d817-e97d-4270-a3be-4778730df35e@kernel.org>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
	<20260212-feature_bbge-v1-4-29014a212f35@bootlin.com>
	<d786d817-e97d-4270-a3be-4778730df35e@kernel.org>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_085836_140150_F00B8258 
X-CRM114-Status: UNSURE (   9.38  )
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

On Thu, 12 Feb 2026 16:40:14 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 12/02/2026 16:26, Kory Maincent (TI) wrote:
> > Enable the ITE IT66121 HDMI bridge driver to support HDMI output on
> > the BeagleBone Green with the Seeed Studio HDMI cape. =20
>=20
> This is not one option per patch. All three patches should be squashed,
> because are logically one change.

Ok, as you prefer.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

