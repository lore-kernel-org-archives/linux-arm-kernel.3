Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E04DCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dgzbxv5LgP6yrWflVEmO9CW6B2XNNqetxCLAu9JfhLQ=; b=BtsAVs6xS8ruomwtKhuexRd43m
	DqdNvv3qajEKcAlBBi0srBWJjS1nvO3DUa5Ke5rPpSdpcuWP2M+AMom9sEpv40G8zX0vM2tueFnn3
	XrHlAjP8p9Q4M/iRSPW5oxnsM0e9keEin9r8RsPb7ZIje4O49t1Wo9nqIkKxFKpxnzWY5dNSqdk07
	o9FqOp+qgPG8zxmmaOSCxzSxYBhE+6vCYsRKAfR0EzBr+tpZPzjVfKPbT3HGPWGChY37qno9PZP8n
	EHiSl7iSPQwRyDgiwzXxXIn+eHqewlhtYIC6fn6Pv+MwgxbW96B77Ap2tCPxsqX1KpbuEn2BFQR8P
	09c2ZzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwX4-0000000FFFs-3Cei;
	Wed, 14 Oct 2026 10:48:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwX3-0000000FFFc-2VCm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 10:48:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C18186022A;
	Wed, 14 Oct 2026 10:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE2A1F000FF;
	Wed, 14 Oct 2026 10:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974904;
	bh=Dgzbxv5LgP6yrWflVEmO9CW6B2XNNqetxCLAu9JfhLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNHuwjdQK+UqOji54CT96pYb8N/B20UgGYZr+66mT1M5+06Ah2qiIS9mK0jrKqW2R
	 nOmtzwSF8B0TbNLKbUj+1HDMl+YyE2LchBMD+4NGiigsvf/XP2Sj3DaIZfNXULDJnM
	 x/K9PlwyBzHnBgjlof/BOi6DFA57I2UWZCEbf3mRXZibxwUWOmJT9D+uhK1D8V5ODz
	 fX9RBw3Iy6pLWkfGZttKsp3gjuYOWaAZFk2Qw/1lljDj4phBG0aPs+V2GX/SSZfhpR
	 lLstCE6tJSKPhtMMyW4NiOUeLjLx2QTn6vgjblgKJ3wmQpRlPRjdCh6+zpdSlpk+sU
	 muh6TbpB+Xw/g==
Date: Wed, 14 Oct 2026 12:48:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	Jason Li <jason.li@cortina-access.com>
Subject: Re: [PATCH v6 06/10] dt-bindings: serial: Add Cortina Systems CS7542
 UART
Message-ID: <20261014-grumpy-ant-of-satiation-f72b39@quoll>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <20261013-b4-cs75xx-v6-6-37e8f3969b7c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-b4-cs75xx-v6-6-37e8f3969b7c@gmail.com>
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

On Tue, Oct 13, 2026 at 09:06:07AM +0300, Fil Dunsky wrote:
> Add the binding for the UART found in the Cortina Systems CS75xx
> (Goldengate G2) SoCs such as the CS7542.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../bindings/serial/cortina,cs7542-uart.yaml       | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 

This depends on the first patch, so should not be taken independently
via serial tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


