Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F72CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsfkewtZkeXUqsNAkn3MeYENQgA5y+P526SpMZ1pQC4=; b=qIITR0FmObNbrNRWvFRB0VJlvi
	SmyejDm3QGHbA4ksT4q2lLt0nzqk7EQxgexlUWJMkUTk5woLT8w+OtlhNKVT+Rdo7JqgFbXLqd/u6
	boViqaru30shoV3DR1tpPX9C/JsHt1CcYhuxjqcYFncxhXTfd3ugIUUMIOBmZO5pMsvH/+Yun+Kjm
	g5H6TtvZ2vWQ47yuavBkzROL91XhYqC8KJ7rPZH1xmRNkm2je7c5fpRYpJkJVTkFN8vlXWtD36yJL
	7tlsJEHbgnm4MuwAiBkiWzFMv7NkExg30UpuCthSzw9FdyFA6yyghSX3fyDf9Mh0hNOn2f8OIPg3Q
	QQuLefvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJC4-0000000GKpI-2l9J;
	Wed, 14 May 2025 20:59:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJ8O-0000000GKYc-2OJ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 20:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F8975C4A29;
	Wed, 14 May 2025 20:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52475C4CEE3;
	Wed, 14 May 2025 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256123;
	bh=XI3xgfAZdwvDWzRCy7jilpDXrXPyCBgl3gT7OpRxpqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sd4Tg7iVw9a3co6ia/HEJyfU4qAMGV5ADJVZuvdFjfpR8ubXd+5rQhM3p/FuieE27
	 SWP/qk39rgoRHVefCSLTj4mqFWpORhdqDx8REFM7pRU3sV6Cb5uRaxB21ideGeMkzB
	 CxKXF6sSGTbgU5Jc2gBpNXQN35ENq28Ojmt+4TeGHSW5ht/8mMawq629lOtSzRGoAW
	 296XCAd2dbMB59OLB2uJPyBECZUGnZ0LIRrtSWaosrzqpWoBLJc1zZK8aiNNF34vIu
	 aJiMiJ726GB5DJGH2AUIfQATNdkh2/gjDaP1ZmZtHg5sWderift4sCUQp23/OHLdVc
	 PNnsSPcx8orxg==
Date: Wed, 14 May 2025 15:55:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-pm@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Lee Jones <lee@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neal Gompa <neal@gompa.dev>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v5 01/10] dt-bindings: gpio: Add Apple Mac SMC GPIO block
Message-ID: <174725612106.3020225.7096153668435332244.robh@kernel.org>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-1-f5980bdb18bd@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511-smc-6-15-v5-1-f5980bdb18bd@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_135524_653572_7E499481 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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


On Sun, 11 May 2025 08:18:36 +0000, Sven Peter wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../devicetree/bindings/gpio/apple,smc-gpio.yaml   | 37 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 38 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


