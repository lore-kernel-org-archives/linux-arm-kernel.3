Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjZvlpJSXYOhVZuRppmSko+dfxbbl2+AcegT2rC1JKc=; b=PMUOvV7v6Ao23v/o5WOcE6MR5D
	/GX8mqcDmwRN75oqhrFkca3weegaFileELLs9jLl1VoN/F6iIKErEYNc7dC6Mee2z7xXN6Rv2nToA
	ptCjVFlVLZ9Iokv8suaalaLzvjSK7L0cH2qMJpwlgDPYNtC3KbuiaJaqBTQYnUdS+D3Ine2ikZlB5
	0fZSs7mU/lQe8h1ogvSN0xjPMd0j5JNx/2A4ujpTC/jW5oPaZQsphjMmbkF+iL1t7TgkGoKB6nsub
	kw5B11Po4+hDUiHhQqrHOv7mTtSmZHLd2D2jK9/ejozUvH9eJdH6SW31ba2qo8cgtmq+1Ybcp3Mal
	MZ9bwVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm3g-00000001x01-2Qnv;
	Thu, 09 Jul 2026 10:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whm3f-00000001wzq-1z6S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 10:32:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E2BED43CC0;
	Thu,  9 Jul 2026 10:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84A41F000E9;
	Thu,  9 Jul 2026 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783593162;
	bh=EjZvlpJSXYOhVZuRppmSko+dfxbbl2+AcegT2rC1JKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdH4Z+jdnHyig2RoKQtqKol7ECXjkpU6SSRU97vFOWRucE8qG2E8WSJk05+E9cp+z
	 /5zCMDdX22Vyt1y7hPRNNG5pX29YmIP4UmOVxXWjOxSfFdUkNgGT5lGanbSFnr8zOy
	 v7RVuazvUSRGJLh0CmxM49K8Ym+6FyfuRGLH7aA2UyX6onQN4hn4xzIr9ovkIWtcfj
	 6ntAr6jJ7QKJm0GjDtbOLK/KWdaJY0hTlj5WVSt+UYDjHiyLwIKVDHBA2/H3suIW95
	 jO4gj33lrGzsL+V0ioy1eaQYQdzbTNxeX3t5oLRKgfXMuAEyJ0jr6ISoyHr5m1uTe3
	 pX+QvwkFVzG0g==
Date: Thu, 9 Jul 2026 11:32:37 +0100
From: Lee Jones <lee@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
Message-ID: <20260709103237.GF2045740@google.com>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
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

On Wed, 08 Jul 2026, Frank.Li@oss.nxp.com wrote:

> From: Frank Li <Frank.Li@nxp.com>
> 
> Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
> st,ref-sel. The both driver drivers/mfd/stmpe.c and
> drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
> put these properties under mfd, but some put these under child node
> sample_ts.
> 
> Allow these properties put under sample_ts and mark as deprecated to fix
> below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
>         from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Why is this attached to submission:

  [PATCH 0/3] ARM: dts: imx: cleanup st,stmpe touch screen related CHECK_DTB warings

And where are the other 2 patches?

Pleas send new patches as a new thread.

Never attach a new patch to an existing thread.

-- 
Lee Jones

