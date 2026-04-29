Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3635FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRWWBVBpJfyHUbcXC5KjEtdEc+bw539Wu5/xgbbyIoA=; b=I933rQNltGqif8QKIpkpylMGaW
	R4NWjl1d7eXbbuNI8rQbq875FdioEcmFQUR2iTUmyhf3W+Zd40DN2HxqNPTUcpDTgKT6NgZJSgpSG
	iZMy3BK8gsmrDP3MUKNoamI4ZYsRV8raPcjOgP2otVS4ogNtodMjhh8mZKNPLihSZ68pSkmmHW43g
	pzRHGVizBCF/0s7180HdMRbjpWGIUVr6RxxOtv8SaRnTOAV09RqHOJqnzT66moap7NqGxry5cZozS
	MpSF05X4ZjzhHzpswCelJcYQb/uk/M0jcaohEDTRUpDoMA/K80b7DEbtjK1daSA4BpdcOuejoOFl6
	WD/2NUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtL-00000002s0C-3GTz;
	Wed, 29 Apr 2026 03:47:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtB-00000002rqT-22hg;
	Wed, 29 Apr 2026 03:47:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E77C261334;
	Wed, 29 Apr 2026 03:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2637C2BCC6;
	Wed, 29 Apr 2026 03:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434424;
	bh=WRWWBVBpJfyHUbcXC5KjEtdEc+bw539Wu5/xgbbyIoA=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=Fi3MoCxr8XQyo389WKmKUe9eDdIw6NSPMsEZa/pfS1cucSAdx6joi7OqxGDyvXxgK
	 iEGMzvMJqvwMIAUBOFGGq7r6mnfHmFZae4ZmvpWU4maL8CxbOxolmVe2FTdKXNkqs0
	 AIAU6VVZU6huhv94JYn7TiVEya2tzAtNjIHUaUJ4a/Ri2fDKYhjEExUfmjJtoa1jWd
	 HnMiZ13t8RsCNomw+o+DneoY+xD6YjZc4jplUJ7xpQJTQQpo6susmbo90+raEr23Qo
	 j60NF64OL/LuUH45T/DfP25TE9K3zWyeac77sPIoSa85lTU1zxA0o6oPgB8CjRy6l/
	 Nt6oLFtF8yGuA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org> <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Ikjoon Jang <ikjn@chromium.org>, Laura Nao <laura.nao@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Sam Shih <sam.shih@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Tue, 28 Apr 2026 19:06:14 -0700
Message-ID: <177742837413.5403.1187117954638508299@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Daniel Golle (2026-03-25 22:09:35)
> Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
> a clock gate nor an update register.
>=20
> Add a MUX_CLR_SET convenience macro that takes only the mux register
> offsets, bit shift, and width, hardcoding upd_ofs =3D 0 and
> upd_shift =3D -1 so callers cannot accidentally pass bogus sentinel
> values to wrongly-typed fields.
>=20
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

