Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3D3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJwimBcRqLSyXYEID3ttBpVRmf268sK2AExRPEHgOEI=; b=L7UA+0zn2uFzIQoo9YjiIrmkUJ
	OV8Nne3nvPpx6FBxZVp5kroHWDwqHxebZN37xBk25V/VCjXpPlHlwAQepxOaEv77f7v8/Yafs9fXM
	FXf16oGLWjcht8htIev/3OXQDrItms3lK7mEMPjzW4sVAVNeMSwZDjyHehWX6TA4A5tayCcnmxm5e
	jw1ARTqmcIL6c/arvKcccGpheaOdG1hk+C1o9pFaFoe7HrgxsD3qSpvQowBVhuiDFrZl09Ddy0wU6
	7uP/kWJejSIMDxcWWmXIDj6eRpPZoKtqqO7Zd1h/8i3b/e0YVyTEcGPwYVPhat1AbwDOLY0zKHHEA
	NHZB/VKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigWj-0000000CffU-2Htp;
	Thu, 13 Feb 2025 21:13:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigSK-0000000Cecl-39RS;
	Thu, 13 Feb 2025 21:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DJwimBcRqLSyXYEID3ttBpVRmf268sK2AExRPEHgOEI=; b=JLMjc8xXqVS83EWPH15sVxIbDP
	yKlFs7JwlHERsFF56d6h2cSeXBzC7u//NenkcNAvdYiQ09DmQCviukCuQM/igm0UvDRTKpmheit5t
	ZZ+4f4+YcJRNI8Of8AwaytmsdhARr6vLIAGwNYEqPODpOr8SDOK3lkYJzZC9bEzjw4wheLGZjKMRL
	g9dzDWyWxS2pBHaEXZ4EmIzOBz3NmWsueePys4hMtwR4ARF1wBDn/eOYFK0PjlzG3GheAc2LHoodc
	ZOhad2aju/3KBddc2lo3HnKSIBFzMau2WgSWDjSQAeIA8nldPw1xHWU9+zmP/uk3Se9MfxZFg4a/c
	+Dgof7Sg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tigSG-0006a0-Mn; Thu, 13 Feb 2025 22:09:04 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dse@thaumatec.com
Subject: Re: [PATCH v6 0/2] MIPI DSI phy for rk3588
Date: Thu, 13 Feb 2025 22:09:03 +0100
Message-ID: <6831884.31tnzDBltd@diego>
In-Reply-To: <20250213210554.1645755-1-heiko@sntech.de>
References: <20250213210554.1645755-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_130908_793784_5288D005 
X-CRM114-Status: GOOD (  24.66  )
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

Am Donnerstag, 13. Februar 2025, 22:05:46 MEZ schrieb Heiko Stuebner:
> This adds the phy driver need for DSI output on rk3588.
> 
> The phy itself is used for both DSI output and CSI input, though the
> CSI part for the whole chain needs a lot more work, so is left out for
> now and only the DSI part implemented.
> 
> This allows the rk3588 with its current VOP support to drive a DSI display
> using the DSI2 controller driver I'll submit in a next step.
> 
> Only generic phy interfaces are used, so the DSI part is pretty straight
> forward.
> 
> changes in v6:
> - rebase onto 6.14-rc1
> - add Krzysztof binding review
> - v5 was sent at the beginning of december '24, so probably has been lost
> 
> changes in v5:
> - add bitfield.h for the FIELD_PROP definition
>   (reported by kernel-test-robot)
> - add Sebastian's Reviewed-by
> - add Conor's Ack to the dt-binding
> 
> changes in v4:
> - moved to #phy-cells = 1 as suggested by Sebastian, with the argument
>   denoting the requested phy-type (C-PHY, D-PHY). This works similarly
>   how the Mediatek C/D-PHY already implements this, see mails around:
>   https://lore.kernel.org/all/20230608200552.GA3303349-robh@kernel.org/
> - dropped Krzysztof's review tag from the binding because of this
> - dropped custom UPDATE macro and use FIELD_PREP instead
> - build a FIELD_PREP_HIWORD macro for the GRF settings
> - add received Tested-by tags
> 
> changes in v3:
> - add Krzysztof review tag to the binding
> - address Sebastian's review comments
>   - better error handling
>   - dropping empty function
>   - headers
>   - not using of_match_ptr - this should also make the
>     test-robot happier
> 
> changes in v2:
> - fix error in dt-binding example
> - drop unused frequency table
> - pull in some more recent improvements from the vendor-kernel
>   which includes a lot less magic values
> - already include the support for rk3576
> - use dev_err_probe
> 
> Heiko Stuebner (2):
>   dt-bindings: phy: Add Rockchip MIPI C-/D-PHY schema
>   phy: rockchip: Add Samsung MIPI D-/C-PHY driver
> 
>  .../phy/rockchip,rk3588-mipi-dcphy.yaml       |   87 +
>  drivers/phy/rockchip/Kconfig                  |   12 +
>  drivers/phy/rockchip/Makefile                 |    1 +
>  .../phy/rockchip/phy-rockchip-samsung-dcphy.c | 1604 +++++++++++++++++
>  4 files changed, 1704 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
>  create mode 100644 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c

Forgot to transplant from the v5 cover-letter - the series got a 

Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

on RK3588 Tiger with Haikou Video Demo in [0]


[0] https://lore.kernel.org/r/63cda072-3671-42c9-9650-7a3ece39dec6@cherry.de




