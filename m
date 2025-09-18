Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8543CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAMRs3EbyF1XGGaTsvBP13Ccnhqr+M87FnxfkVVVsrA=; b=EIE94f9Ho93X/FEVXxNn+wxbuJ
	sseQWSaXHrrpxKJh0xYhJvbuz6fhtQqLPUt7lw9DGEiDpfbWfjfwE/beUT52mwGh/mQe9Plt8EMew
	2h7bJu22gfNUiLSiE5Q7WHaADVhjeDdDMycvwfzdi4XCt9OtQOld9tAVdPfhEOywpZJ78r/3bWifa
	eUnoHN0nWnYLoDwyFGHu27cb2dPwQ90zxEl+uKBgGNL3J+SIClazbDUzxH/L9FqPrpcFYqNzxJYIj
	8SxPYN1Qvzd5z74aWIHs3nfKkxia4utvwWVzkmb4mX7mgXb2MAqrKDSMVH9OzORqTr5us1x2/AVce
	kHsIi1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtB-00000001AjY-3Wn4;
	Thu, 18 Sep 2025 21:10:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLsx-00000001AZa-3Qzp;
	Thu, 18 Sep 2025 21:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vAMRs3EbyF1XGGaTsvBP13Ccnhqr+M87FnxfkVVVsrA=; b=QLhSWJje2q9bkKWYMbzv52HhN/
	HzUnlzdWtIoi9KQ029azp70hbVLwXAAWVJU/uZrJjzWubno8jmUIWtkwFoBPVi1it05SAXye3V+sn
	yk8nvO6Jm4bA2/FZaKZ1wCfo4t4EcDkprstmO41PNmplxUMJsODEP4CqGcXSSWn964HpzSsDRrtTm
	W/sJQM+Ga864a09zmETnkFZFAsNG4ShZnSNy5eaP879sKfo8odepzClivCapClBmjpdU585Bdh1lk
	jtNJj5Lm1suw0vBtVueLDTcWDFQxdZSHnj4pqw9GBzzTJZn6sh5BCK5AVkn0oEcUKYo2VpUHyMMuk
	m/d6GhFQ==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzLsj-0003SC-5k; Thu, 18 Sep 2025 23:09:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Kaison Deng <dkx@t-chip.com.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Wayne Chou <zxf@t-chip.com.cn>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for Firefly ROC-RK3588-RT
Date: Thu, 18 Sep 2025 23:09:20 +0200
Message-ID: <175822973680.1568500.8881843891628390459.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1757902513.git.dkx@t-chip.com.cn>
References: <cover.1757902513.git.dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_140947_907081_C9D23839 
X-CRM114-Status: GOOD (  13.13  )
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


On Mon, 15 Sep 2025 10:22:03 +0800, Kaison Deng wrote:
> This series add support for Firefly ROC-RK3588-RT.
> 
> Info of device can be found at:
> https://en.t-firefly.com/product/industry/rocrk3588rt
> 
> Changes in v3:
> - Change rgmii-rxid phy-mode to rgmii-id
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588-RT
      commit: 0bb8d67611b59740f47ad57658a8d2986c43f8c1
[2/2] arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT
      commit: 93781211e9ad9578787355147c2f28b7289a8ec6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

