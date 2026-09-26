Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0E5C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 05:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmbsubwsJv6grfemhX1Zv6FjAqGw9tQVhCke8CNIAq0=; b=L+eynXkbmHDV2Ll6DzJ8Vpj2Uy
	+AqJ/hh+xfv5ujmN1DIUTbCIQv3EsVVdsPzrDjMuyPAAawm72QtjgvKB9ZUhSE0eX8Nu/cg/yOxfh
	hvyreVgSwh0XrqgqBH4ynxLDMvY9CUNQN0yO1xPCcxWy8Cdp56d49gwkHDJUSMJGxPwD1UsFVTMjP
	nDbvHsV3Q2WJ2JEy4y0XtMnhH1RAkTjAAUqG1tTLqKlBx2w1ISioJtcxGQznIayc9HHzPID3+7Ik2
	0S2XEwaKLb/E+URb6kNQEA3nGAZ37xZdVEeT8lTWqhJShnecce/d6v2M7NubrdpNUQqwCRrUbzcmv
	R6ydxzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKmf-0000000F0gP-3bW1;
	Sat, 26 Sep 2026 05:17:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAKme-0000000F0g8-0A8K;
	Sat, 26 Sep 2026 05:17:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9804E60136;
	Sat, 26 Sep 2026 05:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 753381F000FF;
	Sat, 26 Sep 2026 05:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399830;
	bh=dmbsubwsJv6grfemhX1Zv6FjAqGw9tQVhCke8CNIAq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YoAA97ZjK1QOxsWw63FzE5sARM6ZMj8DWFBc+7bzzT1Djt2Rez+xGc+w/GMo9xSf5
	 HcEDCUZlv9IPocsHFMOFaYjt81l9F1tincOwDWr5gS5uzoXS9DMaSrx5hHslvabVLw
	 GNS3UULju4WMGNWPRGwc7FuR1iA1XFHekg5EA2U0kA1ZLcInzYEfhAnDcAvobBplZl
	 bqqwHKz6k3PaUo+jhIoxjBb5XDXS54nY15BZUEZeXjOiaqGKzOcNxTsYnSyQJpajM1
	 q9GD6fg3Vsrf01cjqUIfD3AGMb9jyiJu/ZWh4pTgQgwyMuJHf1zpmZu22ZMdE2p3Ff
	 NFTMyL+kP5QLw==
Date: Sat, 26 Sep 2026 07:16:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 08/11] phy: rockchip: usbdp: Add some extra debug
 messages
Message-ID: <wqvcii3xylpu6e4kfvvundtj2v6x5nhe7hhxdlw6j7njtv7gm3@pdhlgezhpcem>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-8-8d507cb1174f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-8-8d507cb1174f@collabora.com>
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

On Tue, Sep 15, 2026 at 05:06:11PM +0200, Sebastian Reichel wrote:
> It's useful to log PHY reinit to ease debugging issues around
> USB-C hotplugging.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

