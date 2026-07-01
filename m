Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9236EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IjGriL20aUDrYKm6+vTu9029BmucxRxhyWYYY+OsIA=; b=uzDyUC13lmsyRJEUPRez+YppBl
	mcRfPP/z6Vv5+SGLHvdhnDNu6eRyxlYWBxlZIE1fN/BJR6DQFWsqiLd4j74MCeotBHoczW7+NXF5m
	/4/JqOOjZs2t13MEFVOeL2Eds33xUBkLYqpywphtO0G7iVnCxCThf83lV6PWjSk5F1DQYZ1oQhwSr
	qgMjta0B2JU9GIRDZkmnT7UOLE0TxOqcsycs0L4ye5ARi9gQtSQVRoLCKl8fP9mOFcQzN1pxrZ6XG
	BL3n2gxQp5Mjb1NdJimM5gryOIVYLov34y4Pis11u+dFe6rKGc6pgCWBR1ASAkm1MpMlmG+uks/HB
	4O5LyPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weybB-00000002h3F-1FQN;
	Wed, 01 Jul 2026 17:19:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyb8-00000002h2T-0oyk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 17:19:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FD07C4FECB;
	Wed,  1 Jul 2026 17:19:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 030955FD9D;
	Wed,  1 Jul 2026 17:19:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7306104C948E;
	Wed,  1 Jul 2026 19:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782926376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9IjGriL20aUDrYKm6+vTu9029BmucxRxhyWYYY+OsIA=;
	b=y9QUWxlV0KdIf9f/c4LLTFZWCL9K6cSxJ/+M78N1Z9c1zI/NLsntj7oPAFKCXCpZxmnZxy
	alT4YKxKZFYGyT+BFHqW0GwcfRgehJWuH9JkuEfKyuWtyVMIjOGqF6REFNJmf+kUMt7Q7c
	0PvtvmNs6hOoxfJ9G+p6z+B6fitYNygvlI4q8INBZ/lDSbL+LWeTJ9zzcs0mS37NuSJHfj
	3BgM+ueb3u+bs6Wwtv5v11Km4oq8x/vkwCS4/PvbFL9S+u1ExOoV+SQo311mp5LfzBDoDN
	2w765HyEMzksiUMFNcnPmxeZWvdxOYB8q1B2P9ciZK/JxfRGj40HEvUYuJwHeg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260619-drm-lcdif-deferral-msg-v1-1-ce2392dca985@bootlin.com>
References: <20260619-drm-lcdif-deferral-msg-v1-1-ce2392dca985@bootlin.com>
Subject: Re: [PATCH] drm/mxsfb/lcdif: don't hide lcdif_attach_bridge()
 deferral messages
Message-Id: <178292637135.3330226.15837707987617382686.b4-ty@b4>
Date: Wed, 01 Jul 2026 19:19:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_101942_405312_067AAD8E 
X-CRM114-Status: UNSURE (   6.37  )
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


On Fri, 19 Jun 2026 09:02:13 +0200, Luca Ceresoli wrote:
> lcdif_attach_bridge() uses dev_err_probe() on all its error returns to
> store a specific deferral message.
> 
> However its caller lcdif_load() calls dev_err_probe() again on error,
> overwriting the specific deferral messages with a unique, unavoidably
> generic, message.
> 
> [...]

Applied, thanks!

[1/1] drm/mxsfb/lcdif: don't hide lcdif_attach_bridge() deferral messages
      commit: cff96362794a5c1f3adb013b4a46c7233149a629

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



