Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F36DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpF1YMkskI8UsGrh5lJSpejW6nd0lyITwuPdRCfGE+s=; b=IJGI4MTWV9o4i3qFud3y8KOiY+
	w3XdKaUZ/+mI2lD34MRZnWumrAd99WtwAMrXz9VzZsiTrkLLPXK+BUJ90Zlzo+XQ+RuKL36dLvTPj
	uGPf29XJVW3QyUQUJeOlk6cq0JwpZQ2ZOBALxp4M9zZBx3C4WXk2z/Bq1DeyzrlubLxcrotAlPk9k
	ldDmo5DBKUwkzZS/FCGE6tn8DYKB0I6DQw6qxcwtG9L1QhhAn3Kr/O8MWLSgVB5QLZbYUIUyrXqAK
	XAdsFUlegvKCWmnrjvq/7c36hQPVIZjJfwRdjfB3xkqqG97CHNCreDKYKu8OgTu0+ZiRiP4hTf77Y
	mpcyBsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy3g-0000000GvsM-1rTM;
	Sat, 08 Mar 2025 17:33:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy22-0000000GvX4-22nZ;
	Sat, 08 Mar 2025 17:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VpF1YMkskI8UsGrh5lJSpejW6nd0lyITwuPdRCfGE+s=; b=IjuXVS8E8ZY5kwZFjSi1+gXEB9
	qvNwHIyyLuFamW5UUhMU3JZKa07+sfm/wJFte7QytmrPpPdJSEsdEUveKd5QLDsu8XW/uVDPZ2sVL
	Q093Ie8JoJRfFMQvBZwgP2nvWZPNAchgRLSnliIbnzavc8kbCAA5LcUWVzlYsBGFxkL8alR9cfgd0
	xHJH1BmIVGsRQvUoHwsQjYP8p2gqAR5OQd5drebU3/8YlVXo5EbL+kInDisebpPGX5lpdyQKKpIVR
	WbAd30aLs+MlFHKlFTjayzReQcqEjVbUgvVZqx7PZq7wq0g6Twy/pmnjnsuW6Ny7yqkEdOhcGXZUG
	QAPnM4cg==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy20-0004Tx-N1; Sat, 08 Mar 2025 18:32:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enable ufshc on rk3576 evb1 board
Date: Sat,  8 Mar 2025 18:32:07 +0100
Message-ID: <174145503576.101861.18242365156337250993.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <1741180586-140422-1-git-send-email-shawn.lin@rock-chips.com>
References: <1741180586-140422-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093214_551076_6D83DC5C 
X-CRM114-Status: GOOD (  10.72  )
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


On Wed, 05 Mar 2025 21:16:26 +0800, Shawn Lin wrote:
> RK3576 evb1 board supports UFS, so enable it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable ufshc on rk3576 evb1 board
      (no commit info)

The base ufs controller node seems to have gone together with the
driver patch into the tree containing the ufs stuff, so this
does not build right now.

I've added it to a temporary branch and will try to get this in
after 6.15-rc1.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

