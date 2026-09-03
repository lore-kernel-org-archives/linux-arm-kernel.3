Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E25CC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrKxt9vYXse+6frgKnd7jpIrxEBJjTuM8wsMTzUkcIc=; b=Vd9+OjJdKWXKfGvP3zw8WUOJmp
	wR6S5FcoSsRy+GkPb/j5HEw0jd/tphSdK5UuIjzaXV/75+r39Eo6L+O6AO9/83JIFjoqVU1DMDz0Z
	dvWHTOUNW/ajixoKvAE5y9By+nse4ivgfv/AfSK0l7XFP+P42Zuz3DTDGtXik/6ATR5/8uWJFNfC7
	5plzX6cA/NB65NmTDTegy/2mq+2Hn/03XpyFMlYF2wA9XLiOb8NUjVmm2H6s2b3uUKQOBrWtK+gsU
	iwWxckMpDNVPE+byYPBefg7IF0tfrEL0RqCNlt9MeqP+K3vRBhWvUcGJpVCA6FMb3ots6x7XvSK/6
	k5rJE1/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26Ya-0000000HISO-0zZJ;
	Thu, 03 Sep 2026 12:28:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26YX-0000000HIRY-2jSm;
	Thu, 03 Sep 2026 12:28:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DEE9E4E414EC;
	Thu,  3 Sep 2026 12:28:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2488602B8;
	Thu,  3 Sep 2026 12:28:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2328C11C7A01D;
	Thu,  3 Sep 2026 14:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788438509; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vrKxt9vYXse+6frgKnd7jpIrxEBJjTuM8wsMTzUkcIc=;
	b=bTdOVqSf6aGtK5L9ynAP9tmNJoU674gqZTEd0auCuwYFgr2gDd9RQxKLWuPlJfOHojFxFz
	bezMq3ngSZng9k9uJl3UN5HXqWvglovciNMXg2SE6y/hWkpM26mbPQuUn5GE6CtYkpSGzt
	0aMqIEe3/LczcK2RIL0HTphRPGsXyj+hmCtkDLVKSl5ZUZYhGepVo6N/DP9ADxEptK6F1S
	Cnt1HwTOXMMGpFalqM5gWyWUW9mhS1KTfsDahBuFXS/DOp88SVydrMNvKEqUIUX/PKlySo
	66ysanBlXFnNTtQ3xBXWkYlw7H/0OlUXrx9SIOkJZQPwggUWeWEwnL39sQINBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data support
 from drivers
In-Reply-To: <20260903112425.1904748-1-vz@kernel.org> (Vladimir Zapolskiy's
	message of "Thu, 3 Sep 2026 14:24:22 +0300")
References: <20260903112425.1904748-1-vz@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 14:28:26 +0200
Message-ID: <878q5i4iz9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_052837_862257_08E75DB1 
X-CRM114-Status: UNSURE (   9.28  )
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

Hello Vladimir,

On 03/09/2026 at 14:24:22 +03, Vladimir Zapolskiy <vz@kernel.org> wrote:

> Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
> device tree support, the unused platform data support can be removed
> from the LPC32xx NAND MLC and SLC drivers.
>
> Vladimir Zapolskiy (2):
>   mtd: rawnand: lpc32xx_slc: Remove platform data support
>   mtd: rawnand: lpc32xx_mlc: Remove platform data support
>
>  drivers/mtd/nand/raw/lpc32xx_mlc.c | 21 ++-------------------
>  drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++-------------------
>  include/linux/mtd/lpc32xx_mlc.h    | 17 -----------------
>  include/linux/mtd/lpc32xx_slc.h    | 17 -----------------
>  4 files changed, 4 insertions(+), 72 deletions(-)
>  delete mode 100644 include/linux/mtd/lpc32xx_mlc.h
>  delete mode 100644 include/linux/mtd/lpc32xx_slc.h

Sashiko raises a build issue due to the cleanup missing one use of a
header. Can you please check?

Thanks,
Miqu=C3=A8l

