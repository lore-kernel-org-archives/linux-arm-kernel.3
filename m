Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17206C44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 19:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87h17Vm3Kg4e1AvNbenx3pMVHZ02lJjFNP0N/SI3OkE=; b=s6JOD0vrzblI1Ys3OpItqrBBtd
	b9p2c3BWHGiLXUu0vyMGQvUvBQZF11khhATAIuZgG6HUrGEO1vrfcRKFUQyY6tmzbskoWhLVPSzQg
	SHRucOeoh2lSnUi9i/qgrbmA2WebXTe2T37cxhPJJlo+HotNrrjU+X+xlIUm08tPL2zJsLoXxCkV3
	IPHDTiIFBw9j14J6Jdd4XDhvCsOgOacSlPKCe82U5d8x0Dx4rWzJON90xuhsQip26Slgeq4j9qJCh
	dz1nL8q9UFL+n4cID4w2u6s25hGydztKdlHkmQto7pkWkoTkKS71l6r92GNQXo3QHcm4+ibrjyGbv
	Vvqjnl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRhT-00000000Sh5-3moM;
	Thu, 16 Jul 2026 19:24:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRhM-00000000SdY-2Qiq;
	Thu, 16 Jul 2026 19:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=87h17Vm3Kg4e1AvNbenx3pMVHZ02lJjFNP0N/SI3OkE=; b=L278ZaGZ+l/HlGPc9/ZvDmVq12
	9AsMVRfzZd1OFMD5Nsh6x/6Oo9XkBcGUxDXg+3/TA3CrC14fA2GOW+tQiq126G+3KCsx8EAY6ziA5
	g+OA3jm+2H7jQPBokaJVz+RsvrEyQUZktrlMDEZZqKbGC5XeBb1D9ypwej7n6VaMF1cmqXBs+pdnp
	17o4qLE7Jy5zVC5YM1aiydoJrBPlwnt/CJj/1WocYeYyYqcrgTs5wbcIY1hkJOuekd8f9JGeKtDoc
	uZCM/SAXbuwYhWP3KuQp9zigUYue0YbDemdoc5oOrbus58IcTteBY39n/Ub66SmAGuw6UMLowHPpC
	F1DxYiaQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add support for Orange Pi 5 Pro
Date: Thu, 16 Jul 2026 21:24:31 +0200
Message-ID: <178422977233.2335819.13925907620580546087.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_122444_619694_36395777 
X-CRM114-Status: GOOD (  10.53  )
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


On Sun, 10 May 2026 21:53:46 -0500, Dennis Gilmore wrote:
> This series adds initial support for the Xunlong Orange Pi 5 Pro, based on
> the Rockchip RK3588S SoC. The board features eMMC, SD card, NVMe (PCIe),
> a Motorcomm YT6801 NIC (PCIe), WiFi/BT (BCM43456), HDMI connected to SoC
> (Second port is disabled in this patch), and a 40-pin expansion header.
> 
> The series was tested against Linux 7.0
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
      commit: beca9854e249515fb1ff4c575c875a85df9961dc
[2/4] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
      commit: f724b899d0f30d78a7b2c3f025aa826cd3f5eccd
[3/4] arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for Pro
      commit: d20f5368a4db0a70a5a7d3deb06553aae61f4ac8
[4/4] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
      commit: 4d6c68f39300bc52dacd204d08a4470ab2524726

Sorry for the wait.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

