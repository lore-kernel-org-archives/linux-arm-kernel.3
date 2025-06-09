Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37FBC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBAmbvG9DKJ5ZBtHCrdVkfgG0G+RQFv12c3uqAQzHz0=; b=3cE8kX42MPS4CNKK5eaJZFR2S3
	upaC5SUzoJfJwV2tMb/RjgX1WMrzAWGDhj1XYNCVGDGg1MtTG/g5AolSFG4BPVP/WtsfdCRE1lg4x
	Y92MCG00g85Mv0DqbAqpxmr4xTTANqDTpNExbr8LN5tCEIwmQnod+VyzaC55sHLst7VZslo3h00O4
	qcScXqBLKqhRNSSNhF1eASpjvXzt3BUAtRFuycm4WHvUMmz0jocI83MYZj0NeMcSdFdNfH2kFWNIs
	Rq2kmRBwu8MprS/v0dOG68NCl/n7pu1IMzR4bkY6KP/AzHRu+CVhEPemEXd0xy4tO5FK4bEbpoWdy
	Y/AU85Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOafr-000000041W5-1c1D;
	Mon, 09 Jun 2025 11:28:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaPG-00000003zRu-1AMI;
	Mon, 09 Jun 2025 11:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=BBAmbvG9DKJ5ZBtHCrdVkfgG0G+RQFv12c3uqAQzHz0=; b=lpyUj2t+obwq5CMWCTbvg57HuZ
	dxrsN0ETGbkfP4ePm+9flK5EAPa+KIlaCmrXAwZ7Nvm5GWmkItNic0WUmhG0mtc8oINDLpBzoJTbG
	1NkkXWTzvf0GAUNELM9Wk2hMt5q1Lv249lG8uldv5Mdf9IkkEQXBnRI9DFjGjt7roYW70SL9KlGLu
	lS+KDeWHsNZ/kBWI9RB7D1lP3HSXtSnhp8p5BSjaL7Etc3PZbNkKLZedPbHqulac8WrMb2lnsUz1Q
	ldC71dvXi9NNcSCndKHsnMfU4a4MEsGXS+nBwjo/w4sUSNdOcE2vd0N72Frn7IDJtruiZ5DW5m0F5
	Ztlvlqmg==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOaPC-0006VT-MY; Mon, 09 Jun 2025 13:11:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Mark Brown <broonie@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sam Edwards <cfsworks@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	=?UTF-8?q?Adri=C3=A1n=20Mart=C3=ADnez=20Larumbe?= <adrian.larumbe@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Peter Geis <pgwipeout@gmail.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Vignesh Raman <vignesh.raman@collabora.com>,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: dts: rockchip: Remove workaround that prevented Turing RK1 GPU power regulator control
Date: Mon,  9 Jun 2025 13:11:01 +0200
Message-ID: <174946744885.771907.2986962634832337844.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250608184855.130206-1-CFSworks@gmail.com>
References: <20250608184855.130206-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_041110_314258_6F7FE419 
X-CRM114-Status: GOOD (  10.83  )
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


On Sun, 08 Jun 2025 11:48:55 -0700, Sam Edwards wrote:
> The RK3588 GPU power domain cannot be activated unless the external
> power regulator is already on. When GPU support was added to this DT,
> we had no way to represent this requirement, so `regulator-always-on`
> was added to the `vdd_gpu_s0` regulator in order to ensure stability.
> A later patch series (see "Fixes:" commit) resolved this shortcoming,
> but that commit left the workaround -- and rendered the comment above
> it no longer correct.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Remove workaround that prevented Turing RK1 GPU power regulator control
      commit: 5952996d5303c96702ef30ad30ec0a01acda46d4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

