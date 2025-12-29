Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F463E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 02:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU0F2GreevXFoVqmX9VG52TjkETZrwkvLUIcCOhoP8g=; b=Xa6HifIAz2W2zAjmFc4RK19L+x
	q3WfwE9D5ZPTSkhJvToKMUEL2AxveGEXmohQpWlW5xjJG8aWXl3Ds4gqJMa6hky0Fu63HqY7GHs/b
	mAL7N1pDMI3EOgj6CUpx5/Ua47RRQ5//Nxep8FXt5VCawEx1afSf+23o7KAXlAom4btdpuC51f1Vt
	K9GzZ4cyfPEdk4/QEYS7COHLGtRDJhSojc23IogGHtF2M16WPLASE9ZNkPg/EJA2fP1ZimftORTYp
	qlaFtY9gr1Qd4PmJi9Nh9uxAL1VWx/Uksyafvd9n+OEwNhchBg0n6E/zsDDXZ6uaJdN6fNuupH+Yr
	CTkTanUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3DR-00000003Eur-1Rlt;
	Mon, 29 Dec 2025 02:42:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3DQ-00000003Eui-3PEU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 02:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B3DBA60018;
	Mon, 29 Dec 2025 02:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE55C4CEFB;
	Mon, 29 Dec 2025 02:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766976155;
	bh=VfX8cZ299Fd2aqfB00CG/8JVQnNZFXjsOP4N8336/Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdeNYSvrLyMlPEcBO36rbv2dxeNZXCaHMW4Tz47KdN74ohVVlLMKKuZLsyLWVzwvd
	 ShEnhqNA8MlLJUNgJtUQ8p5ltCN1KzBm+5WdtdWsJ4WBrdjFRhIvAipg9r4bFaA5QS
	 E2AfLyDbBXuPKLbceiU8td5jpciPXpK8tm2n4iWFNnlKtvwRPjiz25bGrHT3KvLRuX
	 et8A/qo7M6/x7bbHOq3w4qkmVILxLooUGD5BB8Ci4iNHyZzMM+FCxjJ4wP/Q3AGG19
	 pgDEsLewoNuUXOrIWx3RtQi9NvJ71p6HWjkievkEqT2T8dAf4IRPg0QToaJrJjTTX0
	 SMF3PP//eLmTQ==
Date: Mon, 29 Dec 2025 10:42:30 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM
 SBC DT to rev.903
Message-ID: <aVHqlnNGNGmaF14m@dragon>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
 <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
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

On Fri, Dec 26, 2025 at 11:24:29AM +0100, Marek Vasut wrote:
> On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:
> 
> Hello Shawn,
> 
> > On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
> > > Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
> > > board which implements significant changes. Keep some of the rev.900
> > > and rev.902 nodes in the DT so that a DTO can be used to support old
> > > rev.900 and rev.902 boards easily.
> 
> [...]
> 
> > arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
> > 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
> > 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']
> 
> This is addressed in bindings patch [1] . Can this patch and the bindings
> patch be applied ?
> 
> https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/

Could you resend them?

Shawn

