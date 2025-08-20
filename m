Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68277CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE3Jq1Ciq6MhAAQc1qJ6fcK35clkEtk0uKnaYwyaufE=; b=f6kJ5bVTRw+n6a6pOptxENZyDR
	pFba2bbD/Cvt//aeHa1H8F2vTplnwRJwVhMX5lSiiehtSEnE0GWlWQDpCNAH7++iw1iUpBk+kKekS
	GTOmiS8H/DYo+16be/3BiReoqQUXZjukMqvW/XUDFdpvJks0y3R9UfgUV58JuE/tdDTCEcy5zX2Cv
	uKoYafi+1iP5TIibuIDzCK9j4CS1bkQMS2awfxEwSvy4Mb/2H5yjbElrnFqcQ55h3omSDGN2fwX5Z
	2jDqmyUICrKvuNIVFbSLVATc4lo1y8GjaUpeNIvNHGAQDI9D53bSB1qYqKa2o5H3S2o0QUSz7cjvF
	wcXIigpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZYg-0000000CH5K-0um1;
	Wed, 20 Aug 2025 03:32:18 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZTr-0000000CGny-38y9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 03:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GE3Jq1Ciq6MhAAQc1qJ6fcK35clkEtk0uKnaYwyaufE=;
	b=bWQCXMnOjqJWDF2BQzcu4GZvEAoe36Pm4a4n1lGck9ucw68xhs/iPWxKgjrGab
	O0XVc6RR5j66vkaEAmWBiLTKE93rRTtUb93U4OVmx36Q6rkHta4pQRbDcMEOKRXT
	40KV+XQpJU7QFIloQRZ1Kff4xwLVFyzG9T9Nf3/b8LAVE=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXSnt7QKVo47L+Ag--.63175S3;
	Wed, 20 Aug 2025 11:26:53 +0800 (CST)
Date: Wed, 20 Aug 2025 11:26:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] ARM: dts: imx6-display5: Replace license text comment
 with SPDX identifier
Message-ID: <aKVAeyQ6iXU0-zl5@dragon>
References: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-display5-dts-lic-v1-1-81e46a650d3d@prolan.hu>
X-CM-TRANSID: Mc8vCgDXSnt7QKVo47L+Ag--.63175S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoWxKFbE93
	y0gw15tw4SgFW0krWfCF1avasrKFWDZr12qw1FvFsrAF98KrZ8u3Z8Wr1qvrn8Xw47Jr17
	CF15Ka42kwnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb7PEDUUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuvZWik7SLzbwAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_202720_097947_C4B18E2D 
X-CRM114-Status: GOOD (  10.27  )
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

On Wed, Jul 09, 2025 at 09:32:44AM +0200, Bence Csókás wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`.
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lukasz Majewski <lukma@denx.de>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!


