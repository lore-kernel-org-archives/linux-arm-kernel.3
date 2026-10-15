Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349A7CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BYTPN1YnNM3Fwl3zVGsa2NH/wVfsNuKryu9DbOHO9w=; b=KpV8xp4cgTiQ4oc9k4bCd6fdpi
	TQ/RQx6TTgNfzKWXwaxA7lUtFFZlpNBo7+2H139+/mbIfrDqeshB+2Nxypx/esa5bnwotVxg2znOq
	zHg3JpIbBAA7eyr9mmMzqKEs1RPzyAHnRf4isD4BLPPGAsNece4Wil2RrRjRWDFvc/y3anvD2oBLC
	LOffAqkCAeXkXTgKNB6KT5ss5WoKvpnsgerbUnRSr7amhjC0Tb+Hy/iwXvxAp/1c/FFSpNsVvzTsN
	jpr8OVdvzZDOCXzCxaJqd2AxhPpC/yQParhYGnZ2Oa3ya/UWuF01BYsFR4XJwdwOByVBgmaqxySV3
	AOniDzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMCn-00000000L3Y-3LtV;
	Thu, 15 Oct 2026 14:13:13 +0000
Received: from out-40.mta0.migadu.com ([2001:41d0:1004:224b::28] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMCj-00000000L2y-2vWd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:13:11 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AehSZEUXyYI5DnsWcNl+PxgJ375j0fwJ+dcWs3+ntuo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792073587; v=1; x=1792678387;
 b=w+VCKMOfUhZ4tnUVXgY67Kd3FFG/XrjyC9yoHz4uB+KWiaFE5rxOJDgzUvdyypas+jqMRDSV
 x8s6NQAJ/+KafzKv7/7FzR20ERkP5qAZInNHVEFgCT8ClMqjtuypi6A3ndnMrfiFbuMZwNMFC2L
 FC6rGijnFaBeLnx5Utonxda0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 162999ff3130d9cb;
	Thu, 15 Oct 2026 14:13:07 +0000
X-Mizu-Trace-ID: 162999ff3130d9cb
X-Migadu-Flow: FLOW_OUT
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so8386a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:13:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxeHWuOtCUKWjwkzD6bFCzJqFTXaLanHO0m9ZYyAyOQ8ou9XTo2AGMAwm61QuZMkQTZDXHyQIVqZUJVImdaxX2a@lists.infradead.org
X-Gm-Message-State: AFq9FYLhCqChc6kVqWuUtZ8UDHUIZuk8wgPn+Db/XHRgAf7Vq/h4LSvG
	iAVMK0n5Q2/HFDu4ZkoOtc0tf6axawH7m14LexQxN2zQPVWuoNSwRtWpSbaSNDOnoSwez2fWJna
	RnVddRgcDbaxHGxthjQHZbUn66YWGq10VmrnqV4B+
X-Received: by 2002:a05:6402:208e:10b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b375fddc3fmr33779a12.14.1792073582345; Thu, 15 Oct 2026
 07:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261013130247.4135515-4-fuad.tabba@linux.dev> <20261015140909.1310928-B-seiden@linux.ibm.com>
In-Reply-To: <20261015140909.1310928-B-seiden@linux.ibm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 15 Oct 2026 15:12:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwqhB8_L0E5X5SgCcpK4rGceRgq1mtOwcPaMG-szycvew@mail.gmail.com>
X-Gm-Features: AclHuK8s26iwmj4UvOequv8LIG1kS_-fIOvoCkMvREIBgursWs09-hjQUBgRlhc
Message-ID: <CA+EHjTwqhB8_L0E5X5SgCcpK4rGceRgq1mtOwcPaMG-szycvew@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: sysreg: Mark fields the architecture dropped
 as RES0
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Brown <broonie@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_071309_911363_9B3DBF22 
X-CRM114-Status: GOOD (  19.04  )
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

On Thu, 15 Oct 2026 at 15:09, Steffen Eiden <seiden@linux.ibm.com> wrote:
[...]
> Verified values with DDI0601 2026-09.
>
> While checking I noticed that Bit 58 of PMICFILTR_EL0 is also defined as
> RES0 in DDI0601 2026-09 but is defined as SYNC in tools/sysreg. Not sure
> if this demands a separate patch or can be folded into this one as you
> already are touching this reg. This field is unused as well.

Thanks Steffen. Catalin has already merged this series, so it would
have to go into a separate patch.

Like I said in the cover, I plan to fix this once and for all though later on.

Cheers,
/fuad

>
> Anyways,
>
> Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
>
> Steffen
>
> > ---
> >  arch/arm64/tools/sysreg | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index 341db8e9b6c37..99af1c39478be 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -1420,8 +1420,7 @@ Field   17      DIRECT
> >  Field        16      EnI
> >  Res0 15:8
> >  Field        7       PAUSED
> > -Field        6       LASTFAILED
> > -Res0 5:0
> > +Res0 6:0
> >  EndSysreg
> >
> >  Sysreg       BRBTS_EL1       2       1       9       0       2
> > @@ -2663,11 +2662,7 @@ Field  57      EPAN
> >  Field        56      EnALS
> >  Field        55      EnAS0
> >  Field        54      EnASR
> > -Field        53      TME
> > -Field        52      TME0
> > -Field        51      TMT
> > -Field        50      TMT0
> > -Res0 49:47
> > +Res0 53:47
> >  Field        46      TWEDEL
> >  Field        45      TWEDEn
> >  Field        44      DSSBS
> > @@ -2985,7 +2980,7 @@ Field   27      NSH
> >  Field        26      M
> >  Res0 25
> >  Field        24      SH
> > -Field        23      T
> > +Res0 23
> >  Field        22      RLK
> >  Field        21      RLU
> >  Field        20      RLH
> > --
> > 2.39.5
> >

