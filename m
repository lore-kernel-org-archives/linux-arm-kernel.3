Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B205E93808
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 01:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=; b=YhpoyreyYFmDeZjnUWjWMiWaDX
	N/Cq0PubIVYlDK8dEG6dteYNUX6TgTeF0AImxrV3KvNbego4whNPdnp5DQmouzSkE4AKXsOQ3zh8X
	DKWxptx0mlLkE+xkdyy9xznlboiRk0ZDfHeml3Uh4YiC2r2LCpWlyfmOK2glTrrwrhYhH3QKJO5Eb
	YI4TH4fPCjILq0mR7hjuqnvyi/GhuzKhj4btboyh9RfdHmTGP9huN+NU1sP9UhJsOB6+W3lt4Dx+p
	9VE3rjwiMhHhOOojyfwpddi8W6Hje8Cww5/vZ2KSxTNW8zNmxEgzRku2P7NEtFL80qs3zypCMKm0g
	Sh76kB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC6KN-0000000EqcD-03TS;
	Mon, 13 Apr 2026 01:43:03 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC6KJ-0000000Eqai-1cNW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 01:43:01 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-42321c8b8f5so3154750fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 18:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044578; cv=none;
        d=google.com; s=arc-20240605;
        b=H4UZSiSMcDiKSLetDHcSiHIElgoFt0aRhBqWbzz2kFz0YN65WorLgchga7rK3tEZoh
         6RIKDdni/LLOkFXMn+twslwslbkxa1hOGPcHRPzPG3gO2OH1RhMr1ME07L8Vaba1MX8f
         KTe6pBw/bnqLVU5Uj3tLv+nk69xkCUAswcpKlsnZk6JVvnOToBS9f14Qa9oWmpSqXjTb
         nT+q3A5+nBa77YRbVu/A6NwT1WUTd26HG8tEZxnIQbxIFTmFRFM6+7x2aimAQwjylNc9
         babK/BD0AVeUqYLPjnRssP9N1uVlRWcYaVLk1mxN6yzaRJX+Nk8okDvPy6kjUbT8Itbt
         OHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        fh=jBQ9s4kNb15zVWMi4Zzg7OuKqLnvalZITqI9VgjCVAQ=;
        b=g8xcoP+1W1+IKSpiuEB5uNhxkUT/8gZ+/K1CVMiD7bTIKD1jCHHT83svHO8jS5zEib
         0a/TUnqcJM6t+9PQMa7X3kN6aPDHk8uaOioG/oQqaUe/OVRPKA/5DCGIhOXAyTXrwMBI
         GYDcCp61vbXlgKWpb0mi9bxtXsB9XLr8Iqk0d1nh0OCPPCn4hpT7h0funw38RDSGIYhK
         O+ecvQCbumO3uOA2IJbNMoJp6ybLwVXLU7z7330LV76ToKgMhKK9UguEPKqOf/Ry80+F
         F5gSu83ZPCBfrGSziOoDc56qLDdyUJJaKDketgzmQTHtIkz/Y/L7f5BYmU0DjScJlI8L
         fa9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044578; x=1776649378; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=ERIyDAJvMuNoYACU9C/CmLuXfDTxnuFu71BwTNbkVm5jgKEprloxT0TlhApYfL9hKZ
         EwZRktvU0hnTE9wUZIKE4864YcQLvQ1po2QOLY+ap87E9Plxr5q0lIshuZMnfEMQAHZy
         j4q8HS2JTEzoSUuUNxYqOLm6fFRlYi/vkxf5sf6dWGUVHp+Os8Iwkn185TJkKSKDWY37
         Xpr0Bjb1jctqz4LXbIY9uYq5Wx/gnDiczMQUxOsUoNHspbwlQu/9dDxzD0o+Os6STLdd
         /BwhKuEsYrohBUH1J/9PqCR69x4XZ+LKMqQftYDf9cG4MDNYawainD2ppT4GQWxog2z4
         Dh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044578; x=1776649378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpqWZ5OeBihZW+KiOWj3yc4NCjFh45eEbq7S9GQ1ONE=;
        b=r9Hh58OUGCVggCLh5uqjkE2V6ilNAa+BnvyivEiPNQ93tRXGXQnUlJ6oYw3RaAvWUu
         olcPsOGG+5NHmFTDIJ6DQgAfkPb28bquy518/7WnXYAMgx0qP3X+EIGQ93xaeGAWuWCR
         PTnrN3WcqEVc3wCRkKxCPUG9ilADocgpX2n0t/2tsSPFTFRm4Jl1xiCCdKvIWoO/GEad
         +EKPOCzimjWZV65frJ5zN7uxxerZrSHhWuXuIe5SSLQSROCHUoV0qvYTs86Nx35RK79p
         wJGlvSn/Z6SmlM/T7U/SMbiKIY8twWCLVgvWoRKwVm71EPWD9IWUAQZbJvSMoHSeeeZg
         2KPg==
X-Forwarded-Encrypted: i=1; AFNElJ8IWQjOeFiqvrVO4U7I90JP1Fe6TUvGDqX+4AWX+DrQyTFwx4GxeMmXo5cuC3CD/KmgoItut54pgLv3I20eulad@lists.infradead.org
X-Gm-Message-State: AOJu0YwzBVOdDAWmFsbaw8suvmTx2tn8DVsOlL7CFIGSA3G3lPzv6wpl
	6fzV3akIa2c6YHpmKOJGQaz6PA/v0kUBqdAudPukTlspkRt+MUvJ/ONMxFO8wUTGUNI+NTfVXpo
	mgjzZd3Oq7tGUUVvXMSQLx8k2I3ecgsk=
X-Gm-Gg: AeBDiesQkTQZEvCRXk8q2psRaKkJTklPWYdEXtgWpBZCQX5XYTrENNC7ruSHLUFdOfL
	1pdWPqZjS7IhVCGXYBjC5XZJB+kEa+GZ/cZLgu+HU0twUqv/DThiy+sLa0mTq3FvTeAOTVyBpLI
	ZWZtb/KfO2MJA2H0MQNLCOfoeRWgliY9grU/5INgb1hzfsAe6fFEFMOz6QqQLZvxkkEcg+0qJ9O
	V8X+wyKKOAjAPTTMYOGJWDQypYAVqI8inEEe2je1Mu4HahsuLhuO5oaQkBbCmxAT99dmrZzWNXB
	tFWX+KaI
X-Received: by 2002:a05:687c:20c2:b0:41c:9797:d1e6 with SMTP id
 586e51a60fabf-423e1e1318dmr5077336fac.14.1776044577979; Sun, 12 Apr 2026
 18:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Apr 2026 20:42:46 -0500
X-Gm-Features: AQROBzD5VLydoqD-crkS8q5jKVQvu0Dgk3PHuV4kaQv0TPwaWMSf23DdaK7QoI0
Message-ID: <CABb+yY0QydFqBQ2sPzrbDjoj1ODTe0FW_p_4jyBR8cP_gxg9XQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: prefix new constants with MBOX_
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Peter Chen <peter.chen@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_184259_433851_E457980F 
X-CRM114-Status: GOOD (  29.85  )
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

On Fri, Apr 10, 2026 at 7:51=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
> moved some constants to a public header but forgot to add a mailbox
> specific prefix. Add this now to prevent future collisions on a too
> generic naming.
>
> Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%=
40sang-engineering.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> This patch improves the above mentioned commit which already sits in
> -next. It is not really a fix but it probably is still a good idea to
> apply it before rc1 to avoid confusion.
>
>  drivers/mailbox/cix-mailbox.c      |  2 +-
>  drivers/mailbox/imx-mailbox.c      |  2 +-
>  drivers/mailbox/mailbox.c          | 22 +++++++++++-----------
>  drivers/mailbox/mtk-cmdq-mailbox.c |  2 +-
>  drivers/mailbox/omap-mailbox.c     |  2 +-
>  drivers/mailbox/tegra-hsp.c        |  2 +-
>  include/linux/mailbox_controller.h |  6 +++---
>  7 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.=
c
> index 8cfaa91b75bd..43c76cdab24a 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -413,7 +413,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
>         switch (cp->type) {
>         case CIX_MBOX_TYPE_DB:
>                 /* Overwrite txdone_method for DB channel */
> -               chan->txdone_method =3D TXDONE_BY_ACK;
> +               chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>                 fallthrough;
>         case CIX_MBOX_TYPE_REG:
>                 if (priv->dir =3D=3D CIX_MBOX_TX) {
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.=
c
> index 22331b579489..246a9a9e3952 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -732,7 +732,7 @@ static struct mbox_chan * imx_mu_xlate(struct mbox_co=
ntroller *mbox,
>         p_chan =3D &mbox->chans[chan];
>
>         if (type =3D=3D IMX_MU_TYPE_TXDB_V2)
> -               p_chan->txdone_method =3D TXDONE_BY_ACK;
> +               p_chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         return p_chan;
>  }
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 138ffbcd4fde..30eafdf3a91e 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -72,7 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
>                 }
>         }
>
> -       if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
> +       if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
>                 /* kick start the timer immediately to avoid delays */
>                 scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock=
)
>                         hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_M=
ODE_REL);
> @@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
>   */
>  void mbox_chan_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
>                 dev_err(chan->mbox->dev,
>                        "Controller can't run the TX ticker\n");
>                 return;
> @@ -183,7 +183,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
>   */
>  void mbox_client_txdone(struct mbox_chan *chan, int r)
>  {
> -       if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
> +       if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
>                 dev_err(chan->mbox->dev, "Client can't run the TX ticker\=
n");
>                 return;
>         }
> @@ -344,8 +344,8 @@ static int __mbox_bind_client(struct mbox_chan *chan,=
 struct mbox_client *cl)
>                 chan->cl =3D cl;
>                 init_completion(&chan->tx_complete);
>
> -               if (chan->txdone_method =3D=3D TXDONE_BY_POLL && cl->know=
s_txdone)
> -                       chan->txdone_method =3D TXDONE_BY_ACK;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_POLL && cl-=
>knows_txdone)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>         }
>
>         if (chan->mbox->ops->startup) {
> @@ -499,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
>         scoped_guard(spinlock_irqsave, &chan->lock) {
>                 chan->cl =3D NULL;
>                 chan->active_req =3D MBOX_NO_MSG;
> -               if (chan->txdone_method =3D=3D TXDONE_BY_ACK)
> -                       chan->txdone_method =3D TXDONE_BY_POLL;
> +               if (chan->txdone_method =3D=3D MBOX_TXDONE_BY_ACK)
> +                       chan->txdone_method =3D MBOX_TXDONE_BY_POLL;
>         }
>
>         module_put(chan->mbox->dev->driver->owner);
> @@ -531,13 +531,13 @@ int mbox_controller_register(struct mbox_controller=
 *mbox)
>                 return -EINVAL;
>
>         if (mbox->txdone_irq)
> -               txdone =3D TXDONE_BY_IRQ;
> +               txdone =3D MBOX_TXDONE_BY_IRQ;
>         else if (mbox->txdone_poll)
> -               txdone =3D TXDONE_BY_POLL;
> +               txdone =3D MBOX_TXDONE_BY_POLL;
>         else /* It has to be ACK then */
> -               txdone =3D TXDONE_BY_ACK;
> +               txdone =3D MBOX_TXDONE_BY_ACK;
>
> -       if (txdone =3D=3D TXDONE_BY_POLL) {
> +       if (txdone =3D=3D MBOX_TXDONE_BY_POLL) {
>
>                 if (!mbox->ops->last_tx_done) {
>                         dev_err(mbox->dev, "last_tx_done method is absent=
\n");
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 547a10a8fad3..e523c84b4808 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -728,7 +728,7 @@ static int cmdq_probe(struct platform_device *pdev)
>         cmdq->mbox.ops =3D &cmdq_mbox_chan_ops;
>         cmdq->mbox.of_xlate =3D cmdq_xlate;
>
> -       /* make use of TXDONE_BY_ACK */
> +       /* make use of MBOX_TXDONE_BY_ACK */
>         cmdq->mbox.txdone_irq =3D false;
>         cmdq->mbox.txdone_poll =3D false;
>
> diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbo=
x.c
> index 5772c6b9886a..535ca8020877 100644
> --- a/drivers/mailbox/omap-mailbox.c
> +++ b/drivers/mailbox/omap-mailbox.c
> @@ -238,7 +238,7 @@ static int omap_mbox_startup(struct omap_mbox *mbox)
>         }
>
>         if (mbox->send_no_irq)
> -               mbox->chan->txdone_method =3D TXDONE_BY_ACK;
> +               mbox->chan->txdone_method =3D MBOX_TXDONE_BY_ACK;
>
>         omap_mbox_enable_irq(mbox, IRQ_RX);
>
> diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
> index 7b1e1b83ea29..500fa77c7d53 100644
> --- a/drivers/mailbox/tegra-hsp.c
> +++ b/drivers/mailbox/tegra-hsp.c
> @@ -514,7 +514,7 @@ static int tegra_hsp_mailbox_startup(struct mbox_chan=
 *chan)
>         struct tegra_hsp *hsp =3D mb->channel.hsp;
>         unsigned long flags;
>
> -       chan->txdone_method =3D TXDONE_BY_IRQ;
> +       chan->txdone_method =3D MBOX_TXDONE_BY_IRQ;
>
>         /*
>          * Shared mailboxes start out as consumers by default. FULL and E=
MPTY
> diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_c=
ontroller.h
> index e3896b08f22e..a49ee687d4cf 100644
> --- a/include/linux/mailbox_controller.h
> +++ b/include/linux/mailbox_controller.h
> @@ -15,9 +15,9 @@ struct mbox_chan;
>  /* Sentinel value distinguishing "no active request" from "NULL message =
data" */
>  #define MBOX_NO_MSG    ((void *)-1)
>
> -#define TXDONE_BY_IRQ  BIT(0) /* controller has remote RTR irq */
> -#define TXDONE_BY_POLL BIT(1) /* controller can read status of last TX *=
/
> -#define TXDONE_BY_ACK  BIT(2) /* S/W ACK received by Client ticks the TX=
 */
> +#define MBOX_TXDONE_BY_IRQ     BIT(0) /* controller has remote RTR irq *=
/
> +#define MBOX_TXDONE_BY_POLL    BIT(1) /* controller can read status of l=
ast TX */
> +#define MBOX_TXDONE_BY_ACK     BIT(2) /* S/W ACK received by Client tick=
s the TX */
>
>  /**
>   * struct mbox_chan_ops - methods to control mailbox channels
> --
> 2.51.0
>
Applied to mailbox/for-next
Thanks
Jassi

