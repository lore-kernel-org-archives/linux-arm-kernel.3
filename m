Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20E0CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nnaUzFnAzqmyIVstbJ3ztcSsp9EsU+w8t8s5OiY2ks=; b=biaj/UseKEv9JBoyqGfGRXinFf
	pT3LsMar4LlySCKXp91ODIOtsp49Sx8EnsNqzy7rct499mEsCAlssagXby/bedgvSbalY7ijUHz9q
	C+VDKeKVFJWg8U3ipctD+nJdlcBFdR3pTh7EqKnu+/PVyglduf4OhkPsCAl2eV7FX7Vvk9ClvHOse
	ivXB1Ia0gIreNPpD5CEVKOLHdQD8GOT6seWffQHt82o+FZvywRDhUh3vv7jRKFfId5y2OSXBeUSdQ
	c7VH57bqPTtPMwV+5wnAG1PGTRr+5x6//jUB/VBJgFOUE8iX4AmUZx8QFkPCRnAkKaMGRjApxWL1L
	J+h06BOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Cd4-0000000H6Se-0XvJ;
	Thu, 02 Apr 2026 07:38:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Cd2-0000000H6SX-3Syo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 07:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D897461855;
	Thu,  2 Apr 2026 07:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D24DC19423;
	Thu,  2 Apr 2026 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775115491;
	bh=uKKd7Tn3w7MO8cLMPB4qGLU0BxW/RZiH7cLoCD3vNZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpAylRjG7/MzBYWzdQUfj7URSgKLY5MtDD3+p2wh6Iu0WpfYMtR6AKB54O4Xlp8g7
	 ofRTdq/5DdjuzvmSgJy46yWbvAceSdqyKhuPiP7AvLruTXt9Z7NiE+kRUMVU1qKZYD
	 RlmaAHxf9EpFAcGKCxfki7ORQzw2EfZXPyu569XbYcLGS0XAyQjXoUhBxihvpOsXAf
	 vt7KDQPAzEYWPi2E0n/GmPob4ge2qRX2jmqfurMYEG9qbDSB47zPAur4OJberaWUPr
	 Fpdfuscv4olzqSzze+6tMVhA2HT7kY/Oa1r9aoCtpeKohxtacwROMO+NZYhS4KvjZA
	 xzQDHuPYKSEkg==
Date: Thu, 2 Apr 2026 09:38:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX952 support
Message-ID: <20260402-axiomatic-ludicrous-panther-7a96d2@quoll>
References: <20260401-master-v2-0-20d3fbcd19d6@nxp.com>
 <20260401-master-v2-1-20d3fbcd19d6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260401-master-v2-1-20d3fbcd19d6@nxp.com>
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

On Wed, Apr 01, 2026 at 06:19:12PM +0800, Guangliu Ding wrote:
> The GPU instance used on NXP i.MX952 is the Mali=E2=80=91G310,
> document support for this variant.
>=20
> A hardware GPU auto clock=E2=80=91gating mechanism has been introduced,
> enabling GPUMIX to automatically manage the GPU clock. This improves
> overall response time.
>=20
> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
>  1 file changed, 1 insertion(+)

Why are you sending next version when the discussion is happening?

Best regards,
Krzysztof


