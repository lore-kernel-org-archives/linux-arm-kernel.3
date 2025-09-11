Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30019CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbYMnuTWyfN0Gz6b3slKCQiIkGgeBPU1rlOHaU7fi2E=; b=o+p63qMgNePeC/VeaDqZspu3Pt
	8+E5/5a3EtfdUtYG3fAc4W+19M2u44x5xRqaS8/XyKJCDA5rQbIJze5TAOsVyuRU90FQN0EXRTUUi
	fwut18TwcR0kPI8sK4tuhY1cpWDnq2ROGmdxXd+OmZzhHlVWludYJR11mh+1EVbLlT6pVZotjrrCT
	d9GFzSyGnJ6UpQZtp6D04NtoLL4qh4WE0p/ndhBJrX7ZbWjFj35f4BNZXuTeVYMKlCIAS4cuoZi8j
	F7cIrMVjG4XkzVLEmvfxK9T4Uxedvb+eWKtWPKGDIa67d7CjURHItXZwNMhlyKgrodAYfY6tB7KFV
	mp2W7Kog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVlZ-000000003j9-266L;
	Thu, 11 Sep 2025 01:06:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVlW-000000003hZ-1Qdr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=KbYMnuTWyfN0Gz6b3slKCQiIkGgeBPU1rlOHaU7fi2E=;
	b=k0j2tXMd+2VFECbFDfy941g+mbxW1NBDwcrE3/wLDkiaqNbzwytmU1S/CelBXR
	junfLtIVEt0g+hIijhJoz7K9h+uaVeNmC32B+tplAEFhVyeq4yIbFT6Hgtf4xr9U
	9NL6g6GKuA3VzM+iZUIjYAByrm7KOCd/HHcX4pxq6cttg=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHP_d_IMJoJQFfBA--.42211S3;
	Thu, 11 Sep 2025 09:06:09 +0800 (CST)
Date: Thu, 11 Sep 2025 09:06:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Hu <richard.hu@technexion.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ray Chang <ray.chang@technexion.com>
Subject: Re: [PATCH v5 0/2] Add TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G
 carrier board support
Message-ID: <aMIgf50uRVg7fxKx@dragon>
References: <20250822-add-technexion-edm-g-imx8m-plus-som-v5-0-bf745447345a@technexion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-add-technexion-edm-g-imx8m-plus-som-v5-0-bf745447345a@technexion.com>
X-CM-TRANSID: Ms8vCgAHP_d_IMJoJQFfBA--.42211S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOksqUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQHyWGjCIIEAowAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_180622_790076_20E2A415 
X-CRM114-Status: UNSURE (   6.36  )
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

On Fri, Aug 22, 2025 at 03:33:07PM +0800, Richard Hu wrote:
> Ray Chang (1):
>       dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board
> 
> Richard Hu (1):
>       arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board

Applied both, thanks!


