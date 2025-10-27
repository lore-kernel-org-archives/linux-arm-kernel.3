Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656F2CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2AKbo8uyYqUT6bGKiZiU3Turz5hoR6ig9s0/Vo9OEQ=; b=G0AGsgURue8RUG2AGbIAK+pqQW
	l5Rsh3AXdJGZYBPKNwtjzWfwKGyg1L6ytuK7zUpr60yilqze/5o0OU6xJioDa26a1FOmqCdTGM5H3
	fuk88pR/Df95mIHAExTQOR3IAMM5FbernHeT7huvFMotyHEKuTCBhItXEXOrdEfYeck7MkKaG463M
	8FeX8zuMLbsLdqqI9ZG8ZDlIwY6Uic2FFYM06Vm4ZwzLu6hSSpKQ/Ol/VRIAyXbDu9CYWuqskPhZb
	7qg3HNV+69lD+gIKw7SIV7U/FaWq9n5pgQ4gAoS+YCdBKyQJGfyrmzGVAfU1eYHQxtiW6tAtWsTrV
	H8P7wi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBwm-0000000Cwi6-1R5R;
	Mon, 27 Oct 2025 01:22:56 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBwi-0000000Cwhg-3Tji
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=M2AKbo8uyYqUT6bGKiZiU3Turz5hoR6ig9s0/Vo9OEQ=;
	b=G7COedZrvj867AVRkJA20R6AjStpvGME0URsmRlMX6oBpQLVGDc8vLtFPIhzix
	noLUn96M9NDO0jmS9j6vpxt1mDRW9Ns51DT2+J4lVfZo8kbdUgE/35lEQGyvbC3l
	NvHL/qoElzjjxNj9mZOBgeFheGyqrFZ9jIP6BdvQebkPU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3zxVayf5oWZO6AA--.21714S3;
	Mon, 27 Oct 2025 09:22:36 +0800 (CST)
Date: Mon, 27 Oct 2025 09:22:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] dts: arm64: freescale: Update USB oc settings for
 PHYTEC i.MX8MM boards
Message-ID: <aP7JWuEwL0loYzkN@dragon>
References: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
X-CM-TRANSID: Ms8vCgB3zxVayf5oWZO6AA--.21714S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRxjyGj+yVxsEAAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_182253_238560_0833EBFD 
X-CRM114-Status: UNSURE (   6.06  )
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

On Wed, Oct 01, 2025 at 02:43:26PM +0200, Teresa Remmet wrote:
> Teresa Remmet (2):
>       arm64: dts: imx8mm-phyboard-polis-rdk: Add USB1 OC pin configuration
>       arm64: dts: imx8mm-phygate-tauri-l: Update pad ctl for USB OC pin

Applied both, thanks!


