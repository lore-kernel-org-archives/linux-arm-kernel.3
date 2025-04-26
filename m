Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42230C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 21:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cer4wksqyIzXNmo0vxNsCzf3aimDFe38DROHviMKDT4=; b=J6F7vvgh8AYX4oleqaNbEExeCp
	6a+hH+bO0a0PRnioay/ZPnk9kLWSj13sLwoz1m0XugCx7ruwRzuHzgldFFuY+z8lh7L/j6tvodl+e
	zj47Knut0ycCIwqqXARtpFMGuA5sJZ46NjqVU+Qn59kb8CthaihmlZvk4nuDPxWCpFpyk8nkux8zJ
	Ti9nxkZN975RSME2fRQLpN4rPw1NrGZXHMDYN+xNkdlPTOwdGKQeZAQ0q395u4/REfSOGN/vZHfv5
	G5LSHO6QoRJTqbItZd8RR3fR3r8SL56mZqTWQR5tA6AyaLW9dPmsyRiIGxJIFFPPbG636enbaKE3M
	/tlrOzUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nNk-00000002Xh2-3Vif;
	Sat, 26 Apr 2025 21:48:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nLs-00000002XJY-2eTi;
	Sat, 26 Apr 2025 21:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Cer4wksqyIzXNmo0vxNsCzf3aimDFe38DROHviMKDT4=; b=hxesiz8iu0hYpmdBpjdA4tQlOF
	t0G50gBd6vwRQiUlQjjs/H5jxJmmUYU7dECITCv+C6fkEUI68BUzaje+1lznBUHTe/ssV4WrnATUa
	Xhn5jXW3npOvu/twM9ZWVN5fhNVMx0mRNoWAobNcrBshQ84Rv81JITPLxQvKkAuJoF/A7tS+rmLEI
	/0i5ZFaDLVXqrXWWdrVRugX2vzbG8ArI2iDeUiBJSnWcdQg0mrMS0+RoqpMAH0H/HxcS/1cWYLCfm
	ktLKeeUE3AOylBWqjEqRyKPhZ9NnCRVHBHGlhmUU8euNBOogYqa8wvYAzP5HuvM+1xhtfhZMm8E9o
	frSTOW5A==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLq-0001OR-Oh; Sat, 26 Apr 2025 23:46:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: add and enable DSI2 on rk3588
Date: Sat, 26 Apr 2025 23:46:09 +0200
Message-ID: <174570370108.31943.14492430799638906763.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226140942.3825223-1-heiko@sntech.de>
References: <20250226140942.3825223-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144624_694381_130F9737 
X-CRM114-Status: GOOD (  11.25  )
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


On Wed, 26 Feb 2025 15:09:39 +0100, Heiko Stuebner wrote:
> This adds the dcphy and dsi2 controller nodes and adds an overlay
> for the Tiger-Haikou Video-Demo adapter that provides a DSI display.
> 
> changes in v3:
> - rebase on newly added overlay-test-infrastructure
> - add reset-gpio to gpio expander
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: add mipi dcphy nodes to rk3588
      commit: 2e177b85541d1a5c28a4d64dabec8bdce0461a79
[2/3] arm64: dts: rockchip: add dsi controller nodes on rk3588
      commit: 0d0947766d877b63729dbef502e75827bf4ebca9
[3/3] arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter
      commit: 14e506dcf3b0a311ef3df5a86b810fd9ede0f30f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

