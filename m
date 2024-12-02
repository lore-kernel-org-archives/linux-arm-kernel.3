Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19105E69E9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 23:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29fB5kRe7CnPK8fdvqH3jrlWfZQ7tWQhR8QI7YnEq5o=; b=eZDhsi7WutgMCx7GS1v0aj0Z/9
	aLgiSzLNFROLAg0Fu25gOcX01ZcdxJvdnupRBwGGM5s5aP2+S1qNWK0yeWld5EEaxPD5ep6PQP1MW
	7M0E7eoZYCcaAMkAquUzDcG36ma/tHooBKk76Da/VvzvwqBUgjyamxMjWLfCUe+WNjhVvNSDNBile
	+Pe1z+smkyHy6Fl0wh3LCuoUBnJbX626YI1Az1xE+mAr2rkznGL+w3hUVZ/0IMwwXPUsDaVxM/hd6
	XU6dqUoQ+CgKjZwqjOV+iv6aOjxq4RIHrun3J165u31+XDk6E6kqCKm3d+rj0Bef8x71TeLrXLpGn
	zRxxYByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFu6-00000007jCA-3a01;
	Mon, 02 Dec 2024 23:32:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIFrC-00000007iff-12xT;
	Mon, 02 Dec 2024 23:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=29fB5kRe7CnPK8fdvqH3jrlWfZQ7tWQhR8QI7YnEq5o=; b=eE0xRWhZiFOHfjubLdvTdKXZKR
	Mz1Ml87vJo0aETOg4TanzKDvVuVgTmKDOtZ+sjyN//FraH/wi2Edjfi7Rienm6PTYpTTAoGCEBJqL
	RdJL4DvD5po1cIdTDUB6ilBLGi0D1WRNMd5khvCx39LhwtWBkbjnwT0KuVHMXB3mUDRbzp3o8CekK
	40fDHvhlcHQ+kkXXr7u6R8ZMoItVCJ3vSzmUQHnJqDxSoaH6/JTTfv/vIhkmFKWlSK79KWvICxA45
	COQVRZLNnw8dOwxqGcZZjsbubfBjSbpp94vE5t55Da7koQxEXQZqUv8hxqOmjUr9ylSHGgopGW95y
	XbKAIG5g==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tIFr7-0000OB-1l; Tue, 03 Dec 2024 00:29:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC
Date: Tue,  3 Dec 2024 00:29:15 +0100
Message-ID: <173318214614.1403925.12812225885440711307.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107123732.1160063-2-cassel@kernel.org>
References: <20241107123732.1160063-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_152934_280391_8822FA32 
X-CRM114-Status: GOOD (  10.89  )
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


On Thu, 07 Nov 2024 13:37:33 +0100, Niklas Cassel wrote:
> Commit cd81d3a0695c ("arm64: dts: rockchip: add rk3588 pcie and php
> IOMMUs") added the rk3588 SoC's pcie IOMMU and php IOMMU as disabled.
> 
> The mmu600_pcie is connected with the five PCIe controllers.
> See 8.2 Block Diagram, in rk3588 TRM (Technical Reference Manual).
> 
> The five PCIe controllers are:
> pcie3x4, pcie3x2, pcie2x1l0, pcie2x1l1, pcie2x1l2.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC
      commit: da92d3dfc871e821a1bface3ba5afcf8cda19805

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

