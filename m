Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF180C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5GtsFhXRurro9n+DCfuYLQ9nH7iRtZYR6fJtNO7USE=; b=1qJteeHBfmOFeeetnpf4f3aN+O
	JbVGQ6nN1R64YKKIiZuyfgMezRrNeKBoIPuETRzoep5U8/0JQZmpSzZxfOOR3qasrRsQ4wBf8ffT3
	7dncGRHawyzzXjl8vvN4lTv+e5k0+78b2pF+eFswgvUO166dUABPctGEJBaBm8o4gQGUVDwAhig2A
	5Lx6RKmGqtV7xjkxCa4i0Dp66v85wQlf7a02RQDqXfzOJGCESyjjvawBZdBIKfiJOf258Ap1g39my
	+dc335NdBeB857cbsDajQVisKkIemCb+O9WZYhP2GYHz7PLUbOb41pNfRLJH73mLrE4YSNV4OFRsV
	l9bNPX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFms-00000007ZX3-3Bd0;
	Tue, 18 Aug 2026 09:07:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFmr-00000007ZWl-2yrX;
	Tue, 18 Aug 2026 09:07:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5381F40F86;
	Tue, 18 Aug 2026 09:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4A31F000E9;
	Tue, 18 Aug 2026 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787044033;
	bh=G5GtsFhXRurro9n+DCfuYLQ9nH7iRtZYR6fJtNO7USE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hY5a079VmSMr3pzWYUzZNUsL0N1qS+wH9s8kGh7wZwo5nGkxkYGGcyekmxcE8odOm
	 P1cCFBuGcZnL2HAB62obJfIHjM1kVbvkljY7VC7Mta7dzP6m31Km13zZY27E9vGoij
	 uH2WSppKMP4MELRnfaCWWQSvO2Gw5nf9HAeBfEf8OWX+QUHk3MkGsDwJ8TeMPVrudH
	 /meNXZiRMSM0xywLT8ND+OYUEtGyfQcgbGKCMhahW0y87Gipv/jOcGDg5d3cE/I7B/
	 EnR+BmdWyo9X4omd5pimi5dQObi1FFMZqWGVSFzckpD/oKD7g98iDfmne5eBLHIvlP
	 f+ytDJ9qPi9Ng==
Date: Tue, 18 Aug 2026 11:07:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] drm/vc4: Drop the undocumented brcm,vc4-v3d
 compatible
Message-ID: <20260818-tidy-melodic-sidewinder-e60360@quoll>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260816-vc4-reset-control-v1-1-896444373716@igalia.com>
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

On Sun, Aug 16, 2026 at 11:05:40AM -0300, Ma=C3=ADra Canal wrote:
> "brcm,vc4-v3d" is the compatible string V3D support originally shipped
> with in commit d3f5168a0810 ("drm/vc4: Bind and initialize the V3D
> engine."). Commit 90d7116061f8 ("drm/vc4: Recognize a more specific
> compatible string for V3D.") added "brcm,bcm2835-v3d" in v4.6 and kept
> the original one around, because the Raspberry Pi firmware was shipping
> device trees that used it.
>=20
> That string was never part of the binding: the documentation added in
> commit 4653f22e9ab0 ("dt-bindings: Add binding docs for V3D.") describes
> only "brcm,bcm2835-v3d", and no upstream device tree has ever used
> "brcm,vc4-v3d": the first in-tree V3D node, from commit 49ac67e0c39c
> ("ARM: bcm2835: Add VC4 to the device tree."), already carried the
> specific name. The firmware device trees the compatible was kept for
> predate v4.6, released in 2016.
>=20
> Drop it from both match tables.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


