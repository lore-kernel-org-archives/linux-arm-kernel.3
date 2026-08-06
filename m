Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2C5C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjRHKsliqvvLYwqfQ+GA2Px/s3f/hlLeRUQ/A/a3Vhc=; b=ZVKsZiRuLP8bqHWPlvBHukmOvk
	DM3Drc6iNPWh0z9vMUeNXvJpjGlFwvmjBWyrXjCP5q2smb9/pDQpmAXtc1uzdyGQiPO0HlU2sufa7
	x1j/iO1CSCGVt1zScI4juImHkyX6/+SmG/gbL0LExfOc3DkuvPWsEJ2AJwiN0ZBuFIKv73h2+nxg0
	HjO4HFNyCFyj37mJW2S/IXw4NpGY+Ph1F7hG5wJV1lKu5NU+FfLoJd7nXmWGOos+08+E5QfXmEuey
	9Fqjn1RgtghYU75WjIMc8DU0tJJbwH4jvFr6+BvfPdocH7/EnDIXsKnPXaWe/3SCJgB6kkZVTM6bl
	MVQ9iitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0So-000000069L2-3zij;
	Thu, 06 Aug 2026 15:56:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0So-000000069KN-0i2Y;
	Thu, 06 Aug 2026 15:56:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47CB360AB9;
	Thu,  6 Aug 2026 15:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372BF1F000E9;
	Thu,  6 Aug 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786031817;
	bh=pjRHKsliqvvLYwqfQ+GA2Px/s3f/hlLeRUQ/A/a3Vhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aM8CzvZL1kM8bogCR4THoedGsE0LsrmHOW+9scLTFef8/T7iNfbQbqgwneQlJrmVb
	 zwDA/h8baSVPt2RNqX39wKuflTMuCV7OidrA01gdihp3LswRdZ7e+J5VEwE/nNb32j
	 B5uTIT+0mN7qqbN+Sg5xFSbj/4/5/UpX8PJQmbiID9wudtYkOuu71mfSYwjGdKy508
	 r3gSTDHRJgOkLV1tKT5/fE6Dy1EeShHego3b067oJpOC1sph9rk9odxLj2/cTaWJye
	 +PK4PYBpH9fbPU7d0IkzyCPiCRWtpDcphDgFnF1qfCmWTBVy7uwOMJXI+NIMpixzBY
	 6DZ7QBk91fWrw==
Date: Thu, 6 Aug 2026 21:26:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: jason98166@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Guochun Huang <hero.huang@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 support per-direction phys
Message-ID: <anSuxfeitSqmSHNr@vaman>
References: <20260726-dcphy-rx-v1-v2-0-cf9cc34a412a@gmail.com>
 <20260726-dcphy-rx-v1-v2-1-cf9cc34a412a@gmail.com>
 <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82da3622-9c3a-454c-87bc-fb4ec7adb68d@collabora.com>
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

On 03-08-26, 13:17, Michael Riesch wrote:

> > +      Two cells select the PHY type and the direction, so that the
> > +      transmitter (DSI) and the receiver (CSI) can be described as
> > +      independent consumers of the same PHY:
> > +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_TX>
> > +        - <PHY_TYPE_DPHY RK_DCPHY_DIR_RX>
> 
> How is that Rockchip specific? As you state above this is either MIPI
> CSI or MIPI DSI, two perfectly standard protocols.
> 
> @all Would it be reasonable to introduce PHY_TYPE_CSI and PHY_TYPE_DSI?

I think yes...

-- 
~Vinod

