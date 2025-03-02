Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1074AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 18:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZ/DoE1yc97NpsQpvLoLxdu9zmvqzr+lgS2ZIi9J6sU=; b=eq8WoRiWmNtGQDe7Il3oaUrfqZ
	W+UrDJGkNTEq7f0aBNZ3n8dSVv4pYhWDJ8Uf8PJNjBqT+nU4cvhBB/5/Nd6FKXtPqgjR8dqglv0nh
	IyxXXbhvwOoPYurK6Bx42F94Le4Rw8BDug3asoFaJKbO3JZwD8r5I4HmtO9X+6ClNdUJaqwQ4bC92
	dJaS9PcUKwWZj1NpA+PL/MJgg4XtS/zZKKium2EAf21j2x19pCoD571XCGM0J5BH+t0byWUV8yz4C
	XWePZHZip0XMqVQpAs9k+3btiN20PF2uxAXytxdiyP2zMMqXi5tIvGJ70P+6Oz0f4yGXhDa4ZSgQC
	u5AebK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tooBI-0000000GWKx-0p8M;
	Sun, 02 Mar 2025 18:36:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1too9k-0000000GWBD-0A1a;
	Sun, 02 Mar 2025 18:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cZ/DoE1yc97NpsQpvLoLxdu9zmvqzr+lgS2ZIi9J6sU=; b=Jsm3b1oDc70U9C/3D7TLrx3JRr
	jCsY8BfacHx/Z1nUEUfvhKDiTCSutyqnPtxicC4BQnAiQtxIJoVWZ/IY5e0ROIdPweu0njw3HNoys
	Vh9s0LtE7LPkTGiAQMDCuHgHVkAJ219RDxkpZxqKBgwbxOtd91jIvG3Ml0DLg/IM/OnKZ7MxMSNUv
	gXLgcZJi6DHjySSevZLkkwmLZZf5RHFTOpYtM6Wv0fsZBmgdKX+Vce/J9WdgI9GvwWumGStIqXVqm
	3sLNR8ToSvENHcCtY7dIf01oJgsfn8JUiN/k8xJFW951ulY03VWr6yLPqBcdTT8qsSXF9dmy1Jcii
	vbDtfIjw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1too9a-0004l5-8Z; Sun, 02 Mar 2025 19:35:06 +0100
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
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v15 00/13] VOP Support for rk3576
Date: Sun,  2 Mar 2025 19:34:56 +0100
Message-ID: <174094048722.1377102.8343744540534603918.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250218112744.34433-1-andyshrk@163.com>
References: <20250218112744.34433-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_103516_098671_CC478BC6 
X-CRM114-Status: GOOD (  12.61  )
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


On Tue, 18 Feb 2025 19:27:27 +0800, Andy Yan wrote:
> PATCH 1~9 are preparations for rk3576 support
> PATCH 10~13 are real support for rk376
> 
> I test it with a 1080P/4K HDMI output with modetest and weston
> output.
> 
> If there are some one want to have a try, I have a tree based on
> Linux 6.14-rc1 here[0]
> 
> [...]

Applied, thanks!

[01/13] drm/rockchip: vop2: use devm_regmap_field_alloc for cluster-regs
        commit: ff0b6c031ed3ed31024618340c795523a86e6688
[02/13] drm/rockchip: vop2: Remove AFBC from TRANSFORM_OFFSET register macro
        commit: 838a871a4d51b59fe56ac0422b97443203bfa55c
[03/13] drm/rockchip: vop2: Add platform specific callback
        commit: 328e6885996ca2c6eb8b07d3c9bb1439fdcb088f
[04/13] drm/rockchip: vop2: Merge vop2_cluster/esmart_init function
        commit: 145c9b36892a07bf5e2525b4938e1a6cc9b41b7a
[05/13] drm/rockchip: vop2: Support for different layer select configuration between VPs
        commit: 5439c4f3cb0ec11a3f3cb70be2b019770f6d183c
[06/13] drm/rockchip: vop2: Introduce vop hardware version
        commit: 301618ed1d8ab7cfaec39b107eded9f263da2299

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

