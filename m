Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3637AD4A5E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n19BO7MPLNwQuRYYioniDrJ0SfDC8NE/pXsgsfX4ako=; b=2ttVPDgF4fDnWsV+K+uwklkbyu
	6bOa3QtBM2HgeLJo8uygfVRfM/Q74rr7FBByBUMrFCWbGPEGMObuguUMYjR42NZgo5Tkca2D+qK3W
	VbE3NgtudhGUZrXlLvT/FIDz3q/hxu/dAGWrsniA+dFxqbrvJPrgJFWLsJFbTluCQgx/FJhBF4dAH
	BJfEJ1SXFKPwS7W9W9aQj0H8IiDi5dEgyZIw3PZ5Kb6+PWt7eHmZuR4CQMDCjCCKEz5dczVk12Avu
	sG4E7nde3PsSg+py1GuHi6BLV6KKCWhsF/o5L1HCDJhdw6JRgE0kBpB/bM2SldSVtT6K4lsPJwm8+
	iBWeydNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZR3-0000000DSnx-3tcR;
	Fri, 16 Jan 2026 02:19:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgZR1-0000000DSna-2JuM;
	Fri, 16 Jan 2026 02:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA20E418DA;
	Fri, 16 Jan 2026 02:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E212C116D0;
	Fri, 16 Jan 2026 02:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768529974;
	bh=n19BO7MPLNwQuRYYioniDrJ0SfDC8NE/pXsgsfX4ako=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I9H4UuNdU35Xac09Te+mzVVtGN1Uxd+pVUCpHVhrDvWUSwx+O5WXwVOTXHBo8/Hph
	 HWKlVc7FRYl771NgNzQGbo4lV/FEstPCEjLPoKE7FIZsdOPZxCw9No9zH5HrNj132/
	 3nTy7tYP69kz1HM0ZkDYUZVVBg28PDTVmBlNuHkeYYCwk6+vGSkt1URS9qqS3QJH6i
	 4nDPAT1yT+LM2tq6A3SqkIjyBUM3JhxE6ZKOs1hDmGQ17+Z0YDUZRZj9l9SLPSE2RH
	 D0+0hp/BVK0wv3XJk+S1p+oRB6FX0DgcZMIoeDWj8hnFneljfBqNPfBCdqjQsjOsut
	 Y7EsjW6Vb+BDA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
References: <20251029-mt8189-dt-bindings-spmi-v1-1-fbea12a4ed5e@collabora.com>
Subject: Re: [PATCH] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8189 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 20:19:32 -0600
Message-ID: <176852997268.16445.17842151987828757552@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_181935_620232_46D24862 
X-CRM114-Status: UNSURE (   7.70  )
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

Quoting Louis-Alexis Eyraud (2025-10-29 08:31:16)
> Add compatible string for the SPMI block on MT8189 SoC, which is
> compatible with the one used on MT8195.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---

Applied to spmi-next

