Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3244C47BC0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ihofIBxFPwXzfBzLTBtqfZNBkL8peU6izBU5CnFXCQ=; b=mWy6WaBLSevTuXzBN8EbSO8gkH
	E9L2nNFaztjEzqSvqQgKfQ5OTLq0JO+pbIgitq3UFBWxehqoHRChvuWZgT7MULchbFwMnLr9Lr/jp
	+SQWLbLWaL8EdL+fbVkOwBdonMvGrsQtp0w+mwTTh05Wi549jcT6aJZMwjd3T1zVG3Vv7YgeNAmrn
	rEJigIsfiSjVuJ3iieGXFAKkmTRGMQl67zFnid1d3fcStVcW66fhuFlRZ5BzVW+e8nEUnRzjTGFRy
	bowYjbA0f5csKIErtDrArT7CdEjSqeIULZIF3z91oJqtsibCnyFhR9GJlttevzGDfJ6W11VZeeObg
	NBCPQY6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1ac-0000000CWTD-0y1W;
	Tue, 06 Jan 2026 07:34:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1aZ-0000000CWSf-2YeN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 07:34:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A0211A2690;
	Tue,  6 Jan 2026 07:34:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 01C3560739;
	Tue,  6 Jan 2026 07:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B79E1103C8092;
	Tue,  6 Jan 2026 08:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767684876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/ihofIBxFPwXzfBzLTBtqfZNBkL8peU6izBU5CnFXCQ=;
	b=QA9jJ/P9eRhkdrxb0HptLgAtibWjUt8jFktKgN/YWUb+JLe+KkcDoyyEQD2Ppn5+/jwo5o
	9PuhkdKrKHCFJmwvVHHrNuIRKapqHvtfMGKFtPfB8JkUZq7apk7/qR0ykO/WlNWhf7kDVi
	Bl/ifnbmCGIsRzIc4uM0olnGsE4sW3ojxqibPYiiCO3NDqYB2afR4RvGjjLapoi56PC66n
	5HJ/fOFerReyEAfARTdLDLeTJDoRQlIofWvp4plIFdiL3u195e1w/IEB3kmwrWJz73Gj1E
	uQIdi3lYtAHnUwekMK3xvZVQnq9ev3kSCj8zKXKrEixDRgt59+RNM9n5WrdQ1g==
Date: Tue, 6 Jan 2026 08:34:26 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
 <kory.maincent@bootlin.com>), "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260106083426.6916d687@bootlin.com>
In-Reply-To: <20260105181838.1f307964@kmaincent-XPS-13-7390>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
	<DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
	<20260105172220.2d2edd28@bootlin.com>
	<20260105181838.1f307964@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_233448_113410_FEA79548 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Köry,

On Mon, 5 Jan 2026 18:18:38 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

...
> >
> > Modifying some properties after applying the overlay could be not seen by the
> > driver.  
> 
> I disagree here. This driver is loaded at subsys_initcall (initcall 4) while
> the panel is loaded at device_initcall (initcall 6) so the panel driver won't
> probe in-between.
> 

You're right. the driver registers at device_initcall().
You can modify your node at subsys_initcall(), the driver will see modified
values.

Best regards,
Hervé


