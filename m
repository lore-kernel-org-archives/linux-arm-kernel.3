Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB615CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCXTW2aOaTue8CGuD3TkPBjG5amIHfOVy3I1QHrr5hw=; b=I6zEtzhS0ffR3YYV6C14G3fXer
	o2fl7kjDAEpsCgkXdmva1A2EksnIYcijJw4zw+kz0GnXJSFVTdKEDH3QtOicWRpxJQA3wE64WOQGK
	R36UaS1AUNxInlhltf9nhSFjMSAv/GykNFT/SMi7SUasUIQE6Ikvzb/D6QJ5ULcyiGamiQs/NuUKz
	HiQChuCpBhb0huqTSb00W4N0U8m9TEREbKGAXeGedUQrYItt8ql0DzN94Zy5kiwa7Ks4HrUy86rVU
	V1C7KF0oL+3DyCmm4l6fIv/rxdYdnYdbCB62qoLKUxF2LuOTcBMhXzxe3vMQ9aGNRT5baVYgKpMF+
	BhvKuLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJl0-0000000A0ru-1liN;
	Fri, 22 May 2026 06:53:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQJky-0000000A0rN-0IVx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 06:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DB5C40A4E;
	Fri, 22 May 2026 06:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4ACD1F000E9;
	Fri, 22 May 2026 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432795;
	bh=MCXTW2aOaTue8CGuD3TkPBjG5amIHfOVy3I1QHrr5hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9fklyXk++gVyN5MTlOuDtPZAa4x2oK5cbE/aA6ue6o8/47ysIaE/BmTQyrdCYRHF
	 t+F0Em7yVbh1qVURXJJtBg9pshRY5ymwwYt5GFC1EBpak06BfSZh+J8KeIexHpBhEl
	 8tf0padDvBn+uKHXymRV6unqxfNHJcmBWuRm4Bvhg5iSfWjWunNZy20kF/JHpFnmKa
	 mMWDjYJgA49WiTvu92FNdWw2Jdih9uU6fU/FmtBllfmsS5vh+oK63rHhQ63eVx0DGu
	 3jp7Kg4wjHkU3JROyI284uTEz7RdBMBT39uUPBIFQeTqoLHQlbQNU4SDkDEOMMI6wb
	 xG6KGyfyLf08w==
Date: Fri, 22 May 2026 08:53:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Vitor Soares <vitor.soares@toradex.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 14/15] dt-bindings: display: panel-lvds: Add LG
 LP156WF1
Message-ID: <20260522-furious-coua-from-arcadia-b81cba@quoll>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-31-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-31-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_235316_132777_9074B8F3 
X-CRM114-Status: UNSURE (   9.98  )
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

On Thu, May 21, 2026 at 04:00:50PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Add the compatible string for the LG LP156WF1 15.6" FHD (1920x1080)
> dual-channel TFT LCD LVDS panel.
> 
> Assisted-by: Claude:claude-sonnet-4.6

Really - oneliner for trivial binding needs AI tools to help writing it?

> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


