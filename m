Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4F6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8HMI4dBSHOZzYxtls69B2jOiIgFLybmVcuOyVJM9LE=; b=ITPEESdiFI8sGr53W/QVQHSKIE
	ddX8w/8s/8figV1DqmCxfGeviUfrLWqvp0HfW4sMbWcTk9SbnuRD3o+81LrPUX2m3HiENQysCRSCq
	uW+clEOgAx4XDTBd9M72pzX/Gtd7uhK1KwXUeFAZjOVolOl2oKIUq5lAyo/SyFH5yqNkEAj+hjPl5
	HD8K/V81FrkUmerDcGpVBbPN8U+jNd+yFzzRXKEFxfwz9GKa3JEXj4KFwSqQO0+oYiIXYnt2fD0bt
	vvPNx0rgE9A3GJWfxQcPizK1TZA5qa/O2B0o/X8c70cllInX+F13h3N9CfUDCttH7wVM/MRSvPyqy
	Cccd8xFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9py-0000000EH5n-2B9C;
	Fri, 11 Jul 2025 09:14:34 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua93D-0000000E7TA-2MfU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=M8HMI4dBSHOZzYxtls69B2jOiIgFLybmVcuOyVJM9LE=;
	b=kcMqUPmh/qagFxTfJHasI3aSRZlobqClH28SagoqLkvIgkq4ih8ujofBHK1JMe
	MRsQwq7V2CuHrl7nntwpxJwZUP+u7tfgQsIOsXyAu1s51sCbYOm66k0+yP3+/tkr
	Pf+A7uK0HwDdqYKceOGcGzj8oJRuFNM638KyKV2lnpotA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3d6YJynBoKCtSAA--.9983S3;
	Fri, 11 Jul 2025 16:23:39 +0800 (CST)
Date: Fri, 11 Jul 2025 16:23:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>
Subject: Re: [PATCH v2] ARM: dts: imx6-gw: Replace license text comment with
 SPDX identifier
Message-ID: <aHDKCWFd9oOZu6NC@dragon>
References: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-gw-dts-lic-v2-1-ac3b697f65d5@prolan.hu>
X-CM-TRANSID: M88vCgD3d6YJynBoKCtSAA--.9983S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoWxKFXE9F
	W8Ww15JrWSgFW0k3ySkF1avasrKFWDZr12qwnYqFZxJF98KrZ8WFn8Wryqvrn8Xw4xtrnr
	CF15Way7C3sxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9NVDUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRqHZWhwiwXXmQAAsp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012411_920797_7EE6C635 
X-CRM114-Status: GOOD (  10.02  )
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

On Wed, Jul 09, 2025 at 09:26:41AM +0200, Bence Csókás wrote:
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
> Cc: Tim Harvey <tharvey@gateworks.com>
> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>

Applied, thanks!


