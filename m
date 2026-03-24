Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D33F54ADA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWUHvi50PILEaFiGX4TV4ej6NOVm50IR1cRnvT6w2vc=; b=kR/J9I2zRyeBwzX9JDzDKG72uT
	ivCRyskag0IuXtz5PmfiG3QYVa13LSbpus5Ph0DZFDrP6ejEitXTfwvUoCbKZep+7hhczVKRoilL7
	Oh37u3VoPEjgvpjDJVDDY9JR9DsavY5bZfUz1e+3FqaQydSqHLiVd7+3GXqCUi1Xpja+/WhiZVVdr
	qFsuyn52ebGkMy9bhAqbMQEJCzFxPo+m8H1zlnQLaVP1RnP2/a3cKBuhMgZiH9d+C3n7YuoWloK2a
	m7MqE+30WHqI9wgx1unkA3nKzOFe7ZrzGHczHcKAqWMvYuIvR+379NPabhKIgaizVZZW/dVSJ3CPJ
	R+9FprtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54sr-00000001vCK-47jm;
	Tue, 24 Mar 2026 16:45:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w54sq-00000001vAu-1m8z;
	Tue, 24 Mar 2026 16:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=MWUHvi50PILEaFiGX4TV4ej6NOVm50IR1cRnvT6w2vc=; b=LgiHxD/ZQb/Bxaz0kS2H1DCN50
	V63I5RKtZW+tgxjK6TDQ1fNN5UoscMwujjRuyJgPKohCvbKdZUWfZodpRatpeZMKRXnuupFNfF/H8
	hzge3Plzcpo7yAyjIUYetars9zkfEWnaWpeZsB07zj8qvyTG6rb+Bu7/KL781kzEMDoj41G94Bccg
	racXiHAOh6Y5rYBGAzEZ52UzofoiaEdarbHjJ99rIkWdwLYJNYx7Qu/jlCGI8kvbQQVGe5VLev838
	fm6Vkd2f11pbMaWJIJHCe6MtM7kL3dODpfgS8gcTX2RIo1JW+JzO4lBryk0sfaZU4+7nzypz329eQ
	VPAY1SpA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky
Date: Tue, 24 Mar 2026 17:45:29 +0100
Message-ID: <177437057316.780275.3596701070961076478.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323125721.692139-1-festevam@gmail.com>
References: <20260323125721.692139-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_094536_539427_AF0D9DD8 
X-CRM114-Status: GOOD (  10.02  )
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


On Mon, 23 Mar 2026 09:57:21 -0300, Fabio Estevam wrote:
> According to gpio-keys.yaml, linux,code is a required property.
> 
> Pass it to fix the following dt-schema warning:
> 
> lid-switch (gpio-keys): key-power: 'linux,code' is a required property
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky
      commit: 94c8dc1fa8e1ad4037084204152bca1e799d7d1c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

