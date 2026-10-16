Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47815CCA491
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oQ+MUsY862yw3W6ThUw80i4Mg92NlZLEJzdN0dO65I=; b=Dn2ckkxuRTIl21xFDp5/J1UeyB
	6AfUHNjfbB7lkJfv1/kTPgrcWQrI7aaDtSCHY7Q27ZgnFeBap33Y8GqfEwGWQnn/8sdyZlleOCiHu
	w1X2xbKOjx7uZ/QL9cZk+wKz4fkqn8EylNpkyED3DiTjnt+3b4xOs5ItiObe2/Epjmfaup4EW5gUP
	49SiJ5aKfZMQFKTPnwWlqnS0efqr9LcNED7oUBVkZTJNy2RefYhvyu9Wy56axUYC4z3hXoH6ZBnkG
	MtIEhswvYlu7QZFZ069dVZNPAXLy0opxxWHOsk3/JQoiFcNfmgTMson273TLekn7mDzos/gGdtClV
	hF5CxoHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHel4-00000002Yf1-2fzY;
	Fri, 16 Oct 2026 10:01:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHel0-00000002YbW-2HPs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:01:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EABE94E4122C;
	Fri, 16 Oct 2026 10:01:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A49E26075D;
	Fri, 16 Oct 2026 10:01:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48592103282F6;
	Fri, 16 Oct 2026 12:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792144900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0oQ+MUsY862yw3W6ThUw80i4Mg92NlZLEJzdN0dO65I=;
	b=vyD+tY6xP8Z9RwR2xkuRI3THWcN7/fM4teqUX1np32hkVH7TkufocT2ZYa6FtlaQBDdDH7
	te3j/Gizl0ssUbuKOsSfk8OtdVDkiDyuOpWMz8/fyhCT2TxbzR10qiGtKEv7tYEmSvQS7v
	783OU8Re4ArvppviTidEbsVnPzjqr2s4ZwnE6TqsClHC5nLI/CxQ2JwQncMYHecL5G6HjA
	P8aUPsBy7QVIAWbhY+Nw4n8xWwSeQDEPGNDbuZeTAw25i2mrSiYwQZvquaODtICLqfSJ6q
	lvS+LGmzfw/gafx3TI8ZfNV8jq+1B+BM3qtfPzXtW8hhG/OHFfaaXglJAKIQgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 12:01:25 +0200
Message-Id: <DM66CANKPVNS.SGWB73YDX55M@bootlin.com>
Cc: <kernel@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Johan Jonker" <jbx6244@yandex.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Huseyin BIYIK" <boogiepop@gmx.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 0/2] drm: devm_drm_bridge_alloc() conversion and cleanup
X-Mailer: aerc 0.22.0
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
 <179213353665.3058528.14437637653539699061.b4-ty@b4>
 <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
In-Reply-To: <d1f0369c-ff43-4b76-9092-5c638b132f15@yandex.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_030146_713257_03C8D04F 
X-CRM114-Status: UNSURE (   7.87  )
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

Hello Johan,

On Fri Oct 16, 2026 at 10:11 AM CEST, Johan Jonker wrote:
> Hi,
>
> If any decency or Code of Conduct left in the DRM group then also credit =
the original author.

I'm sorry your prior patch was not applied. I was not in Cc I just hadn't
seen it, and no one else had reviewed or applied it so far.

This is a communication issue, sometimes patches just fall into the cracks
(it happened to mine several times). This can easily happen with a complex
development workflow and high amount of patches as DRM has. The workflow
can be possibly improved, as well as my personal workflow perhaps.

But I don't see any lack of decency here. Definitely a polite and
respectful answer would be appreciated and would help the communication.

> Also remove driver_private.

Removing driver_private where it is unused would be good. Would you mind
sending a patch doing that? I'll try to spot it, but if I'm in Cc it will
be much easier.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

