Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E248CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvwlF6aMjt/ctYUuBL3JPfNBkTxCTujVNJ6VU6bSGDo=; b=2NctKTaHVUgQ1cglyXC9f9xeng
	JcCHqN6XL47RJ6YseQnH+vxVyQq0ndYs3oOi5lOb7LzIxzphxJeWzwqJBM1ONLh+jcqfJn6/Xh5lm
	f7GaEJmzsvt2iiaNYcXerrFLSxM4x+DBUBBveCTqAGiK7pt2nIoWyQeeFLTFkzqwbTpFyctg953bo
	FunfyH59ssNZJM89wavPRPk/PBc4jsYUhHWXKDYS7JORXveuBNSBXysz+43nnfuo0atqkoZ39kkcd
	tw1e9FVmIPjQNehMRCCZ6RDsfZLC7gkohDi7ECPA3P8V+yzcBMxwdH/b9JUhKqDUYaBQDUtR9fzxo
	YfzQhYtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBYE-00000008NKM-2vqv;
	Fri, 24 Oct 2025 06:45:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCBYD-00000008NJo-02Bi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 06:45:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A2C543E01;
	Fri, 24 Oct 2025 06:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4902C4CEFF;
	Fri, 24 Oct 2025 06:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761288324;
	bh=UUhpDadZzBT4RrPvzIdECya0GjjCWyOzHQkuKftuzQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivnGSX9DduM/MQ3ZCnpNc62OnWb6W1h9IiDDP6dsfVjSgb3jOLPa0VNNzruUqf5pS
	 qhmliyRhoRe269hJZp5+YDDOXrtig4fQViL/rfmkqETX14BeTLZ+nPnQ6T8lF4dveM
	 SEOIUhC8wTQ/V6yEtA30ijB80qUwyN0LhUES2BGTO5MWs2i20z7xJ5yE6b3+EwiYav
	 S2HiYVRBLW1LRSyeZdeRRo8LsL/+kBul/V/7kJ4UPQaP4W58RJ/r8sRG061ecw60sR
	 4uaJWGTcXUxD2sdbCdO8bSUlWf5gKjkeJstNRnwyN6e24SqUA0FeR2z8DpMtxKmLhM
	 Gyw7h+Znj9EbA==
Date: Fri, 24 Oct 2025 08:45:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	jk@codeconstruct.com.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
Message-ID: <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_234525_065237_2FFFA67A 
X-CRM114-Status: GOOD (  10.27  )
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

On Tue, Oct 21, 2025 at 09:35:45AM +0800, Ryan Chen wrote:
> The AST2600 I2C controller is a new hardware design compared to the
> I2C controllers in previous ASPEED SoCs (e.g., AST2400, AST2500).
> 
> It introduces new features such as:
>  - A redesigned register layout
>  - Separation between controller and target mode registers
>  - Transfer mode selection (byte, buffer, DMA)
>  - Support for a shared global register block for configuration
> 
> Due to these fundamental differences, maintaining a separate
> devicetree binding file for AST2600 helps to clearly distinguish

No, that's not a valid reason. You just moved the compatible and are
still 100% identical, at least according to this commit msg, so there is
no point in this patch.

NAK

Best regards,
Krzysztof


