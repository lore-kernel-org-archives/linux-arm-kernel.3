Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BE2D2ED11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFutUY1+i2Abz9/+lY5B5zMjLAf/XXdfuIZO3h7kvBM=; b=UGE6pgDwYOfYejeSBw/8ZReKpw
	j6CDtCsYklQDxpi5jmkCJ/gkh1sEwlHoxTKYtLxE7285RcXRXxa/pcnAi3YchR5+KWdKrnUMfxWiw
	T1uI7BLDZd8O2DjU7j0Nb4mMYuR7bNTCYcucHwEOTXlrWv0TngzprDnjmMndrzA7kSAl97aBjXNPk
	QGe+xQpuVvJCWj00F1CHCy9/KsSR2G1SJx3wKYdvMuQggjFiBT0qME+WmcCloP6G6Kq6Q2UJaWorY
	xaeBnTVIAqVTjA5ZHxB5imNreEFXH37swgzym7jFa86hbLycVBzGUQlKgGtepFBPacIOgYvnRb11i
	pLKmJzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8D5-00000003XjF-1FMu;
	Tue, 20 Jan 2026 09:39:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8D1-00000003XgV-0qDw;
	Tue, 20 Jan 2026 09:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=PFutUY1+i2Abz9/+lY5B5zMjLAf/XXdfuIZO3h7kvBM=; b=nBKB4/EAuIVUXD7uTW+HFPaqwH
	8SoYNERmA9r66r3fPJ0dl+CIwPnBX+/yck3ZaK36E1UHlrjnLd3oKf1PR0IZd2YzEHak1qHhy0EzM
	5Snni4/f96kjJz2/HmlcMvWL8xNZ5G1nDWWZTokDXADQDUxJptjz2Dfv658Z1ZnfxLFlLajLQCTOX
	JgQv+LoQgcTYjMBqTzQGFRZ6BDHLMWKPvjwteQU24ZVYjVvgM84HV3PHKlRLWcohApaTsUHDNuexJ
	PRnnbtwe0fiGq2DXCxrJaAMNirW8JXpu8HGBl5QPlX6vTmNDE97l/SmvnJmAnPstW8fpahRwykmk/
	oKGbEWoQ==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi8Cv-003KZM-5h; Tue, 20 Jan 2026 10:39:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Luis Garcia <git@luigi311.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Olivier Benjamin <olivier.benjamin@bootlin.com>,
	megi@xff.cz
Subject: Re: [PATCH 0/1] Fix imx258 variant on pinephone pro
Date: Tue, 20 Jan 2026 10:39:26 +0100
Message-ID: <176890189889.310054.17634541522861042266.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260118214620.3319040-1-git@luigi311.com>
References: <20260118214620.3319040-1-git@luigi311.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_013935_257684_84DEC83E 
X-CRM114-Status: GOOD (  12.00  )
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


On Sun, 18 Jan 2026 14:46:19 -0700, Luis Garcia wrote:
> imx258 had the driver updated a while back and it introduced
> two variants, the imx258 and imx258-pdaf. The pinephone pro
> is using the pdaf variant so this switches it to the correct
> variant and eliminates the pdaf pixels from the sensor output
> resulting in a much cleaner image.
> 
> Luis Garcia (1):
>   arm64: dts: rockchip: Fix imx258 variant on pinephone pro
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix imx258 variant on pinephone pro
      commit: 6742b998166485558ccb0e89b5d5fd93c1aae3ca

In the future, please don't send v2 patches as replies to the
previous version and instead start a new thread.

Next versions as replies, does sometimes confusing tooling.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

