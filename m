Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9237AC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTocGVc2MASEq20lQzdg3r1UFQEPztqxGB68Vx/zNVc=; b=YPHTCJ7eWyXFncUa1U1uE+szdx
	BSDWzWTe5TP2VNDOWPkR05xaIbnFKw3D8quGeuNvrVwZXFN9dPmBjsT5UNwt3hTmRNYgLRTfD3kuI
	E6h7mQ7GZ+Ka/539et8H7e2vEO16MK7oWOIWhIW+4DeUbOZPk/IeiIwIRCmTSNJzN5GY6/pfbRKU6
	PsxE/y47nQ5+4A3+xxe02hlbG7FIX1tbgIELHH31EJDBQKkK+VjQHsm9tGHKPhiWfj8FTBFSvMm4c
	fLwr6xwGsQ9wnVbNFUiMA6nX793P11uMC9rmmc1wKh+909oPHjwrc7XBtBjcFWiY9/WRSsAg5RaJ+
	sJHR+pDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxE5-0000000AUyl-3sAS;
	Fri, 28 Feb 2025 10:04:13 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnx6o-0000000ATAa-2rIB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:56:43 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id CF9171FB6E;
	Fri, 28 Feb 2025 10:56:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1740736601;
	bh=XTocGVc2MASEq20lQzdg3r1UFQEPztqxGB68Vx/zNVc=; h=From:To:Subject;
	b=rI4kydmrCNJr+mnASvcrsFRM5ZvE+xEroHyP76emsEsbXXTlqtsCg3pSSoVeM1bib
	 4DV7t8E9JCgxncP7jiesSqYAgCx4JR3vX+8h6hfZ1SN1zG/6YiSvEHENCChEqifrfe
	 R/uJd2V9QUZeJb/GKVQeEVyg3KjdUta8qWkXqnRk3+xV4CLuWU2mjAMuN8vbOobEra
	 FpqqypTswRMUVmw0eO5w2Dkb5tyNVYrV3R5YeTWisQcUOP+f2MbI8wofMq5XVJVtLD
	 ppLp9GAIr3nImacxjXswoNetUKOklG14D4f1vL8pFfqltON+Vd1udlhWh4kcedAxj3
	 yk+/P/+fmNV4g==
Date: Fri, 28 Feb 2025 10:56:39 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: apalis/colibri-imx6: Add support for v1.2
Message-ID: <20250228095639.GB16617@francesco-nb>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
 <20250227170556.589668-3-ernest.vanhoecke@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170556.589668-3-ernest.vanhoecke@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_015642_879244_7A56B909 
X-CRM114-Status: GOOD (  12.01  )
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

On Thu, Feb 27, 2025 at 06:04:53PM +0100, Ernest Van Hoecke wrote:
> Apalis/Colibri iMX6 V1.2 replaced the STMPE811 ADC/touch controller,
> which is EOL, with the TLA2024 ADC and AD7879 touch controller.
> 
> Accurately describe the new hardware.
> 
> v1.1 of these SoMs is still described by the following DTSI files:
> imx6qdl-apalis.dtsi
> imx6qdl-colibri.dtsi
> 
> v1.2 is now supported by a DTSI that modifies v1.1:
> imx6qdl-apalis-v1.2.dtsi
> imx6qdl-colibri-v1.2.dtsi
> 
> For each carrier board using these modules, a new DTS file was added
> that includes the v1.1 DTS and modifies it with this v1.2 DTSI.
> 
> The original DTS can be used for modules up to and including v1.1.
> 
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


