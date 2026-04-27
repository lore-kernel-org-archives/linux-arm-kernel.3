Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D1CFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vw3V9ZfPq6PThxSOCtgguaFkBodfELaZ7LQ1o0ghpf4=; b=2l+8hC/w+7wrfaKpvLyhKxNMaq
	6aXddKJleKabW0VMtdd06VYKmarPwcKcF1VF37/ZvPM3QruCRkrKHC7VdexT42viC9NNxODiESXRW
	fdjBxJodTIeeUc3S2jMyAbUvODO8cXH9fU9z+zQZzwCVbO7mzlIh/o33h7vhJhqo4CxXb0KWuVJdn
	7ekKjFpWxfVil3ChaZOExxyqxbYqeFOvArYbNaClNVivWuwQd2UWqum31rBWaZ6HI4kSYo/OPGPyh
	/jeqG4dXRCk0m+zMEMytT94OOw9duOx3S13r9Ei8dn/U9qqpZh6Twtzu2+8bSdHRcVjsasgd9qWqM
	wzGeaSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL0P-0000000GtM8-27kw;
	Mon, 27 Apr 2026 12:24:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHL00-0000000Gt9d-1tAt;
	Mon, 27 Apr 2026 12:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vw3V9ZfPq6PThxSOCtgguaFkBodfELaZ7LQ1o0ghpf4=; b=JAHewWSnuM8OEin60mkfTLpvD6
	lgvibbXzHX+q7+T4sZhEHzbGqknD9ub5a0tJprTGpO0pEJu3U0EDT4M05W4p3ivmtfzwbP1YHXwF0
	BzweoJObppg7hBaoLKFBvAX1QCNYHAuLifbpGKzVRCqEtlOeX6khofvE9IOK4GjhwgBIrt7tgtOM+
	uRIpL89sy0mtyWxNzI1MgSDeSchYtxExm0Ycwki+tbvtA28nb4QzAAob7p3C1Zpl85GQtwxfpLWY4
	NtCnnIaJPdFqDfK7KIyRAVzgvquk9D4hfRvjQ4VZ4o7F6rk7CIVv9Na0QMUCxRJvKpQS/PYv7yL+1
	aApPzHIQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sten-Silver Ots <stensilver@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Torsten Duwe <duwe@lst.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx
Date: Mon, 27 Apr 2026 14:23:24 +0200
Message-ID: <177729258231.1866089.18432864978582477876.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260413215301.4656-1-stensilver@gmail.com>
References: <20260413215301.4656-1-stensilver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052340_532019_E4532B23 
X-CRM114-Status: GOOD (  10.24  )
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


On Tue, 14 Apr 2026 00:52:49 +0300, Sten-Silver Ots wrote:
> This commit enables the NPU on Radxa Rock 5 ITX board.
> The regulator vdd_npu_s0 was already in place and since the NPUs
> power domain supply is now described remove the always-on property
> from the regulator.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx
      commit: e4f7054e819eece6fd83072ff2dcefc7a36224c0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

