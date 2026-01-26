Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D23D1951F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nALW3HhfFj/202n/g5QYkUrMwqhISiB3IrtYEa8euk=; b=m5EcBYjkmI9Kcir3M7boZJ1SGf
	khrFlymX8ebaovJY3rYH6t/f+oiI/faJH35bzRoHv7sdUyoqq23XtRWwUReoXMHbKEWs93mHKpART
	ud2ybO0Ke+TFF7buwkwkkiU5QfqoBEXwUF/XSkGLoHac94AINbnUgJHvRsqsyN9a2+1cMk1PyEuTq
	ytGTxxgdM7WlQuFrgDgKHtkhoFn9uBWwsuGG9V22SWdNfUseSbPFvjCS3FiQXxxKmF57yCFM3sPrP
	jF8VKxvoSUfxGzTs6BjurHb89RKA4xlQ9FRgUNMNIp6e2kzOdBiZTd6oIXxFVNOa+qxa9OaZ4v3HB
	qIsPOZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUMU-0000000DHdL-0Bwd;
	Mon, 26 Jan 2026 21:43:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkUMQ-0000000DHcs-2kE2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 21:43:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 97DFA1A2A59;
	Mon, 26 Jan 2026 21:42:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 541A360717;
	Mon, 26 Jan 2026 21:42:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A18C6119A8652;
	Mon, 26 Jan 2026 22:42:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769463776; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+nALW3HhfFj/202n/g5QYkUrMwqhISiB3IrtYEa8euk=;
	b=rfT865BlG/dFY9zv4vg4gdieRFYvfP9x8eyl+e0aQqahaf8e+eZ92HIy5aUPHPA3r62NMb
	au66FcmmQ4dfPcSZ6m+jJYlAP22WC8R0bsionAbLUtg9SNB0NRAMNgcLlQSTZ3z/Fn6dLg
	rZ06H4rpReh7S+VwY7vw5rNqS6lzCwptsbC3+Cv9HH8niGer0AnV5Nct1hN+MlWi8TD+G7
	h6gB172QNxFtaZ/2DWRW21xWFzFbApppMN979MOP/zV+HWVsYM2bLtG51LIghNaBdS6xyb
	F9SQK+vd8m5T1nG/qXjDKXgI4jFawT2crvumJAJ+KmnMGVTIrV2xQ66+6HTNuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 22:42:48 +0100
Message-Id: <DFYUK1CQ2458.1LX5K13CHSVRC@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com> <516e24d3-511f-4fb5-9274-a20639618d4e@nxp.com>
In-Reply-To: <516e24d3-511f-4fb5-9274-a20639618d4e@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_134303_177142_41CFEC70 
X-CRM114-Status: UNSURE (   8.37  )
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

On Mon Jan 26, 2026 at 9:14 AM CET, Liu Ying wrote:
>
>
> On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
>
> [...]
>
>>  * the bridge returned of_drm_get_bridge() is stored in the local tempor=
ary
>
> There is no of_drm_get_bridge() defined, so
> s/of_drm_get_bridge/of_drm_find_and_get_bridge/ ?

Ah, well spotted, fixing that.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

