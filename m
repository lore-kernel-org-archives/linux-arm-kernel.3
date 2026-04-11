Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F034AF3ED5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 23:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWGbn5WqYjseRmAvmlC8sWj5Ios58RCRfAnja1hHuc4=; b=JPyW9uprmGBpALKzCgCpFswwgt
	tzYU3xicfgYXiRMSC8+oSknXwQd0uERIZP8HfX4pM+dP2tZQjLcuOEsiAgCt+qMetzXOqG6fDq4x3
	zikOeQzSs11L4Nw24Rw5uKbRldTUArxitza/BcvLBxkERdLNOM9gIp6MqTHGIpFm5UXK3eusm2m+3
	zBZloo7/PxEe67ZoqDDhVQb8nJslbVZHxpb9H4La/QdRS/5JF6XJUmSnWsKasyFrsGBd4TjUzk0JK
	z87awLVlXeZlDmRFYs+Ie+56sdt3pdfU2qfqxFnQoCFRrK83uUsNxrbmaojhn1NAZmRXeOcsB09Wk
	ndJ7amgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhgj-0000000Ds9J-3GzA;
	Sat, 11 Apr 2026 23:24:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBhgh-0000000Ds8Y-2Dsb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 23:24:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 264CE42BB1;
	Sat, 11 Apr 2026 23:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F146FC116C6;
	Sat, 11 Apr 2026 23:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775949866;
	bh=RQCJ+fj6WdO8hfeSNAkecBI8UWI0eKm/Metutfq54YY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kFl5gg7baURuiEnE4bzO1c7O5+EC5kZjwAxokvQEWRh9aJqOAwCMjGucSIjO0PD6N
	 3eci2qbCCFQ0en5DRdRfXr2M+mzh/Fmj/8Ro5oiG6eQmtZ7N75tIk7IGqvr1W8X/ox
	 SOkYrwRO5GOShFzjSBMlR6fV1W3a0qwou5fXI8tF/d/l0xUg/82osh5yUNokABFQUW
	 u+amtDrerXeRGeMkzkGLfrLny6vDbKiHI1YBrRW0B3daJRVlRTOLkLVzkYLCWTX5yk
	 VRPS1LDT0oHtWaidq0kANYyy+s46oNPbVQqyHY4vnhFfTEj3fbJ6VoXVOtBCN57u3G
	 bv8Hn7I9IJvEQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <adJu-NeYb70E-1yS@home.wens.tw>
References: <adJu-NeYb70E-1yS@home.wens.tw>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 7.1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
To: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 11 Apr 2026 16:24:24 -0700
Message-ID: <177594986409.5403.8384720945242145842@lazor>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_162427_584961_17CAA01F 
X-CRM114-Status: UNSURE (   6.09  )
X-CRM114-Notice: Please train this message.
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

Quoting Chen-Yu Tsai (2026-04-05 07:17:28)
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f2=
7f:
>=20
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-7.1
>=20
> for you to fetch changes up to fb20ccf70cf695f178d7c32e2d33b376560df0ff:
>=20
>   clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock (2026-02-2=
5 00:26:12 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

