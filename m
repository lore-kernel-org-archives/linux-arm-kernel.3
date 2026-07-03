Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbH6EOaxJJwCRaD9Scc4jGAt/kQtlCmPLiShqgjHmu0=; b=XCbMQLipPvVL8NE048uaO2WrUB
	GxMHglkAspuKfYc8FU7dbsfj7tSYaFxp8mls8i1ddlyEJtSau5uEKO5OdNUwPTb15HhlXKty/tnee
	dxfWxr0VLGHYWjqzrtVKXdefKFgiiVR1ausUOR6nrJS40X/xi2b75fRwZn+f16lH3r/lPY45sxOQJ
	tEUpmoN1GioezGqJcCLDqm+I/d+R2cS9W6McKKQ1neK5EIRa4V8yB80fkC27nxCKcIc3tdJPnKYp+
	/qnDfgz1Vri32L48Szr90ZSwWF/H8i2E9CnQUBM4XQ2cqkCRgqAq9nBlTmQ5I09aauyf5idRx4eat
	b9SPXLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaZB-00000006WPN-4B8o;
	Fri, 03 Jul 2026 09:52:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaZB-00000006WP6-2INR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:52:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 09F8D416B0;
	Fri,  3 Jul 2026 09:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CEB1F00A3A;
	Fri,  3 Jul 2026 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072332;
	bh=zbH6EOaxJJwCRaD9Scc4jGAt/kQtlCmPLiShqgjHmu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YtUbTTQ3YcY991mOo25WNvGwKaUMGOgMXJtkYRzWNIqaO3m9busfvfeIgVVSegEpe
	 VLK1OyZtwnzS8g9JKKmn6OrOHH+Nt7+pA/I+0l+rcKAShqA+nt9XKUWCvHKhV9cFXB
	 71b4JlWf0DbrPtl0FxbVLN9MnclG5c7n3ZBA1rsyO67B0ZI+PalTS2PE2Hf2GMPq16
	 meqBprpcQAJ+kgGFGUj5SutsD1m2zFhJ0QyOwOEvtP/ifv38+kvvKlwR1c3pei2bUd
	 pmZQcU/TvosCWqsfPSSbCAHUuckJhomayHQPOnTIthay1HjLNJ3oaU5/Ls8npaWkAd
	 hKny2xpSoaW8A==
Date: Fri, 3 Jul 2026 11:52:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
Message-ID: <20260703-spotted-silver-nyala-b39ec4@quoll>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
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

On Thu, Jul 02, 2026 at 02:06:26PM +0200, Sasha Finkelstein wrote:
> Certain Apple SoCs include additional PMGR power states that are
> controlled via a different "misc" control block. On existing SoCs, this
> includes the fabric and memory controller state.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Just a nit on top of Conor's review, if there is a new version:

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof


