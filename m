Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F57CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ids8GPq+OLZj5NndZN4Sa1BRCsRNAOOVIKZvWbSwRnE=; b=SgthVqS/DlGLasfodlCxZA8CGb
	wd4o6kFRM3+sGJouhUKUZdHjh5Pmaf9+H22EyDo3HqZPNpBbyD2YzgPmoSIPnB94VwZOE8ItsT+Ns
	GzF/oAxP6d2GBUe7rs5cR24q+dwelZneiTPzVrTGiUeq5NVWcmeogwIavNnQKBpU8tdJC9jEM4OhO
	lNfCYN3fA6jeDFw1qZFyaw9HYZaYcczuAKL9lm1v5xLlC5yL2+BSIxzU7dniwsobseMqyIqvBWlF3
	k+wOQLiQdM/qGxIq9059v/nLma4VTIThJGD0aVq00Nor1cWsl3DQfdd01LFc14CmO0c47pshV4i23
	luQ2pFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDH5K-0000000DDvj-3aCa;
	Mon, 27 Oct 2025 06:52:06 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDH5H-0000000DDvB-3Ojm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ids8GPq+OLZj5NndZN4Sa1BRCsRNAOOVIKZvWbSwRnE=;
	b=FuZNrB+v1YGsv3THEF0JzL2Wip2LNaJSyktXoboKSsC5ArZ3a7g2RHR0U4ZsA/
	R0yDUowupNkbGvZULMhVyzPWd7icumn+DBL8P/jvVQL1bCR0qALsl7FcK90phtvl
	KsKtTHRQm93FyiT40IfY5hPAC6rAH66EMpTB6PusDa5Bc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3v7uFFv9ok6E_AA--.51017S3;
	Mon, 27 Oct 2025 14:51:51 +0800 (CST)
Date: Mon, 27 Oct 2025 14:51:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Yannic Moog <y.moog@phytec.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de,
	Teresa Remmet <t.remmet@phytec.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/4] Add display overlays for imx8mp-phyboard-pollux
Message-ID: <aP8Whdcda7_qGknI@dragon>
References: <20251020-imx8mp-pollux-display-overlays-v6-0-c65ceac56c53@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx8mp-pollux-display-overlays-v6-0-c65ceac56c53@phytec.de>
X-CM-TRANSID: Mc8vCgD3v7uFFv9ok6E_AA--.51017S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzOzVUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQfAJmj-FoeF3AAA3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_235204_178919_2A7B6E15 
X-CRM114-Status: UNSURE (   6.10  )
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

On Mon, Oct 20, 2025 at 02:49:23PM +0200, Yannic Moog wrote:
> Yannic Moog (4):
>       arm64: dts: im8mp-phy{board,core}: update license
>       arm64: dts: imx8mp pollux: add display overlays
>       arm64: dts: imx8mp pollux: add expansion board overlay
>       arm64: dts: imx8mp pollux: add displays for expansion board

Applied all, thanks!


