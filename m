Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B654FC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 13:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4Fnrl096oXKF65tzuRQZ6eRc4onRrFK13fpUbFl9Pk=; b=Ta7P1TJy5o/Bp5inF/bTL4EOsD
	ko476PkWB8cLCjZiSGcS+N0SpU9DqbeTBwChlydxiW8jWUvOZjwCAAzqEntQ3g/hPQPf6Op2pO0Pk
	ITTRBOF12fdnuKAEcQCATJT4EwSuoojHuxucUE7/iFQ/HVNgJJkqoqMbb9rYcH29NdsRcBMudr0dr
	BREZGF96Ca7ThOse0tQSL12UvbQFHkLZ4UPmeUtQMgvnv9IG743/qi7Kb9IdDx34p5piCz69QlNdB
	7ItUB80OFH1Q99ljt6O2rP4mimDnokbKEXCs+FAb8TP5SCoMTSRPT3KMNOioaEQp/N7e9vmKq7861
	o8khdw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92Sa-00000003d0s-0aqq;
	Sun, 27 Apr 2025 13:54:20 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u92Qe-00000003cuo-3bIm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 13:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=i4Fnrl096oXKF65tzuRQZ6eRc4onRrFK13fpUbFl9Pk=;
	b=gFF+/ZQYa5fCAE5KYgEvYnr15hbTuWaIQYDpVPvL4hRk4V75FQLpe+wAQEgPJs
	YjpTRhGSpOLJ5Z9JvtLRSAEEfwa46u3/q+ui6qPzsEK6LgcWMoyhNHYpdNQrLA9x
	HYLSj8IGOSJx6x5e/WjQ3RhzPf6vGoqR5qlspjLDq2Ly8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3p0tlNg5o4Vb3Aw--.41011S3;
	Sun, 27 Apr 2025 21:51:35 +0800 (CST)
Date: Sun, 27 Apr 2025 21:51:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Philippe Schenker <philippe.schenker@impulsing.ch>,
	Manuel Traut <manuel.traut@mt.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <aA42ZS8xeyDi9xNO@dragon>
References: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424095916.1389731-1-Wojciech.Dubowik@mt.com>
X-CM-TRANSID: M88vCgD3p0tlNg5o4Vb3Aw--.41011S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4UXFy3Jr47JF4xWr1Dtrb_yoW3uwcE9r
	1Fkws5Xr45Wr45Cw45tFnxZF48G3W5Kry3try29rZ5Ar95AayDJFn8KrZ5Zr43WanIvF9x
	Z3429rs5trW7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8GXdUUUUUU==
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwA8ZWgODbOJNwAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_065221_290877_81D61964 
X-CRM114-Status: UNSURE (   8.22  )
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

On Thu, Apr 24, 2025 at 11:59:14AM +0200, Wojciech Dubowik wrote:
> Define vqmmc regulator-gpio for usdhc2 with vin-supply
> coming from LDO5.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> 
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
> Tested-by: Manuel Traut <manuel.traut@mt.com>
> Reviewed-by: Philippe Schenker <philippe.schenker@impulsing.ch>
> Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Applied, thanks!


