Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8538C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxfWuHGoS4AD08RES316n80ZMluVFGGsrpPDIgi9EWI=; b=glW6VLrGQqj+Xd22V+WWE9neKQ
	pZaMdGYG5T2bWT0+SgWsIqEd7F5gkhLw4fMVIE49cFczIBt+MSlZ9ZfmP7CYBsr+M0slXXg5jSDwT
	6IoZvVgSTFjH2X2w3Vs4wQFOhThc11KfMm/JI64XLKkmYQfAqSktj6aLn+YXanGOC4kihC2fTbAN/
	vLh5z/+ddSgD4qdrj6fIblScAwlG9QBc2B0CMT66NbMaZrQmhH2iJ69tks3rl2Suq7iTcUOQGVVvj
	SWJWVsvwNBwxrVjK9nE211T0bm/iZgTrBgjtINL3LC4AyVa0Ls3EKoND7vwp4hrjf86MXtOxZt8/8
	KYsCXUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJgS-0000000EwCA-0r49;
	Sat, 26 Sep 2026 04:06:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJgQ-0000000EwBx-1jLu;
	Sat, 26 Sep 2026 04:06:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BEDD434F9;
	Sat, 26 Sep 2026 04:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745B61F000FF;
	Sat, 26 Sep 2026 04:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395602;
	bh=nxfWuHGoS4AD08RES316n80ZMluVFGGsrpPDIgi9EWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XJu+a058PFy9AuXoNx2lJIIXcpKT3fHF6QBAJj/v0wp5P+Nz0JRMJbldY9RWwFrIK
	 oKVn3VZuRorua0NW1T5FZqDwSDJuuq0MMlCjkqEgspsvOl0thUe8+adh+IAHHR0tWJ
	 Kghwxgyjyy7S/93Vu8sKh2FK8UPE2Hdk4LKg14j2SW7x1FbK/r6dk6RNJixi5JtHbN
	 PsZuu47kxAJ6vXgRz/76JZ3rVQH4/ZLpsynTmse6449dxcksS+1a4f1rSGcyCKnOjW
	 FFDfbdKFBEXdtqwa0ynHpSYxaiFzH/vy0T3wKx8PHJVTNOS0HaqY4tz7HT25ux3NjX
	 0KbaAplpZfkpQ==
Date: Sat, 26 Sep 2026 06:06:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 13/16] phy: rockchip: usbdp: Rename DP lane functions
Message-ID: <btcylnhxrbd5ks7wt437ddisiiktlqmr3zuwt43otydzd2vse2@7ydv5pircguh>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-13-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-13-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:50:00PM +0200, Sebastian Reichel wrote:
> The common prefix for DisplayPort related functions is rk_udphy_dp_
> (with a final _), so update the two DP lane functions to follow that
> scheme.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

