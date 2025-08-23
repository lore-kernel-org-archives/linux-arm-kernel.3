Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C4ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4szslA7ZyoDYxRL5lU3Ry83YPf61pXDu12N9fYlNnU=; b=PwmKv2VSfGqxkod6C1YEGESMOT
	6IQcAInroralfKqjOBr/f0vxSwTX3eOT9NakfKdn/21IKTBL5LxZog+qtOIPF76c0zDj9zpyKWdDq
	BPso1GDfz1UJFXIXBYw7e4a8i1aWpZYRhPuMbHo9TqrXuCB2FeBJbwbUgWVsj1YNyWu6OwcUPfi2p
	ok0rujqTI6kMNwrY7Z6utmGBk8qCfuB9KFurryNViNmFMXjErsKCZABZMir7xG9lWxWgOMPQwSQPy
	5T4OGj7tSLwEOqRFmpSKVuq7Ekvcve6aSrBW1ZlhMeji8TilCuUtSH+mRGNR/DbvXVwzFBU7HGHrP
	QNU+ppQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppUP-00000004sJQ-2gAC;
	Sat, 23 Aug 2025 14:45:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppMN-00000004rNa-3gkq;
	Sat, 23 Aug 2025 14:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=b4szslA7ZyoDYxRL5lU3Ry83YPf61pXDu12N9fYlNnU=; b=yjODS2TTZXqlklgLHaiMWcDNiQ
	3h58mSclKn2EB8t/kPEwPboVfbiLiaNI1DsvIUWrQeJF8TIO935nUGCdEnaQXc80l6y43X1q7klkO
	Hl1DVJ7H/bH6d7s0Mp9YI921h58yRV08oisb7YhIZER4JwC/dbjT8q+73mIGtUJUZkVmVHWjJoCiR
	/rRszLMs/LBnxb6Loqq9EqqL7/QtBXWnEgVt9Y6n6zD/Pxg/FC8pcV5L2C4Jk19z92D/4l7Q79fvG
	Sx9rVGFZ9g28SI9pnX77Fnx7edcRqwxO3W+jKsbziQ24WfQgHVQF2DKYoA3QwwX7p9N5/MOROvwnJ
	V7MRdiCw==;
Received: from i53875b90.versanet.de ([83.135.91.144] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uppMF-0000aK-Bv; Sat, 23 Aug 2025 16:36:39 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
 stephen@radxa.com, cristian.ciocaltea@collabora.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 yubing.zhang@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 03/10] drm/rockchip: Add RK3588 DPTX output support
Date: Sat, 23 Aug 2025 16:36:38 +0200
Message-ID: <3723317.0YcMNavOfZ@diego>
In-Reply-To: <20250822063959.692098-4-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
 <20250822063959.692098-4-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_073647_909839_CC467056 
X-CRM114-Status: UNSURE (   7.00  )
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

Am Freitag, 22. August 2025, 08:39:47 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> Add driver extension for Synopsys DesignWare DPTX IP used
> on Rockchip RK3588 SoC.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Acked-by: Dmitry Baryshkov <lumag@kernel.org>
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



