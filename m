Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BCACAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r12EmStA2h/gqEr0ZK7EmIPAe3qWBOe4J8t3GC3Kk1M=; b=H48l5JHhlYsmgDm0Px+A7PgXDR
	gmuHO0tg5B7GFIDsMPEFpFFhCck9SjNX0QZnHphl5P5P+gJi6AR+uWbYIqIn3YlMdvNQUB8NBOoyn
	hgSZxdoAV12s3cM+4johO0KkJtRBmFqd7VZxyLghZhpGSQeo7Wf3xBIRKIIISqXkG2IGoA9SvE+/Z
	WLa4QtWDiTzCjj4B+eymLEGW9jTHsgQfp84FhVSkLBCAd9K2Uw34sq0ygmkwXRxLJ1hOJaiMuvOO/
	Uq2eLrRohlRiwhVQgjY7oJ1/5lF47fzJodaB0JI8eapKwmAL0BfKhrlmbnRm6AZepOOcwIAeK7CiL
	9Pf7Zl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0My9-00000007mtX-1CVb;
	Sun, 21 Sep 2025 16:31:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0My7-00000007msq-0UXW;
	Sun, 21 Sep 2025 16:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAA9D407E6;
	Sun, 21 Sep 2025 16:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F522C4CEE7;
	Sun, 21 Sep 2025 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472278;
	bh=r12EmStA2h/gqEr0ZK7EmIPAe3qWBOe4J8t3GC3Kk1M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WvU0OCkJQpg1y2Zu21U31mABeO9ZtSCKM0T3K+xHWc4MA7rzayLMD+oMvzZTgQXlt
	 P6m12kuW2Na3o1VqyJBnlfBAM5LMKDh6iarObGXjL9WXFiNIR5H8qBLKGv/8kwxcQD
	 rjJ84P/4HcXi8X1acREVZ0WrIiSyX6AjFRNUBtkr4fBuIuUMoMfMwZYgLjResmHx6S
	 nAuncLd5CBTZLN6zoY+fxnfxMbb4ZGkY7/TfjI6iTQqiJQJy5I7PL5kbZRixz/Wlsa
	 itp/QYxRy/CIaE2+K66G92ltpWQOPLmPhq2YmZFKPZ8a0dtMlZsqmv8YG/DdSOj1HG
	 AKSv1akYsZDpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250724083828.60941-1-angelogioacchino.delregno@collabora.com>
References: <20250724083828.60941-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] clk: mediatek: mt8195-infra_ao: Fix parent for infra_ao_hdmi_26m
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, u.kleine-koenig@baylibre.com, geert+renesas@glider.be, chun-jie.chen@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Sun, 21 Sep 2025 09:31:17 -0700
Message-ID: <175847227703.4354.11700092500204446137@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_093119_178169_4180F3BA 
X-CRM114-Status: UNSURE (   7.17  )
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

Quoting AngeloGioacchino Del Regno (2025-07-24 01:38:28)
> The infrastructure gate for the HDMI specific crystal needs the
> top_hdmi_xtal clock to be configured in order to ungate the 26m
> clock to the HDMI IP, and it wouldn't work without.
>=20
> Reparent the infra_ao_hdmi_26m clock to top_hdmi_xtal to fix that.
>=20
> Fixes: e2edf59dec0b ("clk: mediatek: Add MT8195 infrastructure clock supp=
ort")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

