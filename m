Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C162C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyfjdJ2F7ZkAf3rL9ZYjDDcoCkB1u8Z2/nkRcIo28CM=; b=xJSt3eWnU5d60ZfZf3VEGrH8Tz
	Szlog8eHqn6rn93YqhAjzBk3AMbgUK1QjtOcUQJNWueNcntRLOaJpV0T6uK1QX1Rkl4zKgIzp2+l5
	VoZFA69WBjn3HdL1PvQCVYFceL9mN2ZAdZuu9iijl1swmG7mxiYMfkHdPR8Y2DgCCy9czx3rfrQYV
	JNfV5yuS+q7D1cQ7Y/XC/wNXsCEZpg6ch3FGnFAYEyYFjDwd8rz9zsoeu1PYUUPcaNFwAnEAQcNAy
	x8fatpXVZWPeYTgPhmk4MRzilsyCFtAk7gj1zr6l/gQCeiJci+lby46hLyivgvxzNnUOWOFx5U/ga
	TD9bthuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Yz-0000000FxZH-17J2;
	Wed, 12 Aug 2026 10:52:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Yq-0000000FxQm-1Gll;
	Wed, 12 Aug 2026 10:51:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE81A402B5;
	Wed, 12 Aug 2026 10:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BB31F000E9;
	Wed, 12 Aug 2026 10:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531911;
	bh=XyfjdJ2F7ZkAf3rL9ZYjDDcoCkB1u8Z2/nkRcIo28CM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e8R/YGW4JRKL1ribgcAim0lsRiuR4eGrfT+UbUeo/UUS2YbARo3PrHY0a2Y1SKAXB
	 0h18deBjs5QzNyHzzT0mCf0oHjN6KRggdMbXaOEYWYgHESaGBSMOOV3t3b+e1TyIXU
	 HeQfi9jaZmVHCIIYMZktFTLqqfqEr7GQUY57eEu9ouW5jI0FGv7skZPx5HSs4GXF7h
	 MnfGvr6/iBXhYFhSEMQ/qNlGg50KcEo92K6R0qRzJgli2gj5U9brsYrXdYH1lBe5B4
	 zTR6YcP2Gixa9eL7vkGjioFEEa3CLosO4wtOgVVIw0xD26eBmG1OJ/GUubWUTyaSVP
	 uDRX5eIRURsjA==
Date: Wed, 12 Aug 2026 12:51:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jason Yang <jason98166@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
Message-ID: <20260812-refreshing-rampant-gecko-b38ef9@quoll>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>
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

On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: the
> same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI-2
> camera, and combo blocks like the Samsung IP on RK3588 expose both
> directions to independent consumers at the same time. A binding that
> needs to tell the two consumers apart has nothing generic to reach
> for: most constants in this header name a protocol (PHY_TYPE_USB3,
> PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> layer.
> 
> Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> protocol it speaks, which also implies the direction. They do not
> replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> where the cell selects the electrical layer. First user is the
> Rockchip RK3588 MIPI DC-PHY binding.

I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
Isn't DPHY implying it is DSI?

> 
> Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Jason Yang <jason98166@gmail.com>

Your tag goes the last.

> Assisted-by: Claude:claude-fable-5

Two simple defines needed Claude. Great, that probably makes AI
conglomerates very happy that we do not type even two lines anymore and
need their resource-hungry data centers to do that for us.

Best regards,
Krzysztof


