Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6D8FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqoeIYwJhzeuhquTrU+Q87s1zT9o8C9kq8PVYTInLlc=; b=ZI75eNU2ZA96uLk8Xd7ZGazZ7E
	hn4fZWRx/w8ZMEJUm93QUM7OOX4eLCjLz0iJhiUHze7zQ11rfH9vPI/9S5NMoxxT/Exwv4fIvBp7H
	y0uB3EiRx5ev2Aos0vDBFX2ZEdDQhjQtOlRS8qhG+roSXL3fWWfYlwKFf7yjrVo5OuX9+HnzJV0bQ
	VdVwttECIEeSy+V/Dtn7JNmJw6d5zdi6gobpk03wCW16f0WQZsuc7bg+wMz02NLF0KKF9h9Su2EsL
	PGU7HxyxGW6dBCuoMwVO7lMO6NQGQMGLKYf7QCSdV6o06Idh3SAIZ00xo0sF2rXk2urAvdtzKlfjy
	G3vRHTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRpr-00000005YT9-2eM2;
	Thu, 30 Apr 2026 13:53:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIRpp-00000005YT2-3iBa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 13:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D909C6057A;
	Thu, 30 Apr 2026 13:53:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D4FC2BCB3;
	Thu, 30 Apr 2026 13:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777557224;
	bh=fWyb1fnAhDmuoMg4sCok6IXhdPjS4ufIlM7IHmfO3cQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BcaGs0WnxaKXHcEN5c7CFyBz3gN9zxY+w5isfrSHyrkHWZRtHBSQDZ0MTtTCx2DEl
	 pelTfHZHQdyr2wijxR5oF4cfb9x7kHzT5cuPWdRL85aJa9J+T/QTBo+JwSsCu06drh
	 jALonMAMuEE5mo9+n4E41Gydnk49mRedhQ6yfjzoO5UKu5bJ1H4HeSn5QmDW24iWlV
	 FXTMpNkt4qlEobCNgek4pdZEJIGYC8L57RLYZsdABxEYZqA43YCjRGYajBXKZ0+odx
	 6m4DxopmDNnGa5lXamWE9k/zG5yjSuHq1RLRo3Sh19qPo01blTQPgkH2kXKQHYI1Bz
	 nl9+H5FMuQd7Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
References: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
Subject: Re: (subset) [PATCH v8 1/4] dt-bindings: backlight: Add max25014
 support
Message-Id: <177755722019.2606736.10749503716773482329.b4-ty@b4>
Date: Thu, 30 Apr 2026 14:53:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 07 Apr 2026 16:41:42 +0200, Maud Spierings wrote:
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.

Applied, thanks!

[1/4] dt-bindings: backlight: Add max25014 support
      commit: 5fcbbedec9dfce78044eee922bf2030e1bd03faa

--
Lee Jones [李琼斯]


