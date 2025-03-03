Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08484C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 21:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZS9W6LWueZRel5mHElMEY/qHM3otop7VBPbgcAUBlI=; b=vqLvk+WlopeM2aoD92dCTmj/9u
	Yl+aLCunzKX09F7pWB6TxAJyNdYKA2S7hPKh0XzdnqqwL0+M16XaFNOTDtQ5AN8m6widh8CmRbXLA
	LwhAMNtwtgDm32giu7a/WuqydIUQ1Epe2uBkvgdByBDcMyCCf8xchzeIEPFckRmu0ZEifmtpBRTOI
	7DjGvMK8BZqh8Q144RllxJ3qemoiCcZH5ecLDRqBh4rJFCCkF78ax0YxZkfjTbs6+GtAXOlY9mgbU
	6B7s1YaomcgoFLbiIfJ7dgJAUe1I0GA3xKOC2n81U1iir9DnkISC9yutuMF2Em+KAoYhIyp++K/ML
	evoDz00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDfZ-00000002Og3-3645;
	Mon, 03 Mar 2025 21:49:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpDdy-00000002OQ9-33Id;
	Mon, 03 Mar 2025 21:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oZS9W6LWueZRel5mHElMEY/qHM3otop7VBPbgcAUBlI=; b=KMTGTLTs3m3xBOfDSyeVo65kNA
	MklFXt7AU/oF3hgMY6RFmAOYW2t1GIy9Ofz7UVoHICWq4Yeiq4FK/shpr8o7RN0rWk7SKrAyRAWco
	hGzvO/A6wC4QkmCHbR4SIEaB4bn1f2VxirBb3Uf+g9yiTQfUJjR0c1oZa5pzVY3F3JabsN+v/fsHk
	7B+pwn0gUgEZpjMUF9fWXUY5deuoJDOq/Wv/eaDs5bDNdeou33NQSYnL8IFQEW7NJtFnLkqzoenKt
	syTwCcY4WwL+RfwU4fIL5bAuqGZ3Jw3euggXx9Uyfr8NGHg3GreoV+WW3Q6XhhQpOiFcgi83bhyO1
	79V4oveg==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpDdl-0005hg-LD; Mon, 03 Mar 2025 22:47:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v16 0/7] VOP Support for rk3576
Date: Mon,  3 Mar 2025 22:47:47 +0100
Message-ID: <174103845739.1823374.12191535922821188431.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303034436.192400-1-andyshrk@163.com>
References: <20250303034436.192400-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_134810_783326_59A5BF6F 
X-CRM114-Status: GOOD (  14.72  )
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


On Mon, 03 Mar 2025 11:44:14 +0800, Andy Yan wrote:
> Here is the v16
> Patches that have already been merged in drm-misc-next are dropped.
> 
> I test it with a 1080P/4K HDMI output with modetest and weston
> output.
> 
> If there are some one want to have a try, I have a tree based on
> Linux 6.14-rc1 here[0]
> 
> [...]

Applied, thanks!

[1/7] drm/rockchip: vop2: Register the primary plane and overlay plane separately
      commit: 6fd4f8a26a21dd2075cfcc7eae3b9d440d886571
[2/7] drm/rockchip: vop2: Set plane possible crtcs by possible vp mask
      commit: b90fa71a11600276c993e620abea8ca9f2045401
[3/7] drm/rockchip: vop2: Add uv swap for cluster window
      commit: e7aae9f6d762139f8d2b86db03793ae0ab3dd802
[4/7] dt-bindings: display: vop2: describe constraint SoC by SoC
      commit: 1803bfb59656d41c4f9f7e5f23188248b649e1a4
[5/7] dt-bindings: display: vop2: Add missing rockchip,grf property for rk3566/8
      commit: 47d31e6598e4fda1433e747ef031cb972c57c5ae
[6/7] dt-bindings: display: vop2: Add rk3576 support
      commit: c3b7c5a4d7c17afb158ba5a41222e95a32886ada
[7/7] drm/rockchip: vop2: Add support for rk3576
      commit: 944757a4cba62b1b50fb51933d0608117599db71

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

