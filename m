Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0132BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 21:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f2W8vtsllrDMKUC5FSQQtnrH0k7J4MAbqURujOPxS58=; b=Z2XMVB9kJyWDWNYzQxFTZ6U22r
	459tZ8PEahl8+vRAzpLiRBgJmF/vZkEAfrzkbt58y4PDccaMNo+hetBi4TJkWlO0zoJhqmPnisxeg
	gRqEcHxdGcRn22YenxfEEhKhTu690U4ruEE5P6DVqFmuUuw1OEAF9ZeRr0juyH93NX4nzs8HRRfCl
	Z4DEzrM5gUqTHwR7T+rVRhgppP008tFLQb00zSzbjYCaIv4R5ybrJdpn0CLxIlnaQLV14rRh35oyH
	QvF4hcUb6eCRLtegB6Eoxg5d1YHUFI0kF0o3xwUOzc73ArZNbwUL0cOR7noCIExkZ4p1n1L2jNqEs
	MVhhQV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsJa-0000000DSEk-0NoM;
	Fri, 18 Jul 2025 21:08:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsFS-0000000DS1s-2t7Z;
	Fri, 18 Jul 2025 21:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=f2W8vtsllrDMKUC5FSQQtnrH0k7J4MAbqURujOPxS58=; b=UEY+MpyhejRlM129BcdUcesf6q
	E8FBgYZZ0PFmeekiyUaIXS4wjqofpvKRDzx7HNyce3YCF6kmqkp08Dh4rVTGrZgnrDQ3/lzYMD/ZF
	yHoeNHIH51dprYqBZb8YulNGvN7Lfg8/WLf/49m9SlWUVORWEarOCFwWA7ckpdrAUMDps7GA9GlPP
	Nskvb1wChQ+Xj2IUoFaKgjse7o9bZLz4A7D1fmLF5KLFQ1v5R2bH4DzPX4woapgb3FJ8FdJVfFyb/
	HM2jRQqoGSs3A83MDLQm+TD0OQX5BOQOn4C2rEvc35Pz/zqM5ptSIfXIocTjsCfe6/ICTSYSJHaCO
	ETiGoJIg==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucsFR-0007Fn-BO; Fri, 18 Jul 2025 23:04:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.17 #1
Date: Fri, 18 Jul 2025 23:04:04 +0200
Message-ID: <9025082.MhkbZ0Pkbq@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_140406_728453_8D2B9C65 
X-CRM114-Status: UNSURE (   6.68  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-defconfig64-1

for you to fetch changes up to edc4a9d1dc1669e42a35b2bd1b711a5da0e83699:

  arm64: defconfig: enable further Rockchip platform drivers (2025-06-30 11:10:05 +0200)

----------------------------------------------------------------
Enable Rockchip DFI + PM_DEVFREQ_EVENT and RGA modules.

----------------------------------------------------------------
Nicolas Frattaroli (1):
      arm64: defconfig: enable further Rockchip platform drivers

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)




