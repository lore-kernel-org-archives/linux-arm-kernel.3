Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B265CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuNL8Di1bZ8KVjRFUwK62J9Adan9uB2Pvz6G50bBMHc=; b=0GcqBQ/WMBn9lzsxcsBaPK7vRS
	l2HZ824GsPN9O4PN6N/2Tr7kU9VW1AjdnPR5jQ/qhXlgr+gtXtc/wyyU67MuCU+DlWE/LjzpMJp58
	0GWrGX8Kd77KLwGfg9UhCWNoqSsbJVS4NsjO+66LfbJeh9hY3uky4wwZY0/Ss/YGi8fha8rkEftV5
	7//HUCco3Nygb8GDaahCzIytr/CnJRBKYLMTPtCQQb782ZMxdlYGapLTQ4gaLcAPqIBmPQdgYInH1
	jK7dDq6tAuGyPomub8GjHa/6VLT6/TXickPJFccg3EELr7AyBC66qiE2XoSMivET6fnz3/lUGQpBr
	gAx7We4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NK6-00000007pd1-3iYA;
	Sun, 21 Sep 2025 16:54:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NJp-00000007pOr-0CKW;
	Sun, 21 Sep 2025 16:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77204601D3;
	Sun, 21 Sep 2025 16:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE00C4CEE7;
	Sun, 21 Sep 2025 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758473624;
	bh=JuNL8Di1bZ8KVjRFUwK62J9Adan9uB2Pvz6G50bBMHc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lpfbD+SUIXTjMhYP0tTZBHTLl0ZUA8Vlzc6v93zVO4lWaY5ZCE45l70qWgCt3g51t
	 vQx2jxCbt2CIEVWR77w5/zmmXz941FXm1DqQhqFq5/QocEq92liHmHOYjPdnwLY2Zn
	 4QjeNnKRYalXG1iVzk6Qwlq1G+BfaYWROkNnuhS6ThOxuOc8iiSqwWttoWOvMSKzUG
	 8TF66Ds0O6pxy7tbPe9SGJ/F/3SpW6owM++WCcYQz4TopfAFiCXIDLANDHIK2pPBG7
	 m+9sB/86ofA2e68DRM/w08LmQTYEqeGboG2Do2zTOk7RnlNhUDAY1pgxGJKJAQw8kx
	 wLcTEU+1nSzNQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250915151947.277983-9-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com> <20250915151947.277983-9-laura.nao@collabora.com>
Subject: Re: [PATCH v6 08/27] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
From: Stephen Boyd <sboyd@kernel.org>
Cc: guangjie.song@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F . R . A . Prado <nfraprado@collabora.com>
To: Laura Nao <laura.nao@collabora.com>, angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de, richardcochran@gmail.com, robh@kernel.org
Date: Sun, 21 Sep 2025 09:53:42 -0700
Message-ID: <175847362271.4354.15117894061507090727@lazor>
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

Quoting Laura Nao (2025-09-15 08:19:28)
> On MT8196, some clocks use one register for parent selection and
> gating, and a separate register for frequency division. Since composite
> clocks can combine a mux, divider, and gate in a single entity, add a
> macro to simplify registration of such clocks by combining parent
> selection, frequency scaling, and enable control into one definition.
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---

Applied to clk-next

