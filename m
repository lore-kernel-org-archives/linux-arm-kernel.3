Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765BCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 06:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oc1LefQiZLWZj6cHXjnSZFfsCcTG4RfNhHfPJWqAbq0=; b=QRFOdJIA588Gks01VXAtaWDYGT
	lPnJBRQY3dARYaSBroBtBH9BW7JutGc4uJx1ltQgHJCi7QJXfyJgDYkAtAfcgGM524ZfgbEL5shly
	if9cnOI9dirPpzCBPyxXk52jMhz48Ut2ZxzJ/4ClweUFX9xTtb23cu+oKblACe7+xflYOQuRV97wr
	vR2yxzz7QINH4nugLpbSrljPEc4IDAGqsk3CwRzXnm12hfGNBBj7kQzLxYTlpqGmEgOSvhmKOpZ6a
	kxJPopI7yqLblGgdMSU2eaV41sXuapfbfl+iR0uLksxlfbShQ0DEMm6dvIRYBdQ6RMsrtVV3USJ0m
	tx9BQ0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXChz-00000006uy6-2EG9;
	Wed, 10 Jun 2026 06:46:39 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXChv-00000006uxV-3fFh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 06:46:38 +0000
Received: from francesco-nb (unknown [185.12.129.182])
	by mail11.truemail.it (Postfix) with ESMTPA id 3850A1F9B9;
	Wed, 10 Jun 2026 08:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781073987;
	bh=Oc1LefQiZLWZj6cHXjnSZFfsCcTG4RfNhHfPJWqAbq0=; h=From:To:Subject;
	b=yLjllAxQSH7rTGTwI3339Bqg2dotiVr3CpnTdi+1Njva9u2m2aX0rlh+ByvYSqvHK
	 4FBtg/PY7tIfw/NJ/Ght3zmhCAwkURMrCir/8hYlBRGl4BZHgSkkEut0d6zi54OreU
	 aFToKaBjM8jTzELTSpYmqTwUiaU03I88Rm7xv0AfgY+j6zZxGgUh4amvv8X+j+X+hY
	 oQ7Sy/nOcluUfUqXE8+5bMmUkaW6bPPyfiFmL8G5VaslNJEolAHdv1M4IpIUIVEGmE
	 C2EUSlRruDEd3FxbDtDyUlsk8Y7AbGHnAMa1otKCc+m6u2zZUw7NxCXTukdFBFq5dj
	 ijrISiAIY5/wQ==
Date: Wed, 10 Jun 2026 08:46:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: ti: k3-am62p-verdin: Add device tree
 overlays
Message-ID: <20260610064621.GA23935@francesco-nb>
References: <20260602141311.1366818-5-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602141311.1366818-5-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_234636_967716_784B71CD 
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

On Tue, Jun 02, 2026 at 03:13:10PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays for the Toradex Verdin AM62P,
> bringing it in line with the overlay support already present for the
> Verdin AM62.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


