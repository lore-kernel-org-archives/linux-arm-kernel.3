Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4EECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWsLWEMDwrfL0znv9a1FFmG5Ojsurr2FWtMoeDb6oDs=; b=O+BXfUqtJBgKMNYFSTkwN4CmSA
	kjVaYVT1+BIpV6E/bsWsVGB/2iTN0gZLAaov5XcvgkgiV4EzSj6mczGi9+kcaAptHqv6JqbrVXiw0
	uTfyuXliDfrz4uFJiJvLJZ+s+6qrFZb13Acxkc+8GqE68ckytaNo+QCee4FyNCsAEJHIUL6K1ounJ
	x76JlBzM2Yp85XKCTyb/nTkGmQMEUb/0x5fCPgK8tyssTDYozZvnhvFujXVaillyRLwBLcd+Puz3e
	nH51Ok27Lv0y0T0RMykP40twFvx6P0Ipg9Ir9lRREHZn8Fb/sHmKUHOPyn32KtMCoApZHVEzUVKeY
	plkyGs9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoM-0000000G9YE-2YEM;
	Mon, 05 Oct 2026 10:20:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfoL-0000000G9Xk-0iZu;
	Mon, 05 Oct 2026 10:20:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E54EF40631;
	Mon,  5 Oct 2026 10:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABB71F000FF;
	Mon,  5 Oct 2026 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195644;
	bh=GWsLWEMDwrfL0znv9a1FFmG5Ojsurr2FWtMoeDb6oDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kVL8xfQvfFGbxJe4asQyapC32bvl7t5tNtCf+kV4HgCD3ysm196T2XvxN078vUec3
	 J5zll9onL2I6q34ewBt5CxXO2/1tc3qhcDYDl+VYTpgbuMtCC0O3d9vSfmDZex9WWh
	 mz6KaNHGEZZM8R2H1H4E9cfePa3nbl0FaULsIYTTr1g8k4np5APdyjGMCKZDbjYO0Z
	 fMKLjFHFXOjpYMH8OfaxtyZ0CJR/zZc2mhk5F9ItlXbbiqAMB5pM5R4phuajVDwomD
	 d0UtqWoQpyxH28/E9OHzMO83qSiHB0r0dsLyVkaGFXI0L5qOFh2/RkeU0+jBvqLnP2
	 t6qsokrdJeOXw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
References: <20260901-hdptx-ffe-v2-0-3a5922c76fc5@collabora.com>
Subject: Re: [PATCH v2 0/3] phy: hdmi: Add FRL TxFFE level control
Message-Id: <179119564237.316652.11654112643268830882.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Tue, 01 Sep 2026 22:55:12 +0300, Cristian Ciocaltea wrote:
> During HDMI 2.1 Fixed Rate Link training, the source and sink may
> negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
> compensate for signal quality degradation on the physical channel.  The
> source starts at level 0 and may increment it up to a maximum agreed
> upon during LTS3 in response to persistent link failures reported by the
> sink.  TxFFE adjustment is optional and entirely independent of the FRL
> rate and lane count selection.
> 
> [...]

Applied, thanks!

[1/3] phy: hdmi: Add optional FRL TxFFE config options
      commit: af00a892e6515e3f08f2079578695389b01ba3a2
[2/3] phy: rockchip: samsung-hdptx: Handle PHY config after module reload
      commit: a673b3d18e37e573d52bf41c47e75d46982f2fae
[3/3] phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control
      commit: 192244b9cb5d15288f318f20ad202f2274359474

Best regards,
-- 
~Vinod



