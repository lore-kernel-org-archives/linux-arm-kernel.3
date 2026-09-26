Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123CC98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+/HZW4AA3+lIDQSaEdclnyFxECpeXstgqxYAcfIyeM=; b=ijgaFOIZeN/6v019JxnZLWJ9Kt
	EFWJblLld8pzKfoTzOF109X5nWEXWbmK1qKH8WH8X4tRzLiOptJlibdMpGTlx5/eVsWP0PDdZsYvR
	6fA92KiJRoLYaIzDLx6wJC1nSHQmOsDh8lO6AhjCwjqcsUOyMvuuIXapoKG2sdvMyOHXTtd77QMoZ
	ajjuN0VNql7pi6MmDPuXqgECS7BpCFS9zW+UoUfxxyIvdNlv+pq3cY4a+V7utHitlyMNp+xY/ZEA9
	ngWP4tn8ObUFqWpjT6g6oMur7Yp8VRY/JkfzPxuZLRheaXvrSKRj0DVS64AdSIPOMwTVqzapKoGF1
	EJCRLzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJZd-0000000EvOw-2q1R;
	Sat, 26 Sep 2026 03:59:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJZc-0000000EvOi-0QdH;
	Sat, 26 Sep 2026 03:59:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BE6441662;
	Sat, 26 Sep 2026 03:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A97E1F000FF;
	Sat, 26 Sep 2026 03:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395179;
	bh=E+/HZW4AA3+lIDQSaEdclnyFxECpeXstgqxYAcfIyeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gj5JZL8dQ+wEO/rWjeBuJyOqI7jk0tWLdmCCiz8dr+2t1BWTG8xUT1XNzPL5K7Ev9
	 a5YYxWvHXOMisgFhoKouDLvv2Z/Jf8Da52yFy6pe2pek9UMcawRCrFuwzVyEeBGOhr
	 /6cvdWQ2v8LnmnAh/sGDINtHT9ympljNPzALwyRAfmIMsikLPVtaj27Ur111KgZpB4
	 UnsyZ4PJ2dCa1k2LUzsdUdYbIRpN/hXSq5ft3c8/x8ymnDWSlZH6ZLSBesn/f2WSsU
	 Vajc1xRUdNTiu57bSeyv1T+mJElaEE/9mcgzFwzh/dDSx6c/iQQNhEkXsQ+r3ihuSJ
	 1PUE3xssxw8cA==
Date: Sat, 26 Sep 2026 05:59:24 +0200
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
Subject: Re: [PATCH v15 08/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
Message-ID: <xueefi6x3e552eaj4fsrcq4q5apyfx5wxmbpn747qck655qrtd@qsftv6cr3kpz>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-8-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-8-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:55PM +0200, Sebastian Reichel wrote:
> From: Frank Wang <frank.wang@rock-chips.com>
> 
> Move SSC modulation deviation into private config of clock
> 
>  - 24M: 0x00d4[5:0] = 0x30
>  - 26M: 0x00d4[5:0] = 0x33
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> [Taken over from rockchip's kernel tree; register 0x00d4 is not
> described in the TRM]
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

