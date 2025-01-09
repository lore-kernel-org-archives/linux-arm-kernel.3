Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAFDE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evpzqHxtYX+aFEQtJHdzEeFAuzdxM9ygHYkzc3TerWg=; b=vEqQoMptqBXfo+7u4OsyQZnWYI
	m/UR866dI7Rbq+p/iD5vag8mOUH7jvVkU6FG8GvOF6/Cznm2vn66egVZc9hsX0xqaIJ8GNnAKruaw
	XbHluSWY+SYxojyFCvSRO1C7lEw5wbN/BNI1AKgKiZSFuO274BverHTFT/v0fcRK2wruQY1jfe5Yx
	XgAkoJ2JG25u0weDJ22GVK9RkBz6rYFzhZWl+SiXnIMKSXSc8vsBYtRnPOJi9sguFQ1GZniWafKtv
	LKWRFvDsWE0/rEp2TBG5vVKRJtACPNYglSQMD/f7zyebRU309zHBfA7Mzd3yE8HAIFN9zbF6JzpXq
	fmVkpwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvrF-0000000ClXq-2rje;
	Thu, 09 Jan 2025 16:58:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvoj-0000000CkzP-2Pz9;
	Thu, 09 Jan 2025 16:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=evpzqHxtYX+aFEQtJHdzEeFAuzdxM9ygHYkzc3TerWg=; b=Npsdf93Q8R4QrWJQCTpcejLVWs
	+a3ySUZrk3R2LN5ULgtf1Z0fkzKxeyaAKYNcRGPhSwDe6o0+2NjLlPZ6vXZAE/HBT0IKDrfHYBKBN
	d+Stocy26dfJ9bF2yFW6Xyv92u7SmmtMFb35Cd0W59s9WblDZiqzpsTn0OmYYC4uVfTo+sgNFYvHp
	wNAUUAk6uxS9pG2f6csvo2obODedYV+iYgH+hJKoBRk+vN6eMZw/ziXhPv3bVoKLsRg3liexAEatN
	89qFfDoaIsaLwH28L8/iYWmonGNjz6RCicYAV9ccka7h/WIm2QAZjw07MWjhdR2N2P5DSEwV2SJrX
	hqO+OdZg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVvoh-0003hx-BY; Thu, 09 Jan 2025 17:55:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Delete redundant RK3328 GMAC stability fixes
Date: Thu,  9 Jan 2025 17:55:16 +0100
Message-ID: <173644170628.2899934.16230769617276217345.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <fe05ecccc9fe27a678ad3e700ea022429f659724.1733943615.git.dsimic@manjaro.org>
References: <fe05ecccc9fe27a678ad3e700ea022429f659724.1733943615.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_085533_632893_D7B96DBA 
X-CRM114-Status: GOOD (  12.60  )
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


On Wed, 11 Dec 2024 21:40:52 +0100, Dragan Simic wrote:
> Since the commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node for
> RK3399/RK3328"), having "snps,txpbl" properties defined as Ethernet stability
> fixes in RK3328-based board dts(i) files is redundant, because that commit
> added the required fix to the RK3328 SoC dtsi, so let's delete them.
> 
> It has been determined that the Ethernet stability fixes no longer require
> "snps,rxpbl", "snps,aal" and "snps,force_thresh_dma_mode" properties, [1][2]
> out of which the last two also induce performance penalties, so let's delete
> these properties from the relevant RK3328-based board dts(i) files.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Delete redundant RK3328 GMAC stability fixes
      commit: 3ca11da6e8a7b578c28dcecc31237791955c62fc

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

