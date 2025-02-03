Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B404C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSvbgIR7n2lPQ5jF97vs92quNf19M7v9euIe9lcmFwk=; b=LD3cj3uvo0rdhbWj7WtLjwCs6M
	xRu6NRXy2hh2X1JdtePtGEHE0OGYmF1YRfzD3hvZ3Lw97bMRxAmEZFXIWBfw3zWcnXsd0w1Ld2pc2
	7Q2Nw16/9elDvv0QHrNJWerJxrPWRzOrYhU0TuAICE48FotELRAzaUN+lwSbWExymrw0fvg77nPYn
	A2mvZHkytfiyAbDrleIZtEnamo92ozCvp+Wd84Ode9EAuqrFdmnXuHZbwWdZiVnvE5JllM/Wa39T3
	YYa6qAmyttUzbHEA3P37qe2TyTMiDwj4eKObIiVHd0nH9aT6+Zf8u9o3QlBs9LJhTsihOSJYCFNE2
	BTCxy12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ternW-0000000EprS-1pE4;
	Mon, 03 Feb 2025 08:27:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tercv-0000000EnbE-33Ug;
	Mon, 03 Feb 2025 08:16:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sSvbgIR7n2lPQ5jF97vs92quNf19M7v9euIe9lcmFwk=; b=oHHYGW0srNc2mV8G6aLmA1buct
	V8f4DpO36yp8tLTIeAGHhb54c+7wmfDW/I/bCmQp7VCoXcmW5nXb8n7gNS3ehsq03b5xXK7wIJ9+e
	DgOpi/oFxnyo44sqzI0ZoM5TiBxuMazHdLwMCTbMKJRiQt7JMqKsJR7eiFhVSsl9WyU3XP7eDZVKc
	9CcBReE2wPzCFtUcPa7s+F0bYJGvQQRVoxtzy/+G+uXckao2GA7ZM0fThUwoUu0dX7uOKkDvXn9G+
	Nvn6KQMd5lShd583hS83SJZXfiOd+qKaOHT5Rym7ga+qBoF1835ZVhzTyGJ+PxlZ0D1dHLPsEO4sV
	taC4MJYw==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercj-0005Vr-Ug; Mon, 03 Feb 2025 09:16:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Tianling Shen <cnsztl@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts
Date: Mon,  3 Feb 2025 09:15:54 +0100
Message-ID: <173857053620.78657.17789947285666303605.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250119091154.1110762-1-cnsztl@gmail.com>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001617_769260_CEC9726F 
X-CRM114-Status: GOOD (  11.13  )
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


On Sun, 19 Jan 2025 17:11:54 +0800, Tianling Shen wrote:
> In general the delay should be added by the PHY instead of the MAC,
> and this improves network stability on some boards which seem to
> need different delay.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts
      commit: a6a7cba17c544fb95d5a29ab9d9ed4503029cb29

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

