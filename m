Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7714C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsMTmcGG1X4n8TVMSg/WVg2Lsl8nVsUpAt6gmPDP8CQ=; b=Xm18oM1vk+Tv2NV2imuxA5TXjg
	4O+Q82bAJgi/DLxXk7jRTT/YxqdIQKx2X3YVjmo4LFC3SP9yxePduzPxGBcIRReXIBIIso2/tSeRC
	se4z1aOeosvGUPSQVeZ1wnTxnw/JRkMUOoju+RD6jsnVWH32DULfKqtKbPAvuZFE9zkdGcZ8u1j8J
	cAi7T9g9qoZjWhDeCFFH9pPqQ34/eVvUlm/rKHMPOttfuEH8xL/HgVZV6zcLVsId3ZpJJXFNt3PQn
	+Wphsm2lTx4j+RNfrGSmi9SJ0u8F9hI8hU7ux2f2QUEuA9zaLbSaN5YEI6RdEPeIPv2G1DTGTlqqA
	0+I+33hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RxK-00000001nvQ-19Pf;
	Fri, 04 Sep 2026 11:19:38 +0000
Received: from out-4.mta0.migadu.com ([2001:41d0:1004:224b::4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2RxG-00000001nuQ-35oj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:19:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MsMTmcGG1X4n8TVMSg/WVg2Lsl8nVsUpAt6gmPDP8CQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788520772; v=1; x=1789125572;
 b=Md3Kcmqxoirc3OJYa61UjACoqpi/bS0CgF9roM28+d56uI8ljk2RVhzfUH0uTGsjTg/vJO8I
 brdIwbID/eo8k0qET/KpWoZ3XruO/HiISPkEq+xo7zFLRpHfnTNvpMwHCbSE7rDlc7sofiZG8kW
 rJsn5NCafcn4G9l64cBbGEcw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4165861cef59bf8e;
	Fri, 04 Sep 2026 11:19:22 +0000
X-Mizu-Trace-ID: 4165861cef59bf8e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so5250e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwdKhy/jzRGAXXeEExydhZeeDUrR3MWXYNoDoMUK+GsuJBpu0Iplq5MBrpRRK8gUNRHYZvxCitOTwOJhGlg0Pug@lists.infradead.org
X-Gm-Message-State: AFuF++lVp4bMNHLloATTxtfjyE+ATg/Otn+z94OO/8G7zXZ/si0iX0KF
	0P9czJwKGeGCr5tjBOAk3oB8Og0L6iBCJbrQaIQc5FIq8yYE0nx5WdoflCavh5bzis6KskXI273
	KpOa4uWKpH2gdyvKxxokMhjsnA3FyUuih0rEKqxFq
X-Received: by 2002:a05:6512:1094:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b61813ebf2mr96629e87.3.1788520761433; Fri, 04 Sep 2026
 04:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260903160819.831518-1-fuad.tabba@linux.dev> <xmhaptfcp2gyoovgus35yhx2uloe2zt3zniwscd2dwnatf2fii@jqobvjdmkqed>
In-Reply-To: <xmhaptfcp2gyoovgus35yhx2uloe2zt3zniwscd2dwnatf2fii@jqobvjdmkqed>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 12:18:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwNJvqqeGtgxR2q+CRn5DJfigssLRcZxz-zY5XvATwOcQ@mail.gmail.com>
X-Gm-Features: AcwNN1WJOez3rM2VTfMTldMzLgVHCuTatIMt9J2llOzdukDIMVSoUgeLQv2Bv6Y
Message-ID: <CA+EHjTwNJvqqeGtgxR2q+CRn5DJfigssLRcZxz-zY5XvATwOcQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_041934_974552_37325087 
X-CRM114-Status: GOOD (  15.38  )
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

Hi Yuan,

> > +static bool
> > +test_has_mpam_sysregs(const struct arm64_cpu_capabilities *entry, int __unused)
> > +{
> > + /* The registers exist whether or not firmware enabled MPAM. */
> > + return detect_ftr_has_mpam();
> > +}
>
> My understanding: arm64.nompam affects detect_ftr_has_mpam(),
> thus when arm64.nompam = 1 w/ MPAM is supported in hardware,
> the KVM's trap setting is skipped yet, and it's possible that
> SYS_MPAM2_EL2 and SYS_MPAMHCR_EL2 are configured not trap anything
> by firmware, thus guest can still access MPAM registers.
>
> Do we need check the raw id register values for the real support
> state of MPAM here ?

Under arm64.nompam, finalise_el2_state skips the MPAM2_EL2 and
MPAMHCR_EL2 writes too, via the same check_override, so the kernel
does not clear the traps either. What a guest reaches there is
whatever EL3 left, UNKNOWN when EL3 is implemented. This patch is for
the case where the kernel cleared the traps itself and never set them
again.

Gating on the raw ID registers would make __activate_traps_mpam()
write MPAM2_EL2 on guest entry there. AFAICT that traps to EL3
wherever MPAM3_EL3.TRAPLOWER is still set, which is the firmware the
option is for: 10f885d63a0e ("arm64: Add override for MPAM") added it
for firmware that leaves the trap set and does not emulate it.

The arm64.nompam hazard is documented separately [1].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260903084809.2027326-1-fuad.tabba@linux.dev/

