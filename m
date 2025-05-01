Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB28C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qY7jMh2s1Q1/dxv6yXIZWQpJJC7k3Ol85coLC/4oDNs=; b=bo1zeSZkDHoiE4NuqZeokaL6Wz
	VEA1hfFBiVI9ktDiqN9M8EMOZUyViWG8A5A2ucVBU7VZQzJyqoLu7Prv4lhyF7XrdKN4xfJD3BzKk
	I6e2NaEzxpkcBiEFxeEuKwQabKcDn8VvBRU0PP6AWg5U7tl9XRtk308/wXqnwxUK8nCPoQ6Pu1kph
	yW0ZHCjJGCBZTEQAsOb1941b+7XCiGWGXrzsQlIvcS4wh7mx621ftB3Z5n5mQZrJm5XB1zkpex3yn
	iJxKxUlrl/YIZpsc6d2IZFGfn8mh4l2Yax2aHr+5gYoF98O5skyHvB1KI9f8ZucRtWJB2WF7FTxyu
	aYtVpZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATIS-0000000Fj0I-2jM2;
	Thu, 01 May 2025 12:45:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAT2O-0000000FeYo-2jUd;
	Thu, 01 May 2025 12:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=qY7jMh2s1Q1/dxv6yXIZWQpJJC7k3Ol85coLC/4oDNs=; b=DP6jfear58qpqLih8qEWeAKnQQ
	Am4/8PcoygDS5o6wPyNNnUy0zvYj8bbVtlYNpg61LXGX1j5zZiBO6wRVUpDJo4xruDni7GlGyBNwh
	LHIErPoNjgMhjuckkR12zUAxifgvdKGpG+iSS5oJ1V6jDs8j0BlWxt4a95QJESN7zVWCHoQXS4AH5
	2FQ30Io/ZM48p3VvhJI13Y4JuD8QHc8/a6c/S82IuzkqnasGqhW6pJAcgCQSLPQIMNs1zsu7gzF+2
	4vsbA3V8ZZUmEvUz6AKIjH/yiTq1mC0Vav2HgilyjKGiCzv2GUYC76ElZZOiR9XB89XTHXIdF4fRW
	WuOP+l+g==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uAT2A-000129-Qn; Thu, 01 May 2025 14:28:58 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, Alex Bee <knaerzche@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Thu, 01 May 2025 14:28:57 +0200
Message-ID: <3554727.QJadu78ljV@diego>
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_052912_706299_946A5C5A 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Alex,

Am Dienstag, 22. April 2025, 09:04:39 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> When preparing to convert the current inno hdmi driver into a
> bridge driver, I found that there are several issues currently
> existing with it:
>=20
> 1. When the system starts up, the first time it reads the EDID, it
>    will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
>    reference clock to be enabled first before normal DDC communication
>    can be carried out.
>=20
> 2. The signal is unstable. When running the glmark2 test on the screen,
>    there is a small probability of seeing some screen flickering.
>    This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
>    by GRF. This part is missing in the current driver.
>=20
> PATCH 1~6 are try to Fix Document in the dt-binding, then add the
> missing part in driver and dts.
> PATCH 7 converts the curren driver to drm bridge mode.

this looks all pretty okay to me, but could you check that your rk3128
keeps working and maybe provide a Tested-by?

Thanks a lot
Heiko



