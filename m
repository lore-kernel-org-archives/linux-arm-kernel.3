Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B40EC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 20:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y917TBfw+rB1/3romxdRxldqdx84UlilNMdHySMnM80=; b=mwtnLXzt3B8G+fSJqk2+qPgGwC
	yB4ujjz3bHbCPl9gUCrYUEBT6II1ViTWwQY3BRZuBFcw/+FJ4KxCE+GnjWFg+el3OiL/WV+VT96ao
	bb7srWSRap9WyDlLDYSbqir/f9Fy9ZVaDBwW2lAF6rBahE+PeF4ClyHNDYhTlfjSCMg03jTvDwPmP
	pRXOo3kqPpG3s+FJMyXNsYuY1lp2e3S1Vn74N5BzMQHFtURKrAjIBi4o125Vz6ZVwRGJP1x5WS7YW
	NIgnNarfnYQtJbrV3oieeC8dqtNlXpz5uP/pNicU8FhklWG9wH1V4nEQE9I9hUDXwOP5F7PRg1qEB
	tvFsbDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriiB-00000004Y9j-1Grw;
	Wed, 05 Aug 2026 20:59:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrii9-00000004Y8u-14mm;
	Wed, 05 Aug 2026 20:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Y917TBfw+rB1/3romxdRxldqdx84UlilNMdHySMnM80=; b=EIAN45GiU5Uqm/bzqShmqTP193
	QkB/VD0SmLktjmYTukSxuWly1l8Q3qeaUWuW6KgpglE3DKG+kjtyAUNyeWsEaQRdXlslow9gK31kx
	f5/DqNBs1ZqslCso1XekG15s1SnXlDWhfw7KZAXmLCAFpVq22dTiJsDKNBll+MSzLcCmn92aB8UV7
	Y3Ek76NJA6V5UrMSo/aT0i9Cxn45NHgzJXlTyoNFcRZJLpjiMotNfnW7CBVN54myIN/k7PLaLFVbN
	ioy2K46s61mD/EZjS97PnM0qS5Q25UzyDhhZ9JYE/gxEbdbuJ8JbV0sGkWNFC8Kfjl0QiOA5/XrcR
	rLUV8zrA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Brian Masney <bmasney@redhat.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yao Zi <ziyao@disroot.org>,
	huang lin <hl@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] Add support for the Rockchip RV1106 and RV1103
Date: Wed,  5 Aug 2026 22:59:16 +0200
Message-ID: <178596355286.2517015.614227776699371944.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_135937_304372_7702041E 
X-CRM114-Status: GOOD (  12.32  )
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


On Wed, 29 Jul 2026 07:35:47 -0600, Simon Glass wrote:
> This series adds initial support for the Rockchip RV1106, a Cortex-A7
> SoC aimed at IP cameras, and its RV1103 package variant, together with
> the Luckfox Pico Mini B, a small and widely available RV1103 board.
> 
> The series follows the structure of the recently merged RV1103B
> support. The clock driver is ported from the vendor kernel and is the
> work of Elaine Zhang. As with the RV1103B, no resets are exposed yet
> and the CPU pvtpll is initialised but not calibrated.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: rockchip: Add RV1106 CRU support
      commit: 713e4d54ff7369b8118f91e98a008220d60b2a5f
[2/6] clk: rockchip: Add clock controller for the RV1106
      commit: b520d056f2619972ad09ced2985b534bba4f9599

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

