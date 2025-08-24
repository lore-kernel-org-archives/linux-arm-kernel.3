Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B43FCA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+uU9wpzyjFB7VA323aJSgGvIlksG/HNr+9V5PmNJ//0=; b=KICTuDrOfUtfkcGrnXbmk8Y2El
	6zmHz8Y6Uj6/fDBDX2ca6Cy5ar+VrC7a/eVRkBpqYhnlePhQHatJgHNDXexu9uOmjwzrxAoatEEge
	2KnLOaTDyp53IF+vfcgUPwYN/pTW1AEhKaTW3vBJJoPCF/ueEQicxEmMPHgbQf+4foBoEU6S3B97y
	qp/khqI757LrIjcicEKb0Hq5K+s7bcERF8400MZHCefez3Yg8dEJPfafOkPxU+ZZ2erofTgsSwOTz
	qD1jwqXU3OJSKQuq2VaPj/tCYuokf3wnbORz0JfnkBwJCcT72bHY/lfKHLdMdE8mef4EgIYjFk75N
	4Nf01FpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8Ux-000000062VA-0yMO;
	Sun, 24 Aug 2025 11:02:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8N8-000000061YP-3IJB;
	Sun, 24 Aug 2025 10:54:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+uU9wpzyjFB7VA323aJSgGvIlksG/HNr+9V5PmNJ//0=; b=2H64JTKwWpwl5hM3JrLmGzynzr
	vpsbTea4fR8mGpEFnQyOTh6x7EF1i/5FaDT8UUsFBcn1Y9y2X1flqHA7RcTs1MMRVQF6MnLavuu2I
	sj3MIRmE1G5vdTHO1drrC8lVRz3ZA+5hb59S3dhLQWW2J7zeBtswFvYlOXgg8s0gGWuTi7Jntobc2
	P7OivoDJAdt7kqhN15SdRdvwzV6+DEGCZ507hAJW/U4RtPnyHPDjA/OuQIduBQsfR/uLGoNkD3XDm
	NX8Irpp/OQnKVVxm2Q0D/MBnP6JULhY4nBxI01acRTVkXkscMES2fkWQPiGikO/MPkZqJm6FYWAAb
	rGOg5w0A==;
Received: from [62.245.128.201] (helo=phil.wifi.munich-airport.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq8N7-0005H4-GZ; Sun, 24 Aug 2025 12:54:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] arm64: dts: rockchip: Enable RK3576 watchdog
Date: Sun, 24 Aug 2025 12:54:45 +0200
Message-ID: <175603280226.3445205.13621939469481331344.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250818-rk3576-watchdog-v1-1-28f82e01029c@kernel.org>
References: <20250818-rk3576-watchdog-v1-1-28f82e01029c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_035450_819061_F20FA8C5 
X-CRM114-Status: GOOD (  10.03  )
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


On Mon, 18 Aug 2025 19:18:40 +0200, Sebastian Reichel wrote:
> The RK3576 watchdog does not need any board specific resources, so
> let's enable it by default just like we do for RK3588.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable RK3576 watchdog
      commit: 9c059700fee595142676a9bbaff6e40e3fcd9cbb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

