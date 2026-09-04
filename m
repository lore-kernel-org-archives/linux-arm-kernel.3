Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37229C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5bb8hjZGz+CA4fl4HfW3Nb19eVE35fDNkkqntI3KtM=; b=zb6fxDiFAHu7P7dkQ90AxHdhDH
	nCgg1CilqcZR4DQ2XxUWU04SO8KREmhu8+tqy8H+g2aHT9YeCHRp6D5YS7mwwCPI8wlyblaqjv4QZ
	02tclbg1/nUItEGyF4nupog+0jSLDrkLbs1E9mZlCkUfAMWnSTvG1czugvMU+M0z6KQCu3xVBF6j/
	TjUp2jGKBXp/Q6Cx9dHeJmrGzmkt0Wxu9qvLsqXGQQS91ewbZIcxSWCRgVNGwnS5dKi73fCUrxY6Y
	N0aVyLXUxdQfk5R9yFGc1GfN+IjyDaYoDu+ec9EmH7hoCI4XBysJDL7eN8b46fAoWHaPnBvpZqXIo
	fWM4LYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Obw-00000001GCJ-2qjD;
	Fri, 04 Sep 2026 07:45:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Obs-00000001GAJ-1Ymg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 07:45:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 724411A198F;
	Fri,  4 Sep 2026 07:45:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 452596057F;
	Fri,  4 Sep 2026 07:45:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EE1311C7A549;
	Fri,  4 Sep 2026 09:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788507908; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K5bb8hjZGz+CA4fl4HfW3Nb19eVE35fDNkkqntI3KtM=;
	b=BkK5GKVgZp+ghWls98Rz86XOPcLZq9tdZ5JNqERCRh+PVnwdrY2j32Y+fnFA1cGYVSr3m/
	5Ez8DSypjPeqmU61/HJDruvMoeeumcE20Pzj756efcRVJ1sBIhBo3rkhSNup06TqRY8wcP
	uLUA4kmZjT7wxXA7e5NnNWq/6r0u1kq4fhsSalqJKrmoovEroULjoOPDtuviv5zKb36N2V
	VSHtCysQUHCn3SbC0r3afwgWHqG9uZkDrNIEaG73LMv71ddNWSvt+Gsc0IR5OFreembRhB
	I85QHSwvIrOLN8GsL8S/hcPTg9NhsPC0eQ8E0m7oCLzf9lzQQZuLEQ+hOQrfLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] mtd: rawnand: lpc32xx: Remove platform data support
 from drivers
In-Reply-To: <28de391b-59ed-4495-9b16-fde7b811d6fe@kernel.org> (Vladimir
	Zapolskiy's message of "Thu, 3 Sep 2026 16:23:20 +0300")
References: <20260903112425.1904748-1-vz@kernel.org>
	<878q5i4iz9.fsf@bootlin.com>
	<28de391b-59ed-4495-9b16-fde7b811d6fe@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 09:44:59 +0200
Message-ID: <87wlt131fo.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_004516_551629_A1F6CEE4 
X-CRM114-Status: GOOD (  12.75  )
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

Hi Vladimir,

On 03/09/2026 at 16:23:20 +03, Vladimir Zapolskiy <vz@kernel.org> wrote:

> Hi Miquel,
>
> On 9/3/26 15:28, Miquel Raynal wrote:
>> Hello Vladimir,
>> On 03/09/2026 at 14:24:22 +03, Vladimir Zapolskiy <vz@kernel.org>
>> wrote:
>>=20
>>> Since NXP LPC32xx SoC support in the Linux kernel strictly depends on
>>> device tree support, the unused platform data support can be removed
>>> from the LPC32xx NAND MLC and SLC drivers.
>>>
>>> Vladimir Zapolskiy (2):
>>>    mtd: rawnand: lpc32xx_slc: Remove platform data support
>>>    mtd: rawnand: lpc32xx_mlc: Remove platform data support
>>>
>>>   drivers/mtd/nand/raw/lpc32xx_mlc.c | 21 ++-------------------
>>>   drivers/mtd/nand/raw/lpc32xx_slc.c | 21 ++-------------------
>>>   include/linux/mtd/lpc32xx_mlc.h    | 17 -----------------
>>>   include/linux/mtd/lpc32xx_slc.h    | 17 -----------------
>>>   4 files changed, 4 insertions(+), 72 deletions(-)
>>>   delete mode 100644 include/linux/mtd/lpc32xx_mlc.h
>>>   delete mode 100644 include/linux/mtd/lpc32xx_slc.h
>> Sashiko raises a build issue due to the cleanup missing one use of a
>> header. Can you please check?
>>=20
>
> sure, from its report [1] I see that Sashiko bot verifies the changes
> against today's outdated v7.2, and therefore it produced a false positive
> error, since v7.3-rc1 contains the commit d6ef4391897d ("ARM: lpc32xx:
> remove a few manually populated OF devices").
>
> There should be no build errors introduced by this series, thanks for rev=
iew.
>
> [1] https://sashiko.dev/#/patchset/20260903112425.1904748-1-vz%40kernel.o=
rg

In this case that's all good, thanks for checking!

Miqu=C3=A8l

