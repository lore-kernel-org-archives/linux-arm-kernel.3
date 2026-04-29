Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3F9FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5C5WjMDCk4kbiTHj64gwZ34T6TJ7DSCuppc2MhbBVao=; b=HD3XnplYHi0u1h9DO7tFQCYRh9
	4zVjioQaqs/i4yfiEF6wWsMDDtxYuVjQYt21tRwoD54b1C6orfkQfC4mu0dCtOeoittDZZ/HW//AG
	bp5A2ICr0n7WYuhHQwNvMKeYZHUJIfNBbijJiFEAB2N1I00ol3jVQMhg1UqyuR3YV/B+57lU7ddp0
	pr5vCtv34DGiCkDsseLaGwsUCw/iPCJ6VGOP3cJ+sPQGrgsaXwBd8WPa3swylEop0F/QCeuNZs/7N
	mvnhALZpBL3v7zfxeXSLtt1HLWHneOWK4gqmS1/jbnSj/OY220IYHmcWZftYgXOSqHtLXL2/MwtjL
	oq4/M8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3Ka-00000003XC5-0xvy;
	Wed, 29 Apr 2026 11:43:52 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3KW-00000003XBl-3Hz5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 11:43:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C7281A33E7;
	Wed, 29 Apr 2026 11:43:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67BF6601DF;
	Wed, 29 Apr 2026 11:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 338701072818D;
	Wed, 29 Apr 2026 13:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5C5WjMDCk4kbiTHj64gwZ34T6TJ7DSCuppc2MhbBVao=;
	b=cvcX78xVFs+rZdgta+uYUEgQ/SAm/sIgoeTFarUqiBRML5ZY/9UiWUx7+q+JQeBF8vWK+P
	Wdgz8vkjIaJCxLrbMnVNSC5QEcjF9CPznrQytjqO+77z5lRXw+3zTar8BcBL+nV0oa3JqN
	QxK20Tuix558dogywl6fJlAAfr099sNplQZMsVeDE8dj17uY/vSXvbe+TtGl0Nsz7Qsgqs
	PE8WgLi0UXWMVC5q2p6MuSu/2U6DuAQs2g8cftVQU5Oohwqg9jFZD1FSi1e9nAREZ0TuHl
	TjkLJMZcZTF+Sh/huni6gXY3usH9ZYfg+K9VsxZt4NzDZLY0eF7/WnYKcODcjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 13:43:38 +0200
Message-Id: <DI5M1Y2NCMPO.1YJOI1CRHENOC@bootlin.com>
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Hoegeun Kwon" <hoegeun.kwon@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 2/3] drm/exynos: remove bridge when component_add
 fails
Cc: <stable@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260423200622.325076-1-osama.abdelkader@gmail.com>
 <20260423200622.325076-2-osama.abdelkader@gmail.com>
In-Reply-To: <20260423200622.325076-2-osama.abdelkader@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_044348_977364_A8E0898D 
X-CRM114-Status: UNSURE (   5.93  )
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

On Thu Apr 23, 2026 at 10:06 PM CEST, Osama Abdelkader wrote:
> Use devm_drm_bridge_add() so the bridge is released if probe fails after
> registration, and drop the manual drm_bridge_remove() in remove().
>
> Check the return value of devm_drm_bridge_add().
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> Fixes: 576d72fbfb45 ("drm/exynos: mic: add a bridge at probe")
> Cc: stable@vger.kernel.org

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

