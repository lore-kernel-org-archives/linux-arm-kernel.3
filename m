Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E7CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 17:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFuG/8nZb4eVJ5UiKdHvsABqzXbNy5nmmF5KkQCHiw0=; b=DXOc/clnL/L4twnyx6wh9NPI33
	HaZ2rsP1PfOaK2xD5oAfNbKNpkgP8UY03rHvq1ga9KA41AzStl8BPmwPrVoAyApkkwyCtB6arnEox
	kS08P7AU5/bR7ntRtof7d7j8QKGjYReZDj4Lz7vjA8KWrDBL7mlpcz343Hg0guiglxbIb0dOuDsj8
	CreHh/Dy0nSGLia8LfEgFOk4ceZ88zT7tgCfuHMCJbAelVg+yLQuAzzBfIXOgkArUaxjyoj7DIq4i
	eS/hPDFMPLxelFA2yIlCxsElEPnqDxp3m15rhwi1mtSRc1Ljn+QZLaq6DsSoXziPxy97QpJU0r+pH
	vNvugSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJQK-0000000C9D4-3FtE;
	Sun, 07 Sep 2025 17:43:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJDj-0000000C69D-0gXd;
	Sun, 07 Sep 2025 17:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=VFuG/8nZb4eVJ5UiKdHvsABqzXbNy5nmmF5KkQCHiw0=; b=m9KSs/W2ZV6YVhiXV1ECPX2vKD
	+o2h8UUPBOWVMzKw2GAnPbEBfcduwFTekGW1MigwFNoLfpCVWSYS50tJEDGcD3VyJbEnmSYaPX/vq
	pH4IgmXZ+DvmN/7+iyG/oYOvunyxtxONYXABQ8tBCOO2b3YxI6frJvBkyRn761u3LBUsKCpviyoMb
	L7xoMdCbhOgSOsX4bQFfnIlVPozUaRDxOKXrQs7dGsmWg6HODDw2mQr3TYw9PWPaAbAny4r9+8FrV
	DoRIcZYrp4K7yB7pOwGQCcKDpy0L3X7CYzVZO6MsNszer68gFbp9ja7PEhMNowPPNNHlEtKDq4xkV
	EVyr/V7Q==;
Received: from [61.8.147.163] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvJDa-0004Ii-UM; Sun, 07 Sep 2025 19:30:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Sun,  7 Sep 2025 19:30:09 +0200
Message-ID: <175726620393.195224.5931454450160072348.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801080025.558935-1-amadeus@jmu.edu.cn>
References: <20250801080025.558935-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_103031_204498_C4444B77 
X-CRM114-Status: GOOD (  11.90  )
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


On Fri, 01 Aug 2025 16:00:24 +0800, Chukun Pan wrote:
> By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
> voltage mapping to the device tree to enable dynamic scaling via cpufreq.
> 
> The OPP values come from downstream 5.10 kernel, using a voltage close to
> the actual frequency. Frequencies below 1200MHz have been removed as they
> currently use the same voltage.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
      commit: 42bbc32c7e9e974ae4eb830ae1381cb016133e5c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

