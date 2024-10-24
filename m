Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C848FD0BB6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pN3rG0YbC7h5EHabK5W8IM1Nvv/GoxCMWjU2r6UAVgQ=; b=L6ag0CBwSwKNmwu9Nx3DW1uN2T
	bgujA2z7aTwuAgAeIhzzqQsS0UxjX7/xVeQ172tDfkcMq3X6Uu0immWCccXyICcvrRi5fJUTO2D30
	gd9Cltr7QZDCBn1QxXTazOcNTYcZjSe3amdoP8uTov3IHmjuun6GxApYsivgxBiAUfEpooFRR3q6l
	Zc0cOY4u+0TsdxTFedlDVPQVGaqFVZ8UTOgQqtB6JGHrbAuEIc7ex2lpxl0sKZ7xYsYpEt+tyHj0s
	v+SN2GqAOH9kLZOC6cXAZ2DSM0aVphymyM9CxIOkmQVyiYyL1riq9xT+zlE/Unw8QPO39Cu8BkNmR
	SBE+BWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tJr-0000000HJPr-2os6;
	Thu, 24 Oct 2024 08:35:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3tFF-0000000HI8z-1ZGP;
	Thu, 24 Oct 2024 08:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pN3rG0YbC7h5EHabK5W8IM1Nvv/GoxCMWjU2r6UAVgQ=; b=bcBOvzQtDWVKk6sxrdZW51ClBX
	0bDhIDiDBidFW7F8pPDQkhLfOMsQNC9/Lu7SrI8web1ruJHMrFU3XKNC5QKC7/snRoFnEV2Rcbgh6
	oWQgIb2G1vsjUFIgb5WnbaQZiyZKpOmiDmkOLN3mUgfF+xbKqrqLfAqQwDVrRl/7fscA2oY92Hwg2
	m4wIrz2lAD9a98SJujHN8YH2xtNcRTgkBZMS6+56QKRhIJs3BGBSdUQSbHMmkFitI2sPUJNZZEOqi
	DjGlv6f979Nsq2l5zIuqUfsgeSBct7JKs4d+/UrT8CU+DY1NQ11gZtGaBPB9NEqIQ8UGsa+Wo6Xcs
	zqsC5b/g==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t3tF5-0002iS-5G; Thu, 24 Oct 2024 10:30:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Tianling Shen <cnsztl@gmail.com>,
	Andy Yan <andyshrk@163.com>,
	Rob Herring <robh@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] arm64: dts: rockchip: several fixes for the nanopi r3s
Date: Thu, 24 Oct 2024 10:30:44 +0200
Message-ID: <172975863602.1671562.17971165767179395195.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241022193537.1117919-1-cnsztl@gmail.com>
References: <20241022193537.1117919-1-cnsztl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_013101_446132_F55F5DBB 
X-CRM114-Status: GOOD (  10.17  )
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

On Wed, 23 Oct 2024 03:35:25 +0800, Tianling Shen wrote:
> * Enable eMMC HS200 mode to allow it boot from eMMC
> * Sort properties in pmu_io_domains node
> * Reorder mmc aliases
> * Replace deprecated snps,reset properties
> * Use the marketing name for the model name
> * Update the website url in copyright
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: fix model name for FriendlyElec NanoPi R3S
      commit: b5bf84206a5c77528f9dd4cbca4e72caa063c102
[2/5] arm64: dts: rockchip: replace deprecated snps,reset props for NanoPi R3S
      commit: 82b2868937883b65732da498b26366d34db61510
[3/5] arm64: dts: rockchip: sort props in pmu_io_domains node for NanoPi R3S
      commit: 17e150fdd983c7e59b9240e34a166285f3c3fb39
[4/5] arm64: dts: rockchip: enable eMMC HS200 mode for NanoPi R3S
      commit: 1b5365034410f1ca21adadadd492b99bdf4f2c55
[5/5] arm64: dts: rockchip: reorder mmc aliases for NanoPi R3S
      commit: b7cd1115456d312f8c5e60c80fdc35fd35ea6eab

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

