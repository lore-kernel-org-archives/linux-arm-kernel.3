Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9621C88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dER/J/8MdqEP/M3Ls+38r00y1seRCBppFrIe7sL3Ak=; b=m/vVQYatCXNMe78olf0f69Iito
	O6xGgzqDU1KmDmh06X6mehSDtbeAQEdkPojc6ot9TMi4vWDKOkOtrH3EkcYtUXTOPNIQMxFHgVv2T
	n5Ay2uYFaXkOCTscTUuYtEOYrLKWhdTv7oG9tuu62F+LF10zBOaerwrLz6e48XnTWQACRDDNo3Lhp
	GEexKQKcOeEXqQTSSA8TBZpUtwQbGzWUlWN73lkKJnR6O0GBI9CyDHd/Hv35eO79VdQUKkuGiBDU/
	656OEBgJwqzTiowfQ9ku4sNBKij/6dQb/OWgelX6fbyUS+s11esgrep9rdv+ROsTsSqxvDq5JcHti
	fr5XPfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ozR-00000001uum-2HZV;
	Sun, 13 Sep 2026 18:31:45 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ozP-00000001urZ-0HaC;
	Sun, 13 Sep 2026 18:31:45 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id AAD2ACF9C9;
	Sun, 13 Sep 2026 21:31:33 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro AAD2ACF9C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789324295;
	bh=9dER/J/8MdqEP/M3Ls+38r00y1seRCBppFrIe7sL3Ak=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YcbeyvW7sSnnTfZTr/uCbcnFTlenGpzO6ymRZncRXn46x5A4ETMeyTu1u76htinxb
	 HNHqDW2pA2lRL/+B2wINBujBetFK7t8nC33MvgFUaud2K1lH65XirYDPGFGST8KBg0
	 P/Yqj8zKBqNjaNnkjfdpGsyVrylFggefTJykvBAdpRuuzNA/ZzXuia19AL3vHJvZ+R
	 ehkm+GzmviHEaV5QJJM2J4q7lpReWTj/n+ksNLXKSwgzFCTpHC3oyE9Ncbl2b0ADvv
	 7B4ICR/9eRUXKwBAvUdwCoetgsY8bJI3OLvb7LsQISqBExAXXfOQSHi6iCtfeyMRox
	 2WGKHRSqJDAsQ==
Message-ID: <159c52926a01c84a24d039b234bd1d3450fe5a9c.camel@rendec.net>
Subject: Re: [PATCH 02/14] irqchip: fix typos in comments
From: Radu Rendec <radu@rendec.net>
To: Hemanth Selam <hemanth.selam@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  Paul
 Walmsley	 <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Linus Walleij	 <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org
Date: Sun, 13 Sep 2026 14:31:32 -0400
In-Reply-To: <20260907065328.32009-1-hemanth.selam@gmail.com>
References: <20260907065328.32009-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_113143_289585_5D96CC90 
X-CRM114-Status: GOOD (  19.32  )
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

On Mon, 2026-09-07 at 12:23 +0530, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.=C2=A0 Only touches comments, no=
 code
> changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
> =C2=A0drivers/irqchip/irq-mtk-cirq.c=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/irqchip/irq-sifive-plic.c | 2 +-
> =C2=A0drivers/irqchip/irq-vic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)

The changes look good, but in my opinion should be split into 3
different patches, one per driver, and grouped into a series. Not that
it matters too much in this particular case (where only comments are
touched), but it's common practice in the Linux kernel development.

There are multiple reasons. The main one is that different drivers can
be reviewed/maintained by different people, and patches to them may be
picked up via different (Git) maintainer trees. Also, some companies
selectively port patches against specific drivers to the kernel trees
they maintain.

> diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cir=
q.c
> index 914d1d639fe3..d30c34ce0f56 100644
> --- a/drivers/irqchip/irq-mtk-cirq.c
> +++ b/drivers/irqchip/irq-mtk-cirq.c
> @@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
> =C2=A0		writel_relaxed(mask, reg);
> =C2=A0	}
> =C2=A0
> -	/* set edge_only mode, record edge-triggerd interrupts */
> +	/* set edge_only mode, record edge-triggered interrupts */
> =C2=A0	/* enable cirq */
> =C2=A0	reg =3D mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
> =C2=A0	value =3D readl_relaxed(reg);
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifi=
ve-plic.c
> index 5b0dac104814..a7cddadddf40 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_ha=
ndler *handler, void __iome
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	/*
> -	 * Interrupts delievered to hardware still become pending, but only
> +	 * Interrupts delivered to hardware still become pending, but only
> =C2=A0	 * interrupts that are both pending and enabled can be claimed.
> =C2=A0	 * Clearing the enable bit for all interrupts but the first pendin=
g
> =C2=A0	 * one avoids a hardware bug that occurs during read from the clai=
m
> diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
> index e38104c5064e..607e3284f700 100644
> --- a/drivers/irqchip/irq-vic.c
> +++ b/drivers/irqchip/irq-vic.c
> @@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int=
 parent_irq, int irq_start,
> =C2=A0/**
> =C2=A0 * vic_init() - initialise a vectored interrupt controller
> =C2=A0 * @base: iomem base address
> - * @irq_start: starting interrupt number, must be muliple of 32
> + * @irq_start: starting interrupt number, must be multiple of 32
> =C2=A0 * @vic_sources: bitmask of interrupt sources to allow
> =C2=A0 * @resume_sources: bitmask of interrupt sources to allow for resum=
e
> =C2=A0 */

