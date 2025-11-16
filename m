Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AACCD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Bq0wIVfG4dtC44QwaB5g6CpsX37U6dOcN4JGpRHlZQ=; b=U0IVFtccRTGzRZ4gcgrCuzZ2/G
	RH5EVlLl9AIc4FCYzjpiVDSliXzoYIn0oA+Uv055Qsv4T8l0wS83lKPzBl9Yof52sp/eebLr1Lalp
	1yPor2OkTltiAqkkUPUYTVSio1w+ReCjAeEUE2bxWjfHTrTk8Zdsf0OQe9jDKVQk5K7+/6Ts61ca2
	45PYJpGHjRUNrPQMLXQA1QgTItguMjp5XPwG5TBUR6jQB8TLWVyaj3hmbHbZeH1IURg7fFcDH9vO9
	Uc63twj7ISOCQJ+e9bZRgDI41DTiYv+d7tHLaEqYYQ+bf5l12rNyIgsxW+63m8v0kMDBYbv3hPjPH
	IwyEzFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZCW-0000000EW19-1S0O;
	Sun, 16 Nov 2025 09:37:40 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZCR-0000000EW0i-3a1r
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 09:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9Bq0wIVfG4dtC44QwaB5g6CpsX37U6dOcN4JGpRHlZQ=;
	b=FR+8b2mI6sKu5ZUSur7jnZiM6TGW25UojjlPY5a/KbIJc2R4jiIqo3glt1CprN
	G9xsz/9IUnMxA726YhCupNwINfP5cu8kUl05JcIUWBfstrJLF9qsgmRnTOwk3L59
	SpJn2LmTjVwkHJ9fniy+SVMxJil53S2CQbMwAWL92bY7s=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3+c1Rmxlpbbg5AQ--.7938S3;
	Sun, 16 Nov 2025 17:37:23 +0800 (CST)
Date: Sun, 16 Nov 2025 17:37:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Teresa Remmet <t.remmet@phytec.de>,
	Janine Hagemann <j.hagemann@phytec.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Message-ID: <aRmbUZhFfZjH_4SS@dragon>
References: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
X-CM-TRANSID: Mc8vCgD3+c1Rmxlpbbg5AQ--.7938S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwQ6JUUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOBScAmkZm1QI9gAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_013737_605415_052A7635 
X-CRM114-Status: UNSURE (   5.84  )
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

On Tue, Oct 28, 2025 at 09:58:07AM +0100, Jan Remmet wrote:
> Jan Remmet (5):
>       arm64: dts: imx8mm-phyboard-polis: Use GPL-2.0-or-later OR MIT
>       arm64: dts: imx8mm-phyboard-polis: move mipi bridge to som
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder properties to match dts coding style
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: split display configuration
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10-ph128800t006
> 
> Teresa Remmet (1):
>       arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio codec reset pin ctl

Applied all, thanks!


