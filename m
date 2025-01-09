Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1043E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYYn2ZoAryPtkBNugm6MsBpPD4hnKv21592PMgEbOWQ=; b=0+/XNj+rz4OVUezJizit0r2+eO
	5hmexD0ac0uyfrGsfStVOlGmnQyBISePON72gu8fHCyDIbXP+anaZy6QnuWJ5904ZIE46h8DMXbnj
	69fKdH+kx61uEXH2qM2PivY9GzF/V0uj+2EhrppG4pcpBCHq/apdrzw/teEWmpE3t+2Z6mPKIcDRr
	M1WQt8jXq6z4WkAtTzot5K7k5+SbgkAh4WUdFOe3G/085mJ9TCyoBdkRgHD2tAk4bmgBVwWTg8nYr
	fsgPdxd6754qBWeeh86V0InQ31UK6xACEhMVtiEfrmE+zzEEAXUCfKCUmOUACelq+HwC7KoPnuJG4
	/WmEg26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvun-0000000CmBt-2nK1;
	Thu, 09 Jan 2025 17:01:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvoo-0000000Cl2A-2C7A;
	Thu, 09 Jan 2025 16:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dYYn2ZoAryPtkBNugm6MsBpPD4hnKv21592PMgEbOWQ=; b=HOmVK8rgEgDpn8qRVh9kLMZnaM
	eUeC8Gs3VFTkMtvfYdcom32TbnDmz7+3k4CllqXrAxUhLXNd91rFDTsY+c4OHSPPCfKk1QmGKXuCI
	cBQUY5FEnIrlPphA9h2RtrHKLTV19ldMEqP2nmWWwr6XuxZcChMaM04j8yB1nnXsG01/7G+0JpuUz
	mClh6QYY4MSMI0rPWtOb+nOqsKD94FBzYwO9iseSwNoAj5uWmJ0n7JM9Ug0f5qpXI3RDkeCO4FWlH
	0n9CVDMZ+OtcSZIFe4feJIAJHhRT3NEf1HJzNcfCTFcITLX87zRd/Zn3Ld6Hp3DfG3367OvvTAHtn
	eksUCxUw==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvok-0003hx-9w; Thu, 09 Jan 2025 17:55:34 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 1/1] arm64: dts: rockchip: rk3588-evb1: add WLAN controller
Date: Thu,  9 Jan 2025 17:55:21 +0100
Message-ID: <173644170632.2899934.6782599288073727936.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241210162452.116767-1-sebastian.reichel@collabora.com>
References: <20241210162452.116767-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085538_557410_66264B54 
X-CRM114-Status: GOOD (  10.77  )
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


On Tue, 10 Dec 2024 17:24:04 +0100, Sebastian Reichel wrote:
> The RK3588 EVB1 has an onboard AP6275P WLAN/BT module. This adds
> support for the WLAN side, which is connected to the second
> PCIe bus. The Bluetooth side is connected to UART and handled
> separately.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3588-evb1: add WLAN controller
      commit: 3948b4a9bbbb7366b277d9adfcee77b270482749

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

