Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E6BE67A9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2kixXIwzcfNbHwd5w2xvnLJwKD/ZbAoWYUhKmFOtFY=; b=fdXAcOdar9HYcFWr2DMUtpKtX3
	6sToWMcYtTD38yURq8MYUIl1gipD0FK0ZihaYbhi4ZQhHyb1Y3Za1BU8yspZzVXKTGxXo/SszLJXH
	Tb84DdbYIHBoCFB8oV4DhC3Lll2MNnajMzhBk6mMGwMZg3P2tKLdTwsKbKwC5ecNapbJZYZyKlxRk
	Qgq+liKjb7HVRzfB2JizoQlgAp6BDJ2IgKvBIwmqzLp2h9q3mlkmU6KDKZjB9ZLcDum3xXJrluTd3
	1elexMOCLOED4Nj5uX8wQndeEE6/ATAUSz6XBc56NRGJtIlQ6fHOnT2B/svOV4S+rW1VpVgmUhR4V
	1spO1YWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLRw-0000000Enei-2w6g;
	Tue, 03 Mar 2026 08:49:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxLRs-0000000EneP-3fmS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 08:49:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B9A941A22E8;
	Tue,  3 Mar 2026 08:49:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 826CE5FF29;
	Tue,  3 Mar 2026 08:49:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3958310368535;
	Tue,  3 Mar 2026 09:49:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772527783; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k2kixXIwzcfNbHwd5w2xvnLJwKD/ZbAoWYUhKmFOtFY=;
	b=yyl4e3BkR1c9BpSKwiVJqWmRzxe1nONWInzsUl0vHpDj/Y6GdrEQS0g9cfjJFo4KIQZ7pf
	os9iwf+5+dn+7O6sZ8RFeOuYxf9FGwhr/8BicW8+2LmpBElfkk2DWv/51uSamKfjjHzOEh
	oKstnDmp5aZfKrkMfom9KtEXx5Cbo2CJIT/6XhLv052oWbtj/4oT/kQAv6yqu5eKaMyX3I
	ajDAfKFGPOoIbAK6vX6BiDRgTAclk42XXhxGSToB7onZ5OaAGGVI71XjIwFdK/cPhZgmwh
	yg6Hxi69iunSOOXCEteDKlnHkkAyZ79E4iaZ4TzUAVb12VnxxIuE/7l2M9BjjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 09:49:26 +0100
Message-Id: <DGT0NIR1EE4J.242LILLFFMDJ7@bootlin.com>
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Peng Fan" <peng.fan@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <frank.li@nxp.com>
To: "Marco Felsch" <m.felsch@pengutronix.de>, "Liu Ying"
 <victor.liu@nxp.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de> <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de> <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com> <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
In-Reply-To: <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_004949_073006_12EB4921 
X-CRM114-Status: UNSURE (   9.35  )
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

Hello Marco,

On Tue Mar 3, 2026 at 9:05 AM CET, Marco Felsch wrote:
> On 26-03-03, Liu Ying wrote:
>> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
>> > From: Liu Ying <victor.liu@nxp.com>
>> >
>> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
>> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>> > field. Add a DRM bridge driver to support the display format configura=
tion.
>> >
>> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> > [m.felsch@pengutronix.de: port to v7.0-rc1]
>> > [m.felsch@pengutronix.de: add review feedback (Alexander)]
>> > [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)=
]
>> > [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
>> > [m.felsch@pengutronix.de: add bus-width support]
>> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

With the GFP_KERNEL and double space dropped you can add:

  Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

