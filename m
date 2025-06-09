Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C54C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgA9iDSNL7LoVYBeJupisyslNFsqQpP5M3SHNxVuOmA=; b=1wpeEez3C4ZgWStC5q868SNCHE
	ub3Y2J0Q2hhJ1xgj7rQrv8nsdDH1pEFTxFhKrkCB9wbV9pkKzz2YogUz498awwiXEo+wopCuo6Qty
	GUu4vJKKTafZlw0LArbQXbxMcUZ1CZ2alK3btYOl8vKJ05ufIVF397GFWOnLfke1jocpbIxWLhem2
	rWhqKxUmoEiRxQ1/64Douadm2bjImlv13JQeYkpv914OPPIp7zH36s4CmG96wsmr8f+CG2X99Tdav
	RSbSSTmAbNpKW6DbQqFRgCz1e5fbu900+UPE7T92QgOg2X1nYc8mBTgsUNyuvhoZp4KIFroItd+hS
	0RNffAfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa4v-00000003wlz-2Cku;
	Mon, 09 Jun 2025 10:50:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZfM-00000003tYC-1l1J;
	Mon, 09 Jun 2025 10:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WgA9iDSNL7LoVYBeJupisyslNFsqQpP5M3SHNxVuOmA=; b=MAGJK8lS/jQ4xm07Q89bSrfWtM
	JPeaVzwQQpJ9y5O29IsxKdbcZZ6/HU8+WUZeisdxndhzQCJ9A78H7kDOXuiodS+OlFO3yqb2Ck32O
	mFi8jDh+N7NR8AI12sSinqV1fxdoa9v1mvrijEn1azPCsbXtOP3ZzrdJQg67L5k85s14NITXlOw/H
	t6vrYBEoX7lBzsqE3goioeNICVYokmbmvBZTW1r5rozhgWuoDUc21E3u3Sk1GoXx8AaVzrn5TqZ52
	cltmFn0kIgxaLQ7XKobqZyyENxkUa+b6RZucL+SExjZuII0QS7shhXjgip8IQxRh+Xuk+UQU4WH56
	oe1EQ4vw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfC-0006Av-8m; Mon, 09 Jun 2025 12:23:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	simic@manjaro.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	algea.cao@rock-chips.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
Date: Mon,  9 Jun 2025 12:22:58 +0200
Message-ID: <174946455535.762051.10507198799610616035.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250522020537.1884771-1-andyshrk@163.com>
References: <20250522020537.1884771-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032344_452268_E9A1EE31 
X-CRM114-Status: GOOD (  10.74  )
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


On Thu, 22 May 2025 10:05:24 +0800, Andy Yan wrote:
> For the RK3588 HDMI controller, the falling edge of DDC SDA and SCL
> almost coincide and cannot be adjusted by HDMI registrer, resulting
> in poor compatibility of DDC communication.
> 
> An improvement of the compatibility of DDC can be done by increasing
> the driver strength of SCL and decreasing the driver strength of SDA
> to increase the slope of the falling edge.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
      commit: af9feb0b85f92d2972061224839c5fea5ee39f6d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

