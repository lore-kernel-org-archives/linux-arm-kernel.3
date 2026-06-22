Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FC2CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI0HXGq7FB0HOc+9hNUf3balba0LXes3NbQNPhmDLuo=; b=ESRGcuWVAK1UTarIx6+fmiGMKj
	WJZD1TiCfyfJKVx7nhfT0PgWwtn4+KUUvjlR3wOpzxWo9c8FO9oLmkO98PYQbdUdWUGqqhn/E13xS
	FrAJQjm668s4cESA2AorDyCT83vdqjCicoxSIVDaFmYGuLOonZ4dD+qyCHi/pYsmM0WdekYGed5FF
	6lrfxuDp8zVZTTI258xaNRtl3T4KmyFXrRN1XVNDqCnHBA6TNAQ8vRKoaO7qzj4FxyfWdqR678zto
	VJdFeJQHxvEMDmDBKLCBkNfW+XyRh+SD7X/NniiFUCmT+ankRg2mKNGG6XyRF/75SiRsKBUNYo4vi
	aHN/JsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdit-00000004xga-1u7w;
	Mon, 22 Jun 2026 12:25:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdir-00000004xgU-1aSO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 12:25:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E2D66001A;
	Mon, 22 Jun 2026 12:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F6C1F000E9;
	Mon, 22 Jun 2026 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131152;
	bh=SI0HXGq7FB0HOc+9hNUf3balba0LXes3NbQNPhmDLuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdXgQ+FvtEuqNgMhWGSlHBhCBpcXfTvhXmSOb3y7f7z4j4V3lZsv3hyCSvBgVMl5C
	 IhnWobl6fwwje0bZa9x2zhtXcvxfNbXzccU0H68Kz4aULAYJ7jhFsrxoTmCkMl60NN
	 ihiAIn22cpnE+15Jmg+WOlzjzgULhMY35uwuXI9siTWN9CSj9brGhn88fdZVro2hAZ
	 9KyNJVkOj11cx+PAqb/cUBbQ4qmXTQCMXj1pxK4rzOGZ7IE1ZcoAlroC2N1JmidPwC
	 ev9OhiZFDk3ayrf9dn8Z+GJesoJBqvmjscIbUNW2axIvSU4dvAbQsqKyloNpRloJRD
	 xh09OciNGmbGw==
Date: Mon, 22 Jun 2026 14:25:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Yu <f78fk@live.com>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Add MYIR MYS-7Z020-V2
 board
Message-ID: <20260622-private-lively-bobcat-e639cc@quoll>
References: <20260619102214.223121-1-f78fk@live.com>
 <20260619132355.1776-1-f78fk@live.com>
 <SY3PPF19552C607716AE1AA440C85D348B6C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SY3PPF19552C607716AE1AA440C85D348B6C7E22@SY3PPF19552C607.AUSP300.PROD.OUTLOOK.COM>
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

On Fri, Jun 19, 2026 at 09:23:54PM +0800, Liu Yu wrote:
> Add compatible string for the MYIR MYS-7Z020-V2 board, based on
> the Xilinx Zynq-7000 XC7Z020 SoC.
> 
> Signed-off-by: Liu Yu <f78fk@live.com>

You should not use outlook to send messages. That platform really sucks,
meaning:
1. You might not receive answer for me, because outlook/M$ treats kernel
maintainers as spam and does not care to change it,
2. outlook rewrites message ids making threading often broken.

Recommended is to use b4 relay in such case. You have been warned...

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


