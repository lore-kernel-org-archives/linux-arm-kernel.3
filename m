Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACB3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQ4AJiWAm+L4niUK8fWwPrbQMZnP/qV6l8zH88nrcgQ=; b=OwNdjk0ISgv0AwiSqgz5Wh/YSR
	aW3SUUMwCHb78LRqWJYZllHOYsqb/oeWOpGBIlEV47b6VvxHzLchA6Z68okRB8fwDRKR/v4GOzXHl
	qCrj6x8Yb83pleAX+uGvcXYaJHXnSxXXnyMScEvLqZfM5gItEBliUqYll+RSFN9NZ7Zi5aNY0utLn
	J2VbaG+tp2gaLtmOouY/i2HsyYHfDw6hFrmWxxOJkE/N/1hdve+AjhTkbOptCJ/PH69830JIhAx4f
	Sb+tDSgFaig/r9oKB0WKYuKLXeiRoxZfJMG5v/h+lIrwIGOExPtDVk0aup/zJ9z+R+GVcQ6pH7hQa
	zxncN4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2Qz-00000008XmO-2BNu;
	Sat, 04 Jul 2026 15:37:37 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg2Qw-00000008Xm0-37nw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 15:37:36 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 3C839C24ED;
	Sat,  4 Jul 2026 18:37:31 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 3C839C24ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1783179452;
	bh=XQ4AJiWAm+L4niUK8fWwPrbQMZnP/qV6l8zH88nrcgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jcKwdO5/NLvVvxSt+j+jee/1o7eobnBDNhsSMSyZblSpLyQ+jvtfQg3hyyajl7ZMW
	 /uDVhDGGSZQweauMxi8GlpaiARUiSQg5VNp+N+zjqD7spNWwKjOVYYiu+ZPQuneP7q
	 l75rv6hIkobTr2zB4p7HQ/DR2GSY/nbSKfE/7N0on5Pap0zAD7+pZ5lWZkI8tB5+s6
	 ODPxuhKXFg23E+cVz63ig1ZTmuGqwTJL7YQkmFH8j/iP++5Hyos1VmQJMcD4Z8yVXQ
	 NPihiaJcNFayQN+td67sRTfQnvuoty0DPNcCtlm0NFc/b3jqJ3S0NEf+qN9leDVtxs
	 OKqXp5RNiIJLA==
Message-ID: <d3dcbd615f2432cd8cdec46db9e5856d59300d18.camel@rendec.net>
Subject: Re: [PATCH v4 5/6] irqchip/gic-v3-its: Fix grammar and replace a
 bit number with its symbol
From: Radu Rendec <radu@rendec.net>
To: Kemeng Shi <shikemeng@huaweicloud.com>, maz@kernel.org, tglx@kernel.org,
 	jason@lakedaemon.net, lpieralisi@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 04 Jul 2026 11:37:29 -0400
In-Reply-To: <20260702033050.1583-6-shikemeng@huaweicloud.com>
References: <20260702033050.1583-1-shikemeng@huaweicloud.com>
	 <20260702033050.1583-6-shikemeng@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_083734_962734_6189667E 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, 2026-07-02 at 11:30 +0800, Kemeng Shi wrote:
> Fix grammatical errors in comments and replace the bit offset '62'
> with GITS_BASER_INDIRECT for better readability.
>=20
> Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3-its.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v=
3-its.c
> index 244509701070..120f6f29e978 100644
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
> @@ -2504,7 +2504,7 @@ static bool its_parse_indirect_baser(struct its_nod=
e *its,
> =C2=A0	if ((esz << ids) > (psz * 2)) {
> =C2=A0		/*
> =C2=A0		 * Find out whether hw supports a single or two-level table by
> -		 * table by reading bit at offset '62' after writing '1' to it.
> +		 * reading GITS_BASER_INDIRECT after writing '1' to it.

I think the second line is redundant anyway. Anyone who can read C can
immediately see the code is checking the bit after setting it to 1. The
not so obvious part is that the read back happens in its_write_baser().
But the way the code is written implies that baser->val is somehow
updated in its_write_baser(), and if one looks at it, then it's clear.

In the original comment, "table by" appeared twice. I would just get
rid of the second line altogether and stop at "table".

> =C2=A0		 */
> =C2=A0		its_write_baser(its, baser, val | GITS_BASER_INDIRECT);
> =C2=A0		indirect =3D !!(baser->val & GITS_BASER_INDIRECT);

