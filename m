Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2803ED61010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ruMiEbmatRyLdSDU9GVneVebQsohFEEnNshrzJh1VY=; b=qoZEGGP6X9FfgVnlJtTlPJzmPe
	E/5OyWkE+PgZuJaItmjAsdARIG1SHEmjaujytmNuc0kfODNagIoRpCsYs39z/VfW0DgKSqlbcDjAt
	SWHgBO4VI3e29O8D9M/KeWs0j/BlK/2buvienLLDAkxBGNAHz4gHYeG4wKZMLCwqT0vogE18XMXHZ
	Eh4usKmBPN7Bmmeum8bdKU7tkKUICh6yriAf32k5bIzq3rR0sX7CNZ4c0pu+i9QgclV0a9fv2nYGt
	/x0jBA0fpEG8BTxrEhs3mu0F3joZseic9agiODivksBPVwMhfP+DOCDzxoN/biniTZ8yAxMPZQa/E
	WI4zBk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQv6-000000005dg-1Tj1;
	Thu, 29 Jan 2026 12:14:44 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQv2-000000005dD-3VIb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:14:42 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3E79D1FAE4;
	Thu, 29 Jan 2026 13:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1769688873;
	bh=0ruMiEbmatRyLdSDU9GVneVebQsohFEEnNshrzJh1VY=; h=From:To:Subject;
	b=BhH3P1uENX1AHobeYn21cwlej1jQLIsuatEdT5bQZUR+fyoaAqWKraICisiVuVLYd
	 7E7EPHtiHF0SJO0nsobENn5ARO0YuwkOtdcPwgwR6E/q3qMXkiUXbzN28eFUuUCweb
	 ovcjzThPnDCuj+GLnDn80uK77br0MybuL5a5uGi7XgMv+JEyGQEvu4OccH2HKCXSWm
	 7H9Fl2LSp9wgTDdL5+/CHwESdcT+mZaKbIvt7v0Q4L2hkClvsnB83460tMVoGlbnrW
	 E1cJqmgCsundDNxd82UVUwAGh5y9IP2FTDJvm1EsI1VfvqK81L172ocgnrQ1LPtw/F
	 Kh037EDHemXPg==
Date: Thu, 29 Jan 2026 13:14:29 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: fix
 PMIC_SD2_VSEL label position
Message-ID: <20260129121414.GA57679@francesco-nb>
References: <20260129104741.888670-1-ghidoliemanuele@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129104741.888670-1-ghidoliemanuele@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_041441_468493_07FBFA8A 
X-CRM114-Status: UNSURE (   8.24  )
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

On Thu, Jan 29, 2026 at 11:47:35AM +0100, Emanuele Ghidoli wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Fix the PMIC_SD2_VSEL gpio-line-name position. It should be on line 19
> of gpio3, not line 20.
> 
> Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
> Cc: stable@vger.kernel.org
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>



