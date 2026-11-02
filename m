Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C43606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tk7LQPzw;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IjrBJiTZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VRgul/3wnTrfhZ6WCGiExBHWwBt8I+pgNAsbFHTgI8M=; b=Tk7LQPzw4WRbtA
	/E1mcewvWqQmA/lJhQbzb2NAYjF76hrGe5rOCh+AkkbJL20WeVB27P9OFaNJ7NzQIIAUp/pgiASnx
	aK52JqU98pHty1NZO0gPjsorMNRmGePG7kkaQSmCDe+ypYG/HZOMKL91gabVS7D/ejygRLiZdqbRl
	xSZszRR+RXuZ96kj8RhMC/KL8AB8bOTGowFweGvr8g5YDlKjbcY/h3ctFuTf2aAL6EgFV9JMKKFwG
	Utg263BjQL9NIMWkMRKoH90KzTKKqQA9osjeFcEl9UP6Ev0Xt+F42DgvsdsQGPTuXobKleI95o/is
	aCqN2Nva3krhwMbqu1BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprq-0000000GG1b-3Ida;
	Mon, 02 Nov 2026 11:06:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNprh-0000000GFun-0u1a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:06:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9AB044E413CB;
	Mon,  2 Nov 2026 11:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2796B60750;
	Mon,  2 Nov 2026 11:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74D771032915E;
	Mon,  2 Nov 2026 12:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793617565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VRgul/3wnTrfhZ6WCGiExBHWwBt8I+pgNAsbFHTgI8M=;
	b=IjrBJiTZgrOL1sPcxBV/JXRyLa1CSRDXNE2AffRAr9sHD2ILgDUWdC8v3Dc6lZGfcrMu72
	UwOyn6QhWF2Ltnd1Kx+fpCz873sNREMY21FfHfkXcRH2CJXfx6q11kz3tclTAqeVOq9mpI
	rUdZdLazEoOcrFSNSDe+LakKcOGwa8C1kCK/4qUhcOoXY126LkpZ/JARBKNrrZdKMIq5wJ
	ARGcWCrk2SeMYjIH4Z+Q9nSM/QblqPlK8hUoWlJF/bsNkUdJrWV153YzBT/mzWC7j306vK
	gi+BhrPcKgPnQEY77PBrKgR7RYcsNfFak1xsO7Sv7c/QoiEeWkoOTKXLQ1wqyw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
References: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix inconsistent indenting
Message-Id: <179361755686.261447.18093822664278994585.b4-ty@b4>
Date: Mon, 02 Nov 2026 12:05:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_030613_430166_EF115EE0 
X-CRM114-Status: UNSURE (   5.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 07 Oct 2026 14:11:53 +0200, Luca Ceresoli wrote:
> Fix incorrect indentation introduced by mistake while fixing patch
> conflict.

Applied, thanks!

[1/1] drm/imx/lcdc: fix inconsistent indenting
      commit: f55606c5c095586de20124943e615d9ffc1be339

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



