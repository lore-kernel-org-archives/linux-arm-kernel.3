Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3747CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTdaNJIrefz2l4TKTINHZnBE2yA7/TvGYhBFkQnzSKA=; b=t3kvAKIXKC7iPnLVlsYK+CaIwF
	KNuO/HwjfiFdr1IAuh9bWcMZgNJ0ltG/PzHnV784vbDYSgCT0yy2oSR9BQlV+tmseOaSx2xmzC5Ed
	NMmoZ8TJDuOQ48O/dtCk7BqGPrAURZnjbyB4AkGGS6F/VFP8JePHf+SuHsIXH9Z4IA1I5ihBudOdG
	yPQwI2vX/wd4kF7VTyHsjDiP/iA3E6xafaGZegbOmyPzJsme4QMrJ8emVbawgPpfS56T2yddvQ9zN
	IYhAkuzrlZvDQzIIoTdjH0E3p8A0bVzC73P6/8fJd1dGGT8oCawXDYHU3ZXKVMDgJpWe1ESA7xcEu
	OnD39/lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYlB-000000061Zq-38IW;
	Thu, 14 May 2026 16:18:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYl8-000000061YC-3foP;
	Thu, 14 May 2026 16:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44870444E3;
	Thu, 14 May 2026 16:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EC7C2BCB3;
	Thu, 14 May 2026 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778775482;
	bh=hyF5D8Pc/kYQIaWvIB9S8/rv8IKNlIdZ14J3dKVxG7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MY5L+XXfqtr6WnaCfpqdESQw0LlnFZidXkjWb7IM5EBPu/biNN2ouhUUqHoXdPyU3
	 bLxduLXK8kEDtK39M04WPNZZBMu7kfUlfh1TaaDvyDXKKJ8S9PPtNNtL50LPCXeS8G
	 JU/gACrG59F/ZbGrJ4AykiuDWL9NJdmIkd1uQGg9TlSiCOn6Q6sxJM9eZ9cOHY8Of1
	 h3VzdWsvKljBY3A8swYkAO8nipCiR5GsOkx8odm0DvlsGYY/pmMpVizkKCUpcZlVyH
	 Ki+/faUSa9P8O+dVaOOxG+ViiGmtzF05o8AmZMiDHNhajwqe3jhEspqACex6e/1anr
	 ElP+VOG9XGxJg==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jonas@kwiboo.se
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
Subject: Re: [PATCH v2 0/5] rockchip: Add USB 2.0 support for RK3528
Message-Id: <177877547874.1092446.2280455106153826984.b4-ty@kernel.org>
Date: Thu, 14 May 2026 21:47:58 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_091802_951306_D2EA3316 
X-CRM114-Status: GOOD (  10.46  )
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


On Tue, 05 May 2026 19:04:05 +0200, Heiko Stuebner wrote:
> This series adds support for USB 2.0 on Rockchip RK3528 to the
> Innosilicon usbphy driver.
> 
> The usb3 support has already been merge for the naneng combophy
> last year.
> 
> Changes in v2:
> - rebase on top of v7.1-rc1
> - split off dwc3 compatible and dts changes
> - add error handling to regmap_write (Vinod)
> - v1 is here
>   https://lore.kernel.org/linux-rockchip/20250723122323.2344916-1-jonas@kwiboo.se/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: rockchip,inno-usb2phy: Require GRF for RK3568/RV1108
      commit: a896852613136e6babe6036567ab0989fb322a57
[2/5] phy: rockchip: inno-usb2: Simplify rockchip,usbgrf handling
      commit: be29cd958f5393004a24cd7b5b1da88dd90a651b
[3/5] dt-bindings: phy: rockchip,inno-usb2phy: Add compatible for RK3528
      commit: c430f042f4ba2c5abd592b6924f028d3bb09d4cf
[4/5] phy: rockchip: inno-usb2: Add clkout_ctl_phy support
      commit: 2775541de0580ab1cd077dfef710e6316563d567
[5/5] phy: rockchip: inno-usb2: Add support for RK3528
      commit: 864b3617df827865a95a06f06f09a8d57a795b91

Best regards,
-- 
~Vinod



