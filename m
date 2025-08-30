Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AE6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aW9LGu3CF6euzt6Lnsx4iO3RXC2O1JmxKXtfo6HvoHI=; b=g55h/hzisRXykyOt+ZtVYjX5As
	35+HGKc/cN51M6R7uWHtCvCmotRLAKHFwKeCn3Gm3tQNBzLUHDA1DLiOJxJdAIDMF8sG0I4dIIUNe
	54UpOSFWV+9twDnyzbYsSnmaCI2bZsLBO0Rt/dxSBxYiZwzOBD0g3eYLrTMvbNmnQFzVwgiUksPih
	wWKk4qBf/DQeGSKEuvsKADRpjjEwIeli1Xr8mOc7kQsrN0v7LGVP+A10JQKXWildNDXxO4UFQtxpP
	YZzF5b5zYkasucCqS3xWytBc5Sr8u+/t1R7GUfCGMnl8rCWvQ77MS4czmingzqo7nepLEm8FOkQ+h
	C/ZYPc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLFp-00000007u55-1QbK;
	Sat, 30 Aug 2025 13:04:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usL9h-00000007t2K-3cQd;
	Sat, 30 Aug 2025 12:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aW9LGu3CF6euzt6Lnsx4iO3RXC2O1JmxKXtfo6HvoHI=; b=glPsh/ESSL0d1WedMKArvTtqr3
	lVffULGdmcdtItMdkPqP+e8PbMBO+iOK0XqbpV9dX5C87mk2t2lBVBqjhFzbnwmOGe9woHkw7nCaJ
	To98WPlaggdLtb0/W3TPX2692siEo0vmEEOLn29x/2e5tQmlK+m/xZ2BdhJNA9sSf0Yno817wZwcM
	d1TCv0pJIEcEWpColyQQdiXNxDkA9iIOvhCCsQuB2XYU4/bQ2YudiANj2yCVqJ1tYjXE/m5S6pfAn
	6KQOttA/WSwDr2p6QD1/ZlyA55in3CKZhBmwpECjt1FUWIWI230Dp7Z7CNuLIbUhnuFRhmJvDPQJG
	0jo97lLg==;
Received: from [77.241.232.9] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usL9f-0007bC-Vf; Sat, 30 Aug 2025 14:58:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: soc: rockchip: add missing clock reference for rk3576-dcphy syscon
Date: Sat, 30 Aug 2025 14:57:56 +0200
Message-ID: <175655867261.3578496.11838740893720919956.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250828131107.3531769-1-heiko@sntech.de>
References: <20250828131107.3531769-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_055805_914268_2AAA4C43 
X-CRM114-Status: UNSURE (   9.95  )
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


On Thu, 28 Aug 2025 15:11:07 +0200, Heiko Stuebner wrote:
> The rk3576 mipi dcphy syscon controls a clock, so needs to allow the
> clock property. Add the missing entry in the list for it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: rockchip: add missing clock reference for rk3576-dcphy syscon
      commit: 941b9a558f34c8cab0a28f3387d5f4063a0ef5f2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

