Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4576E65D03
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yt41PKWrEGJRnAjbz0PFhgIjDGDDXHQksKZGWxpFNBg=; b=Bjj8wJHJIbVtJrPjSZgzK5n4Em
	PhOvUW01JUVMJ9e4kExuGDFOUqFzw1MlSZS4ue+mMlRGzoyRMevH7mqPv8cPbEugWb302isrXgMdu
	K3p3APbK0tEFyS79zVnQoeGOk/LHl90vFYnOeWPcHL7oXKDGX3ceRvlO3SUdYUXuOi9T3u8D+uE+y
	9D5vqzOC3PeR8eH9Yantrjt3rZqo95JArmrv/D6uPUSIkIW6gIGCGHKwYO06C2uXNA4Tm+Jk6Wrpd
	WKS0/Bk4rPnRSVUsWdp/rVP4Oc/2vu9VtlQOvvuGvASTjzwEHiGQndryytfKJrqQP5B76xEYsW8Nu
	dBF6Kkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEG2j-000000016wg-2o4q;
	Thu, 21 Nov 2024 22:52:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEFyR-000000016JZ-46or;
	Thu, 21 Nov 2024 22:48:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 911205C5800;
	Thu, 21 Nov 2024 22:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AC9C4CECC;
	Thu, 21 Nov 2024 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732229311;
	bh=yt41PKWrEGJRnAjbz0PFhgIjDGDDXHQksKZGWxpFNBg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rNnmp0qQL1nj3N2gOyBsQoO7xbSc6MAhn83m3EY+ySQiADVizmmo80xyy9puVyD/W
	 U3lvWAolldzlpXJRVNX/jm4csHUCkY4khC0nFdjQXulCODFHJpfqC8gvwtmcvQhuf8
	 DWFAtRq3JrgkuBEj0/a1gIWTqeC7WjAbfyWL3KINULzYidil+Caf8DCFgK0f+UAgnk
	 7aeHsM9acaL2XDG2BUMojUintNcQAMJlBCniNW6CHDbI2j41afeZvtg1Z1Kdv8uNLp
	 TLbQutV47LQnUFht2ZIF9JOBrmsusI4jBUzc8VmYWJH/0UcdxGXAcVMifof4dHccip
	 AbX6GkOkE6YNA==
Message-ID: <952e489881a673a3c2c803d534465d50.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241023-drm-vc4-2712-support-v1-30-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com> <20241023-drm-vc4-2712-support-v1-30-1cc2d5594907@raspberrypi.com>
Subject: Re: [PATCH 30/37] clk: bcm: rpi: Add ISP to exported clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dom Cobley <popcornmix@gmail.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Michael Turquette <mturquette@baylibre.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh@kernel.org>, Scott Branden <sbranden@broadcom.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>
Date: Thu, 21 Nov 2024 14:48:29 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_144832_067102_26868C7B 
X-CRM114-Status: UNSURE (   6.59  )
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

Quoting Dave Stevenson (2024-10-23 09:50:27)
> From: Dom Cobley <popcornmix@gmail.com>
>=20
> The ISP clock can be controlled by the driver, so register it
> with the clock subsystem.
>=20
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

