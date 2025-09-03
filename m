Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11790CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1KfW10yfYRUz0dRGNkZQYEnp2Hun5fkPdAXq0a5CeI=; b=kZyr8anS6vdh9qOVoIJXzRBTXY
	X63pwluyOpo5ybkTsEiPFuuncrETeQiK7vk0MC+0FAqvLndQ9BgyKt7FZUWTt3lGBVSRGQ4b7Kay2
	o0dYYbybBZMBF5KIIjeRekCTIhNj02FoflYrJatjeryMhm6SD2A+V0Ag6b4OoqJXxLjpLAu/ATOxW
	bLONAad91KyGeow901uS6aZZlFxk6n2AB1VXbiVVW+Kc9xrYoY+Z5nRBeXYnAj0mUBnmPzBsZkPRW
	hSlO+28cOa+xZ945Ky/j2DykBBrBcdqluoNinuA5Gwr2Qul+7zdOAahB8fug9b60go9v4n6QQyn4x
	xSp0+Exg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnLS-00000006YBP-1hBE;
	Wed, 03 Sep 2025 13:16:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmSb-00000006MqA-3MyH;
	Wed, 03 Sep 2025 12:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=J1KfW10yfYRUz0dRGNkZQYEnp2Hun5fkPdAXq0a5CeI=; b=0GyFtSxDP50gFZGFy+2kOXaebj
	S6P0FLjftPJ/knLJcL/8zL2kJncKmqdJUhHRRXiTE2VxVCrXm8oGZKljkALqMrzWnRcfqlwCSi21K
	LfjlaVmB76UU26NV9SOmyHtsmef3wI6OJbn4yTC/ca0gwQdtHJKXB8YbeUD7OxpPadtNtDj3QWlIg
	Q0EcLR7vtD4dbJ8iwKNJaMdf63zciJBX2aohUPO/ZRkvkb4vRmIRdoZZ4jpiuOFKe8qA5AxmjWQi1
	svARzV7X+tDsqwEvqM1UclnHxGXuUiqe8ZyNVbQ/vjIjiucPZ1QDVLB2yybks6SNRZDVLRZcfb2E9
	Xetbyl4g==;
Received: from [213.70.33.227] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmSX-0006Bv-Fb; Wed, 03 Sep 2025 14:19:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: robh@kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/7] drm/rockchip: Add MIPI DSI support for RK3368
Date: Wed,  3 Sep 2025 14:19:19 +0200
Message-ID: <175690195013.3771488.435870786224873257.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250831104855.45883-1-cn.liweihao@gmail.com>
References: <20250831104855.45883-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_051933_841032_E0CF58F3 
X-CRM114-Status: GOOD (  13.07  )
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


On Sun, 31 Aug 2025 18:48:48 +0800, WeiHao Li wrote:
> This series adds MIPI DSI support for the Rockchip RK3368 SoC, enabling
> native display connectivity through the MIPI DSI host controller and
> PHY. The changes span multiple subsystems, including clock control,
> DRM/VOP integration, DSI controller binding, and PHY driver updates.
> 
> Key changes:
>   - Update the Rockchip MIPI DSI PHY driver to preperly handle RK3368
>     phy initialization.
>   - Add missing lut_size of vop_data for RK3368.
>   - Add missing clock ID SCLK_MIPIDSI_24M to the RK3368 CRU driver,
>     which is required for enabling the 24MHz reference clock.
>   - Add MIPI DSI node to rk3368.dtsi with correct clocks, resets,
>     and register mappings.
> 
> [...]

Applied, thanks!

[3/7] dt-bindings: clock: rk3368: Add SCLK_MIPIDSI_24M
      commit: 4a76a0a889cef284327f265f97edc4ff2f3e11cc
[4/7] clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
      commit: 77111b2c22ef5b368da5c833175b6f7806b39ccb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

