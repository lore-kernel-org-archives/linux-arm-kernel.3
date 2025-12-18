Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDD9D6D22A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IchqKkM1bd+yGaVg6uSU5HkGkxw95z8S5Xb35oyo9pg=; b=obHZhpCo1X/KRkgGPFy98pkHul
	PgC7hECnLiBj+ga8xpTUbtR2S9+K2xnwXyJTOoa9EwYNfI0UC1yhSkjD9wc7AIqqsE/i5Z8OUrPIT
	DU2UIYVO0n5sP/lmw0A4or7/wIl+c6l47MgKGRhbIaIt/f311qKx41T93hVpQE/NrFl3yvPlPW8Xq
	xmIocmNX0xLQw9fTf8pcJhhDOYq7BS/wOdEUUVoGCWIT+KbXuWG0GKjIQH15J13SL6MILsonog/wa
	H16ND+sW8f2lmF3kxHjirDqf0vOEYXTFZq/4q8BOHBzmFR+T2rUl8bRoHDS0lfxDYjab2DSHOVnaV
	2nPt0q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEv6-00000008bxp-0YjA;
	Thu, 18 Dec 2025 14:23:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEv2-00000008bxJ-1iOs;
	Thu, 18 Dec 2025 14:23:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8203C1A5AF;
	Thu, 18 Dec 2025 14:23:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 666E8606B6;
	Thu, 18 Dec 2025 14:23:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E7DA102F0ADC;
	Thu, 18 Dec 2025 15:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766067826; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IchqKkM1bd+yGaVg6uSU5HkGkxw95z8S5Xb35oyo9pg=;
	b=a+In6PYbA1mKvlCzytMKYpqqpNmweyhmmw64DSVm4U+rsYr85nTYAmMTHwlSJxtvBEqHtX
	RG9L3e6YQz4sa5m6aGWPUxiiWGVSjyLEhN/exrd+gqJsEzD6+adDnHdgIfJ3I3l/Ub95cr
	m6ZRun7wYQt/QWLrY3qfpzufBblU8xBkL+Utf8jtZleFt+RjBTfCpdlQdNfOOFg5/PpE9z
	5htB1/d1tqdWQuW8jHkAUioZ4BTEQOj+gDUMJi3re9Q7kkog3zWzduDBkGH3HNeS+tDjFt
	4dYjI2/PRcpHsOnjTrNzjrxj4/8LPmAtI5S/TkoiZi1fp8Gw+8giOGUZ+OhdaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 15:23:35 +0100
Message-Id: <DF1ESI44XZ00.I0EK3DH2Y7LR@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "David Airlie"
 <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kevin Hilman" <khilman@baylibre.com>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying"
 <victor.liu@nxp.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Phong LE" <ple@baylibre.com>, "Robert Foss"
 <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>
To: "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com> <0ba037c65f9cadd51082abf2b7857ba7@kernel.org> <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com> <20251218-shiny-rugged-bug-d1d3e8@houat>
In-Reply-To: <20251218-shiny-rugged-bug-d1d3e8@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_062352_610048_701CAFE0 
X-CRM114-Status: GOOD (  13.08  )
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

Hi Maxime,

On Thu Dec 18, 2025 at 1:50 PM CET, Maxime Ripard wrote:
> Hi,
>
> On Wed, Dec 17, 2025 at 03:31:01PM +0100, Luca Ceresoli wrote:
>> On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
>> > On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
>> >> of_drm_find_bridge() does not increment the refcount for the returned
>> >> bridge, but that is required now. However converting it and all its u=
sers
>> >> is not realistically doable at once given the large amount of (direct=
 and
>> >> indirect) callers and the complexity of some.
>> >>
>> >>
>> >> [ ... ]
>> >
>> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>
>> Thank you for the prompt review!
>>
>> All patches are reviewed now except patch 18 which has no reply. I'm jus=
t
>> pointing out in case it's something you missed.
>
> Yes, I couldn't really understand the implications of that one, so I'll
> leave the review to the maintainers.

OK, make sense, it's not a trivial patch to review.

Patches 1-4,6 contain the core changes and they are all reviewed, which is
the most important part to me. Everything else is just "a bunch of driver
conversions" and they can flow in over time. I'm also sending more such
driver conversions in separate series, for other drivers.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

