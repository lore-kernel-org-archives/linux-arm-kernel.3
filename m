Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C351C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP66OtCoIAUGOwrPrVYAUZoLwNYK7xEkiY4rtScu8+0=; b=229JURSj5UxYZkJUPWk3C2ENy6
	NteSY+j9vQN+XN9YVwKSfEuBM7jB/1XjQs4FTYSZMxE2wFgSaSb8D5lPWR92bt5RYKfstoclRpYNs
	E7a1nW3T+iUh4SrFiMjXmuKlaOGaXRj/fQ8gFfiIwfdjo2Prv7nMQZvkScwuTusf3ono1bxzrQ6AJ
	VPop4XNBcOn1M5kq5CNliFyOrVJW3enfaHetT9oLRb/QEI6wMDAuyohvCZQzwxKoV4yhE1yx1dbaI
	zQiFKzeVc2F3Lgfa1Vc26XymRoLa876/gizlLbq/9h3saRkhM9GzVsiOLcpOP/n0Akwvz8uY+s9wJ
	tM06stxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Yo-0000000CpOk-42GF;
	Fri, 28 Feb 2025 22:10:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8QX-0000000CnlT-0oX8;
	Fri, 28 Feb 2025 22:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kP66OtCoIAUGOwrPrVYAUZoLwNYK7xEkiY4rtScu8+0=; b=OppOjBCY5py8iBMgECLQ+fLWj9
	W3CxMi4DVZlXB7ryZCKQEpyalTPDuw1mGTdnIKbpGDR7l8/yCnUfr8cO8XT1kt3+o7rLBK/MVvi0v
	DZY2w0imaGVyMPCQq+SLudvjdmo/+RVmL0BnpuYWcbn/Kpwx2EuG8LY8cS1ZO5Iy9GZ54YzrYk2JE
	T3d21GMZ4LsX0ithJtJvYtRpSocbIX4D/6q7zKpvZcwbL6C6eBnH3a2/UAywGI4+ohD1KS0a8AAz0
	94W2ZVnUHIMhq1g+KksKmOL1TxexyHsYD4jVbVm4DRHJ3uJATbFbvencphBWuZUtT4vega7CWupkC
	kvOwWFvg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to8QO-0003wY-T5; Fri, 28 Feb 2025 23:01:40 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] rockchip: Add rk3562 clock support
Date: Fri, 28 Feb 2025 23:01:28 +0100
Message-ID: <174078008226.501190.7368829300747006853.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250227105916.2340856-1-kever.yang@rock-chips.com>
References: <20250227105916.2340856-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_140149_230234_5372CA1E 
X-CRM114-Status: GOOD (  15.32  )
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


On Thu, 27 Feb 2025 18:59:13 +0800, Kever Yang wrote:
> This patch set add cru driver for a new SoC rk3562, the SoC DT will be sent as
> a separate patch set and the new compatible will be used in the DT.
> 
> Changes in v3:
> - remove rk3562_cru_base and MODULE_ALIAS
> 
> Changes in v2:
> - remove rockchip,grf info
> - Update file license
> - Update the reset ID with rst-rk3562.c
> - remove CLK_NR_CLKS
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: Add RK3562 cru
      commit: dd113c4fefc8df6ebf6486cb1dce1707d5d677b4
[2/2] clk: rockchip: Add clock controller for the RK3562
      commit: 36c7fdc8f585acbf11c8e5bc112fa9d8ef75146a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

