Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DA6E87842
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ctbjtQXFh7WaLQpGDuVyer5fogYvtZe7iuJuOeTdM4=; b=cX4oUW4TtZvmeiWtqfd+kal8ar
	NV1IfBsgrvEpU3iQpW4XDdi/oA+HXifbCyv0RozJNIfP9HHg3G41duxpVDbf7spho4bbgg7HGaIcC
	Aw7tFNb1yBHDIFvGogli7KLn8/uZ2xBQSo4HXlbq0QBwxMW47zOVdOjO6JwcFvXY5+8x79ddZXes5
	dapKKIbWQ5xpHH805WIuf3btu5H4Vu4Co8VgfySyR+W5d72WIvapyOx70au5N8gzvG4VwQj9aSTfI
	7bgE6i2/LpXH5N1rl+gOc6+/zuaD1Tr7gTxT5Zi0bRIly6VigSmr0Vig0kFwfJFOFrFXLiFJlNA3x
	vxYnBHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ4O-00000006tpV-2w3d;
	Tue, 03 Feb 2026 16:16:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ4N-00000006tpB-3hH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:16:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46D2E601ED;
	Tue,  3 Feb 2026 16:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF397C116D0;
	Tue,  3 Feb 2026 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135363;
	bh=bhdGtd4WmowAH58NVum4rBSvvaM86Nvk07AmQZKvsvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9wI+BAHK2mSETzQpb7XvsMA4hAJWj3U4owCD37kw1JDVYNRasFl6bSgRntwgUI0g
	 +Ic3VbzTJgdEtgapWruosnipSDHqVow7/Bk0YrMxcda/SGvYdTosuHgPUQ0L2mfPPT
	 J82lQ5a4t8EZrl2+nLzY0EzzHVxcZEKZ9GKh10LMIYn66y0IbZbdWNXTwAGMM/8Vm+
	 66txt0lMT06fykGlkF0kClb+4zGD86Vi2e3as34Z7W39tgkzy1tjr6LcvxcKX7/STL
	 iDylwZSkmCdvgmqq8wA67O8QGojnardZ4rco77qzn2UKrIV1vG5drhK8I7jQdLbx2j
	 5HxeJ0jDUW65A==
Date: Tue, 3 Feb 2026 16:15:57 +0000
From: Lee Jones <lee@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, peter.chen@cixtech.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v6 0/3] Add support for Cix Sky1 resets
Message-ID: <20260203161557.GA7629@google.com>
References: <20260203021053.4073258-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203021053.4073258-1-gary.yang@cixtech.com>
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

On Tue, 03 Feb 2026, Gary Yang wrote:

> Patch 1: Add yaml file for Cix Sky1 resets
> Patch 2: Add driver codes for Cix Sky1 resets
> Patch 3: Add dts nodes for Cix Sky1 resets
> 
> v6 changes:
> - Pass dts build check with below commands:
> make O=$OUTKNL dt_binding_check
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
> make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
> scripts/checkpatch.pl 000*.patch
> - refine reset driver
> - fix dt-bindings style
> 
> v5 changes:
> - Pass dts build check with below commands:
> make O=$OUTKNL dt_binding_check
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-controller.yaml
> make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
> scripts/checkpatch.pl 000*.patch
> - refine reset driver
> - fix dt-bindings style
> 
> v4 changes:
> - Pass dts build check with below commands:
> make O=$OUTKNL dt_binding_check
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
> make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
> scripts/checkpatch.pl 000*.patch
> - add syscon
> - refine reset driver
> - fix dt-bindings style
> 
> v3 changes:
> - Pass dts build check with below commands:
> make O=$OUTKNL dt_binding_check
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
> make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
> scripts/checkpatch.pl 000*.patch
> - remove syscon
> 
> v2 changes:
> - Pass dts build check with below commands:
> make O=$OUTKNL dt_binding_check
> make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
> make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
> scripts/checkpatch.pl 000*.patch
> - fix dt-bindings style
> - refine reset driver
> 
> Gary Yang (3):
>   dt-bindings: soc: cix: document the simple-mfd syscon on Sky1 SoC
>   reset: add Sky1 soc reset support
>   arm64: dts: cix: add support for cix sky1 resets
> 
>  .../soc/cix/cix,sky1-system-control.yaml      |  49 +++++
>  arch/arm64/boot/dts/cix/sky1.dtsi             |  14 ++
>  drivers/reset/Kconfig                         |   7 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-sky1-base.c               | 125 +++++++++++
>  drivers/reset/reset-sky1-fch.c                |  78 +++++++
>  drivers/reset/reset-sky1.c                    | 204 ++++++++++++++++++
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/cix/Kconfig                       |  11 +
>  drivers/soc/cix/Makefile                      |   1 +
>  drivers/soc/cix/sky1-system-control.c         |  47 ++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 ++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++
>  include/linux/reset/sky1.h                    |  18 ++

This is in my inbox because ...

>  15 files changed, 763 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
>  create mode 100644 drivers/reset/reset-sky1-base.c
>  create mode 100644 drivers/reset/reset-sky1-fch.c
>  create mode 100644 drivers/reset/reset-sky1.c
>  create mode 100644 drivers/soc/cix/Kconfig
>  create mode 100644 drivers/soc/cix/Makefile
>  create mode 100644 drivers/soc/cix/sky1-system-control.c
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
>  create mode 100644 include/linux/reset/sky1.h

-- 
Lee Jones [李琼斯]

