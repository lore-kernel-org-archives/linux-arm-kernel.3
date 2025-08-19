Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8561BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92YCXkncC8mafjIE/bkZt8SEk1Hzf5E3KMeZS8Ny8sA=; b=Cmy+zBd5QkUd7YG1BqzavFuCoQ
	73AbZqX0230LYgiNwJxO6cej6KF7FDIVDgUHOvluyLELvGrb9vcsV558XWOmS6p2TczPngGGyR95y
	iLODvN3T5hKREalHdxEsCbRo6AlcFLRxZZXKh1QYw1oQSN8lfXtxqicg7QT/ijh0nMeM47awhJJhX
	rm+U3G+329repffREyMlb4rX+F1++yFUoWXBL86+lejTuDIXJU5dlLaDdaWGNw4WE4bFbbCOi/BvO
	MTOZaqCXHeSIFoEgoerthVZh8hmC5HTjZUPuyBiTsUeNKaJJP8OMWotS4fkD+anVZo4YaS++IbgCN
	GueACszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV9f-0000000Bmw8-1DSe;
	Tue, 19 Aug 2025 22:50:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTWz-0000000Bc0q-2mhc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 21:06:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D563E5C3698;
	Tue, 19 Aug 2025 21:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAF0C4CEF1;
	Tue, 19 Aug 2025 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755637568;
	bh=JFybjif0PA4bThPHFS5Y8/tz+/sdsAZ8BMw48NI4TXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlq1Np7Ye4pkVq+DvkC30NXf0evlSCoY07mDs0nXTxFZKxgu6ll6ry6C2tIS89ziF
	 hGFXPz4yDKRzwO+rQz3NiKuhPMDqv7mwsXOIHst8SEqyAnIYhPw7M0wSBfpZOQEASV
	 U6NXQbcbfXWUJL+pLy+QrC2pUeaLGWJaJA1rmMTu+gJm9tSNVETspHVxmkY4yRRA2n
	 ICuq08mzgcUFeLzleLmusbO7kKv+eo7ryG+oKIuu/e+waow+7nLTG8LVrWEsgbKhY8
	 sjx5apfhxFzP8e0K1+BX/mWOuFmYQMLV6gqbwsBcabW6DFBHAKqf83iukI+at43ICI
	 jiVyp+B4fLPIg==
Date: Tue, 19 Aug 2025 16:06:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/1] dt-bindings: soc: add vf610 reboot syscon
 controller
Message-ID: <175563756689.1312101.13704825031197649543.robh@kernel.org>
References: <20250819165317.3739366-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819165317.3739366-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_140609_746137_EC7CB4A9 
X-CRM114-Status: GOOD (  13.32  )
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


On Tue, 19 Aug 2025 12:53:16 -0400, Frank Li wrote:
> Add vf610 reboot controller, which used to reboot whole system. Fix below
> CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610-bk4.dtb: /soc/bus@40000000/src@4006e000:
>     failed to match any schema with compatible: ['fsl,vf610-src', 'syscon']
> 
> IC reference manual calls it as system reset controller(SRC), but it is not
> module as reset controller, which used to reset individual device. SRC
> works as reboot controller, which reboots whole system. It provides a
> syscon interface to syscon-reboot.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add missed 's' at description
> - remove duplicate / at path
> 
> Change in v2
> - change description to avoid confuse about reset controller.
> - it is legacy device, more than 10 year. So try keep existed dts as it.
> ---
>  .../bindings/soc/fsl/fsl,vf610-src.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,vf610-src.yaml
> 

Applied, thanks!


