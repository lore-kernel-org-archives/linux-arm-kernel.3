Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA73CA5FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Onub4mykYcFwhE0hmKSL3j6CDl+1xSaBRFx2WEGfuGI=; b=r6yBho3J050KKhDmPbYqJ9FuYd
	awX8ZRhZTbcfsv8vdPcJLlnQIGri1zsV2w1wAvhcQSdgJrc+5Bf4LEIAjn+mWMX9FlMK+8r1X3pPZ
	+aHcMB63qw7jaLiiqeKTsq+12CckUF/Ak8/SuPSpuATcH1/TmHdeIKJB7Z4cRTWMsDXyL3toF7UFE
	yvie4uoPjeTai5iV/c6mp4bsNKU39xNqxnEu8K7yD+eSIRv9R3ePrBoQjiAFqQjNJ+ABYLOF6sion
	ur+X4ra4DoqyWeSaT2Rp+OjiFiGGCYh90/+Q9O8dm8Y6GElch/kXgRcsdobuKguC8HgBJLSjPREwy
	ull7O89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMw-000000071Fi-0b1w;
	Wed, 30 Sep 2026 18:49:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzMo-000000071Cl-3hsy;
	Wed, 30 Sep 2026 18:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Onub4mykYcFwhE0hmKSL3j6CDl+1xSaBRFx2WEGfuGI=; b=ReTRdxmIfg0Hye6ZP10wYTJcXo
	HoxN6a0/CEio9IG/FYxT4WtT+lpHnSOb5ZxcP2r8NOi1mmPVwqrSkCjMK5GuBHbL8CENzNfG1ksEC
	1DTlBgjFFjohhv4n8kBpoET4fG+cxcYYr2jXHJcJOaF+d1Zi2l2b/SaYUAymEUDkMfW2Pe4qq2pfZ
	hv353vlB9D5F3bZECkgIRlxw/7cSHuFhd0ckEwoVh3ReMdjQiDt0qnd/PTDWl2hjF9b7pJcSwXSef
	RwgPfBgj6qG7+gCywgP2AwKk2VPCGvTO9k7SQCmWyL2IETpU+I/fyyIIhYnxKc0T47DdG+1SJpIAn
	0cY0qDyA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2 support
Date: Wed, 30 Sep 2026 20:49:11 +0200
Message-ID: <179079409728.2398180.15813648897564877390.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919134125.59419-1-founder@crepuse.com>
References: <20260919134125.59419-1-founder@crepuse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_114923_435676_00B5B2B8 
X-CRM114-Status: GOOD (  11.27  )
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


On Sat, 19 Sep 2026 13:41:29 +0000, Mizuno Miotsuki wrote:
> Add initial mainline support for the DFRobot UNIHIKER M10 V1.2. Only
> revision 1.2 is claimed because later board revisions have not been
> electrically verified.
> 
> The board device tree enables a conservative core subset for a usable
> mainline system: CPU regulation, eMMC, SD, RTL8723DS SDIO Wi-Fi, UART0,
> USB host and peripheral operation, GPIO keys, and the watchdog.
> Bluetooth, audio, display, touch, IMU, SARADC, and GD32 support are
> intentionally deferred.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10 V1.2
      commit: 55010621f40c5b129fb0972f07e9d8d52aa6a765
[2/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2
      commit: a2ff7779dd92246bd3e34a2f9600dade3794e6d2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

