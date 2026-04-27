Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82575FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGfX4JifioHdwGlnrd0jnkQHo1q8IbJYI1jfVgI5My0=; b=3Ss4+uW5CTZMK8XM9jAlsK0Jix
	XipCOLpWhDu3eCgGC27cWylEQaoA63RWfzukf8ZRJiXoo4a0WX07onru0ngGd1SyLv2VCiLTNm60K
	wkqrZgOnJJCMCypGIJOcnsmVcCQZ7wBo1SLVNB+hFXUhq6GIol2TfChT5C6ZTQcfDu1sVzWUY4pDN
	fNJHhjK9nlrePhU7a8S5O2s3jOFeLkQXso1zUTGC5qePwAeyMzL2I7WQcWRrWci36F7N/PEMrAisI
	3/hhgsV6Y1ngqwbavTttiHjLpEcyy4i9K5XSjjyGoZyFTJyX9L7wAhahB7VkCAQ2O0bl3mHaEcqhE
	Lmcke6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJN1-0000000GhzE-0shg;
	Mon, 27 Apr 2026 10:39:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJMy-0000000Ghya-1ESJ;
	Mon, 27 Apr 2026 10:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NGfX4JifioHdwGlnrd0jnkQHo1q8IbJYI1jfVgI5My0=; b=IjSCaNP8MIsnEMZ2lckrN87FuR
	TZhtTUS1pl4pGpMkAsFkSDoo9T9slTc5PQ2ZbHBI2WnXmYRP6x8HLCJulUi+e/qYLOML3Eu0mkjwt
	fRpxGEUyJbL9Av+Eh5X98td0MUzoKUX4o462NXZibNiyvxQ3eXUnW+nqC5tm9iKefwDNF+JyVRqpp
	wc0pvpeUkYV6QFJ/dD+pAM8Sb9HykqyafN6/l3pafBLh82zHbZwdz/dIIepyiJtzTblX/UtyUfXRs
	s7udLaTjndqtriqiXiJQH76EsiKEuXA+MdyvMdUc0jbzxQqvrvOG4dA6gXK3wRzmBa+Q9sWsBWI8U
	UbsrOGyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 07/10] drm/rockchip: dw_hdmi_qp: Add missing newlines in
 dev_err_probe() messages
Date: Mon, 27 Apr 2026 12:39:00 +0200
Message-ID: <4050839.irdbgypaU6@phil>
In-Reply-To: <20260426-dw-hdmi-qp-scramb-v5-7-d778e70c317b@collabora.com>
References: <20260426-dw-hdmi-qp-scramb-v5-0-d778e70c317b@collabora.com>
 <20260426-dw-hdmi-qp-scramb-v5-7-d778e70c317b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_033916_331115_988C1695 
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

Am Sonntag, 26. April 2026, 02:20:19 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> Add the missing trailing newlines to a couple of dev_err_probe() calls
> in dw_hdmi_qp_rockchip_bind().
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



