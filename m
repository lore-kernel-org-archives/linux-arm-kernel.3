Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FCDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGhMB8KeVaYgWNAUXgR6szKiJVILeCd7gq6JvQk2QT8=; b=eAztybkjkBEy5G6TuE3+YlRJ8X
	Grsf7jID7jitffCrH/cfP5qMVK001Dyym2LciilsH8vXYttV3ujdk3ckerszaRgpMkScyz0OEW4Ac
	OuvH4/dRshWnh5wagnaLnHlsA5VDNePpQD6BRFE19GNvGhnILVAOxcPifQunBuRAVHGvnG1uZuqki
	gTEemipSuuXZoF4eggxYP9P2h591n+PKh1PUgKQN197Uwt/SRxDCb7WQdgsh0pna+9bq62txbDqZ1
	VkZtkDXLAjv4iRMRljd3bzF50aY92yr7JXh+Ciw6uY6Tr/S44F0AtRwizIIfRqulgM1mj1i6iQjlb
	Ec3vosZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAmm-00000004mox-1Htg;
	Mon, 30 Dec 2024 08:06:00 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSAlZ-00000004mi9-2vyl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 08:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cGhMB8KeVaYgWNAUXgR6szKiJVILeCd7gq6JvQk2QT8=;
	b=hTgKhFHZxMSdUUt7HMAhdn2Iq3znLleCrwaaXT9Q1Q/zw5YwFuhrPbw0EoEBWc
	yaXuPeLBiBoS8owzatUOISioe0aAcq+oiY86q77VLQAT7jIOY6sq+i5RXXyToMYA
	JorCAB5KPPOpKYC7DvevdVKyll/KCdgwRAPNnNcQyrh7M=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAH19QEVHJnSkoGBg--.60863S3;
	Mon, 30 Dec 2024 16:04:21 +0800 (CST)
Date: Mon, 30 Dec 2024 16:04:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: dts: imx: Use the correct mdio pattern
Message-ID: <Z3JUA9231oc7mhH8@dragon>
References: <20241218000232.74643-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218000232.74643-1-festevam@gmail.com>
X-CM-TRANSID: Mc8vCgAH19QEVHJnSkoGBg--.60863S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsvPSUUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxjFZWdyEhDb4wABsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_000446_148083_90A44B0C 
X-CRM114-Status: UNSURE (   8.62  )
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

On Tue, Dec 17, 2024 at 09:02:32PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> mdio-gpio is not a valid pattern according to mdio-gpio.yaml.
> 
> Use the generic 'mdio' name to fix the following dt-schema warnings:
> 
> 'mdio-gpio' does not match '^mdio(-(bus|external))?(@.+|-([0-9]+))?$'
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


