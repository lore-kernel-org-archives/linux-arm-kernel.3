Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5715FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGtLqYebIknUfVyVORNUpjuMimNjfRYRM0Dh+xD+A4c=; b=nHkencP/2KaZRO8X3G1/n5X43E
	GY+0BSP43UD2HfthxQ/J7sxD6mf2tv+bOPoLjb8dC74boj/CRsZheT7WwPd00WOXyXuPpD8rvhSzv
	5sWbaGEca1Dfw4LhlhgZ+Twl8tVh4OH6wTbU4RW+LyufdluYikWZKbeVdvVXE0J91SOpPOfzOVxGG
	ZkKB1UqClykyf4XP7/K6/vItCzY2oQGAxOed/Vow+z4s4VojdQQ1LPdFH/GdghxCFEuJxJRVaDJhZ
	Kpv8yhK3FlBAAldBQ0DprS5LWvUp/NQQZhX7Vju1RXk8B3NnQ8n/M/Kw/gAdRMOvC4LXswv5FWcG2
	+JIvWM1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwy3z-00000007bxT-269q;
	Fri, 12 Sep 2025 07:19:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwy3y-00000007bwd-0inj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:19:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48B2E60234;
	Fri, 12 Sep 2025 07:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D4DC4CEF4;
	Fri, 12 Sep 2025 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757661556;
	bh=JsOHwiJSPmaS75FxBuAeLwxiYVXTXheNezu0ilagf3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tCVtXr583ui36A36/kU7OfncGeHpwI4L4hXHThlX2W+QZdTSrWr/ncaRppQxyrYI6
	 vttgEQGobi2x0E1T+BekWRDMFYPLB33gXlOHa8dX6dMcstW8G6DV2wMiGGoOoMVlAv
	 Forzk6SWTGhi8jaOnwYxLf+8N36f1sBjfJMthtCmJiP2yFiPrk2/xMksmrCDZwMI7s
	 9MsaUbsNEgPhs2aB3KVvWB9V8SFIa97hgjaXasVXnDQu0YMizkb8XcfzwPxrScHoGH
	 Mbs4Vx/AVYhJhvTtCU5wIPbPn7BF+xnNFw5qpTuXSZkEmhOkplUWHM1kG4THVj3DG1
	 HzgwM1wtvozZw==
Date: Fri, 12 Sep 2025 09:19:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?VG9tw6HFoQ==?= Macholda <tomas.macholda@nic.cz>
Cc: gregory.clement@bootlin.com, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	kabel@kernel.org, michal.hrusecky@nic.cz
Subject: Re: [PATCH v3 1/2] dt-bindings: marvell: armada-37xx: add
 ripe,atlas-v5 compatible
Message-ID: <20250912-convivial-kingfisher-of-serenity-8d4c46@kuoka>
References: <20250911161308.52876-1-tomas.macholda@nic.cz>
 <20250911161308.52876-2-tomas.macholda@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911161308.52876-2-tomas.macholda@nic.cz>
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

On Thu, Sep 11, 2025 at 06:13:07PM +0200, Tom=C3=A1=C5=A1 Macholda wrote:
> Document compatible for RIPE Atlas Probe v5.
>=20
> Signed-off-by: Tom=C3=A1=C5=A1 Macholda <tomas.macholda@nic.cz>
> ---
>  Documentation/devicetree/bindings/arm/marvell/armada-37xx.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitt=
ing-patches.rst#L591
</form letter>

Best regards,
Krzysztof


