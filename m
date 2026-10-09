Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E61CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiuVVmjDxFja6mEi48+BQ4MgfN4UMQG6MWoTBxBEvCE=; b=1L7f0QQ3LULy1PKUYPyw2ycxJx
	E698WwPjEOU5T/LAWeOmNE50thbpDNlvCeMUsgXpvh3+rD1DLkAFC41NBHdWqxwVKr7NRT7gSbjQO
	1+ht4LQlHFySbthdS74BtBpefsDujQfXLYt2z+7sqpCE9XzPWbua5Xqqnu/1PNs11MF6qvVybD0hf
	ZNKf7gtOsu2qKAbRa9q2my1TGow74FrN8aMTeyid6CZ2huSoiydqsKtOy78Oq1DfUkFwVMO2LKQzy
	y7zYeurKZhgzG+J7E2UEPqySuR8lZJd7LfrEJIG0p7zjBFTsxw3zq9e+3ZDL1XuqX3TBtqUbeQnKB
	o+rbjVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7kY-000000062ck-45Gg;
	Fri, 09 Oct 2026 10:22:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7kX-000000062cC-274t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:22:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01A8440C43;
	Fri,  9 Oct 2026 10:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2186F1F000FF;
	Fri,  9 Oct 2026 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541368;
	bh=aiuVVmjDxFja6mEi48+BQ4MgfN4UMQG6MWoTBxBEvCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NNtbgk/HDvEUXitP5GQ3CoS1QSFn0VHVJWNdFpTDDbz8+vz4UVXoox4HjB/zIqlVi
	 CC4i9ojkFBOrRIEwH5Nxirvvvd0uGBbVeOxGBsjTmF/9W/52Ve40MCVrs5M27ammhG
	 8dDNIpvHzodHNMnFIGJXqNLvlbdZpYzd3zej7JqlbiHW29VG9m7bL7hUoEJINWkr7X
	 xbxFJ2hGIPZWCd4UdjZOISr7fQ3MgQPRGsmnm4WS1XRs4RGN/YIdv2x9EE8VOE3QvF
	 sKfw+8cUyC2i22aBbtyMJBG1bPgSNCUNX5sZKm1JyryEjfkAh3jWQFOsTjr7YI+fZd
	 /z8HAb/kF14Vw==
Date: Fri, 9 Oct 2026 12:22:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	=?utf-8?B?U8O4cmVu?= Andersen <san@skov.dk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/3] arm64: dts: imx8mp-skov-revc: convert to overlays
Message-ID: <20261009-aspiring-wild-bull-1affaa@quoll>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
 <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>
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

On Thu, Oct 08, 2026 at 11:16:00AM +0200, Steffen Trumtrar wrote:
> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> similar, apart from the Display and touch controller.
> 
> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> variants to use overlays applied on this base version.
> 
> Add a compatible for revC-based Skov boards with a touch panel for the
> common dts.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +

I guess "squash these two" under second binding patch was confusing.
Squash these two bindings patches.

This style generates checkpatch warning, which of course could be a
false positive but git history would tell you we never do that.

Best regards,
Krzysztof


