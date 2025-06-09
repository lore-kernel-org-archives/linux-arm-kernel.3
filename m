Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEZECS6vbso0nmjjQa/VPYjFi0sU5YUT4fgKEZQNaBU=; b=GV2WbgoToyV/KqdQ7CPR65LvI9
	/jK2BdNOQQWUC/5w5cXD2Lne9qRXZR3YG3Hq0crfCyNbOBQfV4LddnThmUnhQSoSHO6UoUYMTCdsJ
	4C3fSKOaU95InV6EZEsKQ7cpLsPb+GTlo5Zvwx0M+NbEenDRK1/fCYHpeJH+PzqV6JbzZTz9gqzg2
	TQ1EA9BoI1d0G76PI10KslDMJ4p2WqBui1aZbl4iNdS3gv9yZiuNv2h2LMj4eiBhCtcS26GOQi0To
	pyl9FzTomFMVKEz2cupJ5CGLEK6rvL/w2HCzx9K7aTJWltnWl1HvX4ujSoBtaX6GWDQ/RutAIFcuV
	hjkcn20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOa2m-00000003wcz-1s8j;
	Mon, 09 Jun 2025 10:47:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZfJ-00000003tWu-2ifH;
	Mon, 09 Jun 2025 10:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=xEZECS6vbso0nmjjQa/VPYjFi0sU5YUT4fgKEZQNaBU=; b=fODl7cRehmK4ybPZIIU1U4jMKE
	dPgLtOuOCi5cqZojh60rej7k5NPL0tStWG7D7HbcTAvBOSPx75B209oeP+3R/C9xiUQbioCLAMZ4V
	Zl0oKlcj7Ayafdx9aAz7rE52pUr+G7B/8A+A7LF4+rC+HVYz3JgTV8K/wi/YTZSXNZB3NlN+MfFdo
	UoyDRdX3d9wT/nJCM4E7j++YDXkkFHee2KERGEKMBXReMes3RG7P/JLpXSU3uOCZDXxB1/AjJiODG
	4G7XcJjTVB5OIdXdh7zSoWpDaczZyMak3YU5F3SnxlfThwJncTfrLnTzJ8NegrrdOOhXUnRX45WDj
	ai11mSdw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfB-0006Av-PN; Mon, 09 Jun 2025 12:23:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	conor+dt@kernel.org,
	jbx6244@gmail.com
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
Date: Mon,  9 Jun 2025 12:22:57 +0200
Message-ID: <174946455537.762051.5518711921835874992.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250524064223.5741-1-andyshrk@163.com>
References: <20250524064223.5741-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_032341_682722_BE423E8C 
X-CRM114-Status: UNSURE (   8.88  )
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


On Sat, 24 May 2025 14:42:12 +0800, Andy Yan wrote:
> cd-gpios is used for sdcard detects for sdmmc.
> 
> 

Applied, thanks!

[1/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
      commit: e625e284172d235be5cd906a98c6c91c365bb9b1
[2/2] arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B
      commit: 98570e8cb8b0c0893810f285b4a3b1a3ab81a556

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

