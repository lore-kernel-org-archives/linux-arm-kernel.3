Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3234F483E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 20:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHjmY3uz+RhP2ImOwmCWqApQeZo1zGdRnLnmZ0qQ6L4=; b=jNm8K7ZbKXrRCr34ekFECANX6P
	K98KrTTopoB+R6tIHEyYfDF0aalnQYh2Gw1778e8Zgsnptx6cBc5oIvnfclhTr94Oq4ieBFk/H/us
	N0zhyYgPwxWSOtuGOMuCGPKPoWKucRXDM+0ls51Z6lwClMesPaHvDKcQ06BEWOiVefhYBe8IVwCwV
	gOgblyUdUUNv59iqhQ0DuZk+fB2wHEUolzRKSwUbc1VFyFAtwdJt5/BY2eRUQKCkUkh4zUGY1B/0V
	79409QVe7z9VjdbFWEVr38eX7KfUxZoBEaBR4vqarhZ3Q7U5nZ2u8OU53MP2HXl36toFoWKQRRK/V
	V87rBNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lS4-0000000HWrA-3siM;
	Mon, 23 Mar 2026 20:00:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lS3-0000000HWqv-2oFt;
	Mon, 23 Mar 2026 20:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D08E4600CB;
	Mon, 23 Mar 2026 20:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475C0C4CEF7;
	Mon, 23 Mar 2026 20:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774296038;
	bh=+x9AG17Hp/EBhtYzQohBkV903DY2Vh6iSe2BBxsw5YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5GWk/YUuKdPBeWP84YtTOoDx7rfII8l4iT1yBV9NgYZP2jInEiNUsNQH+ZIy+TLl
	 8PBfxs681Ew0ZlxDOfoxW1DhbnRm6LEvn7KTAF/ZBaTM+0SUsrC8fWv7LDPV1AK+yz
	 UXvCmwWOQGyTxzzDW/O96L/vHXzHVoW/M7plyQwV2aLeLfpIUm/VuiZ4XpmHYZr0a5
	 QJTua9wgXm1AMxQoQHK0DVqvR8syf19HA+LqXHBtHOF0+XxHMBWELgXIwkvM+Hs3LZ
	 g4qBWXPLGpBKp8CRJ4R3EXR2uD0vKsxUcz/I9T+LDQZTq32N/uGlteB39Otu/cebCU
	 D5Alz3WNmVYcA==
Date: Mon, 23 Mar 2026 15:00:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Yubing Zhang <yubing.zhang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Frank Wang <frank.wang@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Message-ID: <177429603690.1305360.6710008166136949728.robh@kernel.org>
References: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
 <20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com>
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


On Fri, 13 Mar 2026 18:57:10 +0100, Sebastian Reichel wrote:
> Currently the Rockchip USBDP PHY is missing a documented port scheme.
> Meanwhile upstream RK3588 DTS files are a bit messy and use different
> port schemes. The upstream USBDP PHY Linux kernel driver does not yet
> parse the ports at all and thus does not create any implicit ABI either.
> 
> But with the current mess it is not possible to properly support USB-C
> DP AltMode. Thus this introduces a proper port scheme following roughly
> the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
> with a slight difference that there is an additional port for the
> USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


