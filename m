Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCxLv9WnMGQlaBo2iZMhsA5FFtXSFCDHIfpUpCncg8s=; b=UbrOZhtxTKMU5hMwf1GiYsrUSV
	8M3PKOIASgSssFRB/vl9woGUW1ek7etvyTWukggXtmmD3TfSm41g3CoRRQ68uW7b8ZRMzp96GLXMo
	Bulx6+vbCE2s6ur4HWP5qVNPxi6iQXBY/26iad5QIaHzjiwQ4hV2jnlGZZfM5JBLkAcj4Ncrd+fTR
	UTmEL7nC6Oq8sdYosOOGFyX4kEmNdqG/KTQKL69Fjk4H3xoiEi2+004qfzU1c5AHofqEuMr5Xzt9+
	b7vH2MXG/rVIOT3OYSlNbpfAYNUGk3c2GzQMjeV/6/DhfDGAUiYLwWTiCI3Z7/yatZYsml0H9irgq
	AFArunjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaOS-00000003zK1-3Br2;
	Mon, 09 Jun 2025 11:10:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZvM-00000003vml-28Dv;
	Mon, 09 Jun 2025 10:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eCxLv9WnMGQlaBo2iZMhsA5FFtXSFCDHIfpUpCncg8s=; b=FVsI8kSGXH/0fbjfTXScFinc3i
	azIrJf2m2MMzETH6VlXzIEWGhPwwoCG5p3aqdB8GhbUGRRYgkf8Ks4/9BpoODrKZke8KXP2qUuNyf
	SN0USvvP6Tl84txbYiVPJbAxscz5BoOoveQlzir+PE+GyIepz/ZTF/Lm5EJK/nvdwHc50QHmrDCJ1
	O1lvCogRvYj2LWm69tAxCOcW+J10KTqbnaTlbwIqwzRZZB19+pdM+3VaVEVnB7vNifj8QCRbTZTKr
	VDrWo1bANLJ7Q29zyuwj/0sB8fSa5uH1yzOyCbTSr19s4Kw66rdnHDdSW1/gMwHbAWgL0n08DS+Pe
	D3MZ6e5Q==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfG-0006Av-7L; Mon, 09 Jun 2025 12:23:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: drop touch panel display from rockpro64
Date: Mon,  9 Jun 2025 12:23:06 +0200
Message-ID: <174946455543.762051.12845309784482047662.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518215944.178582-1-pbrobinson@gmail.com>
References: <20250518215944.178582-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_034016_549874_C2F5CBD1 
X-CRM114-Status: GOOD (  12.23  )
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


On Sun, 18 May 2025 22:59:33 +0100, Peter Robinson wrote:
> The touch panel display is an optional add on for the RockPro64
> so this should be an DT overlay, drop the panel options in
> preparation to add this as an overlay.
> 
> This effectively reverts commit b65155c786c4 so as to add an
> overlay for it.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: drop touch panel display from rockpro64
      commit: d69cb63780943fc1b0765bb9b46f627573cc97d1
[2/2] arm64: dts: rockchip: add overlay for RockPro64 screen
      commit: 49760b9f60528393cca3ea35c4d0719f84215a48

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

