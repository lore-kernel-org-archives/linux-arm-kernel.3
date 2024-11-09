Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A87FD5E379
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/XdLrRd9Xd5DGjwhoQSHywlLvR9zYSL5LpMBZ+yZro=; b=gHdNjNGkWJgQbHvNnKq2BIEs86
	oMoCptndmD9qOer0QyQsSybe55gAJnfCTI4E39qAc4V3FWwxTqIRpplOzx2AIg/4wbm/STuyXUX2g
	PEENJtXZv9Ev0hoCFc8u7laNRB3LiVPjAs4jP/9qOh+WoCJ2BqCqu44K53vxT2A5OfgZj3/OmOftZ
	PWypKVte5HgFCSNKKtwrADrMLN4WOwSKglOl3QJRHpijbYquGnr8qp2NowOu0DWHS0qXmPj/i+iSv
	X4AFlFRPu0TkCYzeBGWgcm5d+ufFf8kM15XSpHo3cyqpUspHvcN1rjrf5iOpGpljrSILBZb/YMdfR
	MsMvhq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qIE-0000000DoiJ-3t8q;
	Sat, 09 Nov 2024 18:34:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9qBN-0000000Dnfd-0lPP;
	Sat, 09 Nov 2024 18:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X/XdLrRd9Xd5DGjwhoQSHywlLvR9zYSL5LpMBZ+yZro=; b=1i/N6t2h3fOqaP9hkFbNDoJWMf
	KJvkZpYgollEVkfKc1GmgqfPTJgDrSSkem3Uj60m9EYYprTRrNXq8x1ROqNYzkF6ouqDkAnuM7Xjv
	7rDs4g76fsEX+9LrtCDQ79dzDpy7B6r5bJtqBZV+dT+3bjFT0o13kOTK4AIspPG6fdNWqOXlDlKsg
	fHM1j4XTeYNxjK/LUNTDcxQPhO/ZXbK4Ef/rwptswZ/xAXGH7uODPj9E5lBXML1Wcy5La7NNSLRSU
	lHLXGckHnJUVmfE+A7/hVIM/s5kPX8KjoF6H08CduldyaqCiUYoeZZOgE4gDFxu0qp19grCz+3jtr
	1/IOKPTg==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9qBI-0007Km-H3; Sat, 09 Nov 2024 19:27:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Enable GPU and HDMI on NanoPi R6C/R6S
Date: Sat,  9 Nov 2024 19:27:14 +0100
Message-ID: <173117675954.1131306.14516383583715120601.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107212913.1322666-1-jonas@kwiboo.se>
References: <20241107212913.1322666-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102737_237522_268A7E29 
X-CRM114-Status: GOOD (  10.22  )
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

On Thu, 7 Nov 2024 21:29:08 +0000, Jonas Karlman wrote:
> This series add the necessary DT changes to enable GPU and HDMI on
> NanoPi R6C/R6S.
> 
> Runtime tested and working with video=1920x1080@60 cmdline on a
> NanoPi R6C.
> 
> Jonas Karlman (2):
>   arm64: dts: rockchip: Enable GPU on NanoPi R6C/R6S
>   arm64: dts: rockchip: Enable HDMI on NanoPi R6C/R6S
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Enable GPU on NanoPi R6C/R6S
      commit: 573a4faab675cf00851273f29feae02d224d2c21
[2/2] arm64: dts: rockchip: Enable HDMI on NanoPi R6C/R6S
      commit: 437fa141ab6509256fca21f0630c5fa57c34dbd1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

