Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A027C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe0udTgs66EroI3SBu3SsayzPACEWPQ7RqmksMkZ3wQ=; b=zGnPkIFcxgM8vHxTvYXkuwgVJG
	3akaZWE2gat/md4a96cCrsh6sGyTCnt+C1vmfltCMJ56SevODXDrvOQsr9LlY1ALAnmwafyTDwQiM
	DraO58KlES//97ym5bRZDfM2aFtuDiPXAdLBw7lsfPaNr6QqnJOqtdyXvEKcIGbMP2Ur2gTzPRei5
	ZZ8GZhQSa3kBBdHZUuS+7ADQ6dWE7bV5lodukHb2IpuF81EJ/hAz/VGtwUmuwqMdKl6p4DAnz+UIX
	rqg971wrI6Z6ve4h14UUt3CTkWKrlRp3Ci6QYUGHM0ZiZF5AbEgNjm9jmWuq1QZ9oBEIAxwo2ArGq
	84MgL5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nRR-00000002YBH-3dz5;
	Sat, 26 Apr 2025 21:52:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nLs-00000002XJW-2eLX;
	Sat, 26 Apr 2025 21:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Xe0udTgs66EroI3SBu3SsayzPACEWPQ7RqmksMkZ3wQ=; b=F1AfyJ7r3ijw+8kRHSGPhTPcxJ
	KlYbNQ4TsPaLtha7RsbjziAwu6TR3dzcqToPd0BMP5HR28y33isW/ySdratC7nux7KKeUn+ZCpzvP
	bN4XFq1suVfYIEpktug47IKhHDlv84beB1tBiH0u6g10r5z4n87xo01Q3Ze/CGUaNZQykqMweKRmQ
	K1ig1/FBvj1vzUVP0+BOsQqXSPEm39ss/Jmv4K/3twQ+4/duvJ0Eqg8Fs7wVUIdL0iF3CfkGvY10e
	eBfNjw3fi/CCQb4FqkKyHyh5rEmhMJ8vl39S8/h5duFuLdv75wdZZxepLsWECklVr6ojyMfAEW02P
	3Dq3CW1g==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLq-0001OR-Dg; Sat, 26 Apr 2025 23:46:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
Date: Sat, 26 Apr 2025 23:46:08 +0200
Message-ID: <174570370140.31943.7618466654461334569.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250414183745.1352470-1-heiko@sntech.de>
References: <20250414183745.1352470-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_144624_694451_A486C878 
X-CRM114-Status: GOOD (  10.01  )
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


On Mon, 14 Apr 2025 20:37:45 +0200, Heiko Stuebner wrote:
> Enable HDMI and VOP nodes for the roc-rk3576-pc board.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc
      commit: 3e62d9160ada511f7828f7cfaf11e57bfb660e19

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

