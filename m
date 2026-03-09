Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE9BEFCD9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meDN1/ABgEmwHgOLc3JEgo7AfrNKBwoWwMtuXFsApCU=; b=B5Qv6q9SMRgGUHFCSYtYOtnmrO
	9yYW9gcqMXk1syJ7ghC0PGvX4UtKMIDXlpsa+y9VDlc3IsvFw9OOjJyXOLUonL9cZdTXHNDu8sgZI
	kkmRsyx83wMIZiRM16r35b+JjFBv1UKZlnMOH/+K54b6U1CaTUqfGhcOO9ybYXsOiqn7eFhB+Za29
	WES1zBnzeKMTOoBNeFnPamcKQcjJ8v+KhCI9bgsOOCXuQOlDAFNeFYSg8X08b4bNYGg8e0+zU1eCO
	1+xugJ6QNB0q2gCrzSFo4qW8oVAaXl+7uwV66ci9WxVwm6YtMPKpnBVRhsuiiGsedVXI1p6AhExHc
	s05lO9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ3l-00000007DrH-0sla;
	Mon, 09 Mar 2026 11:46:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ3k-00000007Dr5-0Xsr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:46:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CC0F600AD;
	Mon,  9 Mar 2026 11:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECDCC4CEF7;
	Mon,  9 Mar 2026 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773056762;
	bh=4GHo3rpAhoh7Ez68qCniCSzBJN6YciwSNLek4y7NmYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=W36W4/zCIY1OQLpUddYgQSvcv7rfjtlmRVHyJWDp1qi5vJ8n96Owl8g6LzSuwZmv3
	 k52gqUlkRvZUAu4nUfC0r1UID4i87J/PMR49y7ivSYsBB1e6g/VADx63uaCGWE0KtO
	 Sa3ZGFnXiAMFTj/m5/UI9sjUs7uWanwN7NQ9JIOj+BLMVePRpwUfjHxKMuDr3sWORO
	 6+CUY6XP2qt2372Oe3MKYdbXJASTo0PbmoXI4v0NSGIzN1M/2FIqEeHc+JmPHkygeO
	 YAyApKuiWuDCXiWEeVEiPN/75ySCyF40zTrBDcSG/1kr20/u2AsE71oUvWhn02XKCF
	 Autm9PxLwOCxA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawn.guo@freescale.com>, 
 Jindong Yue <jindong.yue@nxp.com>
In-Reply-To: <20260225-mxsdma-module-v3-0-8f798b13baa6@nxp.com>
References: <20260225-mxsdma-module-v3-0-8f798b13baa6@nxp.com>
Subject: Re: [PATCH v3 00/13] dmaegnine: freescale-dmas: small improvement
Message-Id: <177305675929.117444.10373471649910063885.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 12:45:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 25 Feb 2026 16:41:36 -0500, Frank Li wrote:
> Add managed API devm_of_dma_controller_register().
> 
> simple mxs-dma code and add build as module support.
> Use dev_err_probe() simple freescale dmaengines.
> 
> 

Applied, thanks!

[01/13] dmaengine: of_dma: Add devm_of_dma_controller_register()
        commit: 3a005126c9d7f30093627a6f329656c358e16b3a
[02/13] dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
        commit: ab2bf6d4c0a0152907b18d25c1b118ea5ea779df
[03/13] dmaengine: mxs-dma: Use local dev variable in probe()
        commit: 96857a90982c2a461520fadc55dda3b8051e8d96
[04/13] dmaengine: mxs-dma: Use dev_err_probe() to simplify code
        commit: 4a5b0a728d665b3b7b08fb5bf6b2f69c995e30ec
[05/13] dmaengine: mxs-dma: Use managed API devm_of_dma_controller_register()
        commit: d11544c674b64beb9948724ba27187238c52b079
[06/13] dmaengine: mxs-dma: Add module license and description
        commit: e1b712c9352cf74285973462ced8d60ed7a9183c
[07/13] dmaengine: mxs-dma: Turn MXS_DMA as tristate
        commit: 67adf1f6643d75e33509900a2cb35db3a31f0410
[08/13] dmaengine: imx-sdma: Use devm_clk_get_prepared() to simplify code
        commit: 5daee52d7cc87415367fa0051a80998cccbab920
[09/13] dmaengine: imx-sdma: Use managed API to simplify code
        commit: 8982cb214a7f29db7d28058a3b4697f436af34d2
[10/13] dmaengine: imx-sdma: Use dev_err_probe() to simplify code
        commit: 917edfa57783352cd491cd5759a04d7b60de1714
[11/13] dmaengine: fsl-edma: Use managed API dmaenginem_async_device_register()
        commit: 4035726a6b724ff0f04b4f1429c7b1a935fc2e76
[12/13] dmaengine: fsl-edma: Use dev_err_probe() to simplify code
        commit: 804e18f7da6d29cff7ed4e004bcc05658f51d737
[13/13] dmaengine: fsl-qdma: Use dev_err_probe() to simplify code
        commit: 2438deea9ff82940ebfce67e232d558199ab8a6e

Best regards,
-- 
~Vinod



