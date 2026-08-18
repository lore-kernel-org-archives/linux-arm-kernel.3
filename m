Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796A1C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEnljxo0cPfEBmMxWEU2YfmO6Q8TD6rHTlbi0qUFIBw=; b=mxG9ZEdYW5cMGeusCLBcRvroHO
	l/CAgQS/N9tNRca26i0pZTGv1fPsArv5ye10zDLsr12BdYF4Y4kbEAVoV7r0XJbCMhNxwVNNtiuPr
	0xdGxqJQEcmzQiCy+QhIL7f/P/aG2keWH6PEGKTx5czfOIPLvEKa3dqptMBzWYAXLbI9c36IyWVIJ
	ZRT4t7g4StPTeIqILpScu3OLC8q6olNkxNxT3+sx//pLxK0wjNS2eRCR1mrWnZbnJEf89vyz4j2kK
	G0wI34LOCgIuVT2UFXAKMNSm8jjqvQ21zJWYZEYYpvkQ++dsTIXVLm+iqXZwYoGwgqnYe9tr3vLiC
	6+YPlwKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFlE-00000007ZMG-0ieO;
	Tue, 18 Aug 2026 09:05:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFlC-00000007ZLW-3hx3;
	Tue, 18 Aug 2026 09:05:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC2F760A61;
	Tue, 18 Aug 2026 09:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658151F000E9;
	Tue, 18 Aug 2026 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043929;
	bh=dEnljxo0cPfEBmMxWEU2YfmO6Q8TD6rHTlbi0qUFIBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VvEGMl0iEuoU7p4cr7L3b2P1L5Oga5Jz0bPSjRk+B129D3GlF/EJOSQy8hsF8ceOG
	 3Zhcsd9yvDMlNQbhDM04tqbkyr7rtBcVy0bAz1vFmsKdLQUuWR083cbUh9MKq5zRIS
	 2dIu9TxTVVTeB6owTDMLeZ/PdeV+Spnx/QwixaQywUd3JNLfm+3iM/QzdHK+tQ9ZHX
	 bNjdXOmKL0yxMqgnOz9nJQFipsHowUBOLZeOxYzqoTH/dDQb0b/FpRqnEWDreP3vgi
	 5GpjM+jASM2mIvF3KDDdPswQPhb/r1sAXiAx5LmLCvfujTyT9ub7JlKSHdg4NG/rby
	 ukYvrQRtC2gWA==
Date: Tue, 18 Aug 2026 11:05:24 +0200
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
Subject: Re: [PATCH 2/4] dt-bindings: display: bcm2835-v3d: Add an optional
 reset line
Message-ID: <20260818-idealistic-chivalrous-sawfish-08ddae@quoll>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
 <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260816-vc4-reset-control-v1-2-896444373716@igalia.com>
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

On Sun, Aug 16, 2026 at 11:05:41AM -0300, Ma=C3=ADra Canal wrote:
> The BCM2835 PM block has exposed a reset line for the V3D block since
> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains

This is a reset provider driver, so not really relevant here. Driver
commit would be relevant if it was about consumer who implemented
undocumented ABI. I suggest to drop reference to driver and instead
describe the hardware.

> under a new binding."), which allows the GPU to be reset without
> power-cycling its domain. Document it so that the vc4 driver can use it to
> recover from a GPU hang.

Does every device have it? Cygnus as well?

Best regards,
Krzysztof


