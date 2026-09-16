Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB8C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MN0X+IRbqzIj1VbDzEUt0hOl0UpK0iS6L2nbKTTZPpM=; b=kvynyrzJFeNTJsmPrCXH374WxK
	9WeNeymMjOkW6ZY3QgMkaU5OG0NtYUx4Jpxsx60lLl1AfjTPjvwD/hrp2GuTozcn/NNHG5PChXbVc
	Gd2xsA2y0CsrZkhdzH8Ets/ZJnDiwE9bqAu5iNIddf+7oKrMVzprGJ5cAGykXHPvq5ZE+jLbsalQ3
	OyeH7nj8V/651sOXpW6k1UrJHVt23/Wn8q3ZOfTUUnBTkIn1bKZBDZWdCsSM3Uj3UAc12fotYYZvq
	B+elE37tZHwe18D6ohUzvF0SMIC9o5o4H3gfP3j/QfWFn3M/C9aKKk0Lj0inCmJfuk4ufS34iWEaH
	8avdDITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nrb-000000095Gk-23bD;
	Wed, 16 Sep 2026 11:31:43 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nrV-000000095ER-2Koz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:31:39 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 22C93CC9D1;
	Wed, 16 Sep 2026 14:31:29 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 22C93CC9D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789558291;
	bh=MN0X+IRbqzIj1VbDzEUt0hOl0UpK0iS6L2nbKTTZPpM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ChdxBR16gxjZ+PtwX1XmtgzWKL4zxpOKwm69kf1IRaz8AjpDR7APvJ48yth6ySgud
	 jeIWA33ooS7Ar7QE0Hj6ucNbKiRg8Uk0am6K60XYsmAP0gd/gA1ES3fTtHEfSmRKM+
	 iNG3w97GLqf2nlSwCbTfDjlsUXuDQB5LnrQeMLj/Ym64ZQPFypK4axJ6vWrDnAveKY
	 OhE+RUnaxc13+NT2Tu9n+C7qLiOvlO72fUx59USmquylE+ReDDmzi9uza3d0rKu7/6
	 OwZz0vVko1fb2RiFw1VFJjcHp/vEtpPDYzmFdV+1adeM0OG57YbxLDXRtFdDfROKxn
	 BGs8MFUGMka8A==
Message-ID: <c9bdd274a1f4b407bc3138bf0d973e3cede7e2c1.camel@rendec.net>
Subject: Re: [PATCH] irqchip/gic-v3: Fix typo in eoimode1 comment
From: Radu Rendec <radu@rendec.net>
To: Xiaonan Chen <chenxiaonan101@qq.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner
	 <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 07:31:27 -0400
In-Reply-To: <tencent_FC9BD4844FBADF31F931DC723D8F4C3E1808@qq.com>
References: <tencent_FC9BD4844FBADF31F931DC723D8F4C3E1808@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_043137_916105_9D202A3B 
X-CRM114-Status: GOOD (  13.21  )
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

On Tue, 2026-09-15 at 17:02 +0800, Xiaonan Chen wrote:
> Drop the duplicated word in the gic_eoimode1_eoi_irq() comment.
>=20
> Signed-off-by: Xiaonan Chen <chenxiaonan101@qq.com>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 6e1fa5b247fc..69ca208eeee6 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
> =C2=A0{
> =C2=A0	/*
> =C2=A0	 * No need to deactivate an LPI, or an interrupt that
> -	 * is is getting forwarded to a vcpu.
> +	 * is getting forwarded to a vcpu.
> =C2=A0	 */
> =C2=A0	if (irqd_to_hwirq(d) >=3D 8192 || irqd_is_forwarded_to_vcpu(d))
> =C2=A0		return;

Reviewed-by: Radu Rendec <radu@rendec.net>

