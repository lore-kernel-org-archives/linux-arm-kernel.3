Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1423C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 20:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrR+2zWNpEZwV3iTqp2xAc/x4CQZ8LH6NthsoKKPaFk=; b=MH8fW8ywhtXB/RXgqTPpoet+Sk
	adwlQyO4eThUqUKf9VqLhiA9+uvYL8ZX5LAdi/oPNETjS5cFdayRjwBkhR4fVkHrchwkNI3qMEca8
	91etalz0WbcJJ+g4fxtccaY+CaMUAYaKexS/uJwbGCdbSMTRnTYfCbJZCexBS7Mc06PhEU20L55ET
	GnQm8Nr8LXq5tRoJXRD4NOmCQ/xaBTL1Rl6VGz0VJ6HtWETNQAx4ajOkFiem3lEr0lnYMWkaO3Vpj
	I7kHI15XRbgQ4YJPAuZiAbG68bbZbi/tkIWj9NoSwxV+GHXJ91tbiJzwjz1jV+H6GBCZhE/L5nxph
	FpTADTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thx0S-00000005DpJ-2d76;
	Tue, 11 Feb 2025 20:37:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thwz2-00000005DUA-20eT;
	Tue, 11 Feb 2025 20:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qrR+2zWNpEZwV3iTqp2xAc/x4CQZ8LH6NthsoKKPaFk=; b=NsYHkrYTBZ9GMfCvJ5EELeLw7P
	yeU593GVZSjLLwDBWcV5oih5VCinlpUxDjlJDmaJxoYhv1N4dzUoVdUYII7SQ23SV5Rz5jCBOLFue
	olm2HO4Yy9vaTzPpqR6hVHFavbettwuiWa6WGE8Tm2Dm+JTUeeOQ8cQiThQNCnACXIHCS+A3fHDh/
	nZCRrL8JoTaWu7ZucvoOeZwVPFBwko2sf3l9azgxfb2LK1YOnaXb6nS3MsjP5G0O8mo0hnwEXCem5
	A6LAr86MHKDPnvYo/qwvF85sJFMbD/8CgXSozAug1Y88JGkK7eK4mUr60lTSdHn4kpWoiOVcCnGwT
	3/WH0NBQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thwz0-0003OL-PH; Tue, 11 Feb 2025 21:35:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Reflow Quartz64 Model A/B board dts files a bit
Date: Tue, 11 Feb 2025 21:35:37 +0100
Message-ID: <173930613282.1358259.15016931391448973048.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <7eea4ebdb19d5f43d24074a166e6c46bb5424d46.1739218324.git.dsimic@manjaro.org>
References: <7eea4ebdb19d5f43d24074a166e6c46bb5424d46.1739218324.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_123552_542669_4CE9CBC9 
X-CRM114-Status: GOOD (  11.53  )
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


On Mon, 10 Feb 2025 21:17:00 +0100, Dragan Simic wrote:
> Going over the 80-column width limit, and using all 100 columns, is intended
> for improving code readability.  This wasn't the case in a few places in the
> Quartz64 Model A/B board dts files, so let's reflow them a bit, to both obey
> the 80-column limit and make them a bit more readable.
> 
> No intended functional changes are introduced by these changes.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Reflow Quartz64 Model A/B board dts files a bit
      commit: e857cdedbe1f9aedad4e307188c55ccba28a3e76

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

