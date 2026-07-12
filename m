Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20BEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 20:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdRuHzdXq91B4Ck5zEM60mSrg0JXF70TNB6D0dYPrtY=; b=R1Is0qDTb3gG3fDPOF4rXqq/mH
	0KI0dhnneCaANGn7e/SuM/yVV5pEr/HMsMqljlWYGnbsfqNp0/FkhtVUjerpdzE6SAgspPw1COv09
	KqqDPdk2IcObT6q12+I474LKrmhxZ/bMDM21pzXjHXX5r1Ikez7BAJUk6GVPOfnz0LP0NUY4Yl5KH
	lHYIsM/QZOtGrBLmGysK1TBP3k6HXYBZBpgV/qBTPVX2wg8tF/xrRocFGosCHb0zh8QPczgguO8uu
	YUuY+WThR2X2WUjLEyEF1GBkRIa0OjSqGhC2X333uskrSMvqzEPuCtoC16r46+YuC7NKiqGNkhc1D
	24+f4OzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0t1-00000007jZQ-1Uyb;
	Sun, 12 Jul 2026 20:34:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0sp-00000007jQw-06bN;
	Sun, 12 Jul 2026 20:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=RdRuHzdXq91B4Ck5zEM60mSrg0JXF70TNB6D0dYPrtY=; b=uewt+Db+AXf5pcMwAPqVJ1Fvep
	9q6dbRiHNLbISblseRryVfgqRMoXiOH9YLvwrNMGvt/fjR2sAFOuzX82Rc0GJAsx2SiUiVQ4zm8em
	o+FbSrAv5eSJl2cHYS5qWgPNj/MWnBCgezbkbg+5cT/ooUhBia2GV9s7kY9GhvbqNPKHLWd4LYLn/
	xjPeJzhtdzlt3dxcwNhQiXzy7AvmqZVFjUMIVWLIbJUju2So+Rig3coEvKAWVCJHWv+0Nc9M7Hzu9
	0SpW3Sx590zvUoyIeMxh3CRFNFnL+pbRutWBQaICE65/4aeqkKEnIxF4US3E+FsTeHQpuPB/7pfOx
	8qRq77Ow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: yy3588: fix HDMI-RX signal detect GPIO
Date: Sun, 12 Jul 2026 22:33:58 +0200
Message-ID: <178388833969.1396294.14102109354699035035.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260709-yy3588-hdmirx-d5-fix-v1-1-900a6790386c@superkali.me>
References: <20260709-yy3588-hdmirx-d5-fix-v1-1-900a6790386c@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_133439_077889_F23602A9 
X-CRM114-Status: GOOD (  14.85  )
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


On Thu, 09 Jul 2026 08:58:38 +0200, Daniele Briguglio wrote:
> The YY3588 declares the HDMI-RX signal detect on GPIO1_C6, but the
> receiver never sees an attached source there and cannot capture any
> input.
> 
> That value was copied from the vendor device tree and is wrong. The
> core-board schematics are not available and the SoM documentation does
> not clearly show where this signal is routed, so the correct pin was
> read from the device tree in the board's Android image: GPIO1_D5. With
> GPIO1_D5 the receiver detects a connected source and locks, and v4l2
> reports the input timing (1920x1080p60).
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: yy3588: fix HDMI-RX signal detect GPIO
      commit: 3cb7054789d1babe484dcd58a921609ee5a687a2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

