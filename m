Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B22C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 21:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4g9mbTx6glp4LZVQ37Z538SfET66JHFfQPw9KNAJLo=; b=MQE1gZ8WteGYQXuijYUtHpqay3
	zBD56qHPjNVr8zDhaSdyyNTx8GS9Zmmg7NqbR8FyC+fGRQLLP0kUZKzSnm2hQXvQk9AKnDCwjX4cG
	ZFvAy0yirVMlhntKvv0+NxzB7N5HGYJZtVsHMqG30kc63jW3uuoo2QcitFe37uGrEi5wJmauz4IJc
	DLummmcf2KE00cT2SD5qC0VJczC1VPaqgU5ggtCW2rl6ZYQWIYqknhdT5Y8DucO/vaZeu0lGxWoKI
	4MntMhOSqn9Rrs1+m/9s0F3xCWjENcTYojImJlyxLBvfSZrSPghG8RK+CWjV7ggabqAmz6E5eDH0E
	ymNhwAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5jD-00000000J5F-1vOF;
	Sat, 21 Jun 2025 21:26:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5gv-00000000Ixs-2FVa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 21:24:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97EDD61129;
	Sat, 21 Jun 2025 21:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44141C4CEE7;
	Sat, 21 Jun 2025 21:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750541040;
	bh=zd3fXuoMbyMxNdsIZpDsy0sSLOEAB8oXLIP0Lcpc6Fc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=AG6hx8ZtawSHqSdTxhjYS00Q7ig6DQAbk8ur5cKXwCxisexAWvcGZNKzo/TKno/rI
	 zy7CF/wx/XnBhtbaGqAGauZxQrohXwrhSR80khthS4J8nca5jaLzSKFf9EugWlDLMY
	 q72KjtumhW9ZymsGMy/mWguJtsMC8gCeJnoba2wGnuiPqmrSJSfj0ahoK41Iz8eyPB
	 8zBPNVUqiE/4qMm3HT3cCQa+QoqrOvZh4m33unmqHjJR8i3zppUigSR0OK8RqKR+Md
	 WY/JESyDdwxZsfxUjfkeD/Fo/8Jdq666wzZzn7rCwTl2gagJVHaDj87a4uTEM4JLld
	 5sH9t0q/arG0Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250410030438.53232-1-bsdhenrymartin@gmail.com>
References: <20250410030438.53232-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] ASoC: imx-card: Add NULL check in ap806_syscon_common_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
To: Henry Martin <bsdhenrymartin@gmail.com>, andrew@lunn.ch, gregory.clement@bootlin.com, mturquette@baylibre.com, sebastian.hesselbarth@gmail.com
Date: Sat, 21 Jun 2025 14:23:59 -0700
Message-ID: <175054103949.4372.16293868938290251169@lazor>
User-Agent: alot/0.11
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

Quoting Henry Martin (2025-04-09 20:04:38)
> devm_kasprintf() in ap_cp_unique_name() returns NULL when memory
> allocation fails. Currently, ap806_syscon_common_probe() does not check
> for this case, which results in a NULL pointer dereference.
>=20
> Add NULL check after ap_cp_unique_name() to prevent this issue.
>=20
> Fixes: baf4c10f8878 ("clk: mvebu: ap806: Fix clock name for the cluster")
> Fixes: 33c0259092c8 ("clk: mvebu: add helper file for Armada AP and CP cl=
ocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
>  drivers/clk/mvebu/ap806-system-controller.c | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mv=
ebu/ap806-system-controller.c
> index 948bd1e71aea..1461922752e3 100644
> --- a/drivers/clk/mvebu/ap806-system-controller.c
> +++ b/drivers/clk/mvebu/ap806-system-controller.c
> @@ -173,6 +173,10 @@ static int ap806_syscon_common_probe(struct platform=
_device *pdev,
> =20
>         /* CPU clocks depend on the Sample At Reset configuration */
>         name =3D ap_cp_unique_name(dev, syscon_node, "pll-cluster-0");
> +       if (!name) {
> +               ret =3D -ENOMEM;
> +               goto fail0;
> +       }
>         ap806_clks[0] =3D clk_register_fixed_rate(dev, name, NULL,

TL;DR: This patch is unnecessary.

If name is NULL this function will fail. See the kstrdup_const() call in
__clk_register() and how it returns -ENOMEM when the copy of the
init.name is NULL, which is what happens when you duplicate a NULL
pointer.

