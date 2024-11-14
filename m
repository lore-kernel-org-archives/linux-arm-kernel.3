Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E76D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVZNQAlU7+ZpAb7hQ/Q+oevBEVygnQyFV6H/sTq2pbQ=; b=4ueE3VDphxgiGXQxfR4UHF/nym
	KbepghYf+4Xkzh8PM7vK1BWEvOsx4ZLurq6PWeyRbwuqozkM0tCNK85tNM+LEEQqBJF7dsU+gfJlr
	9ZS9L6nD8Dh3n03fOqBBkwXIvkCHOlUusa1Y+QXowaQQilnZBa6h5ocBjd2Pl+L+KNfv9wGNZk/x7
	FY4QV0s+O7/srvxUPm7MrjXKxvmm+xcjSBmwiTu7QzCQAsOS49FDWvgLGY9UXspsNdpLuKkJOeUw5
	1WHkUJOIdpgJzF3V+Y+inpbjMjIuaIIZAaFGS3jvVGpndKXSf/wMaeSQEU2Bg6IXQ7GXiNx69R8If
	J0Q2H8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYRm-00000009npc-1HFq;
	Thu, 14 Nov 2024 11:55:39 +0000
Received: from hutie.ust.cz ([185.8.165.127])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXoB-00000009gQE-0PGj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 11:14:45 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1731582876; bh=AVZNQAlU7+ZpAb7hQ/Q+oevBEVygnQyFV6H/sTq2pbQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=L6On/y7yfj0le00M9cmM7nVAN9LOBwYp1ICAEYj4z0NO6oESXKUJB5dY2ucnBFbH8
	 5FMpWiht3uVgpoulm5F5cLXXjDmqJnbLEydwu08+eUjVxauovHAv6ycDbhWj2Ko2ih
	 tHSev2EyHI5XbCIZW0HztCK02YDB2XkIPh6ay3cY=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] clk: clk-apple-nco: Add NULL check in applnco_probe
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20241114072820.3071-1-hanchunchao@inspur.com>
Date: Thu, 14 Nov 2024 12:14:24 +0100
Cc: marcan@marcan.st,
 sven@svenpeter.dev,
 alyssa@rosenzweig.io,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <96592A7F-0E4A-446F-A88F-4C7E2F8F3A14@cutebit.org>
References: <20241114072820.3071-1-hanchunchao@inspur.com>
To: Charles Han <hanchunchao@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_031444_027570_125A90F8 
X-CRM114-Status: GOOD (  11.93  )
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

Thanks.

Reviewed-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Martin

> On 14. 11. 2024, at 8:28, Charles Han <hanchunchao@inspur.com> wrote:
>=20
> Add NULL check in applnco_probe, to handle kernel NULL pointer
> dereference error.
>=20
> Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
> drivers/clk/clk-apple-nco.c | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
> index 39472a51530a..457a48d48941 100644
> --- a/drivers/clk/clk-apple-nco.c
> +++ b/drivers/clk/clk-apple-nco.c
> @@ -297,6 +297,9 @@ static int applnco_probe(struct platform_device =
*pdev)
> memset(&init, 0, sizeof(init));
> init.name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> "%s-%d", np->name, i);
> + if (!init.name)
> + return -ENOMEM;
> +
> init.ops =3D &applnco_ops;
> init.parent_data =3D &pdata;
> init.num_parents =3D 1;
> --=20
> 2.31.1
>=20
>=20


