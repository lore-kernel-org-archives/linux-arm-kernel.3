Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D4AFEC10A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSECv1OVuOQtvHFvE1M/Wc8ov8pydQb30vNJDMTEfro=; b=qHYbQD2EEMeuVF/fZJJbweHBLD
	mkF3IbPh1ktoQ1IHOvstBJnsOlpyPnXKhjO/fWNd2ZM2Q7ZyncNVMlVXCd1uirynAqE5+z2XmVa+w
	KQZQbvLz+Qfh6fVCtyuKGtg3O40aGwI6gYcRJ1oCSVSjoM//mwBtW+fIpwZjVYuPOthRmKr7Y9X0k
	GIe5qP6LPS6ClZzsJI9JYoAqtoozwIXCR8BOBlFbGgRRaIgllHG7B3PoGWXw/dhUIei1FYgtpxNVS
	r3saT9J3pLtFTuuskxuejHyCiLFFlA1SwvpFrOnruHnDk8Agp68g9NfzyGCl8bqn7cuF/fi8LzmNt
	/hVYUiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pn-00000002BKu-1HnZ;
	Tue, 24 Mar 2026 19:54:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pN-00000002B5y-0SQl;
	Tue, 24 Mar 2026 19:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rSECv1OVuOQtvHFvE1M/Wc8ov8pydQb30vNJDMTEfro=; b=BKwGRvQts0E/BK+8liAolY6R5G
	GHzfgcyu6lstm9Ap5WLpMeaUwAc8IuZpDZ5LjEor/SMg9+KMG6fQ1+vHtGCFs0xfai57pHRQ6/wta
	dCs/qB/Muu5NjZ0LLZGN4f+Bh9xzJ8wCza9a8uzF2S1XrdLr4DL25LpL7lGn+jgynmBW0VieDWhub
	kez39/UMy0aQvmUmZELYBkAlN5hr9mW0bgQMFVN5S1cPER2iqfplypje2PDooWZGq1VkDv6vym2JM
	W9EFZneo6Qh3PqkH9Slh+0gwy77Ad2UfcXP2MQ312CvNq1I4j86B3lTjmoDdA0IQBO3DzE47E1GTt
	K8+bhNPA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5t series
Date: Tue, 24 Mar 2026 20:53:54 +0100
Message-ID: <177438200687.818857.194935185801364893.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316073621.39027-1-linux.amoon@gmail.com>
References: <20260316073621.39027-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_125413_168217_4DC5A14F 
X-CRM114-Status: GOOD (  10.76  )
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


On Mon, 16 Mar 2026 13:03:55 +0530, Anand Moon wrote:
> Add supports-clkreq and the corresponding pinmux configurations for PCIe
> ASPM L1 substates on the Rock 5B, 5B+ and 5T.
> The supports-clkreq flag informs the PCIe controller that the hardware
> routing for the CLKREQ# sideband signal is present. This enables support
> for PCIe ASPM (Active State Power Management) L1 substates, allowing for
> better power efficiency.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5t series
      commit: 0f36806da4834cbdfe790de6b88347348cdad32a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

