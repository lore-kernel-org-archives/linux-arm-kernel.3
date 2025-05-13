Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C648CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VClIxoKnQSPlpEtPntyY38ibx0Yg+JD3nBRlgh7tJyk=; b=A4Ez0Yh1WbW95BO3QypGtX+9ch
	IOnkFnvgQnnmb345axCT+sMc+CHyuUQAhhqsTdZVL+B9COYejyY7bKKmAdCMoRIdTwvDzZgvaVwuH
	v4036a7U7PUllxYDgmxLiIZWGVYVXQfQTmBbzgxIV5PLDW7os5k+edzxDk2GbT/lOVHay0Xj0igMD
	ilVJNmZC/MXv2+8SYPmVkashOfkjJDoCwvw7YOyaMy6vSPSuuK9PuGe4vpQ7ihwV65abv/nbKYJ4i
	yp/8ESjr+owxL598nRI8tp8GuBiinvDZS0wWH3Au73SLmsS+650JuyydatSifG6RYqn2X6IZBY1d0
	BjVP43PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvNp-0000000DNkG-1rb5;
	Tue, 13 May 2025 19:33:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEudx-0000000DHjg-0QQv;
	Tue, 13 May 2025 18:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VClIxoKnQSPlpEtPntyY38ibx0Yg+JD3nBRlgh7tJyk=; b=Su1uE+eMIRzUcEzkFiCqxIcUNe
	Tq1rklhRUQZhydAUMLMuPOzZaAAOWdqC74fkyiU7KbpatoYbG48tWqYrMAJa2JK4IAtYxa6GnLZCH
	jWRq07kWgj210M+oi+daswoBMrG/EYg1YeQZDywDo1338H7g7n3cDj8JDk99cHraRPV9+UnVAmoEN
	/jqZ3/7XoLae5SyGbJtyhEjA4fnnSuJaIZ8P9PP+c0s5o4quaI9BFu04BxD5FdAh98N6FLjA3F7o9
	O2Xgi2/mopp+KW74QAAoiuFoBIKTzkh/LYN1iTvpRTqVjtqkR1goQiwthTJelMXcHvWBEfvtus+vN
	ZN9VDemQ==;
Received: from [61.8.147.169] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEudq-0003up-Jp; Tue, 13 May 2025 20:46:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Hao Zhang <hao.zhang@coolkit.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tim@feathertop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm: dts: rockchip: Adapt to IO domain and SDIO for Sonoff iHost
Date: Tue, 13 May 2025 20:46:03 +0200
Message-ID: <174716195450.2345121.11352398890391626406.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509101419.460473-1-hao.zhang@coolkit.cn>
References: <20250509101419.460473-1-hao.zhang@coolkit.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_114621_141124_0D605742 
X-CRM114-Status: GOOD (  11.18  )
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


On Fri, 09 May 2025 18:14:17 +0800, Hao Zhang wrote:
> Changes since v1:
> - Use full name 'Hao Zhang' instead of login in From and Signed-off-by
> 
> This patch series makes two corrections for the RV1126-based
> Sonoff iHost board:
> 
> - Patch 1 adjusts the SDIO max-frequency to improve WiFi stability.
> - Patch 2 updates the IO domain voltages to match the board schematics.
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: rockchip: Sonoff-iHost: adjust SDIO for stability
      commit: f9c7ba983f7b44fe698d580dec67552123520472
[2/2] ARM: dts: rockchip: Sonoff-iHost: correct IO domain voltages
      commit: c2089976772364a3b910676693bf52497ab35475

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

