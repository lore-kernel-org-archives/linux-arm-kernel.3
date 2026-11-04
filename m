Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CCE606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FfUEbu9u;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ad3K59ZV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yDbkb1XED6qncOAadzXW360XIzlZHMnFZRPOUhpQgSU=; b=FfUEbu9uEHHLNTyjBLSfUPGNd5
	HL/863104W1AhVB4lndxy8geEs2l4kzAVhkaVNk26Mg9050vZuGaqrvuaQY4CYm4fcAr0gJRLLcnZ
	aLrZB9wbcsIv1gffHQXW1SdK/GC1WuloP3esUEW2YTrfRLlBvFMlL2WQfsiDWMBtsioODnHmwdQTb
	GNZmeslW02sYmx/ok0LtcN2eVBelO4IA8mtDIX/2WkkA8C7aKUDLk9CPnJ0EYtBmX1kc8HurbGgb/
	QUZmzUxVYNEGmO0lh1M8alJyvqiVXGXf0XPdiNtWdcnx3mXVo2DuXy6X66XEnr5NYkm/Q7eKyCaqv
	H8UsRaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeni-00000006DGA-47ud;
	Wed, 04 Nov 2026 17:29:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeni-00000006DFJ-0Y8S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:29:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AD6860A7F;
	Wed,  4 Nov 2026 17:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3244B1F00A16;
	Wed,  4 Nov 2026 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793813368;
	bh=yDbkb1XED6qncOAadzXW360XIzlZHMnFZRPOUhpQgSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ad3K59ZVwey0zN+ISekqtJdevUXZTFq9kr5r6K9gxSakjrzb9VFhME1mvJWxZZCbR
	 C3okzBzlhkWouCNkouGn0AwWpmtcPyuK0AlxNRavWXvZ0Wh5UHW424pQYEpfBinoXr
	 ZyMZSDhubMTw/4GQN4BLOV2yPY8j+Vs6GZOs/n1hKOn7MS0BWjtc6GdGGlAYue1k9O
	 Wnd5QnSlC+APeAjd5WL8RVORlBTdbO/bcWky9AkIo+6M8q02hod5kE5bNH+N01lIP/
	 AV53S+B/1sNH08KkjMMsMcRBMj2rureyOC4U6CAvXRhBpXdmkpGRUa341Hqn7KZHv2
	 8Yg5aTzE07zcg==
Date: Wed, 4 Nov 2026 18:29:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 12/14] MAINTAINERS: Add entry for Solomon SSD16xx DRM
 driver
Message-ID: <20261104-shrewd-traditional-goose-a382db@quoll>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-13-devarsht@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019213726.4145532-13-devarsht@ti.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:07:24AM +0530, Devarsh Thakkar wrote:

> +DRM DRIVER FOR SOLOMON SSD16XX E-PAPER DISPLAY CONTROLLERS
> +M:	Devarsh Thakkar <devarsht@ti.com>
> +R:	LiangCheng Wang <zaq14760@gmail.com>
> +S:	Maintained

> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Drop, you do not commit there.

Best regards,
Krzysztof


