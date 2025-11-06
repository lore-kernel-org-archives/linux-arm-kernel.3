Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E2ACCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66drUzeJX6dC+QazFCafnL4iFqkKi3oQMXaB9Tb7WcM=; b=C8s3VvRJv2DK911S5KDvHbKInn
	aOPfJdUHBCtrAnN2e8RNL/fRafAGh3gkBLDNuzW6BKXM+O3sXIciB3plVbXkou/IVFBKjQviYoJhX
	B8w/bTm1EyonJRjbhh3XmifhGBibDs7DCTZtGbRwIyCtvF28up6DxHwhm+hiABZBKFxG7nWBX/TCq
	mmmSQHioZ5jGFxKuiVvU5ITGC5/zoVf9Vglt7gsNOJ7BYN0iM6hV7DGfsdwGm57argo7IZmmFKRhl
	4lb24oToxpTTLyOBpnsO0TNDfrAX64CYDys1fQXX7BQ1nvSpSC1qvZoT3MTxn64i1RTu4Bgh6fBgw
	XKP19dJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8wG-0000000GL9w-1lf3;
	Thu, 06 Nov 2025 22:58:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8wE-0000000GL7Z-1jZc;
	Thu, 06 Nov 2025 22:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=66drUzeJX6dC+QazFCafnL4iFqkKi3oQMXaB9Tb7WcM=; b=ZPFSJYhhgvdGSqHJsmjYioP6XU
	iWy7sNTs8wyyXn/U0r6s4afa/omTIMnDQ1l/4dIoq+HU0dAyN57wwHJtYzIhpG2L3GRFwRCWdC/oQ
	hJhQcAMao/ikKUkV+4owK26FjNGnyorWIC2sGROe60yKXDtNZJvhXTxAFrIoB2vPHXLYkxj5OtVl+
	5M0l+4mbeFV3627ToS+wW7dl1FtXIkHwVbyADhtZdf6OheU9tzFoRDs2ycwh/yVR5B3HDoL71a4Ru
	UeDhvPFKrFlogEBgv6Ag37glzywbvRKvvpIxVP0yPnBG3wXUAYi8BQE5IBSCkH7/yF7auo01E0uVu
	IvOtQLVQ==;
Received: from i53875bac.versanet.de ([83.135.91.172] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vH8wA-0001pr-7L; Thu, 06 Nov 2025 23:58:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add devicetree for the 9Tripod X3568 v4
Date: Thu,  6 Nov 2025 23:58:32 +0100
Message-ID: <176246989738.210200.5023344118308147970.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103171702.1518730-1-coiaprant@gmail.com>
References: <20251103171702.1518730-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_145842_464401_F9D9EFE8 
X-CRM114-Status: GOOD (  10.04  )
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


On Tue, 04 Nov 2025 01:16:59 +0800, Coia Prant wrote:
> Change in v2:
> - Add vendor 'ninetripod' to board filename
>   > 'x3568_v4' => 'ninetripod_x3568_v4'
> 
> Change in v3:
> - Fix Makefile
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add 9Tripod
      commit: 25802f8d16374bcfc1e32d26fdee0d89ec82f865
[2/3] dt-bindings: arm: rockchip: Add 9Tripod X3568 series
      commit: a12838aab0cea1e4427d8d620906ce6a1a83a344
[3/3] arm64: dts: rockchip: Add devicetree for the 9Tripod X3568 v4
      commit: 156a530ed5ed012f35e8319c2ee5223dfc7195d3

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

