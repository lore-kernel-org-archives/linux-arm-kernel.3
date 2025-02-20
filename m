Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD57C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR8ijKB3JqpL8pV5Bk+/2fyVFlUM7QF+r6boQ5Lr92c=; b=uUvdQbx9+rWht1cAVSB98X6MYj
	4ToRx/6vRiK00CtfoQiSuxj6sk7uLv7GMaabHgpWExAELTHWxCc3XmeKAU7bwLeCANuXKrsPNscRE
	6r73/cJ4TBv47UaNluh42bOCCWNElN4PBEgIvpivEPCh85s1hL8VJtRgpNo1/18Zpfc5GWdED+OIk
	mmeByMBwq0MNjEnAKVnRXgrv9OH0LT+MVEj07OCFHnPUxvYFRUsqYqOqNGyqWz2Ywl/ERSyDFUMGV
	YfXEAa3YWZXistlDVrHLBWQq79bAuNhtTXdA73vgzLE1MEV7v9Li+gLr/IvM8NDj1/JGQehcXNXp7
	Cm6k6RKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2w1-000000002wd-20Jv;
	Thu, 20 Feb 2025 09:33:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl2ty-000000002KF-2R6k;
	Thu, 20 Feb 2025 09:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lR8ijKB3JqpL8pV5Bk+/2fyVFlUM7QF+r6boQ5Lr92c=; b=T/PMmnlM7C/f0zTQljvckKyjoy
	o37J4FXagT+NMydiD6D1ZY83KvKREVopGkgUSs3PqenRjdt1jPttBnqtnIP5itf/xh5Vf0d8ulH34
	an+a02uWsUPNy8mngBiLFV6i19DvtB54Xs6RawBTeXeGFaAmWakp+Ljbohofqs1efOvCitovAjJza
	+RAPJNxTviNbaKhIxpRb/9cyllCYzH7FIUWh/fRpKj0PFJqyOvjZfkM4mKfukr0twLPMID6Xmqmbt
	DviMDaZEVOIhpFPbY5AIEBlz1tcuSjFhwv3LdiGizaJUxce8JT9ahFFZxCCRj2nrFT7K10uqI8S3/
	opw/nKmQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tl2tw-0003ew-Bj; Thu, 20 Feb 2025 10:31:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lukasz.czechowski@thaumatec.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
Date: Thu, 20 Feb 2025 10:31:14 +0100
Message-ID: <174004386808.2551340.16092707795307058059.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250219093303.2320517-1-heiko@sntech.de>
References: <20250219093303.2320517-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_013126_648485_6EDE1809 
X-CRM114-Status: GOOD (  12.02  )
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


On Wed, 19 Feb 2025 10:33:02 +0100, Heiko Stuebner wrote:
> The sdhci controller supports cqe it seems and necessary code also is in
> place - in theory.
> 
> At this point Jaguar and Tiger are the only boards enabling cqe support
> on the rk3588 and we are seeing reliability issues under load.
> 
> This can be caused by either a controller-, hw- or driver-issue and
> definitly needs more investigation to work properly it seems.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
      commit: 304b0a60d38dc24bfbfc9adc7d254d1cf8f98317
[2/2] arm64: dts: rockchip: remove supports-cqe from rk3588 tiger
      commit: 3e0711f89e5e7b0c7b2ab4843dc92dcbbdbba777

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

