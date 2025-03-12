Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F3FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yd22Qxz7kDBJnd2ZYEgaGoACeEuIVuHffsOhyto1sRk=; b=wnubbS41EZefnp2fq+jsrkfrEn
	3r3IKXybb6LvShnLn4hbpn6eaJlBZrBKMSBoF6C54V747PWYUQHbZ19wLFYSWi11qLVibuOFW05PB
	eR7Bey0+C1NFcRlKxgF5n1L7Yc74b5rMTlCnql/HLVZiYQy2kst8Xbbw44d09rNFv2SUNDs1bZvxV
	zAzw8djTGHlf6YNenPr1Jdtkz8Le+b+eRvtTMJDQbTA10XG/a061lg4WU1U8+QfTq6c5LM3pXoIQQ
	9VBJvHljofCFRmJ6bTa55IEOcjI9wLVekjk3Yfp8MlyeVQaDgFp0i2QlU2NBQKiPBoA8QWBCMutx3
	o6PsPPPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRxx-00000009MCn-14tk;
	Wed, 12 Mar 2025 19:42:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRuo-00000009LcK-3ndb;
	Wed, 12 Mar 2025 19:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Yd22Qxz7kDBJnd2ZYEgaGoACeEuIVuHffsOhyto1sRk=; b=n4GTqQQIMhcq4YAluRDwHbKnoH
	TjRQEBWJJBqEZkeSd4FKjYrt9GreyYhsgoTZR94NU60koVcyszyVg93Ok/x/yhCH1z+2etja3CmAG
	fapBW4qGaRMl858/NCffQUMfIL7I9NdoZyt9mUhK2mxXC1ZhPC5M1lTwndqyDR/+8fnzli1Kf0N/g
	agHyq1cycPPK0l33SRcZ1GootxNikCN5N1NJB1tkMtHJkb7nRMrWzndEalbAQP6Z8rxxYz2DFPBKk
	RPJXWf6mVOGO2n+z9J0loh5YfjRbPaENRvDfT1lZsrtop/7HjjhYCsXGKUqc1V9vQdx3QHzshm30s
	G3FYU4gA==;
Received: from p3ee2c254.dip0.t-ipconnect.de ([62.226.194.84] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsRuk-0001qz-2J; Wed, 12 Mar 2025 20:38:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] rockchip: Add support for onboard eMMC on Radxa E20C
Date: Wed, 12 Mar 2025 20:38:48 +0100
Message-ID: <174180832194.262650.6974587881042851056.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250305214108.1327208-1-jonas@kwiboo.se>
References: <20250305214108.1327208-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_123854_944363_6D25C191 
X-CRM114-Status: GOOD (  12.07  )
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


On Wed, 05 Mar 2025 21:41:01 +0000, Jonas Karlman wrote:
> The Radxa E20C may come with an onboard eMMC (8GB / 16GB / 32GB / 64GB).
> 
> This series add dt-binding and SoC DT node for the SDHCI controller
> and enable use of the SDCHI controller on the Radxa E20C.
> 
> This series add support for the onboard eMMC on Radxa E20C.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: rockchip: Add SDHCI controller for RK3528
      commit: d62917b63e9f2c876bd9abf019a25313bd9cbc07
[3/3] arm64: dts: rockchip: Enable onboard eMMC on Radxa E20C
      commit: f25c3b93f50387849db692891e2b2c6f9cc7d055

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

