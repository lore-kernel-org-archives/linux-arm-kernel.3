Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92C9CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIb76RKd8kDbIfaU0zouCWtia/gRhkmDPPIIJTmfYmM=; b=xUfytcIvdx5UEz3HTDM7W17UaL
	AlGaxGyQR5iLj5kvoLku/SMMInxeDqeWMS5Z3n9uLBdShWVXQRYMfKRrIHInDsQ0s8SMcuoORvLSN
	zpJb/lY/EZMiogMTY1728/c1r6cHuNSdbje4J84cOv9PgujpR8fhF7yauNjFwZDIhajFKy6u6jd6o
	5GrTSq7ZhuIZDoP93u/x0u0PBgenSLe/fJVoIohX9vYIoevxbN26jVUWT2lSmJliR/DiH2DWtQjER
	MK1wUw20ppmUFlLGNuQYCpICm0i5qbigizVxaIPK/1jhAf6GfO6q96u0WvFl9UchbioLCRYIuakDG
	g6YNiYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK7i-00000007Wwy-2z5d;
	Wed, 24 Jun 2026 09:42:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK7h-00000007WwZ-1yFe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:42:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1CE643D12;
	Wed, 24 Jun 2026 09:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D801F000E9;
	Wed, 24 Jun 2026 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782294140;
	bh=eIb76RKd8kDbIfaU0zouCWtia/gRhkmDPPIIJTmfYmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MhAdwshjP71OUnOWtCjiWxp+k+aBs5HHl/Q7usllXn7Jagb0KTazWILP/XY2chsIL
	 ikVKMWq3z8RCKoeefCekD+hWigt4u8z2xOym4fzPQPDn2ATlzYv7TRlVtU7s6JfZ+Q
	 +qDfYbh7x8cVghySlGCdfqBdo1PrkglNpJW/QGhWOEunjPmY99dSGP+oFzDoYRnXIu
	 6DyVztQLmTt5+N8/I29HzA+7siG6RZTUOJ/6CEASHg1NH9puFzZfj4W2clArt4zVRH
	 GHWF9N5HWXNV+gho2h088RgxD47QSzRx6Imn8vCgOSARXD1rqgHZ4XNkWbgR4xYyOV
	 s8tLy5Rmon1dQ==
Date: Wed, 24 Jun 2026 11:42:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org, 
	jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, 
	kristo@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	thierry.reding@gmail.com, sam@ravnborg.org, leonardo.costa@toradex.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Opto Logic
Message-ID: <20260624-immortal-hippogriff-of-promotion-ea09f4@quoll>
References: <20260623195741.495734-1-leoreis.costa@gmail.com>
 <20260623195741.495734-2-leoreis.costa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623195741.495734-2-leoreis.costa@gmail.com>
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

On Tue, Jun 23, 2026 at 04:57:37PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
> 
> Add vendor prefix for Opto Logic, a Swiss display solutions provider and
> printing systems manufacturer.
> 
> Link: https://optologic.ch/
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


