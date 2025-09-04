Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA14CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuLfP+r54LURDa2LMo8LpqmiyCBnEVHwC9eXfZe3py4=; b=xw8maQDjI5D/88ht9SLiDwrf1j
	WGimK7HwQT1di2rfXvOROvYTfOiM09ZDch6AzgNJqUxsbNGdpcElTUoAjy+wdmx3nKsVZJFweSAzg
	Wyp/5Uqehb2wQCyyK6n2oeBMuOclHMVev4Sg2MXNDnBOQgd4d3VObKUZNU7EcQ43gCya+KbSMcz4B
	SrhVhgqXvDrt4+Cjce5ace9BiakNiLJdCeNLqw52zJC4XmiTmKAqDoeMNP4hU8ZmDNok00us+iA7X
	2n7q7wgzsStLf37Ol4mdNRNdkRRj886o4M6/mvm7sda2aMfFpCyfWZ10GnZkN4iJpnaLxw3P2cwE+
	b2FbiNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7Ks-0000000AwIg-1EuD;
	Thu, 04 Sep 2025 10:36:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6Ih-0000000AZjT-2ogm;
	Thu, 04 Sep 2025 09:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F7D143687;
	Thu,  4 Sep 2025 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58917C4CEF0;
	Thu,  4 Sep 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756978238;
	bh=NuLfP+r54LURDa2LMo8LpqmiyCBnEVHwC9eXfZe3py4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIp5rGKSsb4OffYTPRkTkmC9E5V/Dz1pqOk7/EYbgLIWe3oY2+HwirS20q+oEPy7Y
	 JMxHmdnotOEJ8ULS1BDyK7jDnnJH74Kf9u3jTPldI2ZFawLqRARtARC8L0G/wqu+p0
	 kzUoCsSHywe6b6JIv+2jQ3aWL7u6dlQ9B7W402IpH19nRtWcuJAxd3dZbBZ/ptL9Kg
	 +bvoO7gBWo1QDg/Qwsx3T+tFveH8XnAxmfJRrAb6JFrjJLS2B1hUcdAEHYu+udoGUk
	 UM5tvz4E86r5BCr809NTNldr6BMX4bc2Qm8AYrLLMPjIimyfDxJVOxcvQPidbWSuvi
	 3Wu5OChGPV14w==
Date: Thu, 4 Sep 2025 11:30:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250904-practical-dazzling-quail-f1bebb@kuoka>
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-2-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903225504.542268-2-olvaffe@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_023039_731431_D54A3311 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, Sep 03, 2025 at 03:55:03PM -0700, Chia-I Wu wrote:
> MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
> panthor.

What is panthor? Please describe here hardware or provide some
explanations of not-that-known hardware names (if panthos is that).

Best regards,
Krzysztof


