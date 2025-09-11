Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5EACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zu/ILIakLLn37rYFw5PvXVXf22PCnsMSBiyyFDARzl8=; b=OCJWwhTcNUTc2D9bZAaZUA/E6U
	KFj8VhVkEicANqHX81Ktnc+2tsW1F+VSMO5MEYGT3RBgK9ISWqS961NbQzlMpxp48Mj120qpUFeOn
	8WlcDQ4ACsigCcGHqp6Wcd3Fkb9EKwFgTLek8OXDDry11RgWsKFH1nVIfCgC/KA87IOkymG/iHTxw
	iOt+9ekagw7pTNPV2oF2t5TBRizwgPukYpdwehYI60/08r+bxupozKvA9orQdOdy0D7ago92iCvRU
	mpWEEfnahPFQN3K88/BISf8dJL+u+b3r2iyxVpbbnGQ1tGKa39YovO78Ga6lrX5+5FPqu3eUNiEM5
	xjyv4VZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXB6-00000000Q4O-3vEE;
	Thu, 11 Sep 2025 02:36:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXB3-00000000Q2S-3M4p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Zu/ILIakLLn37rYFw5PvXVXf22PCnsMSBiyyFDARzl8=;
	b=LNUxbfE6VV4SLAXXaUc2enyKWX3CzNsQeTquFa24c/YqA3DtbIWaWxSlZL2QTY
	j6r6RKdmhYJgOsiVLuvuKFbEgPyZaPGWzN61nCOmjZfyZ0X5u7dwNL1V0cjh+Lae
	eI51un27bmcSFLxOLoGJoerqTZZUZrqziKt9H752u3gjk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnX_mnNcJo1g9gBA--.44535S3;
	Thu, 11 Sep 2025 10:36:25 +0800 (CST)
Date: Thu, 11 Sep 2025 10:36:22 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: Re: [PATCH v3 3/3] arm64: dts: s32g: Add device tree information for
 the OCOTP driver
Message-ID: <aMI1pidrSAIAwab9@dragon>
References: <cover.1756800543.git.dan.carpenter@linaro.org>
 <7877e1958fa92df92b2b5229365c86493c620c8c.1756800543.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7877e1958fa92df92b2b5229365c86493c620c8c.1756800543.git.dan.carpenter@linaro.org>
X-CM-TRANSID: Ms8vCgDnX_mnNcJo1g9gBA--.44535S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzcTmUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAlCp2jCNanx7wAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_193650_173830_DAEF215C 
X-CRM114-Status: UNSURE (   7.86  )
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

On Tue, Sep 02, 2025 at 12:47:57PM +0300, Dan Carpenter wrote:
> Add the device tree information for the S32G On Chip One-Time
> Programmable Controller (OCOTP) chip.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

It doesn't apply to imx/dt64 branch.  Could you rebase?

Shawn


