Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D86CE674B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoYxV+zXHdjx75Q4JXjcDA7Kc8dxz5Omy/iV5ZA3rIg=; b=SV7TI/cK5jiAFE9pruLALdFoBp
	yA78TfXrTK3qbni7m9lNO03ESAwPHc7M7ImBv0nxsnMSq/1iqdY8E5uQSXUItG/bqvNbceMDKwflA
	3co7bOp3Br6N1vD2MupuG9/YoOGUx+ZQTATl99zGTRvk6fLzJG3IV1Tizr7bzCHBeNz9lIeSQ4sL/
	cWC+YpV1A2lPSO/P1Yp5zjpfvTqyLfshdv6w2FkjB83JlE8kyu9EX0BUzCy0ZdqN4aPnCl+LqB0SG
	3fl/ja+at3qjzCb6L/mCYG6LfCpZ4fRrEtQ+MuponT64ViPW3BXWhO+GPyrda1GhUVdi+zS2A8d62
	QslycqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg7Z-0000000DoxS-3oD2;
	Mon, 22 Dec 2025 13:38:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXg7Q-0000000Dosl-16nk;
	Mon, 22 Dec 2025 13:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HoYxV+zXHdjx75Q4JXjcDA7Kc8dxz5Omy/iV5ZA3rIg=; b=V+Us1nENppsFP8DjeU7zR9HX+c
	dA81FE0TPgbx81C+jqK6AtS0CRTvA/BEZ9TX43OOmmwTLXvyk+MxWNreCJpqSLWcJlhenwn7GAyZz
	nyDvl3soKpHAQP+JqfC7BiFvTRoRjJ4KhKG2DVeaxzxsIl8jdoeGtUBrue5ONxGRXHnEBc0g8pBls
	BFw2L7VkAKih5Se0J8mEyUTdljEdB4oDLPsxCDdCy4Qz4s0KUCxBefw7jzxPND6L5zYeJ6fpJULz8
	GO9Se/MYQwr0W/MtcR5NyxRgA4xqblN5vZMJr4L0Cpjmtw9zwUbGM/Gz+QSiYv0PS+77u25VwUJ8R
	3PICEp0g==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vXg7K-0005s2-Q4; Mon, 22 Dec 2025 14:38:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix unit-address for RK3588 NPU's core1 and core2's IOMMU
Date: Mon, 22 Dec 2025 14:38:23 +0100
Message-ID: <176641067338.1648325.5634476513505380555.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251215-npu-dt-node-address-v1-1-840093e8a2bf@cherry.de>
References: <20251215-npu-dt-node-address-v1-1-840093e8a2bf@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_053836_543888_BB0E9423 
X-CRM114-Status: GOOD (  11.23  )
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


On Mon, 15 Dec 2025 17:45:56 +0100, Quentin Schulz wrote:
> The Device Tree specification specifies[1] that
> 
> """
> Each node in the devicetree is named according to the following
> convention:
> 	node-name@unit-address
> [...]
> The unit-address must match the first address specified in the reg
> property of the node.
> """
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: fix unit-address for RK3588 NPU's core1 and core2's IOMMU
      commit: cd8967ea3105d30adb878a9fea0e34a9378df610

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

