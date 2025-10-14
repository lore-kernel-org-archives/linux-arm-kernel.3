Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F124CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiHv/yOnY6WMqqBbAcq4r+gLICsRKMAlOgwF00S/n44=; b=buUQaViSRWvSHJBTSrt0zjfz/9
	CooCWfClRsOuCj3KOiI+JfoGasY9uETKojZTvvamjD3S9DziaHjRYbbImNRpwQn4ynbHGTAVu4J97
	GDYVxCVP54wGrjmNi3NoGSgo0evqxnqwcvLu2YJs3GSkHBmEHWl2QAWooJ+hHa85XkcNheNS7Mnvx
	OC47j8IJfOe7XZ+6pOd+V1tM47bZlJWceK1pypgQQ7XUiSrezJDpXS66lWWwyH+2uKUW+oCQTAUr9
	JFGFfWttOlA470nG03Z9+hqhwHUWbAvXGRkWSRz0m7OoLy4FzKQ6L5jm5xcpiqtHRt4pUmIPDgPJY
	VGpVezVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQU-0000000H978-2ob3;
	Tue, 14 Oct 2025 18:07:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQG-0000000H8sa-1v3W;
	Tue, 14 Oct 2025 18:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=XiHv/yOnY6WMqqBbAcq4r+gLICsRKMAlOgwF00S/n44=; b=xz+L5VWQ/4abOx3kcyXefrbnf4
	ktFF/bDAFfxrlD+4dSTkjIDX4YQoYxfcNEiizSh2rEJKxjcWnpnMfPWNlah9LqG0QWbMN1wY7/shh
	tUETy5O6cleDIZHXf9WvLeISNChFn2Blg+U1sHVEsfGEuXkzNYTLiCTcpnO4UHGREKXWCKIqudVl7
	SwoYb/DJ62SX54uQ7SM6L2+BbwHNLkqZMQbsooaUoei7NPeq+Vdewg14yo/lRnzLI0UjodANxYcwp
	wKUvRR2Xi5RFeLeJycmKkfBJzXY/Q1JcaSmhlprKRjtqOa84BvsmT8jMKht1ZyQEAMzuHbvGDy/pu
	Xl3H8bVg==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8jQB-0001Gj-J3; Tue, 14 Oct 2025 20:06:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Make RK3588 GPU OPP table naming uniform
Date: Tue, 14 Oct 2025 20:06:36 +0200
Message-ID: <176046473180.1662867.16010204377467165654.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
References: <355c16ab070688fc6285e0d4419eb54a3f699eee.1757152740.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110656_550953_6C5B9BAA 
X-CRM114-Status: UNSURE (   8.91  )
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


On Sat, 06 Sep 2025 12:01:22 +0200, Dragan Simic wrote:
> Unify the naming of the existing GPU OPP table nodes found in the RK3588
> and RK3588J SoC dtsi files with the other SoC's GPU OPP nodes, following
> the more "modern" node naming scheme.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Make RK3588 GPU OPP table naming uniform
      commit: b3fd04e23f6e4496f5a2279466a33fbdc83500f0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

