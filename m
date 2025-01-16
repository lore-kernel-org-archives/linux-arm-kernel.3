Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE0EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkhfrX5NJP6fRdG9kTmMbb8SkAyO6e7pFwE1cCRx7L4=; b=yb+va6e0ZlKfDp7pf3Za2HWMQY
	u9t1HAHIuWQiK7NCVRtdedSXb62noxefugjCCUIO4B4DWA6SgPssBKBjsS2UM2dn4ZwCs0ea5BfME
	eGwkeWO8z8Bt0IxAUhGmsOPfHeAlH+ALwWwS49gjUAuxAzJY4dAAZeb3t3wm+JFZoJTPPFYapqnVb
	Iq5Nk7nXmXwEqkcC5jJvDIFLvoj/CDJlU/C/QhGsl2seZ6V2AZnLZdjBdQaIr2H70h7PZVHfQtL7S
	4WaUQ7ojiQdw2GYJ34AE64521QrrX3oqSI6u3Ex+WyR506w3bzxhHrumysg3hYBiMKGhGVyqfoSAw
	lmt8Qsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKhf-0000000E5WZ-2PAx;
	Thu, 16 Jan 2025 07:54:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYKgQ-0000000E5Rp-150P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 07:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 780EAA40277;
	Thu, 16 Jan 2025 07:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DCEC4CED6;
	Thu, 16 Jan 2025 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737013973;
	bh=4X40u6qRvjap3XD5YqCVaB8bLA5Q93cffOs+6tcseV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+S9lQawrZhWMcnVcZOGAHYRA5X481BoVpCXBw6XA9Qbf7V3ijp6JEoeFo2VB4YYq
	 2h33/OPovyaF/BBn9t7PPMSlti1rPM5p8+xFLaQBBQM9E2iqK9zhhWNbh2Jbhf64h5
	 MaJy6q0aSIV5idUJPDWvlDMsqGT0f+BiCNbn99gjQQ1EhcillMhGgmaMcYhxgMfg2x
	 QX0NUTe2vhnjibrRK83QX+ywpDi64b4nW8r6gtg3ZrMrIwJ4gZ9fMBnn5rmq6za9X9
	 WipK+LHycoxfTTo52NjpbmBT84qwb6yyys9aFTWdtXeov+jo+e8rHTXSq64w3djH/k
	 OgUGrCeaJf+Tg==
Date: Thu, 16 Jan 2025 08:52:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Wronek <david@mainlining.org>, 
	Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v14 2/4] arm64: Kconfig.platforms: Add config for Marvell
 PXA1908 platform
Message-ID: <fptozdlnt3yfdvqb44l77qhjn6tmdirhnrb6lkeniec2hrmuoq@yoe2w6g6xi3x>
References: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
 <20250115-pxa1908-lkml-v14-2-847d24f3665a@skole.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250115-pxa1908-lkml-v14-2-847d24f3665a@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_235254_364145_677422B4 
X-CRM114-Status: UNSURE (   8.98  )
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

On Wed, Jan 15, 2025 at 09:35:55PM +0100, Duje Mihanovi=C4=87 wrote:
> Add ARCH_MMP configuration option for Marvell PXA1908 SoC.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---
>  arch/arm64/Kconfig.platforms | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


