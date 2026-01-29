Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4732BD73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAui/HADg6RNhy1hhtar4GPmk6E7krh+QtansfKM78c=; b=ZP87WSaucxmuRUH5fJ8EXSkLl+
	8qp5f63noUwXaAtRhp9whcpZo8AnCe/LjVQJmtOsgKi0SkBAaGuGCkv+iqTP6x7d/2eQETOufas8T
	ZiGqeTHemwpujInh0mOlscYtU2NXKrubBkah2eEFQOp48IiauqKcI/fhqPOWW0IdL4gQ22pFZYI7w
	SVgRdNEVODnpSCELonTjqvqv88lcv+9UZui4+PPFWovRIY1ecc7WpqnnUQcJ8K+2Ojog6tuv2htQF
	Nko6IKIjvtkKTXzs48qjUccTpPF8gS8EZ/QS33Iu72z8hpzPcsJDOwMfFr8DIXc9l3RHG4IQbluWi
	mzCrjthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWaj-00000000V8a-3dsU;
	Thu, 29 Jan 2026 18:18:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWaf-00000000V7o-3oNr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC2F960054;
	Thu, 29 Jan 2026 18:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703CCC4CEF7;
	Thu, 29 Jan 2026 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769710680;
	bh=SAcQ/bmpw40uH4VH8bWJdp31ASTq8tWQB6is8ATklbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pl+b8Bx85WmBaZE+dMuCA9qa/uWVXY0HAj0BKaWDi9HtemQ+k5udGdtLooX9k0Ghg
	 OYnIWvnLHw+VCN5kpT2KVaAABUmQbJsLvK2rzI+hWJg634Wu2zdD4wX4ZiRXoJnl+y
	 hGca/wJFeP1aDWHvJK/XnmENjl60+er+2o8Ilv3d6m5epkOD8649wp3kI8zv9Ev+nP
	 divV4d1H3lF93um2qG/ByQn3dSDRPayVmKYfqC/QMXKYFl6Y9/y/9aAoHA735FA/ZC
	 HvDS6DXmdLmykq4czSfgagCPwYVUxUNSUQjSlXpd8uXDbgEUBf2Trmh/anE12lmGkY
	 zkGFuAjO3i+Lg==
Date: Thu, 29 Jan 2026 12:17:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2] dt-bindings: firmware: fsl,scu: Mark multi-channel MU
 layouts as deprecated
Message-ID: <176971067833.1454686.17086963865281930203.robh@kernel.org>
References: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-scu-v2-1-03f3aaa56e1b@nxp.com>
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


On Tue, 27 Jan 2026 07:06:00 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The SCU MU driver has already supported the simple and efficient single-TX
> and single-RX channel layout since 2021. The older multi-channel MU
> configurations (tx0..tx3 and rx0..rx3) are less efficient in practice and
> not needed.
> 
> Mark these legacy mbox-names and mboxes tuple layouts as deprecated in the
> binding schema. The driver continues to support them for backward
> compatibility in case firmware publishes the legacy properties.
> 
> The example section is updated accordingly to demonstrate the recommended
> layout.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v2:
> - A minor grammer update in commit log
> - Link to v1: https://lore.kernel.org/r/20260126-scu-v1-1-b9d31da12860@nxp.com
> ---
>  .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 

Applied, thanks!


