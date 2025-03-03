Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C663C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 22:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVKxuo1W1BxE3FJKf7YbMkOhKpBvK2Ol0T0KlNBKv7o=; b=ROy95XwLRduiN+wp3IdoJGHLJM
	HHzhXXg97Erk4v51oCi3texcqBpNATj7rqRK5Cu7IAfHWoMmXJYXzNPRb21zSymw9UPBaDdIx2h9q
	dYDRqhGALLMNvz0s7Dv9j2MkJk+0ZH//seSbhq5lMGFWnhltJhiurh38MibGO/TnSTKBuzIls2ztP
	sUb4y5F8f0cBcWTE9lr0mE4fC7BpVn5tItshwELHNXqXVrRsAyfx4VqrI1U5IdjAy9MKour3NrWMG
	6SpF3otQhMifQg6HCx5rdPUA5Do/xuBu+DzGb0PYBaahG39Lq3rsY6VoWTgWLlhygKeQezSGOx3G5
	isYTXDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEX9-00000002VM9-1qx3;
	Mon, 03 Mar 2025 22:45:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEVa-00000002V9B-0R6r;
	Mon, 03 Mar 2025 22:43:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AVKxuo1W1BxE3FJKf7YbMkOhKpBvK2Ol0T0KlNBKv7o=; b=aDnmYlnmuYrhIaA0ONYcTOUxRY
	KZ7m8hrWZnAkSc/n4H5qBIjO2jzAITieERvYwcbgNsC4HJv6piGgoWLvrHd4WZ1lc25QWfFwcgXcC
	KgrI0KQ5BSzpUXxPF1Mvlrms/K0lNbBNLgJmHB7ne0/52hnujUALKrWqF4TSTalaRCCr4upJ5Q9u8
	Bt2a0hojXOOlm7Bzd24GXk0CKbp1jUmMa1OE/cEcYW6WGyjQdUHAu8mbMQ18aj6mbr8PlTPehwi4q
	Mc1e//pi1ncYZlLsURNMjw2K0ed9G4Lh+9S/BGXKzEe5o7yfDHhIF55gN/jz3MRXEeJFalp06uhh2
	pIE9G4RQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpEVK-0005z3-Hk; Mon, 03 Mar 2025 23:43:18 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/rockchip: vop2: add missing bitfield.h include
Date: Mon,  3 Mar 2025 23:43:16 +0100
Message-ID: <174104179297.19992.1129192365556530821.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250303182256.1727178-1-heiko@sntech.de>
References: <20250303182256.1727178-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_144334_142007_B6E162E4 
X-CRM114-Status: UNSURE (   9.25  )
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


On Mon, 03 Mar 2025 19:22:56 +0100, Heiko Stuebner wrote:
> Commit 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
> moved per soc configuration code to the other per-soc data into
> rockchip_vop2_reg.c, but forgot to also include bitfield.h for the used
> FIELD_PREP macro. Add this missing include.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: add missing bitfield.h include
      commit: 95a5c9d197bb22a506913acb330a926d4e51aa95

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

