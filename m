Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A29C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjcDYrHrfsWdwpPP6OffxdP9Ov3fR2yq6A3OOg3IpEs=; b=oUydL0BfzM4MyPsV4TN2NVye6K
	bIrdpswvp9hMM79pXhwfEEAWCT/wVWc8YJixVw81bpOQ5bcJrxM/KAvlxiSjBZMdvOQ7AcKDmg0Py
	tKq+BVzrRi2KQ5CRqHk90MlEli2+mEcCI3RxayOm1tyylnHVM/IfftAtfCQXZG3iwTU0LLRflobyN
	Q802qJluAOa5+GKcyb5Z6yHLP31ympql3KFrasqbPBLb3meqy7p8UU1VtgRcMP8WnunE3/g4yKWzM
	1qSi2NhMn1u3p+2rKZUzSn3w5dLVfx2rRP5uJRAwZA4EQ0eETxhWyAVf6PRM4J+QytUmr+GOKndOq
	ixuSxjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBE6S-00000003yxF-2MxP;
	Sat, 03 May 2025 14:44:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBE4X-00000003ytu-1UJb;
	Sat, 03 May 2025 14:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=EjcDYrHrfsWdwpPP6OffxdP9Ov3fR2yq6A3OOg3IpEs=; b=OI1C6deSV2rWXR8k0KU0g8khKJ
	2sJvPWd5Ln1aVYQ0KnzPXCsLnES7wzDbFTx/hdw0xEOoQo+c4iFZuc2dk0gmLaG/XeH4NRam2M5C9
	ggk629MgT719kvU5Hn2c3ZENEVmx2NwqZBAZtU3UsCYEN7vVhLq+oKdqwRMfKvrhexLe51Jv1nqGO
	dJZQQjUXKQsakZtsUZ0rT69kpHy/thv6c/+qM5GDXyymd2eBKFrQwhPc5/9XIr4T4Y+D1ZYHEDeNp
	rLRd0jjvYFk6tpWTqBASNLP81rNFuYROAB4Dg0x2qBAQLS+qURON1sgvCJFLSRyCvQKnbfA6HQwLU
	zPt78tEA==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBE45-0003pc-JE; Sat, 03 May 2025 16:42:05 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v4 0/7] Convert inno hdmi to drm bridge
Date: Sat, 03 May 2025 16:42:04 +0200
Message-ID: <9503607.rMLUfLXkoz@diego>
In-Reply-To: <20250422070455.432666-1-andyshrk@163.com>
References: <20250422070455.432666-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_074233_414030_E2E49E52 
X-CRM114-Status: GOOD (  17.58  )
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

After resurrecting my rk3036-kylin which hasn't sucessfully booted in a
while, I could veryify this series, so on a rk3036-kylin

Tested-by: Heiko Stuebner <heiko@sntech.de>


I'll probably apply patches 1-4 to drm-misc later today, as that solely
touches the Rockchip (and only rk3036-)side and patches 5+6 to the
rockchip tree.

Patch 7 should probably get some attention by people more familiar with
drm-bridges, so I'll let that sit for a bit longer.


Thanks a lot for working on all this
Heiko



