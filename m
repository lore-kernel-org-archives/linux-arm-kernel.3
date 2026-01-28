Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5706FD25B48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkOEXyC/0gCse7bBNhfu8r/cAT6OuOtpOsSIyHaDmlE=; b=E8FDHDfHn4dvR5GUdYbL1qVnNz
	n0MaZkJW964Nd90MS0ODxl99cB+OXak8dPCeoAkj4YOokQ1RVStrRQeigpvjj3hkdHJOn9pcksP75
	93kjfxcpmkYv7SWHnCxgnTaJyIVAhYSXSPdRDFCo3c0Vyk43vmT8e/An00MgMpcnua/TBb4DseSTc
	hhXpmg50Hn1P7uX3GGT+hP3ph9z3G2sCSMJhr7haiqwMHy69p+1CPhhci0Q0IqDyVA8GeUX90lDOL
	S2G/0d/n/TU3B85neJiN7RwUbTAPWruisVVRxVkn+BsJFLpzv62aMuzwMfP9eS0QMcpDxpEBWl2p/
	bxTShdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3zr-0000000Fx6R-3ZN4;
	Wed, 28 Jan 2026 11:46:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3zr-0000000Fx6K-0hNz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47968600AD;
	Wed, 28 Jan 2026 11:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B48BC4CEF1;
	Wed, 28 Jan 2026 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600766;
	bh=gkOEXyC/0gCse7bBNhfu8r/cAT6OuOtpOsSIyHaDmlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DewNZW4xe/HsC2IwNbH7ZHZuQK/jdLOGAoXLQmB7DAVHUIz7pWjSYl0TsDcNtU892
	 iaTLLo762MtsBUd8L4iVtF1NF4/KXtzmt5M7jf4jG6Awnm/o+sDNOxXWuL19S3VFNI
	 CKohONU8IJXABxx4UkdUxEh1lBVRh6pFYZeV5XVJI5td0nYaAqbjATZI4Q0uNowdGL
	 iYkS8pMD6pJU4QyAen/oTp6p5vndkJMf+p3PsoCVSx34y/DplORAoxjNyIhwAuCDyt
	 hQKwPjYmCp4eLKzbtqy2UykO8DIBrwgVqYA/JIdHnXzUw9Rzxvx8RrHshpIdH2ekL6
	 srqp/vndJGnQQ==
Date: Wed, 28 Jan 2026 12:46:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, 
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
Message-ID: <20260128-daft-rabbit-of-abracadabra-fe3274@quoll>
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128071853.2602784-2-shengjiu.wang@nxp.com>
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

On Wed, Jan 28, 2026 at 03:18:51PM +0800, Shengjiu Wang wrote:
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform

We see this from the diff. Say something useful.

Also, why power domains are not required?


Best regards,
Krzysztof


