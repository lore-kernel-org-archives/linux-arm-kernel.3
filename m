Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E39CCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS9BEOjyMC89WySoacc9yzUCtWVmE5mbMlKi0V2KxIw=; b=uQiHZbggk6Yt7xuR/cHf6ngCP6
	xUFee7pmZuy9oNQQpjBA4qczUSLHbjl+iQzKF+TxPUwz+fhTdh6gnGdp6nml8igDWc55vR9NjJBI0
	fHwomLoLWCRYFNt5pA2FTrYKqebE+uFnxRWwwUGRjdMaKG4WzYnQbSyKr45P0VpmVYYpYpLn9dPcV
	6cBgt09s2qx04/dAR23wxIvw8B9sXoiLjGF1uJuQ6Sfwj6o37NJ/qhdreM1oBKw1qMZfob1km3aR/
	BnVKXzycWf5c+TTlldFiv10S+fvgRf5YKINSKjmE16IvehK3vyxGiAm7mHHMneE9/vUyTF2iZilmr
	QjFS7HIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtLd-0000000EQA5-1Vwc;
	Mon, 20 Oct 2025 17:07:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtLc-0000000EQ9q-1CDS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 757C1602AC;
	Mon, 20 Oct 2025 17:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0647C4CEF9;
	Mon, 20 Oct 2025 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760980023;
	bh=BXD39jZJVxX6AUbacgFfEyVJoekOr0uUFJadFIRRQsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roq0Ke4mM4GKd+i9w+UN/JjXEtPMQEbIrgWZhOB0UCeKMt0pE+tQmRiDOITM7UvF/
	 X2gIwc+wvR+Y3Uyt+ISl/frmA+XaDSktQswOAZuX0VcazAq53ZIkzcjPBHb6ovQqec
	 qk82+2WhDnCOGgajWTvYuX05Aci+pehtiSO9WJJAVjWE9xu+3i4f6OYE9gV/b+78NZ
	 NYjsVEsNcFapmYAZZ1/KiVXC1ptrL7xd0u6tIPJa/UcBUlF2ICCQKnZe/7O2FRk/SL
	 paTl2/dqMrlFo0vr5qBPWTLaDHoU4xoCbk/l+f/tjpt2SunBvZzMBo8qaAcZ+aqwdn
	 utxmIrDX52i8g==
Date: Mon, 20 Oct 2025 12:07:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Erick Setubal Bacurau <erick.setubal@gmx.de>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, s.hauer@pengutronix.de,
	david.hunter.linux@gmail.com, devicetree@vger.kernel.org,
	mchehab@kernel.org, festevam@gmail.com,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	skhan@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: fix redundant quotes on fsl,imx6q-vdoa.yaml
Message-ID: <176098001750.936573.6366914023282858347.robh@kernel.org>
References: <20251020121145.190020-1-erick.setubal@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020121145.190020-1-erick.setubal@gmx.de>
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


On Mon, 20 Oct 2025 14:11:45 +0200, Erick Setubal Bacurau wrote:
> Fix a dt-schema error: `fsl,imx6q-vdoa.yaml:19:12: [error] string value is
> redundantly quoted with any quotes (quoted-strings)`
> 
> Signed-off-by: Erick Setubal Bacurau <erick.setubal@gmx.de>
> ---
>  Documentation/devicetree/bindings/media/fsl,imx6q-vdoa.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


