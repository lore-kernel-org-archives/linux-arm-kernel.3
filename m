Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18801C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 21:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7b+fOoJTElkvsk0LPoq5Mc0WbgbeP4s25/k6SfLmdI=; b=XhCg0lIfI88xCRCyHCT6cakvHf
	aAwt03StUFQbeN5in3EJCipI5IVmQHbCHS8VflsMOBMlWbdVupE60U5ZAyJe5UkGoGYDoU0SEOiQa
	rMv/GCkbVXRn4nu1Vyy2xL2Hpu/A9fJF4f0AuozqV74KZArZc6SQ0kpIvtYH4/yRG16RI/J09iDp3
	FThR//eNnhJloBLHsHkx1BtWV5Gbu0YZQsce/5bEoxDIIzuQERLqf1/NwlhS1DDTaU7Wve68SV2Sd
	m8Y7mJeRG5xgzsZ407/Pe+NIUjCSH7wHDuNIZug5WRvbdQw17Ge0Q0VUqUqho5kXikY4Vjc8nN7Ca
	wrSwSCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQfV-00000003Ipb-3DQ4;
	Mon, 14 Jul 2025 21:25:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQd3-00000003IDZ-1oeN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 21:22:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED0ED5C65B6;
	Mon, 14 Jul 2025 21:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C3DC4CEED;
	Mon, 14 Jul 2025 21:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528148;
	bh=XWvyEJu17/NYmt5lKHJpnUX0PIhb311yUkoU6DfI3wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvoMcceWv1Y6tF61U88roTUWlaNIqhWe/DqowtENh0zvk+4MWV1j3cMWFwYHttF/Y
	 UuvxMs5JqKQDgeJqqv1PwxSNDnq+nobMH6BW91rOqgo+W9RaZfzlgy0xLQymd8wq/h
	 OLtfnMf1xHtD3XVRiFBBMUUyByiryS60CL+gi0WSsucdf3JYGScxsO1d/SVXYZhO9u
	 6pUzFqIrpBOgodGDqQ+shI8uUwNvx7rEF+BHh1tP3pBxlBZjCSfEkTwW1AQM+bXBKE
	 eijRQ/V8mVvJSwur+UYSibH9tMi7VYjn56cipMASCVu/Mei73KqUlomr/26Gu6h0Jl
	 0pOnmP1G58bGA==
Date: Mon, 14 Jul 2025 16:22:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Samuel Holland <samuel@sholland.or>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add Allwinner
 A523 compatible
Message-ID: <175252718830.3073791.16346905793933146110.robh@kernel.org>
References: <20250711035730.17507-1-iuncuim@gmail.com>
 <20250711035730.17507-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711035730.17507-2-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_142229_509377_80A3B56A 
X-CRM114-Status: UNSURE (   9.29  )
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


On Fri, 11 Jul 2025 11:57:27 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add a compatible for the Allwinner A523 SoC, with an integrated
> ARM Mali G57 MC1 (Valhall-JM) GPU.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


