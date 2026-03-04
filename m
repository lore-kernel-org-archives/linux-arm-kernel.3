Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42C0EFCE4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIGwrCqPlTvk8g05dxZBjXzxv9TdKNafDRbPwLq0ZSI=; b=LndKfhIscYakIECVbnrAXYeGtI
	3gExfu6TrAGvDLo0ZMwktLGmWK1oGaOeP6g+iYJKOWirlzLzlJydZTKdBVH2wIc2RmVu+ezcKAbfT
	IDbit7tDuoACI/9/sRFS2yu0Jj1xzoOMKrTF8u5zj66xZaHFGTZXnXyryP8QywC04LCgwTsNJ//pO
	KQzafkn+L6qFXXa3v6h3SPSDvkFuvXcm8lF9muzqeXP4caewve4LHwsiHnPxR2OhMgky5jBFCCKQE
	GVnJAi/zyU2I1fwTTpLq3UOmYV4V2Bk3oODWo1+07LP4RiUEAZ/xagbBNy+RdTSWz9jBWLzYWt26a
	UY0968fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw6B-00000000fgK-28gV;
	Wed, 04 Mar 2026 23:57:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxw67-00000000fdq-2Eik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772668660;
	bh=gIGwrCqPlTvk8g05dxZBjXzxv9TdKNafDRbPwLq0ZSI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wgo5VNoTLL2efzHKlpFefxV+cqSmR3SHo2mShMBZS50s4ZhhSnQ3SRU+9WhDd5KzM
	 cF39e6AqZ34dIkPctLlSnC5QqGjWIp85FJmu5FI4oYMrT6/IvnDgY74CsUrSNCX8P9
	 SXZJnv+gIQaud0xbHfY3J+hVsu5IDgjN9apWk7VmygQgzMUeb9sTSvqjzfhrjM8YrS
	 OIgZlmtOYchjPpLU60OcWtRsCZqoWJIE+IDTtn645bJ2yE4J9wotU1clhEc3EewXxc
	 chO3xZYQljCx/CtvjZZ0s+5p1m+V8sEhs1hEcUHZqkWpkLUxtTXbEuQIEalsqBoJi3
	 BAGuBAXUjix3g==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 46F0760C90;
	Thu,  5 Mar 2026 07:57:39 +0800 (AWST)
Message-ID: <3e9d0b356ad2871de0b3a47194726d3503ef136e.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: update SGPIO and PCA9555
 settings for DFT
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Colin Huang <u8813345@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Colin.Huang2@amd.com, Carl.Lee@amd.com, Peter.Shen@amd.com
Date: Thu, 05 Mar 2026 10:27:38 +1030
In-Reply-To: <20260226-anacapa-dts-sgpio-v2-1-fd76828616b8@gmail.com>
References: <20260226-anacapa-dts-sgpio-v2-1-fd76828616b8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155747_783558_1AAA74EE 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Colin,

On Thu, 2026-02-26 at 22:08 +0800, Colin Huang wrote:
> This update adjusts SGPIO mappings and enables interrupt support for the
> PCA9555 GPIO expanders. These changes are required as part of the DFT
> (Design For Tooling) integration and are aligned with the SGPIO signal
> definitions provided in Helios_SGPIO_BIT_MAP.xlsx (rev: 2026-02-16).

Where can I access Helios_SGPIO_IT_MAP.xslx?

My suspicion is I can't, in which case this doesn't have any business
being the commit message.

>=20
> Updates include:
> - Add interrupt-parent and interrupts properties to PCA9555 nodes to
> =C2=A0 enable proper interrupt handling required by phosphor-gpio-monitor=
.
> - Correct placement of LEAK_DETECT_RMC_N.
> - Update SGPIO line-name mappings per the latest Helios SGPIO bit map to
> =C2=A0 reflect leakage channels, presence pins, module power-good, and ot=
her
> =C2=A0 DFT-related monitoring signals.

Please take some time to read through the documentation on separating
your changes:

https://docs.kernel.org/process/submitting-patches.html#separate-your-chang=
es

If you haven't already, please also take the time to read the rest of
the document.

Andrew

