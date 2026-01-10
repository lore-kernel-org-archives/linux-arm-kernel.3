Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74209D277F1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQdYwLZzXMAU8SmkA7uOTds+binBUVJuHuO0dy4zD+c=; b=YDG+fDlXnyfitDVN4ShFJDJndf
	uWesQgpApVgBkKIXqlMXlDyJMpK7DGQKpQFkfJetBXy6PZPjf9n1SDDqgHK0JslFh8XRBrpX4O838
	+eUzIdZpFZF0kn+8/qutLg2/3FWg0gW/GvpGziyDhbQWnkYMJczm+F/0eGBJzP7NhpIWakVo7oP0k
	gZY5ika+cQK8m3tM2lXGi53Mi3+fywXDqj3B4E8dvZjaqJtpzaVOn8ze6/8IbULOyhbe2/LvFAo3C
	j/PqrrEUfSW4NfW6piNlutMhCPWlDl2xSfr7wDCdPaYZTT/OVDzeU1dle4SM5gD2ak7QCNEDYny+L
	iViWrgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veblD-00000003YDZ-2LpY;
	Sat, 10 Jan 2026 16:24:19 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veblB-00000003YDE-2BSP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 16:24:18 +0000
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ee1939e70bso56050471cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 08:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768062255; x=1768667055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQdYwLZzXMAU8SmkA7uOTds+binBUVJuHuO0dy4zD+c=;
        b=aYHGg3UpALsuM7arGqj1Zvz4XVnVyZSDuSyWQRvzhJlbBEYocnwLu83U6uLOQTnYmd
         wHF/S/BzlXoV7+1kyEDnTG55ycgb1SH7zRoGlcSuSa/yE6NNHjzPEvLXRz4xj7Mgt6ju
         a8FnTRBEh9U9OSiR0BB5kCgkiRHZ+0fYprQ6l8tYgmaGfwzQP8Pah7xVYX3i9CErVcTn
         G3p5miqV+klzO6FU1wm0o04Qfm7x4DD+f4n+UcietPTJajns1XC7gdJKEJNSI3hOSmQJ
         fAC62WoOTiCwd3vX2ADJiNn5qbZD6FT+ohKVW7fQszF5JBdiwSorVRN3U6gFY7DvaltK
         TMCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA09LRGOJd/3AATW5bsa3NwsjTPwDSbTQeRpZKFmfZJOup8oRfP5x++TmNy8swP3XY0gkOAtBNETouD99hCx4W@lists.infradead.org
X-Gm-Message-State: AOJu0YxSrG5w/HMaagGrqwwB8QNc5n08NO8OqiG35bOK9r19tTiMuWOA
	vX84u34lfVwtsJjnfAcWfGN91BSXQlNo9CkUEXWn5W3bwewAJ1nmbL4LR+kD6w==
X-Gm-Gg: AY/fxX7VqmPE2FFUK03/tbDrBRm2dzUgUAigTtJGUKmYyEzrLG+cnDR5wJ/wfPjtULe
	72IoPV5HDi9JlOoyU+DZxL+ezwmoQ1jrAQ6VptSN0se/M4l07slsI9ZYW3D3x5dK0Vkh3qTfz5w
	531awxbibLEmkH9d41ZgL00a7QKw588PcJ65RaUW63oZtWK6qe2jB9bjiOjMGaAD5A4GI5CMbuz
	6ghhC8pkjzapiqXrB1K0qMQKZ+EyJrv48/nPgPD3EuMca1AJGRNLi+JU12TwtZa9X0r18LmYiqi
	qcwgV5WuI5VMH4IrQvKuiuScUR7qc6Ar70JzSdS6YSd/TtVn6O3R4z3pBNThzuI5E6oaWh8yRpY
	UMCx5KSCqrspRfS/RrzgXgBa3XsFC+gv+1Go0FJsFbUxw3906y9XuPqCq6gWQAQuGf6tfxlyM+r
	i1ZZ+bfCCgCTDpumhp2HXGMdXPRGJCJOy+5j83HbpGUIqoG75qOcRwQtMZRaswXPEin8jtOOPvE
	jSa
X-Google-Smtp-Source: AGHT+IHIlrDu9pTf2QA8bG4BVp654XYnTyplHjviR9MRPkddwXiKBSL2kZZB8ZUO6EZ+oVie3BF6Mw==
X-Received: by 2002:a05:622a:480a:b0:4f4:c0b3:f50d with SMTP id d75a77b69052e-4ffb47d3b20mr197312371cf.2.1768062254724;
        Sat, 10 Jan 2026 08:24:14 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2a8fsm98921826d6.16.2026.01.10.08.24.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 08:24:14 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c15e8b2f1aso522109485a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 08:24:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIHzPQ5KvjAphTY5rHwSUUMIL5n72F7DqZLK4L7WA1iU61AmaOdbc6wyY0Una2EPRy9paA1ijA1KeqRtONUtLf@lists.infradead.org
X-Received: by 2002:a05:6830:43a3:b0:7c7:162:e0c7 with SMTP id
 46e09a7af769-7ce50a90f4bmr8147510a34.6.1768061889898; Sat, 10 Jan 2026
 08:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sat, 10 Jan 2026 11:17:32 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-HQX+gn6btg2XdSWksKT_LWiZALHYUut6g=nLNyyss-g@mail.gmail.com>
X-Gm-Features: AQt7F2qg4rFQ5hy8HWAR12VQcLFFsQaKZU4AJgyzrS2WAPR63DqzY544RgrVDKs
Message-ID: <CAEg-Je-HQX+gn6btg2XdSWksKT_LWiZALHYUut6g=nLNyyss-g@mail.gmail.com>
Subject: Re: [PATCH v10 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2
 SoC support
To: Nick Chan <towinchenmi@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_082417_577515_FE1226AC 
X-CRM114-Status: GOOD (  24.57  )
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

On Thu, Jan 1, 2026 at 4:02=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds support for the CPU PMU in the older Apple A7-A11, T2
> SoCs. These PMUs may have a different event layout, less counters, or
> deliver their interrupts via IRQ instead of a FIQ. Since some of those
> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> be enabled by the driver where applicable.
>
> Patch 1 adds the DT bindings.
> Patch 2-7 prepares the driver to allow adding support for those
> older SoCs.
> Patch 8-12 adds support for the older SoCs.
> Patch 13-21 are the DT changes.
>
> Happy new year 2026!
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
> Changes in v10:
> - Modify apple_pmu_get_event_idx() to take the number of counters support=
ed
>   on the current PMU, which allows `perf record` to work correctly on A7-=
A9
>   with 8 counters in the PMU.
> - Rename the added counters to nr_counters in apple_pmu_init()
> - Link to v9: https://lore.kernel.org/r/20251218-apple-cpmu-v9-0-4deadbe6=
5d03@gmail.com
>
> Changes in v9:
> - Rebased on top of v6.19-rc1
> - Removed non-existent "INST_A32" and "INST_T32" events from Apple A11
> - Added "INST_A32" and "INST_T32" event affinities for A9 and A10
> - Link to v8: https://lore.kernel.org/r/20250811-apple-cpmu-v8-0-c560ebd9=
ca46@gmail.com
>
> Changes in v8:
> - Rebased on top of v6.17-rc1
> - Collect Ivaylo's Tested-by
> - Drop #define PMCR1_COUNT_A64_EL3_0_7
> - Reword reason to not initialize PMUv3 remap in EL1
> - Link to v7: https://lore.kernel.org/r/20250510-apple-cpmu-v7-0-bd505cb6=
c520@gmail.com
>
> Changes in v7:
> - Fix a W=3D1 compile warning in apple_pmu_get_event_idx() as appearently=
 using GENMASK()
> in a function prototype causes a warning in GCC.
> - Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f22=
5c1f@gmail.com
>
> Changes in v6:
> - Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM o=
n Apple Hardware)
> - Add patch to skip initialization of PMUv3 remap in EL1 even though not =
strictly needed
> - Include DT patches
> - Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd2=
8ed4@gmail.com
>
> Changes in v5:
> - Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to kee=
p things in
> chronological order.
> - Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45=
147e@gmail.com
>
> Changes in v4:
> - Support per-implementation event attr group
> - Fix Apple A7 event attr groups
> - Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8ade=
d81f@gmail.com
>
> Changes in v3:
> - Configure PMC8 and PMC9 for 32-bit EL0
> - Remove redundant _common suffix from shared functions
> - Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b36193=
2e88@gmail.com
>
> Changes in v2:
> - Remove unused flags parameter from apple_pmu_init_common()
> - Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac=
1743@gmail.com
>
> ---
> Nick Chan (21):
>       dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
>       drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
>       drivers/perf: apple_m1: Support per-implementation event tables
>       drivers/perf: apple_m1: Support a per-implementation number of coun=
ters
>       drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
>       drivers/perf: apple_m1: Support per-implementation PMU startup
>       drivers/perf: apple_m1: Support per-implementation event attr group
>       drivers/perf: apple_m1: Add Apple A7 support
>       drivers/perf: apple_m1: Add Apple A8/A8X support
>       drivers/perf: apple_m1: Add A9/A9X support
>       drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
>       drivers/perf: apple_m1: Add Apple A11 Support
>       arm64: dts: apple: s5l8960x: Add CPU PMU nodes
>       arm64: dts: apple: t7000: Add CPU PMU nodes
>       arm64: dts: apple: t7001: Add CPU PMU nodes
>       arm64: dts: apple: s800-0-3: Add CPU PMU nodes
>       arm64: dts: apple: s8001: Add CPU PMU nodes
>       arm64: dts: apple: t8010: Add CPU PMU nodes
>       arm64: dts: apple: t8011: Add CPU PMU nodes
>       arm64: dts: apple: t8012: Add CPU PMU nodes
>       arm64: dts: apple: t8015: Add CPU PMU nodes
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
>  arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
>  arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
>  arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
>  arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 820 +++++++++++++++++++=
++++--
>  12 files changed, 883 insertions(+), 35 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20250211-apple-cpmu-5a5a3da39483
>

Seems reasonable to me.

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

