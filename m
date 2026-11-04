Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51FD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1oR9mpbB;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tXU4PI05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=; b=1oR9mpbBP/EI7t
	aPIMFm7IADRRKUaH2QedjZl6P60Lo5URWY/hTJUA8yg8juF9ZSa+ZIVFoMLqwKokriUrUKTwQIYx2
	eixVjoWWdjl607xpLQHZGvzq3vr99/UlBiPm064jfsWYtG7neU3y+vz/t7+PtH3imHhx+FALqwlUc
	dx5KywocSUfLuVND5qbi6m0j2KI7dtpJOQgtLZpwAhZq/71vAL16BPNrYXhzWY0R8UY+DDDD8c0ES
	grfaubzawkHoiBe8vdNCXe0WKh0QnqgpOdRkPHPF/+Y2vfh5z27L4aIT6dhmb6KD5wukUYh+kDopV
	ZO2rali33msKlBKb8p9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXw6-00000004xeB-1SLR;
	Wed, 04 Nov 2026 10:09:42 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXw2-00000004xcx-3sld
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:09:40 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-945ae2daa66so61122885a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 02:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793786977; cv=none;
        d=google.com; s=arc-20260327;
        b=JLwIbKERakYVLpRF5LTBlpFMXAvvt62N+v4bPPtndsLs2oTzrF9xjwh4l9m+dbFVOd
         N0/HUqZ0uqlZq0di93FTfoWE9CI5Ia/cMy6AgxM/55uAFy9Ul8cSDx68UaV2Q1UPuQ5n
         3IGtsjVIbKx0NvxecZ6fa8GSiNSWIsmuN7VisckvvqlFkYWPYR8tPjJCJmwYCh3huou+
         /cELOBuqfMfAjFwKcfun+Erk2oKLuGwcvSAShy9kkrcPighU4o3+pjnHXWTcq7fJteXQ
         dwITyCQLBmDJmHWWXsM8Era3JERdT9KojiNGy3GWPvw0STjP3JLpUCAW3yfEn+miv2Ca
         QOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        fh=z9WQfS2NiC+JdJJkdaQa06/LCZ2RO4WLx2uObOeOd7I=;
        b=Lb9ex0fePdUmqAp0+aPpSVGlfm38fM2+sXgt6kp6O8LUzwWsSXpxxXcaI72qPKKATs
         VEWpwEPg08pJbEbcaqb6e2qD66lYvzWh6UicgCrNz583w6iX7+ewmypMw/Es2Tz301Ak
         jHoBopwE6ggOV639wd1GMUQ4qV5yNGCtKQkejeomDvfnU+Y8UfdjdrN1Hep8rULu6zi0
         GhIQl27Q5Fuaba6SrZ0S5HJ3FkWLnGC5MZSXPzcr2/70YlNLtNx0CLCBVTIG341WznKm
         ZumiOMDbOU0mbN1HRKrHVTaLNaGUG1SAGpFwI66aTpI2ZQUItfIBd1b1s8sAvpHABjak
         TqYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793786977; x=1794391777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        b=tXU4PI05OpFzKpC0LpEwGjcAMT4RjaoWtEBYlQZPaus6D/XxuthvOu82orieiTjHU1
         w5QDSoz0kYhie3zR44egja45wtLGAtWQGTAe2GlX1gTOpzvNeosb0oR1woNTUFlxnpqz
         rf0rWH8dQa4heWi6ZcFQfiX5Cw8WXqXTWvGAxuzaU5ctzI1kzGaAA6Q3Hx74Qm7ymxHP
         nIiCS0dRtdzZmuyuNvLA1YNZNAgh5W6gJb098sYk2Gv2WpeD4sDdhfnSAYjD2VFj+Ycc
         txi+gFev6SzB6ecfX9eGthedqExlsGRjYHIH4ar52WopGrBt4I9vSFUNXI/e2oY9sk25
         viFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786977; x=1794391777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRB1e0g/RzNosgVh22Q4nbJS5JXGJ4/s7oJ6tqlGbYg=;
        b=OPqxI98dZkXPrVxP82a32QUktLH4Y8zQlVXkOw8Tl/5Aj7uZTRC35c2HaQ3Ohi6xYI
         2mCsflf9AdDCrKNmAAsghbTvFtVcoRd7HP/E4Y7JQZvVRjcvDHfHvGfw2MagI5COKQ4N
         xJMEOlekx6wzVQ7tSfD7O1bF7ROKT1bhQCT/33gsdu/GyTu4bFsq5/WZ8LZ+vipQxThK
         /U6sDudxG/KvQK75spgxB9IeAtjCggUw9HYar923uAsfp8ISCZLUR43UqeXkIhfiDzJz
         ZgTEGQfAv/DQhjtIjiUGIpxmCZpEakMviAxqoi3TxXubt/Z4Y7r33I/8QZEMbrJ+2Bza
         kKIg==
X-Forwarded-Encrypted: i=1; AKwUvByBkkfYxEFCmlebDc0AGfVP5IFuCb7+CESW0YreznWLOID6hoDQn4g42o8pM7sod3F3Qkn+SOff+nhZaCni8UFN@lists.infradead.org
X-Gm-Message-State: APuU4Z8k2e46prFGd/CEHyz7OSYCksmykBAJvJl4l4iyJqrDwu64tyaM
	uyCoYIVxNYC17yDxYvJEm+N5xjsmMO2qntiHLLw0F2RSo+nxeUl59YmjJFv87to6bCmI/+rLbnl
	d109H32zW71NRRjzXBNKzcPeoMsMFinxD3j0i7ka3ig==
X-Gm-Gg: AYBFou2X060kmF0qjaof6ARedP7ePVRP9cJ/1EYrgwqdlpdy+aN/wJcQlWmYXUYtHQt
	nqZWflKxFP3tny7tBl0Tu7tSHh8Wgot0K1IX0dCm8wv0/uPDDvM5RwHNBvJnH7qCEJ0ZaTCy3BX
	j3Pk4RygPdRwKkLdhymo894WA3pUpUXMNrDf/uTqBtJw9uvtXjNA4sTrmgHox1Dnps6eW93CxLe
	GSG70hOxozvjL79SeCa9IO4jjZU0oKM6chV1RWV59oePAGdPq/qNFU7DO2AZvfrEAigO1zcrA80
	m4xyNAOd8nCxFZNpHREeZrc5hgLy6aSCneIKbJupJKjERaEB70YK2gCJpMKAzS0EUEcfXkXLtZl
	VhTTDTQ4QtC5OzdaW/HJhTIENr0LBAfX2zOFxMm61snlo2Yxa1v8SK8fTDKx4eYGZr0INuOJ+2V
	OKzEM84Vkw23IrmgOpeEY=
X-Received: by 2002:a05:620a:460b:b0:937:6de8:b40 with SMTP id
 af79cd13be357-944217194b4mr2663985585a.15.1793786977174; Wed, 04 Nov 2026
 02:09:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101082307.151957-1-gahing@gahingwoo.com>
In-Reply-To: <20261101082307.151957-1-gahing@gahingwoo.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 4 Nov 2026 11:09:25 +0100
X-Gm-Features: AclHuK8sSyrPUh77ae7umfCvxuLdQ-s4Z2b2nFvZD8O11RHz5Wmhve3hcOyzmnA
Message-ID: <CAPsqS2SOj-+VQxsFvMQ1Hqcep55J0yT++76QZ8or4a9kmF7Bdw@mail.gmail.com>
Subject: Re: [PATCH v15 00/15] accel/rocket: RK3576 NPU (RKNN) enablement
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org, 
	p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com, 
	royalnet026@gmail.com, abel.vesa@oss.qualcomm.com, 
	sebastian.reichel@collabora.com, sidong.yang@furiosa.ai, 
	u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com, 
	diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl, 
	jeff.hugo@oss.qualcomm.com, rfoss@kernel.org, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_020939_252111_EC95F7D0 
X-CRM114-Status: GOOD (  23.21  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 9:31=E2=80=AFAM Jiaxing Hu <gahing@gahingwoo.com> wr=
ote:
>
> This adds the RK3576 NPU to accel/rocket.
>
> v15 is v14 rebased onto next-20261030. v14's 12/15 no longer applied
> there, because Sidong Yang's regcmd validation added two defines in the
> spot where 12/15 adds its own. Nothing else changed, and the tags carry
> over.
>
> Leonard Lausen has the series running on a NanoPi M5 and posted a board
> patch on top of it:
> https://lore.kernel.org/all/20261019090348.378183-2-leonard@lausen.nl/
>
> On Sashiko's two points about v14 9/15, I measured a CM5-IO. U-Boot
> hands over with the NPU domains on, and the power domain driver still
> probes. The NPU QoS is saved before its first power-on, so it is not
> zeroed. The domain whose QoS does get zeroed is the GPU, on mainline
> without this series, and that fix went out on its own:
> https://lore.kernel.org/all/20261101055633.101309-1-gahing@gahingwoo.com/
>
> 1/15 is the patch that carries Igor Paunovic's name. It is also part
> of his DVFS series, so whichever lands first, the other drops it.
>
> Ulf offered to take 7, 9 and 10. 1 to 5, 11 and 12 go through accel,
> and 13 to 15 through rockchip. 15/15 needs 9, 10 and 12 to 14 first.
> Without 9, 10 and 13, the ROCK 4D takes an SError at boot when the NPU
> domain powers on.
>
> Link to v14: https://lore.kernel.org/all/20260924102135.92217-1-gahing@ga=
hingwoo.com/

Hi,

Could you please add a GET_PARAM IOCTL to this series for userspace to
query the hardware version? I think I would return an enum that
matches the NPU DT compatibles one to one. Then userspace can have a
hardware database indexed by that value with sram, register map, etc.

Regards,

Tomeu

> Igor Paunovic (1):
>   accel/rocket: request the core clocks by name
>
> Jiaxing Hu (14):
>   accel/rocket: take the completion register writes under job_lock
>   accel/rocket: wait for a running IRQ handler before resetting a core
>   accel/rocket: let the core suspend after a reset
>   accel/rocket: factor the completion tail out of the IRQ handler
>   dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
>   dt-bindings: power: rockchip: allow resets in a power domain node
>   dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
>   pmdomain: rockchip: add optional per-domain power-on settle delay
>   pmdomain: rockchip: cycle an optional power-domain reset on power-on
>   accel/rocket: select the per-core clock and reset counts from match
>     data
>   accel/rocket: add RK3576 NPU (RKNN) support
>   arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
>   arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
>   arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
>
>  .../bindings/iommu/rockchip,iommu.yaml        |  28 ++++
>  .../npu/rockchip,rk3588-rknn-core.yaml        |  47 +++++-
>  .../power/rockchip,power-controller.yaml      |   8 +
>  .../boot/dts/rockchip/rk3576-rock-4d.dts      |  22 +++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  86 +++++++++-
>  drivers/accel/rocket/rocket_core.c            |  32 +++-
>  drivers/accel/rocket/rocket_core.h            |  11 +-
>  drivers/accel/rocket/rocket_device.c          |   7 +-
>  drivers/accel/rocket/rocket_drv.c             |  42 ++++-
>  drivers/accel/rocket/rocket_drv.h             |   2 +
>  drivers/accel/rocket/rocket_job.c             | 157 +++++++++++++++---
>  drivers/pmdomain/rockchip/pm-domains.c        |  89 +++++++---
>  12 files changed, 467 insertions(+), 64 deletions(-)
>
>
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> --
> 2.43.0
>

