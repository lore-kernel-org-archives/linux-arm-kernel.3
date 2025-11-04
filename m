Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05B8CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C50buEJgHS4X44Pxki9184nNxCl3PAMZC3E2giSJfBw=; b=gzraSTP/T+ZdjiJ7s3C2UWLr8K
	Y9H8xubfM/FNMzzI9NtgYVaL17+ECFqXNi2WupOOko+TeRHCIDp7DWJ25aVNw5ybOHkCuceyJIb7y
	mzyHwZb7XleAFu2AOg6iqSh+C+DAlvZyhfzO3gNf24CBobAuoG6bypGLITA0q8pKYddYCOSYDb/xN
	AcnPsAyFl6my3mut7lbvJ5uIBNYgTbJkHVvKIzJZgE5UhEZu017EdBDjx5Q90ATpVITsd8eQYbCpb
	SwNzxWlTL7HPOenug/J3K9iIMcjLNjk9pAXLnQT40NI5pKg4h/YANMSxY81XeUSpbrlc41S0fo82L
	QEyKFsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBbU-0000000BLDW-2HpQ;
	Tue, 04 Nov 2025 07:37:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBbP-0000000BLD5-1t1Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA74B4454F;
	Tue,  4 Nov 2025 07:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0F2C4CEF7;
	Tue,  4 Nov 2025 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762241834;
	bh=xhxp+8yUrOqmn3E/ji9PabKENE1tC2sGm1YBQzpn5tI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XUMiCcXm2a4mJlNy0ladRJgAMrb6ML4tFYmoNTi6LuQo4JBcfic8fcTg3+RAgRaIW
	 U/09qPu0qgPVvV3YviBldAEOWeQS0XD0eqqwtA4PJ9qdTEph+ShH8fA8gD5G0HTJ+c
	 WvTPbKqI2PcnnO4TyZ1wgqCHxZ6sh9exOaPUIcm+zhnr/y8laDJkkMQpH7UlLM61hv
	 SP+E39ihJ+w46V3iMQqEQxspZ+kJjtL2mGTeF0eaBPc2+i/eAJKQrm/baF66s65QHP
	 Lfv1M3RO8qJBJt9X1HgL7WW8jx5QQ6yRw5F2ieA0Dj5FBCP529yNoMY1RCH8xF/jzd
	 qfaxyogkCibwQ==
Date: Tue, 4 Nov 2025 08:37:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Frank Binns <frank.binns@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
Message-ID: <20251104-judicious-malkoha-of-snow-6a2b92@kuoka>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_233715_509801_664C3EFC 
X-CRM114-Status: UNSURE (   7.60  )
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

On Mon, Nov 03, 2025 at 09:07:35PM +0100, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


