Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1641D16804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJOMXH9QFgWgu5VMOJnp+cDOX/HyjZh2mkK6m3hvABk=; b=BIjTOAYfQWfxT7sGOSsRBfLd8/
	mE96FprrJ8+vDfq5ZqSeIUrvRKsPQi8+EDeGM9o3qOrfO2ZGIWFq/5eLTDVen76+vagiitHa/P5Ps
	bgWe93FZpCekjFg3wnoQ49nXu2gJTG2QgY1Xc0E2cyBcNubWqM8InlaC0ww+YCR6L9/QmVq21QdZ8
	MGqpIVySQ671hnQ3ZGZJq9K1HsKOT8kFwFVDXg+DuYi9l8+lpTJaQ/Vpyx/G20OzN+dN4BtCtULTm
	0Rwtdn3GKUtXFoBAbsivRV4hPC94Z6yoSvjOZzJrNCdSZJ9c8sZhJc+R1XPV1RowHIZu9nlTZqp3U
	b2D1cwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9pg-0000000290N-2k4U;
	Fri, 09 Jan 2026 10:35:04 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9pd-000000028xA-0B4X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:35:03 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8E23C40E00DE;
	Fri,  9 Jan 2026 10:34:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZLtoArDXc47o; Fri,  9 Jan 2026 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767954879; bh=tf79nQltkuFcnhXHTJqEKH0yZcFm9B9epYWrL4oDSRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gki2PIiuSlT1PBmvROB8Vm90PtLWIOjzJvrW3yIpsdu1pFvSl6ZylNI1AaXbFOCGQ
	 ON5VUUw27g3PXWdR4z+HJx4yQxlTNSYgFFAuFtCMLYLBsrKfwfKAOaeWaJZfGrgolE
	 o+UWbl4NyTfOfMp36/v+Gc3NJZtep02/ozs1ud8tvzGJbx6d0iGZmskko/n77PP3Kj
	 7nK1X9czaCvK+Ufi3QJ63vGmkj7sAwbkrsuJWUOlzEXdrGBQ1TXOGRJqN/ipeAC5+i
	 A390Dgobe1GE85YxAkTgP7bpjixa3Uu4QcuUushqxjHysAc3YZXVly3pVaG/iusupq
	 xY6/Y0PCSH0A8RXSbDbCuVldT25MVX2eBjtgVfuXNZUfF+4T75uH/YH150jD8+tdc/
	 YtEMbmzvY43SM4ilach0YiKuFatN+vs7lQz+PGLM+59TV16PHaJzxRcCnYHV1ixs3w
	 VjsjFiFAv6NsjDyhxMRPPwiEHFwGMFc/3zrc8EWNdV3YjpQXJM7Ho1P9ElFzb8uzj8
	 h+3jLRljVQ/Sbvb/sikaWeLoD+551OgU7ZrSAkTC7hiEPUCEdPPXTedoCRXqh0AcH0
	 8belyZOVl3wpHt43l9J+BVHFYXS5xMJZjjtWl1rIuXust3KMexrJjQZ5BOqpNv9MNp
	 jg4nLDnWI+GuLJtzX3NI5EWc=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id C54B940E01B0;
	Fri,  9 Jan 2026 10:34:22 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:34:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org, lenb@kernel.org, tony.luck@intel.com,
	yazen.ghannam@amd.com, misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Subject: Re: [PATCH v5 00/17] ARM Error Source Table V2 Support
Message-ID: <20260109103416.GAaWDZqDYoyt3KRAE9@fat_crate.local>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
 <20251230202211.GAaVQ0cx8o-CqzGU2O@fat_crate.local>
 <0038141b-713f-4024-9f8b-e5f748f5a6a9@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0038141b-713f-4024-9f8b-e5f748f5a6a9@linux.alibaba.com>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_023501_239082_D5C51153 
X-CRM114-Status: GOOD (  17.28  )
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

On Mon, Jan 05, 2026 at 05:12:25PM +0800, Ruidong Tian wrote:
> > What is a "RAS node"?
> A RAS node is the hardware interface for error reporting and control,
> consisting of one or more register sets (a collection of RAS records). =
It is
> responsible for error logging and interrupt signaling[0].

OMG, one more meaning for the word "node". Because we're not ambiguous en=
ough.

/facepalm

> A single hardware component can feature multiple RAS nodes. For example=
, a
> memory controller is treated as a "RAS device", where each memory chann=
el
> has its own RAS node. Interrupts generated by these nodes are typically
> aggregated into a single interrupt line managed at the RAS device level=
.

Nomenclaturial tragedy, I'd say.

> Comparison with x86 MCA:
>=20
> RAS record =E2=89=88 MCA bank.
> RAS node =E2=89=88 A set of MCA banks + CMCI on a core.
>=20
> The key difference lies in uncore handling: x86 typically maps uncore e=
rrors
> (like those from a memory controller) into core-based MCA banks. In
> contrast, ARM requires uncore components to provide their own standalon=
e RAS
> nodes. When a component requires multiple such nodes, they are grouped =
and
> managed as a "RAS device" in AEST driver.
>=20
> [0]: https://developer.arm.com/documentation/ihi0100/latest

Yah, thanks for explaining.

> > The ATL is very AMD-specific. What does "conceptually similar" mean e=
xactly?
> By "conceptually similar," I mean that both ARM and AMD share the same
> functional requirement: translating between a System Physical Address (=
SPA)
> and a device-specific address (like a DRAM address) for RAS purposes.
>=20
> The goal here is not to share the hardware-specific translation logic, =
but
> to provide a unified interface (an abstraction layer). The actual
> implementation of the translation remains entirely architecture-specifi=
c.

And why do we need an arch-overlapping unified interface?

You can just as well have aest_convert_la_to_spa() and none of that "unif=
ying"
churn.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

