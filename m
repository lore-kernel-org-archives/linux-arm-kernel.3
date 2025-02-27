Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C18C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b0trcqZRkNGYmjXDSE3w2Fcq+D3OS7D4tCZA8ZK4TY=; b=M0sZqeWx/dIYOA2kSN8sKDDgn6
	d0HHLLN90862XZIE0C2yf7/Wm8tsSBYzs2iCRMG5LiS2i5kadrgApPn9OrUmXIVKVakU1tCun2b9M
	8rePxLXw69S5X4BiP5fnAup9arGtKgqZP80bFWHdDxVvGTsfPiF+XDRvMINVFCCnT5jp1ZAJr5+27
	ASAXcq8T90EZX+ea7v4+RjMlfS9PFmg0C81xrajLG6mfPGxQJ+GR1cgbjrGVJ1ODbZgs+Xhs1PZts
	iiaYqo0cwYoiOhDmrr3yVHsNzI6XAEq/FxJhBeEJRd9HpJEYFj/7QdGuqDdy0onFSZCsU5VJEc/xy
	D/y3t1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSMC-00000005spA-3v1G;
	Thu, 27 Feb 2025 01:06:32 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnSJL-00000005sIy-1VQQ;
	Thu, 27 Feb 2025 01:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97D5B612CD;
	Thu, 27 Feb 2025 01:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B320C4CED6;
	Thu, 27 Feb 2025 01:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740618214;
	bh=3b0trcqZRkNGYmjXDSE3w2Fcq+D3OS7D4tCZA8ZK4TY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oeOvY+eerU9W0wXRIdGa/7e/Mg/kezvTNdTlxZ9Viuvygnvhi4EDirHNCxRMOz5v+
	 Gg4ZMdhDCgs/Xhd/PYAIizvto7RKd0GvNPbAHLgyMMYTMvYdNJbtnvhJ7o7LLzrJ3d
	 6oYTHQ0Z79y+YiDtP3x87ZkvCZyjMbCSBNQ849urmKMiurMUlAH6k+qdOnB401vPpk
	 y/iUoZyeosJNlIBZNTsFSwqPaWeKYLsHZmRKFAQF6/iueCbGuQAbzCX40oUGFKrbu0
	 yhFyMsC5iji/omcpOnxgNTn64mGSk7e92UinFWbDH8hbiauGsCV2UhO1lk9EM/8tY1
	 7ACo4KheJXu5Q==
Message-ID: <b49cecb83051d825fa6f61e9998a8fcb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212100342.33618-2-angelogioacchino.delregno@collabora.com>
References: <20250212100342.33618-1-angelogioacchino.delregno@collabora.com> <20250212100342.33618-2-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] clk: mediatek: mt8188-vdo1: Add VDO1_DPI1_HDMI clock for hdmitx
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, amergnat@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, kernel@collabora.com, macpaul.lin@mediatek.com, pablo.sun@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Wed, 26 Feb 2025 17:03:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting AngeloGioacchino Del Regno (2025-02-12 02:03:42)
> Add a missing clock found in the VDO1 controller for the HDMI TX
> controller over DPI1.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

