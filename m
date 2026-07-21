Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B30C44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 00:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozfN1zf4+uWXwlf8HnytJ7+svEtCavVMiyprjP6zfIY=; b=VE7sd4p2ReelrK81gVciEI1bE4
	Dq9kLmYdwoIPVp+u0o2KbVyqwvO69Yulb1bt7mq25m7gjY7aQoQZhO3m8SVVntrc+U9mxwW/b1NeA
	c7sjGaCKq/k0bsOOf4CYsLOuFT/2NjlnYBmF5JQ9QtCrd/BlCJzHgWLrn1EZP3CH5WjHczhZogQrz
	81NMcGO+i9WvbMAfYj1rP5VjoZILyOEU9/e0cDhHb0YAPUX72oV41FvgOlp7lMVSzadSavmCgVYsq
	Shx/wGXHQwii/+/VXu+1NjsE8YWmb6cffBpj+c4Xem5eK7OwD2VlKCHBA49sxjerVXruCrFY5nOdg
	IhmA5fog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyp7-000000089jX-1LZG;
	Tue, 21 Jul 2026 00:59:05 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyp3-000000089j5-2kR1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 00:59:03 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id ED15DC3739;
	Tue, 21 Jul 2026 03:58:53 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro ED15DC3739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1784595535;
	bh=ozfN1zf4+uWXwlf8HnytJ7+svEtCavVMiyprjP6zfIY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NoZc5GUYWpGTXpXx+efET/sRKMKjc3hZyNX08PYoRhuPmmObvDVItLVooNLlnZWUA
	 ef63ouqcQT9LpvXVPwwu+RWK7TFGSBq0KKq677FTsv2sHgzevYrNvcOFGpAjvkp9bg
	 AZAdODboxQm8XKy9nFmJy4jgBGOrIenINS6A0J+++K5yOlCogCynWH2S9m224AnJul
	 yZtjfB1l8an2Dawlt8DkJyPBl5cL8IiKEkCcVtTgXGrNOufWzjUY1MRyW/OOB4UXaa
	 q4rN+Bn4HAn53NrW4uPi3XADB53Ji9G0Wneoci6Vryq0Dd+cfCxjGw0QXBUc4r6VZq
	 s8CyHcl7Zlezg==
Message-ID: <46025d0b3255bd62412598eedae4eda03a61cd39.camel@rendec.net>
Subject: Re: [PATCH v5 4/4] irqchip/gic-v3-its: Fix grammar and replace a
 bit number with its symbol
From: Radu Rendec <radu@rendec.net>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org, tglx@kernel.org,
 	jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 20 Jul 2026 20:58:52 -0400
In-Reply-To: <20260720071215.50705-5-shikemeng@huaweicloud.com>
References: <20260720071215.50705-1-shikemeng@huaweicloud.com>
	 <20260720071215.50705-5-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_175902_000734_2CFD97B5 
X-CRM114-Status: GOOD (  18.29  )
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

On Mon, 2026-07-20 at 15:12 +0800, Kemeng Shi wrote:
> Fix grammatical errors in comments and simplify the comment about reading
> GITS_BASER_INDIRECT to check two-level support.
>=20
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3-its.c | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index 5dc91862fc15..8935a6e7a20f 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -163,7 +163,7 @@ struct event_lpi_map {
> =C2=A0
> =C2=A0/*
> =C2=A0 * The ITS view of a device - belongs to an ITS, owns an interrupt
> - * translation table, and a list of interrupts.=C2=A0 If it some of its
> + * translation table, and a list of interrupts.=C2=A0 If some of its
> =C2=A0 * LPIs are injected into a guest (GICv4), the event_map.vm field
> =C2=A0 * indicates which one.
> =C2=A0 */
> @@ -2502,8 +2502,7 @@ static bool its_parse_indirect_baser(struct its_nod=
e *its,
> =C2=A0	/* No need to enable Indirection if memory requirement < (psz*2)by=
tes */
> =C2=A0	if ((esz << ids) > (psz * 2)) {
> =C2=A0		/*
> -		 * Find out whether hw supports a single or two-level table by
> -		 * table by reading bit at offset '62' after writing '1' to it.
> +		 * Find out whether hw supports a single or two-level table
> =C2=A0		 */

nit: since it's just one line of text now, you can put the /* */
comment markers on the same line, which is the preferred style for
single-line comments.

> =C2=A0		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
> =C2=A0		indirect =3D !!(baser->val & GITS_BASER_INDIRECT);

With that,

Reviewed-by: Radu Rendec <radu@rendec.net>

