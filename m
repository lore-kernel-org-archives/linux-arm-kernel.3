Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D90BC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 18:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzvF1uGW1BmPBniFIraEI0sWxtjhBw/Ld3lz24/uYLE=; b=sQSHvaUeuPG0yKdEFKI+ZnLo3P
	Bn7G3mHF9lzYshVCcGEsGBujQUcs/ZsN+EitiIgDK0TwDZO5e3SHASRRAelylAuYDyxVSdr7mRvzX
	Tv7O014MgHd8b3fQTIRiFqxgRbsOsnk+K0rwouVyB6GtFI5X5mwx+JMMX26K2ZYpgQ/QX9EXm2uzX
	yWVoqldFxMNslmFKsVxD65csUcN3kR9jieMjJ1Jw1ht7lgRjwWBfMWy/lGegXk9XAcYen9as/4Vjo
	9HyBrVEPfan4eNCwFl2/IMajUcolbm0jUY3+pH/4b8zPO5wp43b7V5TQG5xDgNqvCVOet89xg7+MY
	0okTIjyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5p2j-00000001vNm-1dxU;
	Sun, 13 Sep 2026 18:35:09 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5p2h-00000001vNK-0T2P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 18:35:08 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 1590FCD5E7;
	Sun, 13 Sep 2026 21:35:03 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 1590FCD5E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789324505;
	bh=jzvF1uGW1BmPBniFIraEI0sWxtjhBw/Ld3lz24/uYLE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=zYmUIFjq7qOs7pH3Rln2weE3OGG5dniOgPViHjuTm/Im8+hFbmEseOs9DX4+YXJW1
	 5TA72w4xE8VpsyAIXR9NcxZea/Hg0tvng+l6XBG39GUCnHVP0q9jeXhhik9Q+l9MpG
	 kSnGSfvmpsGxrsYILHxjcVlXqP2FpTfmynppy/TrgXoltbiS8UUGZCB0S6vtdaxfLW
	 MMQGCGH1bWjKuB0pDNHxt2MfsLuv9YWOqvAMZdVCrqgDAeDQF8qrof2bIstKsd08UJ
	 /XYluhSNkNJy3e+jrYYzN2kL6Lpl1NkUSnoZ4wsqowHsfYUTQR2IK6EJLi5mmeWRKT
	 H/kS+7ojVgMWg==
Message-ID: <67e1861034a1083843c876deae4af9733f4a09ae.camel@rendec.net>
Subject: Re: [PATCH 10/14] irqchip: fix repeated words in comments
From: Radu Rendec <radu@rendec.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Talel Shenhar
 <talel@amazon.com>,  Thomas Gleixner	 <tglx@kernel.org>, Marc Zyngier
 <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Sun, 13 Sep 2026 14:35:02 -0400
In-Reply-To: <20260907065659.12034-1-hemanth.selam@gmail.com>
References: <20260907065659.12034-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_113507_326102_0405C8A3 
X-CRM114-Status: GOOD (  18.10  )
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

On Mon, 2026-09-07 at 12:26 +0530, Hemanth Selam wrote:
> Drop words accidentally written twice, reported by checkpatch.pl as a
> possible repeated word.=C2=A0 Only touches comments, no code changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> =C2=A0drivers/irqchip/irq-al-fic.c | 2 +-
> =C2=A0drivers/irqchip/irq-gic-v3.c | 2 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)

Same comment as before, for patch 02/14. I think this should be split
into two patches in the same series.

Applying many patches is easy/cheap. Dealing with merge conflicts
across different drivers when backporting patches, not so much.

>=20
> diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
> index d10ac9b63c99..760317db9dba 100644
> --- a/drivers/irqchip/irq-al-fic.c
> +++ b/drivers/irqchip/irq-al-fic.c
> @@ -180,7 +180,7 @@ static int al_fic_register(struct device_node *node,
> =C2=A0 * @name: name of the fic
> =C2=A0 * @parent_irq: interrupt of parent
> =C2=A0 *
> - * This API will configure the fic hardware to to work in wire mode.
> + * This API will configure the fic hardware to work in wire mode.
> =C2=A0 * In wire mode, fic hardware is generating a wire ("wired") interr=
upt.
> =C2=A0 * Interrupt can be generated based on positive edge or level - con=
figuration is
> =C2=A0 * to be determined based on connected hardware to this fic.
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

