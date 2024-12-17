Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC41E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+w7QFWiqsyThQ/PJOJZIXG/dhL6X0lgvSeC8TLDHq90=; b=H3LF6Lrh5k2a12upCgI49QN+NF
	pHzawr1fOpnWODoQpr/qHxCUDh2hd6KzcfJfVc9eVh9dklD9JvlK2pGnqok9abvLg/HTHqKyZpDkc
	w/Ra+ry94diBx7azkYyoFBRt4knQlgRjU6WGc1BnHpBegxU2E1N/UxPO0X4X9LCKs479vrzhv+cE9
	KsAgTfynKuKYvVlqYMKkJu/EYiYHKtSSxGPo1SlEoRBi0wNtDW6JHenTUSpxF8AoGAaoD64mGbKYK
	bSVikxmOhHSZblsGf3oAjlgEUxB7ruyQTzhhR1Os/UCWNM8mCl8YlSdi6zIAqzybRYydv5UiRPkHB
	ucvSdGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe2Q-0000000Ej9v-0Tv7;
	Tue, 17 Dec 2024 20:19:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdze-0000000Eiaj-2IoS;
	Tue, 17 Dec 2024 20:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D74665C0DD8;
	Tue, 17 Dec 2024 20:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EDBC4CED3;
	Tue, 17 Dec 2024 20:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466593;
	bh=+w7QFWiqsyThQ/PJOJZIXG/dhL6X0lgvSeC8TLDHq90=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=RWLr9NVYRfsC5YeJnYSAJtERdDyXdeG1tAsyK4BKZJulBdIJJH6y9rZULakDqIf3q
	 OBwshHQOxihngNaXgvj7NS0BKORMY5PT0BAFg0vyQ2fN61829+TId6rY5rvI+1Rrw+
	 pCGdii6AsgD2cFvfd9YHPxuJAt6zYiDZxHP5+TwbDxGxnfqI13RezcP7lMnA9q4Ncv
	 lGdkNhr2SGGrVTTnuEsSHq1Y31igFk/BPcy7hQvUkpkK9SNYeWL5PzlXhw4Hz9K7ee
	 ek4vS6nqx+1hllJCyU2+VnLK53RfqWvjA/gQ562emtLWzuL3ampaguxMU/xtGtv/CP
	 v97RLcXgx2Aew==
Message-ID: <9f9f82956607d47881091bdb0eb6b380.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b8526c882a50f2b158df0eccb4a165956fd8fa13.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org> <b8526c882a50f2b158df0eccb4a165956fd8fa13.1734300668.git.daniel@makrotopia.org>
Subject: Re: [PATCH 3/5] clk: mediatek: mt2701-bdp: add missing dummy clk
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Geert Uytterhoeven <geert+renesas@glider.be>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Tue, 17 Dec 2024 12:16:31 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121634_654890_F3528C21 
X-CRM114-Status: UNSURE (   6.94  )
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

Quoting Daniel Golle (2024-12-15 14:14:24)
> Add dummy clk for index 0 which was missed during the conversion to
> mtk_clk_simple_probe().
>=20
> Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to =
simplify driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

