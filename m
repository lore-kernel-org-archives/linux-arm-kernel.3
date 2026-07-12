Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 20:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv2WgGTz6WKIqtoJnLFA34PaD05R6doIbVvqCh8lFG4=; b=ex3IL7TfLy1sJUdgcYjnOxyEb2
	2HiJVTIdMRfukc0f+BdUkZFTA2syALhSaVuDhadAcYaavrhTyR4zJdaySM1uJA3b6t9sgCOJpcudE
	J5k/z3YJIoxZ6PKK8MwMjTcQUjYNp8r83Il0K8GVWlJDydX3HP6lyivl0PTxibK5QFvz4e1oxR9r1
	HToULBVt/cXi88ywFwf3vte44R4OA2VeYNZst5gWjSONBA2WP7HkQEEbtcmFvr9qqCHclAOL9TAFq
	kardW0VV0+IVt84ORPoOnIzrcvaKkf+Hqb2tcLrd/0r+fWzcrDhYcqCr/4LzDyBsLBRRoMz32X8MX
	F2AUe1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0t8-00000007jeF-3rhE;
	Sun, 12 Jul 2026 20:34:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj0t2-00000007jZP-1KC6;
	Sun, 12 Jul 2026 20:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Mv2WgGTz6WKIqtoJnLFA34PaD05R6doIbVvqCh8lFG4=; b=ctJpl8nTmjSPbLdy7AePVUSEcT
	4SU8EprP9Zha+ttcLt3cuQ6gy3de/Nx2IcCVXn+Ur2u9z3rvkl0k85qyLgLVY3Isde/CeUCrsd4Ib
	ZAGsRB5w4feaOa1KpOapEuzihotjFf4UAmebxw8jth2ErWFcLeLdICBSs/HxLxu2KT0bd2x1bhxgg
	kpH4XNgIxuS3CrTuDcD+ixXLw0+mOhmX5xqlIHxbMm3SO6YH9aSsJWzGv0yIRh+LfTPiJOofmOqCZ
	JkrEQUEinoNIaL5LVIdgrMSih1NbP47hsBTnsMKfF99I/HNZvJ/kFVEWuFx8sSe4knQanm+KgzRJ9
	jwHO712Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Wu <david.wu@rock-chips.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Yanan He <grumpycat921013@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH v2 0/5] ARM: rockchip: rv1126: Add support for Alientek ATK-DLRV1126
Date: Sun, 12 Jul 2026 22:33:57 +0200
Message-ID: <178388833980.1396294.8103967667500299878.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_133453_133346_466E1D18 
X-CRM114-Status: GOOD (  13.96  )
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


On Mon, 06 Jul 2026 17:14:40 +0800, Yanan He wrote:
> The ATK-DLRV1126 board consists of a CLRV1126F core module and a
> DLRV1126 carrier board. The core module contains the Rockchip RV1126
> SoC, eMMC and RK809 PMIC. The carrier board provides Gigabit Ethernet,
> SD card, AP6212 WiFi and Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and
> audio connectors.
> 
> This series adds the Alientek vendor prefix and board compatible, updates
> the Motorcomm PHY driver to consume an optional external PHY reference
> clock, adds missing RV1126 SoC description pieces, and finally adds the
> CLRV1126F core module and DLRV1126 carrier board device trees.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: vendor-prefixes: add alientek
      commit: 068a6bd57167cb97058b08f22db0584fabdaab95
[2/5] dt-bindings: arm: rockchip: Add Alientek DLRV1126
      commit: f1522feb72aa5231532c9f69e7f5cc91972697e1
[4/5] ARM: dts: rockchip: Add RV1126 I2C5
      commit: 17bee9ee734e56d512ec7803eb7948adb56d1d9c
[5/5] ARM: dts: rockchip: Add Alientek DLRV1126
      commit: 44045aa7a9a9e6484617f44f77a3efb2d8e78565

Please double-check the sorting on future patches :-) .
The dtsi was perfect, but I did some re-sorting on the carrier-dts.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

