Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C17C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvcoD3y8NoexvOIek6+LRfEIrItF4nd0tICSSnTeRa8=; b=rbskyJOYJK9qt0L6Z2qY76RifF
	oiJeEKqN5ReTPyZGo6jbBDVFMliECZzuEm830fcSi0FdLZFlMV9ok6DK/+jzZvWL/+p4ep8g3gdUU
	6SYXOEOWvLgnpCK7NZ/7wSkpa7iZvEsADvSevc2Ao8n5LNPotHcLb2woUBWzTKrlqVYK+EZUj25am
	xCINLysNMM3dG6PtZ+dR3OSV0mggQ2OpMoQZCMs5Uy6PekZLkHtDLjqefMyIuzPXlg8DPsqMH5CXl
	dC04Mc9ElweXGEJl2ylNQnDjEIkkEHmEIjE2rx36AsL5YMMqz64IrJxm7ZYG4CvBFLeeRUHNiX+s3
	RFagH5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YYC-0000000AO2S-0RAD;
	Wed, 23 Apr 2025 11:46:00 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WnC-0000000A4c8-3Fw0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:53:24 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0D00A1FBB2;
	Wed, 23 Apr 2025 11:53:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745401994;
	bh=xvcoD3y8NoexvOIek6+LRfEIrItF4nd0tICSSnTeRa8=; h=From:To:Subject;
	b=RdqjBWFrjmAuSZbTg6HbYJ+YfXO46LD0pH6r1s+tXcT4RCH0E5DT/Udc3GeUOyXy8
	 c6hGcrzbdkDQRf9OUz9vrot+FrXvm7HWbbwASJXJAWvbfVZ20kqytS8tSUhRh8DtZi
	 VdnypqPWvz7kRT/cbaiuGQzWsbafWnBnp68KlGU6Yo6KNvjonYHCTHk5LhMGZYLjJL
	 g0vDcCMXfn4f//5jOXo1iG+DW8DSRmFn7HbufrogjdMPh8NnI82pCY5nbmKPqmWeSy
	 MlscygbG3PyIXk0rgkX5HamwQX22CmeaaKsE2iwdY0w14Z5Rj1RLvy3lHOtVfuznX7
	 /K8EcHSOJyq5w==
Date: Wed, 23 Apr 2025 11:53:09 +0200
From: Francesco Dolcini <francesco@dolcini.it>
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
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to
 usdhc2
Message-ID: <20250423095309.GA93156@francesco-nb>
References: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_025322_976570_D3738F2E 
X-CRM114-Status: UNSURE (   9.22  )
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

On Tue, Apr 22, 2025 at 04:01:57PM +0200, Wojciech Dubowik wrote:
> Define vqmmc regulator-gpio for usdhc2 with vin-supply
> coming from LDO5.
> 
> Without this definition LDO5 will be powered down, disabling
> SD card after bootup. This has been introduced in commit
> f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5").
> 
> Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
> 
no empty lines in between commit message tags, not sure if Shawn can fix
this up or you need to send a v4.

> Cc: stable@vger.kernel.org
> Signed-off-by: Wojciech Dubowik <Wojciech.Dubowik@mt.com>

Tested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

I would backport this to also older kernel, so to me

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")

Francesco


