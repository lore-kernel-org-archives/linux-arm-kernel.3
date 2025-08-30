Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C33CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/dkWKo2DNAfJeWWb8yeq3cKKBe9SgmP3N40zr/J1DQ=; b=YYGHAjgpn10BKUHNAgq+T94/on
	8/M+fuay/LWKrygIxVPXc8OcNag4n+w/oa2WX3AKNTiBeTqusOCvduvRXYc/9eR3Nuw90soFJen8F
	YLO1O/4+DJe89r88bQJzlAulDSG8rp/NhQCiotkhEFmjgYChkalJBVzWJQgBDPO/1Cie5a5YGzJeM
	H4sNpuZM2Q00DanXTLtIw1eA5Km0MNO5uZIfeh1r0eY1kFAdTqwG4myFHzrOTbEvEFZR+CNKlueTf
	o9wQrs1yBQoZzg0TutSKtEemyqMPoXzLFKI4qUs1qiryaqEqDFEH54KnQwJ76KQGYj7rtIM8b0lvi
	wHtqU6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLLG-00000007uaw-2vZL;
	Sat, 30 Aug 2025 13:10:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usL9h-00000007t2H-3jK8;
	Sat, 30 Aug 2025 12:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=x/dkWKo2DNAfJeWWb8yeq3cKKBe9SgmP3N40zr/J1DQ=; b=govHmqqpHCquzVG0n0T3/QySIt
	eRbzqlM6tmeQQi6bDjG/q1sdTkrodW4yK6E8c5hE4OiueE9kOFGHxx7NpuewBDPTRCddfOIOSkSar
	2R/p49BFdKH0fdQxv/loZAnpYYiS5vpAL1QOGKXtxyvZgug12XA1tBOy9d5q24oQ2f9hbpabq0GNc
	F9fbfxe38dDETxaTc1kQTKRixx+RadQsjapk9Ihoe1Q9d57DpyU7zE6J2Z3zPIWD6VotLSSjaCEVi
	H4BfukOhYJPHdQe3pFg9Rl2nuaIr34KZt1jYAN1uCnBVlTGkleoIvTsi+EiS3Kw0Qh8iAYkVvYol3
	4Nx2NbjQ==;
Received: from [77.241.232.9] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usL9f-0007bC-AT; Sat, 30 Aug 2025 14:58:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Hewitt <christianshewitt@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: add USB3 on Beelink A1
Date: Sat, 30 Aug 2025 14:57:53 +0200
Message-ID: <175655867259.3578496.17878662770551692525.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250828171645.3830437-1-christianshewitt@gmail.com>
References: <20250828171645.3830437-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_055805_949076_A0F0A22A 
X-CRM114-Status: UNSURE (   9.10  )
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


On Thu, 28 Aug 2025 17:16:45 +0000, Christian Hewitt wrote:
> Enable USB3 for the Beelink A1 set-top box.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add USB3 on Beelink A1
      commit: cd20b50f4ea926aed3586f7200d95727368b021a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

