Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9A3E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 23:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMXLTKZv7aPQSaOukCeYXiGlmyqmXrYyjrj2l+DZP5Q=; b=Hl/Rse5UcMbYQ3BZS8clJGTfty
	lhzH5FiZ6xE9EdsNn3pdURDHASvGTBocUXLodRewQwjpWRUxGl03qGHfcU1F8qedYqHrxOljJB6H9
	+AgQiBKVThPimvjTmAU3xF2QqHeeewzA2JDccVGCderOrcffN7fdrHgsu2Kae0bWPRlXFjhphZqm8
	1HbmW2mO9gsnFF1ysUGVNukgQq3RERLENUcDg3aJzJsxUEx5Q4Wee4qOptwRP/BwZWJsbqR5mcYry
	BSWkwwAXYjd3JVg9NEpqC+kzG2LzcSj56X52qCTJz+aM0t0BQgSRCScTOM83DtcqQWqQx9sWM5dDt
	hZ9DwdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1lO-0000000DXHC-1Txb;
	Thu, 09 Jan 2025 23:16:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW1kB-0000000DX9X-1OKu;
	Thu, 09 Jan 2025 23:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DMXLTKZv7aPQSaOukCeYXiGlmyqmXrYyjrj2l+DZP5Q=; b=VLMDRBo0Fhxksbi/ChrY9gaNRh
	o12d4T6RURl9lbQ51vCzjGjUq9nTsq4uAnKCKqM86LZS0Du0OHDSwH/h9jND8AwaCIEWJZcIIfTI6
	6Jauton0lBxcEHROkEGLVW1/Fm0RsdkiReO3f73GQzzaWeoM4FZQqHYDmrDy1rsE+siE+UjyOYxhS
	rBka+Yl1YXrd+yqdkOhTn+48LdB+ZrKhCw8RI/bmk7YK/4f5/IeRG686DrjaQO37o++1bXbxnyas9
	wq3nuWEQPyTRuUSb2jkGY3y+f0SkkLy9zyGRWW089m9VEywmqRPGrv9oP+zLHlraiwZNSL0+CTDrm
	+DOU59Kw==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tW1k9-0005wG-FP; Fri, 10 Jan 2025 00:15:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v4 0/2] arm64: dts: rockchip: Add Firefly ITX-3588J Board
Date: Fri, 10 Jan 2025 00:15:03 +0100
Message-ID: <173646444755.2945728.11659314833812280538.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216214152.58387-1-shimrrashai@gmail.com>
References: <20241216214152.58387-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_151515_367013_9637DC87 
X-CRM114-Status: GOOD (  16.48  )
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


On Mon, 16 Dec 2024 15:41:50 -0600, Shimrra Shai wrote:
> Draft 4 for the device trees for this board. I hope this one finally
> addresses all outstanding style and organization issues. Note that the
> technical functionality limitations from the preceding versions remain.
> 
> Changes since draft 3:
>  * Removed the rockchip-pca9555.h header and used the pin numbers directly
>    in the .dts.
>  * Removed the display-subsystem node in the .dts. No other board seems to
>    have one like the one that was there and it was causing warnings.
>  * Removed extraneous property "rk806_dvs1_pwrdn" on the PMIC subnode on
>    SPI2.
>  * Removed an extraneous property "rockchip,skip-scan-in-resume" on the
>    PCIe node pcie2x1l0.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
      commit: 8886252102bd774656d19423b7d85e1ddd78f9c0
[2/2] arm64: dts: rockchip: add DTs for Firefly ITX-3588J and its Core-3588J SoM
      commit: ebe82df46fba0f0fe45d7e03ddf5ca0f6e758a06

I've sorted some properties and dropped the status="okay" from the
fixed regulators added in the board dts.
status=okay is the default, so there is no need to add this to new
nodes.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

