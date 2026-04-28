Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F29FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l002AgQCeDZ3kFs0LsbzlezWAODmhj1nOy0lrGZD00=; b=dcGS+PLrjQ5hIbme31UJpOlf27
	lu/a5esyXD7ja7tq7kXyToKHkAYuDkAXzlR1eMjpwcR4TO3SBmLfN/0QSjlAtCM+p2OSBPbRSxDsh
	DwXVx+3BulAfH7HZARMHLnX+aKFeWDsc5tPHac+WzWfnG9AUBofX5n1QFvAekjh+TJz8pgeQDg5oQ
	+PRxaObTHYgqT6WWFVQ1hSwHur7hzfNdcaBVxn0N0Dpxpog2kwxd/GiYzN7jBjq6/sy6nJOez8L4K
	t1OmwDWtp9WoseelSJe8QgQT06WHJMAEMoosMG7o+ULnFJoq7IjJo6kPi6yhLS+Be2JDbdbdSTZpj
	a2kdVafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHetX-000000016e7-08t3;
	Tue, 28 Apr 2026 09:38:19 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHetV-000000016dd-0UUE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:38:18 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g4b2p4kzDz9tqB;
	Tue, 28 Apr 2026 11:38:10 +0200 (CEST)
Date: Tue, 28 Apr 2026 11:38:00 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH 2/5] drm/panel-edp: Add support for Samsung
 LTL101DL02-002 panel
Message-ID: <afB-JGklY4IPyZER@archstation>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-2-196f80c5673a@timmermann.space>
 <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VNvPtG_f1W942SKJfM4ptK8Wvd-nZs4geBCG3bO_A0BA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_023817_318502_55E3AB87 
X-CRM114-Status: GOOD (  22.27  )
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

On Thu, Apr 23, 2026 at 02:49:53PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 23, 2026 at 2:15 PM Lukas Timmermann <linux@timmermann.space> wrote:
> >
> > From: Alexandre Marquet <tb@a-marquet.fr>
> >
> > Add a panel entry for the Samsung LTL101DL02-002 panel, as found in
> > Samsung Manta (Google Nexus 10).
> >
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> 
> Adding new panels like this is discouraged these days. Is there a
> reason you can't use the generic "edp-panel" compatible? I know that
> the exynos5 driver is pretty old, but a quick glance shows that it's
> based on the same analogix-dp core that "rockchip,analogix-dp" is, and
> that seems to have support for aux-bus...
> 
> -Doug
> 
Alexandre had no luck using the aux-bus in the past. I've read the
documentation on the panel-edp driver more closely now and apologize for
the clearly violated directive of not adding panels like this, we are
investigating how to get the aux-bus working eventually.
Thanks for the clarification.

Best regards
Lukas

