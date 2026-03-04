Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35C7EB7EBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJq5OiNAaCAjRVT0mIH/WZXQf7nV9YcAogd2Uml1ylQ=; b=KYZFlP84C5NebZx0CngDweEMkD
	aubORbi5u1kfJbvxyE98tR1uVhYOXDV2nHljPrezNv/KW294Yq2WVBT+OUFJyvJvnN5jqNIILIcfZ
	mVBor+7Bs4pPSZsH7WS+t3T1rNwJt0WqxC1eLNLubpSJNULq3ucyARlxOxLlIHbVaQ4S9sbpn3+SB
	mzRUKlZV3ZuHFIayqpbYeE3atmEGg/wksnlWT71bum7idprXJzfV4vd5kDDGEhC/Zlq4BiQ0N0LBX
	215T8vwmeXRF/4MRl/PhqzJsdmGoPQad3Hgck1z5fZzBWokdBG5hE+1MMxm6kHdi7TnMa4MyLKuIP
	JM5mA/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjcf-0000000H0Nu-2kzw;
	Wed, 04 Mar 2026 10:38:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjcd-0000000H0Nn-3rcJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 08FEA60097;
	Wed,  4 Mar 2026 10:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736C1C19423;
	Wed,  4 Mar 2026 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772620710;
	bh=qJq5OiNAaCAjRVT0mIH/WZXQf7nV9YcAogd2Uml1ylQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YMqciHFoHWkm0gdqztZeLKiemNl3siyzBI9JJfaPcMdT8MnwG8uZJAZnWeXfvhmgc
	 RBbiLcNSE37QC6l3M5S695MBfoaBuUeH92sFKI6pShPK6h11T2yBi355R+v2aGU4VA
	 tEop2mpy9xTaC1Mi9Y5x0lPqIVTcNFXBehIyKaisVMxdR7K93Ay88v2l7LbmNeb9xI
	 UJCHicElosPEGA+VkGrYBQg2G4D757XwE6Tbr0Ww9mxh2XN8/xSlCEWChB5ttVKOss
	 ztuzmODhMiMQtHOl8s3Q7S5gagk09kWwS5G4meOD4z2JBSUCem+W3qOrhBvehVxvdM
	 eue7k7dU8I58Q==
Date: Wed, 4 Mar 2026 10:38:23 +0000
From: Daniel Thompson <danielt@kernel.org>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 2/4] backlight: add max25014atg backlight
Message-ID: <aagLn0PyqLqcwS4R@aspen.lan>
References: <20260123-max25014-v7-0-15e504b9acc7@gocontroll.com>
 <20260123-max25014-v7-2-15e504b9acc7@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-max25014-v7-2-15e504b9acc7@gocontroll.com>
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

On Fri, Jan 23, 2026 at 12:31:31PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

