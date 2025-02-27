Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A91C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 22:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+q9YCLatUCSCnJTmJIom0ghzOsPFelG4Neix4m21bM=; b=digoTu2rCJytsErtIrr2QAurpy
	yyWeRUeSej5kizgDaFV0bdKO9FQZVlDSLVDoW/uMU/1wOpAq+NQkMgxbAHd/vZBeAQq2pXNYUwWax
	7bJyxobQDcnqqh8LkalhQAC0jYOwWYK8QzpPRjBGMnqYI5/juUvbSV7UH75RLMpB6yQKFcEo0e/Cz
	ufsp6L6ZelCjNUommEA3yx+BpJLmohm1C7fvmqO53oklcJvT4Isk2G3x1tqi7SKZb/rizVFzXuPo1
	UhvCDI8S5KxNiLg6MP5aPC7LK+5xS0D2eT1GR7uBkNGvSJ/nleEfKfF95YS5Uc+2DQPxZ0QKA1kgK
	yCNGahTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmTl-000000092Py-1rnK;
	Thu, 27 Feb 2025 22:35:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmQj-0000000922h-40Ao;
	Thu, 27 Feb 2025 22:32:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D011E61149;
	Thu, 27 Feb 2025 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE30CC4CEDD;
	Thu, 27 Feb 2025 22:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740695553;
	bh=u+q9YCLatUCSCnJTmJIom0ghzOsPFelG4Neix4m21bM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tY1b0VZONdhUTZ6kvJSq7QYwzREZg9If7wG5eVNbQhp3klRGixOPyr741z0txj+QH
	 Tn609WFuQLIGXzuOaVfC7oMMZPJSjrcOL+qaK+nE0O9N0G5nFuroM2QLR4e9CP/dRG
	 qhhEKTEZ/34jKWyoNMkZOj53yp3kj3id00VC+HM+Lk8ougOfgCZ9NKX4lWHJPhhIsX
	 ++1kZPp0nRIiKrRX58yn4KF/pt40YRukq2gtopfkeuHqycVp+JaXxvPbMLXPJqa7xZ
	 WRx3vvCA5JG0ehy4ciZBMrkJql4LPQmj9Q7ZFTm5snYGMXp2sQkHlm2pbciY/R2c4D
	 Ls8a+NeuawLOQ==
Message-ID: <3d27fad06ffc669d8d3661464a8f8c99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250221075058.14180-3-friday.yang@mediatek.com>
References: <20250221075058.14180-1-friday.yang@mediatek.com> <20250221075058.14180-3-friday.yang@mediatek.com>
Subject: Re: [PATCH v4 2/2] clk: mediatek: Add SMI LARBs reset for MT8188
From: Stephen Boyd <sboyd@kernel.org>
Cc: Friday Yang <friday.yang@mediatek.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Friday Yang <friday.yang@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Yong Wu <yong.wu@mediatek.com>
Date: Thu, 27 Feb 2025 14:32:31 -0800
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

Quoting Friday Yang (2025-02-20 23:50:54)
> SMI LARBs require reset functions when MTCMOS powers on or off.
> Add reset platform data for SMI LARBs in the image, camera and IPE
> subsystems.
>=20
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---

Applied to clk-next

