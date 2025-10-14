Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E207CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIEDzwv7QdB31GWJ+XTDLBa3gIoDkaeLOaqFwxH7huU=; b=3acWamYZKXqtBJTaxLWBamOmi5
	6c2dczWCCdjmDQzeZvwbmho+7Uyhbs6cCImsXaoQ9f8X6AZ8Qn16gakdqz5sa59ylPwsqGdgL4N00
	H0AQO69HayO8ASv9/7ydHEVL2oDulfejZ5w/uJ3gKJMflqJiYwZcbXlETgNqFex0r1zcIWEK5EjKH
	nSgm8hLEEDqYw2kahhK2XzCAGB4/2sh+Fvfs2VcCZdgalTP/xNlPYY2nSodaM7WJqM+xjnp9i1PGp
	C0rTXTZTIjQ7g9PpcbRDd5XJ29MiKASiczrKKyNSW0RHzgyYdNFTiFR3fpvpRUbbquR2Ep4UPZlGD
	N1na3RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQg-0000000H9MD-2BJo;
	Tue, 14 Oct 2025 18:07:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQR-0000000H91s-39Yv;
	Tue, 14 Oct 2025 18:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rIEDzwv7QdB31GWJ+XTDLBa3gIoDkaeLOaqFwxH7huU=; b=oWce2nmHWPWWoNXeYgtzvmVX/+
	hA0OkoEPV9FKtQomxOXwECRZ1fIRfyBUXTVILAz9OyIqcsolM26xiEC9LcZvtSQtEETvN2s5jNiUM
	VekHnoxEnHGurZGh5AfbgA8s+SVbjWZaBPsqQWoNX7BSwl0XLeo91KiVqruss+Xu6QC+M0MvUf8qC
	8St4tVG84On1cTrJtoKvmmiSfX1dQAhqHuOBHOss0ZOuOS2vhX3u0VVy81WXCKQi//XerfUsLlKYC
	EG+xrbzWwBDMNm2nJppzEw1Z25fwWUbSw3bYKNwX03xfsKuCV6FJKcQvcnl5CJ4g38TQDBOldDlqy
	nuyMJYSQ==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8jQC-0001Gj-A8; Tue, 14 Oct 2025 20:06:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Peter Robinson <pbrobinson@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2
Date: Tue, 14 Oct 2025 20:06:37 +0200
Message-ID: <176046473179.1662867.6131209694998628350.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250918062825.194-1-kernel@airkyi.com>
References: <20250918062825.194-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110707_825713_92EF3223 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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


On Thu, 18 Sep 2025 14:28:25 +0800, Chaoyi Chen wrote:
> The rk3588 evb2 board has a full size DisplayPort connector, enable
> for it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable DisplayPort for rk3588-evb2
      commit: 134fae98cfbabb7e90b1b2d957fb374408061034

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

