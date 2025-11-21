Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A3CCFA473
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 05:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE3Wj5yLxa7MGsQ4QqVxQAReCRJQFJrzCzSpWLSxTVI=; b=H22ftUm+pBQ9RHs5kTj+4PeORd
	VzXbxke/g1iB9ibN89dU2pv4aLc91Cl41OxCxwtOyQ891lBciO5zNjOvh/Q07Hz3sz5QDJk1ElIDy
	xTg116uKTE55at7BV6ccZI4bWPzgVoYVLdTVRDLoW25YEfodHYZpLkrzNNJagZE328FQ3lJv3NpO0
	Ta8hH6/Svru1mUmXANdQQmQtXL2D8Qn51R2Bav31HZRDYfEpfK6Q3gFWii8k0ZXXBepCLfQILKvNo
	1rw3fz3lc91erEmEZAE37AnL1Wf3Xps8WT6C/Ldmlb2OGsmJJccCliM9JTDh23WU6QL53WAyVeHEa
	kDq2sPng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZv-00000007put-2izP;
	Fri, 21 Nov 2025 05:21:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJZi-00000007psP-3rCG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 05:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A164044345;
	Fri, 21 Nov 2025 05:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BABC4CEF1;
	Fri, 21 Nov 2025 05:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763702450;
	bh=Siiw7pVgduRMyqsIBGRHkzNydO8FFZun7CIgfPDv+1U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XF4XP6cMSXtfX6GojvsSr2wWuahnrNFeWRINIQYMm328w4pgtcYWyII2aHvOe9C7M
	 9u9dwjEYpoM+LybfIPfR3FvxhzdoC3C3RQA1f7l0KbZwN1uE0r1RZIov1B1qbey8tE
	 3bIj+dcg8faBEFC/JnEwZBc/+OJo5urkgmYVcKkx0dXjAPsxePlsCYUUEczaSPN+SE
	 L/CMHTlfL2kw0zoCDVfhqfTe7qpB2l8oVQxjCEguIs5EhJTTzjUEGhrT447fkaJonq
	 vLas31xZZSTWLfw+LuuP4xP37kp/j234rJpjJXYPeULPaGS/LS+SdYciYf8jzW0gfh
	 lRkCi9sgpn1FQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114070512.855008-3-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp> <20251114070512.855008-3-yuji2.ishikawa@toshiba.co.jp>
Subject: Re: [PATCH v3 2/2] clk: visconti: Add VIIF clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Date: Thu, 20 Nov 2025 18:56:54 -0800
Message-ID: <176369381444.11952.3963774406317821182@localhost.localdomain>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_212050_977516_9D816997 
X-CRM114-Status: GOOD (  14.30  )
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

Quoting Yuji Ishikawa (2025-11-13 23:05:12)
> Add the control sequence of register bits to handle the clocks and the
> resets of Video Input Interface.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---

Applied to clk-next but see below.

> diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/=
clkc-tmpv770x.c
> index 94a736da6..1e2e8d643 100644
> --- a/drivers/clk/visconti/clkc-tmpv770x.c
> +++ b/drivers/clk/visconti/clkc-tmpv770x.c
> @@ -18,8 +18,8 @@
>  #include "reset.h"
> =20
>  /* Must be equal to the last clock/reset ID increased by one */
> -#define CLKS_NR        (TMPV770X_CLK_BUSLCK + 1)
> -#define RESETS_NR      (TMPV770X_RESET_SBUSCLK + 1)
> +#define CLKS_NR        (TMPV770X_CLK_VIIFBS1_PROC + 1)
> +#define RESETS_NR      (TMPV770X_RESET_VIIFBS1_L1ISP + 1)
> =20
>  static DEFINE_SPINLOCK(tmpv770x_clk_lock);
>  static DEFINE_SPINLOCK(tmpv770x_rst_lock);
> @@ -32,6 +32,10 @@ static const struct clk_parent_data pietherplls_parent=
_data[] =3D {
>         { .fw_name =3D "pietherpll", .name =3D "pietherpll", },
>  };
> =20
> +static const struct clk_parent_data pidnnplls_parent_data[] =3D {
> +       { .fw_name =3D "pidnnpll", .name =3D "pidnnpll", },
> +};

This is wrong. There's no "pidnnpll" in the DT binding for
toshiba,tmpv770x-pismu 'clocks' property. Please send a follow up patch
that cleans up the usage of clk_parent_data in this driver.

