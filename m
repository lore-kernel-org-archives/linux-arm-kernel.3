Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC558D5AE41
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 14:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3/2Us+WWEmXNyI5R2qYS3uBblMDLM430KkbIZTR+8w=; b=HF4UT/awpMrM9iP2DelBNAgAol
	0JKgnBPH3IZrKnHAEkW/MTR1ku5Qzo0q3DBPKnONwdW0C/KnfDBdyMRRNhnzijSkGQXUMcDFt0ZWP
	ZzLJsDR/+SAwgK7YG0/yOcMQN3R6zWK1tfCng3CZShqGjebkiKG7c5JrjIFmTxrZqtQkv5qGesW9+
	HFINjFhbpSsx10iN3/tTCxdNeDUQjY3YBbO1Ez3tHbVyFknNdAGydR4Uhg+nJrHkUwgefGYwdkU/j
	bZVt8zTdANZWM2OUs3McGOjCiLgUTb4taCh0se5Bahf1qpNNtTP4rFyLKnPhPDQFU/NNrYEmmX1M+
	HzCXv6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUQvo-00000001hvG-2uG9;
	Sat, 13 Dec 2025 14:49:12 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUQvk-00000001huk-3hbp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 14:49:11 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-rg9b.prod.antispam.mailspamprotection.com; s=arckey; t=1765637348;
	 b=GL1DcM8jn5P4XDfew2XlOynou/qf3PsVRVIDLm1F3+0jqiHyCJm1m0PNV1Kxn5/KdQBdV8KAEU
	  NmF+0JAFCmlBC6dmUjfnupdY1EZmuySEwzzhiZhi7sUemogotmoAQtA6DI8DrKZbmjL9kQXRwk
	  3QPYsKWATO0wE0YfIEvGfQITlNvAA4iWDcpvzPtybMt9v182hQC0qGeaVVVBd75yp/4zOgOlK8
	  47D0ksy2Am4hsth9NCSB34QnjQS4Or/bqCzYuUIc7XVPJP7klaB1OkNgHisPYjfa1s/hTXB9v6
	  m5ebbxVlcZIRtpNsuhg4SFKegQv/p80LSgp5wt30vP6fRA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-rg9b.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-rg9b.prod.antispam.mailspamprotection.com; s=arckey; t=1765637348;
	bh=hmb6xGzMv/vH6oVI3SMboBWtIvQmnF78TVg9dy9oviE=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=A2qcqV2riBXzPqa5oA/oQvFLSVpw9TcQ5p/PBn0c/a0tnnAo6zUzGHebuSlWySAewQ1braqC0R
	  PYrphVq7EA46v7ysaV/4Cw4lJJyYsZ2PQfdmJgZbI1lKyd7nYLD6Xkekc/yP1XRibNfr8OdPlK
	  Z+4mK23U94cR0hPMiXJ9AyaE/3v0P9mm2OzeGUFXA4z7c9kw1lC76AqACO0+HjouJUOXRIzjfM
	  uaPkYNZcubwqIRutyDzQwbLhCXd3rCjIA+6vFn+fBV1IMuezDzXMuWytGpWKdt8iLSMzTv8dUa
	  XzbQwQ2sgO6fqXgNfIsw2BwqOhtmE/zg7Aw4XDkl6WgFYQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=M3/2Us+WWEmXNyI5R2qYS3uBblMDLM430KkbIZTR+8w=; b=MA+fVoBVWWMgJxCgx1bSBF5KJo
	7WYLK35HjhPzIQM+OxubE+TIt8BPeBde0co0cZGLhvznpcXr2OxnWhIl+WZ9e4IizNTSddr6hBws0
	e/4C4iiBMaCKotW5On0Lpezh+K93vkI6HLELwYM7Y62dNJvxUJgcsTpADK7aU7y72jUk=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-rg9b.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUQva-00000007VX5-1hwj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 14:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=M3/2Us+WWEmXNyI5R2qYS3uBblMDLM430KkbIZTR+8w=; b=Ri6RM4lRUWlOMF73nov0tmlpyF
	rKJCZyuJiZCK4EQVCAbXGQ+rwflVAs4UV2C3dzokjULimNv+FyO+nNrqPtdQnNqPjlmwDTyosy0qw
	HqvokWHF96TwwmqK5uZblUSc3fK7404hq0YVu5m5kpPZUxYmbpii+wMxWR7k6LcHiG1g=;
Received: from [79.34.194.176] (port=60557 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vUQvM-000000004in-18K8;
	Sat, 13 Dec 2025 14:48:44 +0000
Date: Sat, 13 Dec 2025 15:48:42 +0100
From: Francesco Valla <francesco@valla.it>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com,
	Tom Zheng <haidong.zheng@nxp.com>,
	Steven Yang <steven.yang@nxp.com>
Subject: Re: [PATCH v2 0/2] Add FRDM i.MX 91 Development board support
Message-ID: <aT18yj7c27_buJSe@bywater>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 4b4f3633d5228f3ce55d1cc0e75cd226
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vUQva-00000007VX5-1hwj-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-rg9b.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_064909_280391_1F24B651 
X-CRM114-Status: GOOD (  14.16  )
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

On Fri, Dec 12, 2025 at 11:31:32AM +0900, Joseph Guo wrote:
> FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC:
> https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91
> 
> Add device tree and dt-binding for FRDM-IMX91.
> 
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
> Changes in v2:
> - rename compatible 'frdm-imx91' to 'imx91-11x11-frdm'
> - rename 'sw-keys' to 'gpio-keys'
> - rename 'user_btn' to 'button-k'
> - drop lpspi3 node
> - rename iomuxc 'grpsleep' to 'sleepgrp'
> - move dt-binding patch before the dts patch
> - add board page link in cover letter
> - use CAN PHY to manage the stby gpio of flexcan2
> - drop realtek property
> - add pcf2131 aliase
> - add bootph- property for nodes should be kept in bootloader phase
> - add reset-gpio and assert for eqos and fec
> - delete unused alias
> - Link to v1: https://lore.kernel.org/r/20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com
> 
> ---
> Joseph Guo (2):
>       dt-bindings: arm: imx Add FRDM-IMX91 board
>       arm64: dts: freescale: Add FRDM-IMX91 basic support
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |   1 +
>  arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 904 +++++++++++++++++++++
>  3 files changed, 906 insertions(+)
> ---
> base-commit: 73f1e611b076de705c2f1c26cfdfc5b8e96f4733
> change-id: 20251114-imx91_frdm-add2b2c07e78
> 
> Best regards,
> -- 
> Joseph Guo <qijian.guo@nxp.com>
> 
>

Everything is in good shape, the only non-working thing is button-k3 
(but that was expected, as a small hardware modification is required
to reroute the phisical button from system reset to user function).
Not a real issue, at least from my point of view.

Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>


Regards,
Francesco


