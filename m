Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BBCC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhwcdtlEhV2tm8XYwIBp93zYZFnlA/GalM7yZ7Dl6nU=; b=RIdlKFxQ2wAslaOzy67jdohmE7
	V/iaPygCNTSb0vjqJdlAcGyEH79556RKdeD/4rnkW8M3g1oxB+/upRcY2n443F8P2Z2u489HrFysw
	0rOdjSaPwqvyMLA1VTiAXNsaJxSZNyb1N6nhqMwzV8YsHJUJfZFcYFh4ZwnfVZDazYexCE0hnXEf0
	DOK30nDYDYVyY80eAXvS+PxiZetpZyoZ277KrtR/Ysftm6utB3qKwAJfpjmirv6o30hMGXwI487lW
	aylg7TXRTVcYCU60kDeNmB/QgPyELlWD/PD//4UTOcmOPrecFiabKKc12MqNFputkcKvIdjjuH6dA
	NtwLBxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGIp-00000006sVJ-1Q2r;
	Tue, 18 Feb 2025 05:37:51 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGGM-00000006s9h-3mhn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bhwcdtlEhV2tm8XYwIBp93zYZFnlA/GalM7yZ7Dl6nU=;
	b=Vpvn7bDVzGJEPcjeB2eOS2HvMEpvkz0Ni43KP6fFREs7anhS8dJHZ51zfsHNEI
	P+n1IaqylkvNly76632VKXldXSNVf0vzVSxmnAm1XHHXjXAp/MpgAoVN0pYPBTXN
	VQ/Irmbz7GNgWrubDB/PGATW+OI8xpl1c5oK6GkkxWJtQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCn8YsGHLRnKZ4jCQ--.17131S3;
	Tue, 18 Feb 2025 13:35:03 +0800 (CST)
Date: Tue, 18 Feb 2025 13:35:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] TQMa93xx fixes
Message-ID: <Z7QcBZSU28w3tC8f@dragon>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgCn8YsGHLRnKZ4jCQ--.17131S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgACsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_213519_257418_5718DA36 
X-CRM114-Status: UNSURE (   5.70  )
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

On Tue, Jan 07, 2025 at 03:11:14PM +0100, Alexander Stein wrote:
> Alexander Stein (3):
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
>   arm64: dts: mba93xxca: Do not assert power-down pins
>   arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases

Applied all, thanks!


