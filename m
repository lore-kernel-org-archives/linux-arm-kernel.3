Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65621C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyOsQWlx9wOPikLvlGoUZKXFqWOe7s/HotIfPZuLNMU=; b=McVPNIDt0R4CH+ugSnxV43OEj2
	IHgoG0YMfJvEj4DcNPK+oxmjG1/Cv78jbgp0aw4HUajj+CQk5JfxjzDWEoRw7P6bHWYqABjiG1Xez
	wgjJz13gtrVLVdocdXPRO/Q/TsE698kXZy9LVDqCVFM7qxFehdZpOWVweK/eGRtojIMh8fFJFcBvR
	3RbMZGl/+4L+iUjzcw6jSKmKI1/F/pJdi5yFiVWMMDlOK/9TFFVnmgkh6d5GSAL2CaD9Xkf58za1H
	QnDyG1cN8kBFhtxQco5F409LXYktwlo2UDNAkaJZ6bzW635HuxfwJiX/dH3mTjFD98UHWgN8NG3wE
	PmUml3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ME5-00000000DDj-0oyO;
	Sun, 20 Sep 2026 18:25:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ME4-00000000DDZ-1VFs;
	Sun, 20 Sep 2026 18:25:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97A8541861;
	Sun, 20 Sep 2026 18:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB351F000FF;
	Sun, 20 Sep 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789928718;
	bh=HyOsQWlx9wOPikLvlGoUZKXFqWOe7s/HotIfPZuLNMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9V7CC/CwGt//6juokjMbcKK8cPY1+gZVqM8m/L1Mq2QIvJFTCOZSlnLgr7EqiWYq
	 h7iTOKd7ZyYiWgfBXFslK1xIkQOatthzOr9a4yihBOgHWkFIs/ylj67pAXdxjdHmGp
	 xMnAG3e4ml8I0+RP9w8+lycYvpcophCNKOpzABtLqXMdESh2oERd7yjSi8y5ssa5p2
	 DHcqu3qykSeteXL7fsJGI3GPcelUqY0n068pQv2Hetp6T5uEGSiSrCGktGjcltZ68n
	 xVIDK+czfKPD916PNCfkDcPYVgJKEDjCg/kkIIv0Ege79AHlVNLVu1n2aBEPX8BhBW
	 CLt9xrcO5c/pA==
Date: Sun, 20 Sep 2026 20:25:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add DFRobot UNIHIKER M10
 V1.2
Message-ID: <20260920-terrific-resolute-bullmastiff-7e3913@quoll>
References: <20260919134125.59419-1-founder@crepuse.com>
 <20260919134125.59419-2-founder@crepuse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919134125.59419-2-founder@crepuse.com>
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

On Sat, Sep 19, 2026 at 01:41:31PM +0000, Mizuno Miotsuki wrote:
> Add a board compatible for revision 1.2 of the DFRobot UNIHIKER M10.
> Other PCB revisions are intentionally not covered.
> 
> Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


