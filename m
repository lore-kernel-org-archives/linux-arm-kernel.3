Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E77C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/BU56m5hr+nm7qNN9JPWRw98TsKltQXZGfNDmvsteg=; b=mjkPlm/qWn3tDEJAPbZtOzrvrV
	3lsGVNSSRQasm4/f/yks2fdbFku2oMa01YlrgFha5U0V7zzQ3R3AnvZIJflzR3/IuiRIsk2b6lpXs
	j/CI0HKTU0Q/uqsS/oukMzOCOtV8CHqOj10aW40K1zPblsLRQYKhUM/wGOsY9VsFohyurwQ4lS0rM
	acWylWeNEetbYb7nJggE6JdMAlkjoOs8ZRma89X7fFPuDogQMQidYOsxkRYgLnuaxQKwPsVuU7eWt
	qxhy2LYuk/XhAnXvgcnCgPiKAb/Z9z7yTR/G7fAV1rdax5eHQ+o3n2jwTIQIkh4L1O8NTi9r4DL8V
	00jIuAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qxh-000000062s3-2CFF;
	Tue, 15 Sep 2026 11:04:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qxg-000000062rr-2fni;
	Tue, 15 Sep 2026 11:04:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63A4F41AAA;
	Tue, 15 Sep 2026 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74371F000FF;
	Tue, 15 Sep 2026 11:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470268;
	bh=5/BU56m5hr+nm7qNN9JPWRw98TsKltQXZGfNDmvsteg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agQpVdAyPlrOzRNUeA2HX0orWbarSld1v4ZzsMU8rIcdrPi5UMOzPLP6oOVhyfq/a
	 We3beQlKAK2dqH1FRxcGUdsduFCYTj/cEiWOx8PLUmiN3iUyQx398DqwPaFniYbJAx
	 L73ffSM2SnXQharscpxn34D2YxhMzuNS8TUG+lxermF+8fZRQvsl56WcRCdUVmpZJO
	 S3akshazZRo1M58vUotkJmSJUNNl5FkMUnmezjwy1DhwV8Z6aIlVWXdhqySRHrltAu
	 ASVqYJgodELE5fXf4IEM0ZvYb+nsoDJVjZjTqNp9t/OnBCp1r7J4oJ62l2Fx5KwYv9
	 uXuvw6N5QCaJg==
Date: Tue, 15 Sep 2026 13:04:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
Message-ID: <20260915-valiant-indigo-potoo-e15ed8@quoll>
References: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
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

On Mon, Sep 14, 2026 at 03:10:52PM +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 APDMA, that is compatible with
> mt6577 IP.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


