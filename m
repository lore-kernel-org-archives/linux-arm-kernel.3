Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9B3CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T13PpfofiomlNgg6/ltRzK/T/BI06+Nnoby+OscX+ss=; b=O0O82NwMAStUbzFTzh/pdFcC+c
	FjjhJuuNU+S9KnVYpEMtX10PeN2dJ11D9r6kM3uaB5/mlV7xZSX7YBY3HwVEQAJtNV/B4+Js8uZzk
	EHLC/ey9eDltUG7RAUAB/c30UixAFBZuNTf8q/4Vif14kgmTWgbnGa3j/azgFrbtP/gEMj8CmX7aS
	HZCTACe8RvI/e8fxlyDOcVNZUaZdbNuObP+6cgYLnhaC5nw0aPBYABbljHbaR83WWsui/vRGTQhL8
	y95fVmk3DNAAg+aLhhs7Ml4BL+2d+F+Akuw2EmBg/udoovXs4JYG1X6/B1uO5x9XT0icXqn7Ou6Yi
	4eskQsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Mxr-00000007mml-36rR;
	Sun, 21 Sep 2025 16:31:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Mxp-00000007mm4-0UcY;
	Sun, 21 Sep 2025 16:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0F91445B6;
	Sun, 21 Sep 2025 16:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A6BC4CEE7;
	Sun, 21 Sep 2025 16:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472260;
	bh=T13PpfofiomlNgg6/ltRzK/T/BI06+Nnoby+OscX+ss=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=gbDmoYfUOjUvEQRhREN2Rt8FcPLK6s8LsMM6YYLQhRR7JJUtCnSQbjSblIIVtERI7
	 7g2csSK4a3b5r4tu48i9HubMn0GH8GT4IqBucX879MowRdiGBZ1gWIDvEX9VZshXJe
	 9EP4qyX4EvGqAG1o2tjTpC82fXoeCOhroEP9UX6F3usSUJLIRw9IXZHxC226ifyUZ8
	 sN2A2vUQn6EvZsZxYgd14iQGwGdlgrL7Xq4ESgoYoi/N9l8/2wGu30/1jQT93AXFgT
	 hvHGSwpFTOeQqudqIbj53A8X2QirFkgFbKxPzxPSH4CpiyHxXJ2jnsyP+G/81K72c4
	 zc6Xr+kWop6jw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZyRIy22aS_Yjoavg@pidgin.makrotopia.org>
References: <ZyRIy22aS_Yjoavg@pidgin.makrotopia.org>
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: SPI0 clocks are not critical
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sam Shih <sam.shih@mediatek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Sun, 21 Sep 2025 09:30:58 -0700
Message-ID: <175847225898.4354.5439045355673574414@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_093101_175399_77BB4AAF 
X-CRM114-Status: UNSURE (   8.61  )
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

Quoting Daniel Golle (2024-10-31 20:19:39)
> SPI0 clocks have wrongly been marked as critical while, probably due
> to the SPI driver not requesting them. This can (and should) be addressed
> in device tree instead.
> Remove CLK_IS_CRITICAL flag from clocks related to SPI0.
>=20
> Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Please resend this if it is still applicable.

