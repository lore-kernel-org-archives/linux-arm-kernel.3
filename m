Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F4FCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NIdAVBnnVCHzcsjaaAfuLI/aGx3BP4chTZykUMYnDx8=; b=r1SSwbWEXgCsVJbSAknJ0wfYUh
	IXfH/Okfensy1mnN/AWTsycmvR/ym6wbvJoeaFVygqlVe/EBWPZvIANdrBzYMxNAK94Uce9sKcpcQ
	TFjCxSulKBtnykyJl5jjx80Wsnwy6a6QFrkR1i6v5spgSy720hf21zgxSY/LPYiDjSYq0iFjmVZy4
	2LE9W+UjB/G0+BuHF6MNSSe+A8+DhnLsPFHTbJ7nlHZzs2mrXHOudaKUbQOqcyCeXb9nhrkygV/IU
	v6tnYsm6R0qsg7NITKdPXCb9viwodhjTvp9pGkY1C4ZWH9GrTnzPfbLVKW3AsSVWI19yjlGn4kF6f
	gJuCe3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8ci-000000063DR-2bb0;
	Sun, 24 Aug 2025 11:10:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8NG-000000061aa-1Mw6;
	Sun, 24 Aug 2025 10:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NIdAVBnnVCHzcsjaaAfuLI/aGx3BP4chTZykUMYnDx8=; b=Bjj+/j1DFjdhOTnzJM1UrfEtKq
	LaeN3qJjvdhelqdw4R/Fp40NgS7q4bMi36PlcFwuisfJ7AdRVwI0aoxdpgX8/cgB0NUVzVsT8BOkG
	ICBRRANwboMmCpBmD5LgshVSyQWWAzyXg15Gy5Cn8+DkOO9xtHN7Is6BM2y/YNO2D4mOjwCUpbk3n
	mblZxhP0uiCwOV1WJnN98eaFFapq4dC1gRiZsVv2qTLdTva/BAqhBSHi1UYCopPg3B5rUtCWLpDPy
	MZHNd301VWNcgSQpjhEjHH1G98DVxcVJQMOcUQfPb8tVcPkW5Ek2R+Afa3TPEi/nfTNqnFVR1ryqL
	Yh3W4WNA==;
Received: from [62.245.128.201] (helo=phil.wifi.munich-airport.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8N6-0005H4-OW; Sun, 24 Aug 2025 12:54:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Johannes Erdfelt <johannes@erdfelt.com>,
	Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 1/2] arm64: dts: rockchip: enable NPU on OPI5 Plus/Max/Ultra
Date: Sun, 24 Aug 2025 12:54:42 +0200
Message-ID: <175603280233.3445205.3932375472449753007.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250812025755.2078-1-honyuenkwun@gmail.com>
References: <20250812025755.2078-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035458_364855_D834BE48 
X-CRM114-Status: GOOD (  12.75  )
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


On Mon, 11 Aug 2025 21:57:54 -0500, Jimmy Hon wrote:
> The NPU on the Orange Pi 5 uses the same regulator for both the
> sram-supply and the npu's supply. Add this regulator, and enable all
> the NPU bits. Also add the regulator as a domain-supply to the pd_npu
> power domain.
> 
> 

Applied, thanks!

[2/2] arm64: dts: rockchip: enable NPU on OPI5/5B
      commit: b3d7fb3fb2227259aa2fc54916cc808614f3ac24

I picked the other patch from Maud for the RK3588-without-s
Orange-Pis a bit earlier. While yours was earlier, they are
effectively the same, so I just picked up the 2nd one for the
rk3588s boards now.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

