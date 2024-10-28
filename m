Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2A9D3E2A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keYcC9fhxqNbYuzzzk2WhE2mtMjSjj0nBQVIyjqHiRw=; b=PNu0ecaaMz2JaluHOC+tVLkSqI
	8XMPheMMJJTZrVGrJhh4DDIVd4RsPKyugbmBnyb/LlrW5eMaXVzFYWlD/2ahRqKnhcrDVX9lZElcZ
	O6Zo/CZ4etJexzCdWD85IpR1BRQ128Ptwu9bagmd6zdLxkU475HEO88y4A8fz8yTkvs7/YEazSIB0
	4pH8EtU8MkBin/+bVlizmy83eLPU1iekxYAPsLl8CCp7bnp8aHjc89tYCuwUxaoCLZEaRj8y4rq1D
	vj0WtDJX7dJrmYZAp37EmuyJK0zWZj9CIQvjJRZL0UEKNONFH0AX+2i/jI2kA11akCqu0IICgvTP8
	GI5BiokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UwI-0000000BuuL-2BGB;
	Mon, 28 Oct 2024 18:58:06 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UmD-0000000Bszs-2wEX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=keYcC9fhxqNbYuzzzk2WhE2mtMjSjj0nBQVIyjqHiRw=; b=Ox7UQMINWv7qTuRqJRZEbZECAy
	Tzf47LEPIniNHdmIm6V1FNmDhWvHMy5BM9liiZo4H4mDGUFtsWlIeoeUpiJ6KemJ9Pf+psb0LF2SN
	zW+xXgMZbiWyUFxUrly/O8UNFE6kTbv18g4w00NqIoy3uRx6WN/Sz5wzLSFcw6dSyKJK6ExILFrX2
	+oQSgMLlntb7PLDs8G+0DZa8UPyadU055ESjhzcdaKi8vzecL18YWm3OLEIomwf2LHQvM0i5pMXKB
	MnauT4aJr1AQnet7+OuuhTOkMdx0wCmxiEsGSa1ljLlCDchyZnGcg7EP7Pw0w0kLsp4bYOu5t0cRJ
	975QpCDA==;
Date: Mon, 28 Oct 2024 19:47:28 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx: Remove fsl,imx6sx-lcdif fallback
Message-ID: <20241028194728.0655edd3@akair>
In-Reply-To: <20241028180844.154349-2-festevam@gmail.com>
References: <20241028180844.154349-1-festevam@gmail.com>
	<20241028180844.154349-2-festevam@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_114741_963736_F21B9037 
X-CRM114-Status: GOOD (  10.55  )
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

Hi,

Am Mon, 28 Oct 2024 15:08:44 -0300
schrieb Fabio Estevam <festevam@gmail.com>:

> From: Fabio Estevam <festevam@denx.de>
> 
> According to fsl,lcdif.yaml, "fsl,imx6sx-lcdif" does not have any
> fallback.
> 
> Change it accordingly to fix the following dt-schema warnings:
> 
> ['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

As the devicetree might also be used with other software (e.g. u-boot),
this might break something.  So if u-boot (or any other software) does
work with fsl,imx28-lcdif because it only uses a subset of features of
fsl,imx6sx, it might be worth changing the binding instead.

Same for Patch 1. But I cannot test that and do not have a strong
opinion here.

But thanks for touching this annoying warning.

Regards,
Andreas

