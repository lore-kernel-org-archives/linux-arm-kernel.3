Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AB5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfCqAdaT7JKP/gVcpsVgJ6pvah+60OP5bkL61BKY/qY=; b=O9d5nm/cxrRjLN3aJAeMarRcV0
	85LHfeVkbK2ygxAZSjytU4O2bY6H9wUBJXXoDTnGceMicq52Cay4PO0nHPNGw9USp1mQS2lQLCxWm
	8XNvN0xvY5boT3P2sugCUexHTW4G+JMuIilBhcovQQyswQD6MNVhk7OMxNbue5x8pCMUnHEpdFaBk
	gVlmub69h9k/N6BkJZvxxqlG1jYU4nXAMT/wfe9kYz6vNVK5/ONHQyVhnqTCa+R5l+vBtY9Fnk6CI
	3+3ZFO1V2jPSWN/2nOEsV/fPX3RohDeBp3ktxyrdi28U/WLeQzCoIWZKn1AiqRjyPFeiMZZ06dKUo
	8DudMaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe5c-0000000EjcD-2D4Z;
	Tue, 17 Dec 2024 20:22:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe07-0000000EigD-37jd;
	Tue, 17 Dec 2024 20:17:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15DCC5C4ACD;
	Tue, 17 Dec 2024 20:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C07C4CED7;
	Tue, 17 Dec 2024 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466622;
	bh=nfCqAdaT7JKP/gVcpsVgJ6pvah+60OP5bkL61BKY/qY=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=gW1KnDvvapk26xhTxQAuYjC/xy4yiGrkWF1PAkO0p1jyn5yYMvoPNrJCAv5MUWHzf
	 M3SXODkntTvxJD3QAnSWtFlmnL+gOcpS4lY1MnDrJjBxKCBQMxSC0LZRy/6AlAUatp
	 rS8AV+wmp89LyUDwTPmkYNy2DxbD+fwtKeurLXJ6kVOARoDBVN8+lGCUZUiM3ODOeR
	 lb/wIC1J+KOyo51oJUWCFdZ0GxbpeoycE4298PFOV7ao/jIVQQyZ7jz92QNSupPTIf
	 Lfcx5kia4cLewCCKSp5BDKwruvDCfYoBcSmpDLyIWwkFBw6Jw0YoRV+RF7oL8AMzKr
	 VdkbJGj3LQQTg==
Message-ID: <2c3885eb1bbaca8a939b9233fb593ace.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d677486a5c563fe5c47aa995841adc2aaa183b8a.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org> <d677486a5c563fe5c47aa995841adc2aaa183b8a.1734300668.git.daniel@makrotopia.org>
Subject: Re: [PATCH 5/5] clk: mediatek: mt2701-img: add missing dummy clk
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Geert Uytterhoeven <geert+renesas@glider.be>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Tue, 17 Dec 2024 12:16:59 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121703_819794_B580531D 
X-CRM114-Status: UNSURE (   6.83  )
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

Quoting Daniel Golle (2024-12-15 14:14:48)
> Add dummy clk for index 0 which was missed during the conversion to
> mtk_clk_simple_probe().
>=20
> Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to =
simplify driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

