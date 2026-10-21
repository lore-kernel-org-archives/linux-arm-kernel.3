Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30033606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PLc6AuFX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QtxjfneK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJvOaBqu5Qcpy3J+7X/UPbWtXYUBWXhpnp+20Y4WL2U=; b=PLc6AuFXP5iEQv9Wb6d1owU7Px
	IR5I61NUDXOqaB89DyZQw5vM9Y0QYetaON38/w5vayImPqGJxhr7fXq2y9TVRpkS/jUa9+em2yNEa
	yYOD4CStjC/iG8AilZ0iAWDayLmf9N2hDikJ5Ti9OdmQyr87uFdXcZx9iTiUZLHDe2aTk47vvk381
	Pi4tIQtzDQ03QHqzT0TIs8z+lvhVX/XgOzW84kq5TgBV3+KgKUy/kiGlks+Bo4v7ltIuE7F4ASUsN
	fK7fvMfrHDUT3pTvViz6DTifs3YzvxMh1zE4RC4+wcIg2ajUIAT6hTGdOtLVFOgCNxzAH1G3Pdm4z
	5YL2LRuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJN2o-0000000B0Sn-0hJB;
	Wed, 21 Oct 2026 03:31:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJN2h-0000000B0RP-0hce
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 03:31:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 552CF60416;
	Wed, 21 Oct 2026 03:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819B61F000C9;
	Wed, 21 Oct 2026 03:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792553466;
	bh=dJvOaBqu5Qcpy3J+7X/UPbWtXYUBWXhpnp+20Y4WL2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QtxjfneKnjZhTmSYwDDo/F2fD54d5IDRDKWfAyKPHoPwuEEz0Vy0jPy+ooC98fOBP
	 5jcv37W86+ekKaF1MaLJMPVuxu9+X3gqso0JKEifRvu184RvXU7uS5ZpLKNm4Cyi7w
	 NlZOqp82wwC+z3cvF+otPXFaHc2jhnFW/LQFYQ8dX2Ci/PSKoBzzNN0jvCFkg/KU/H
	 ymKxNIJHpT0pcmDG1BTNjH4L6a125QCUPaRxlax11XdwaBM753Nauaob/yukmk+yj3
	 Dgwl6dtPdxRf8u2WbT4QeiWGEaAjIWLbDoOVzc2NoLDMYqcmTe7KOMpWju5EqS5a2l
	 Xkllp083tULVQ==
Date: Tue, 20 Oct 2026 22:31:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com, Liu Ying <victor.liu@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: firmware: fsl,scu: Add
 imx8qxp-pixel-link nodes
Message-ID: <179255346358.4052644.461378605676348742.robh@kernel.org>
References: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
 <20261019080621.194103-2-alexander.stein@ew.tq-group.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019080621.194103-2-alexander.stein@ew.tq-group.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 19 Oct 2026 10:06:16 +0200, Alexander Stein wrote:
> System Controller Firmware(SCU) provides access to Display Pixel Link, so
> add the display controller links.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Use patternProperties instead of 4 discrete child nodes
> 
>  Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


