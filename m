Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C88C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0mT1gYQutRbQjr/KeeBWDlUXYQvp5XqEtNxRNxpekI=; b=sl5Twn978En9Jwh4B5beid4JVV
	eMQwstIIEads15kVoPhOJypia3jbqxDNyJB0FG7NrAjhraAV1pt2NkdI2BhKJnDXss0mb3f8MGkdG
	S81gaQhzCPA3oL5JmSWkGDEjpAlCtspSQNLgxBkdT+PNgCQsR3J6ssC2UYojgDY3fgFsK6fx9BFuL
	cMlhOoclC6Khw+g6HCjMdJ1P/dpwjg5vuknK5eV83D9ptnfSQ85AxzbjmxoP3vVDIURhbolOwhY+S
	dEM1pBwr0u+bH/efxUu+IHL4lKtVlsIw/N6CnAKVrB6yvPY8S6D4UDENZ/Vip/KYAGeXDxdeu8AXm
	s81qK5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzgh-0000000EGJd-0fCO;
	Tue, 07 Jul 2026 06:53:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzgf-0000000EGJ9-0IZu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:53:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38A19618A6;
	Tue,  7 Jul 2026 06:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7EE1F00A3A;
	Tue,  7 Jul 2026 06:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783407223;
	bh=v0mT1gYQutRbQjr/KeeBWDlUXYQvp5XqEtNxRNxpekI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQuv3+yny3139qCwzgvCBjU5d1NWhDE3G7OLGFL+dceVhuD4j0RX3oThwQzUmNd21
	 BUZdb8187uOzXqJh/MKgrOw/HfY/SmbI6oVh8B2yoMEG8pxaq+eb21DK9MFA/w68iC
	 pmHLPDjtdIQAO67bYZ30nOkdZt+krW5PL2QIp4ziv7+NXZLfo9+sr2K48xTjNuRqcr
	 pHuVM4XXOT82oBNvv9JVJzCGuLc9FzNTlBZXfPcHvQ337qsBD/yZ8EKhBzQwcG+2db
	 Slbj3McbZtH9BbtVeVX5bV7yUShEoTLtTowJKVe2bxHflL0FtIuxgdSGISMeedkirj
	 6HjsLM3s6ATNw==
Date: Tue, 7 Jul 2026 08:53:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601
 (should be st,stmpe610)
Message-ID: <20260707-little-organic-horse-a0be9c@quoll>
References: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
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

On Mon, Jul 06, 2026 at 03:29:32PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
> 
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
> 
> Fixes: e10038ce1ba9 ("dt-bindings: mfd: Convert STMPE to YAML schema")
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


