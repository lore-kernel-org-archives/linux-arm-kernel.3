Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C934C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQc8KBNXic1DZnFfIwGfGX0puZguj5Ag4lvx2OkjmOM=; b=FuJgNFZhtpb7Ogx+BhJplLCGej
	O5jzK8rEe42zlyVYbVbLdxXLEp3CM4ZInIvHeEsaoBjXdOLGxeU/nD/KehHH2ApXjw71EmLt7johP
	NZ3n2LLnKbuMefeqfQpjauyRJf2jNcSMvHI2twjifTfsEHRLc5xfRYyYJNLUuwgZwUEK8Dm9RxU6l
	kjDoPSmFlabGdHCnd4cBgLjr1hCV+ZG8mJyRoqtjZ5k2sYbH+yVEBZKS7+RIJF5GHkmmTBtQBXVXI
	7ox5AvOzbpx6ejG+loYel6tvx0aBKzHoHFqo/tELlGIM0SCIKHCwkL75kpPCfIgrV/w5Q8rmBCVOo
	cc6wxg1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAHF-0000000COKc-1uV5;
	Thu, 19 Jun 2025 08:05:41 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9m0-0000000CJ9N-3KHp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qQc8KBNXic1DZnFfIwGfGX0puZguj5Ag4lvx2OkjmOM=;
	b=lxTLwirY93ccLYht3790YvQzbm2YudORaWDoDB3WQ4mKTfszjLri6EFbpbUF9l
	x65H8Uhi1E33Ds5odQC0owBP2s0cw3RvxDrcwRx0ajC/wXUMGUxzgbV33MURRIQZ
	zxh32iF+9i9aIC0XwrDAGyK7TUgkBlwu5RR4AUESYidvo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXVlEzvVNo33X_AA--.29592S3;
	Thu, 19 Jun 2025 15:33:08 +0800 (CST)
Date: Thu, 19 Jun 2025 15:33:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] arm64: dts: freescale: imx93-phycore-som: Move
 ethernet0 alias to SoM
Message-ID: <aFO9MpNOSzTGfyJU@dragon>
References: <20250522083909.533567-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522083909.533567-1-primoz.fiser@norik.com>
X-CM-TRANSID: Mc8vCgBXVlEzvVNo33X_AA--.29592S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrGw43Kr4fXF4fJr4xJry7ZFb_yoWxArc_CF
	W8u3WDAw4UAFya9343CFyFy3s3tw1kJr1IvrWagr93t34Fg3s3Gryvvas5CF4xW39xtr13
	u3WSkFWSqrnagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjMmh5UUUUU==
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRVr0GhTvTVkkAAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_003325_171009_2FB74BBA 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, May 22, 2025 at 10:39:08AM +0200, Primoz Fiser wrote:
> Move alias for ethernet0 interface to the phyCORE-i.MX93 SoM include
> file. The reason behind it is that the physical location of the PHY chip
> connected to FEC interface is on the SoM itself and alias thus belongs
> into the SoM device-tree. Consequently, it can be used by all boards
> based on the phyCORE-i.MX93 SoM (phyBOARD-Segin and phyBOARD-Nash).
> 
> This also enables us to mark FEC interface as the primary / first for
> networking in the bootloader and systemd (predictable interface names).
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied both, thanks!


