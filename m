Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54091CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUEMQ9hxWK8o47vR4FLZy+UYeyT0Sph3CZ0aGaNr0M8=; b=hPm2BHfAZ3ivf5c2rCZCEWrJhk
	LgS3rlFQLF09KI1CVuJM/MUmovkpPkrD2OwewleRePITzjz0L0ZXTiRNca+c1sg9h2txsSfOZxS0q
	5LR88OkRo6KbGXcIRoFwZQVOJXbUYKM1BSEZePnnn2E6oKMQxPntV++gw4iA04CvMhOzKA8Wo2/L4
	N8MMn8z1CV0cyfzS44n8uhstMVDvtmzwVDUYbuiWimaI31grrdBvhHh/D/4ez/Q9Neka77EQlWONK
	4ZfWWBbPkjrjr/o2RrJowxrX8svTsL1ZJpqZG/JBFbUQPv4bq6kuDbxQ8D4zz7s9lTNDsFg0PPrUT
	241seU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLJU-00000000EIT-0biY;
	Thu, 15 Oct 2026 13:16:05 +0000
Received: from out-5.mta1.migadu.com ([95.215.58.5] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLJO-00000000EH1-0xH1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:15:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cBClqqcoRnjq1tJUyrLKGJx+LO26OjFSc7Ag8ZACa0Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792070155; v=1; x=1792674955;
 b=FFgACMSVjGrbSEPR2dLUmi3WDsf7CE9FvksqCyWv/lb3bymzAjdGyANWk2ztx+jVxmNhx0yG
 adBRHbMqF70GtsOuLpJtDdOXZ4d0xIXsW+gx6YB+TXa3Wp5jLAF5Vx4yyrmMJrqowhAUQ4bEk0C
 vNSJX/BcQyFJxPBpUJnAV8bI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a93a90c41de34ec;
	Thu, 15 Oct 2026 13:15:55 +0000
X-Mizu-Trace-ID: 2a93a90c41de34ec
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so5411e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 06:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwwJBHLA1vNfuQAILXaa80ly1v77GVfYjapeGaR4tivGUI+q/MHQ604nsih/F+t7Wb1ReVrKNs7RKi/eRoGFYvN@lists.infradead.org
X-Gm-Message-State: AFq9FYKP1aTufrqQIF0PPrYJZPKSQKgEXT+E+oVJQwvfcPSdIIg1pgtR
	za1PpGpTqhOo03SMUJ1tgxzLuF09WpOjNuIUPL3/PKySH3Z74z/y4dgDEMypOY/4N2hVKwHET++
	+reATOGpvAcPcIuY+Qx2S5h2YAwH3AjU1QgkWoU7f
X-Received: by 2002:a05:6512:2211:b0:5bc:ce5b:96f3 with SMTP id
 2adb3069b0e04-5be3e11d7c9mr81883e87.4.1792070154180; Thu, 15 Oct 2026
 06:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261015100539.1011760-6-maz@kernel.org> <20261015125716.2650737-1-fuad.tabba@linux.dev>
 <86ld7z150j.wl-maz@kernel.org>
In-Reply-To: <86ld7z150j.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 15 Oct 2026 14:15:17 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw=CsL7XdMdV2g41ThRMQe1_Vh=HL5E50pOBT3ZWQ=PtQ@mail.gmail.com>
X-Gm-Features: AclHuK81C1k155nk4IeQL38Uum0spopA4W4U08O1g0zocLSDFFuwHaItMqtONv8
Message-ID: <CA+EHjTw=CsL7XdMdV2g41ThRMQe1_Vh=HL5E50pOBT3ZWQ=PtQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] KVM: arm64: Add helpers to halt a vCPU
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_061558_411524_A153526C 
X-CRM114-Status: GOOD (  15.03  )
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

On Thu, 15 Oct 2026 at 14:13, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 15 Oct 2026 13:57:16 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Hi Marc,
> >
> > On Thu, 15 Oct 2026 11:05:37 +0100, Oliver Upton <oupton@kernel.org> wrote:
> > [...]
> > > Signed-off-by: Oliver Upton <oupton@kernel.org>
> > > Link: https://patch.msgid.link/20260929212925.31775-2-oupton@kernel.org
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> >
> > Should this one have a Cc: stable too? Patch 6 is tagged for stable and
> > calls kvm_pause_vcpu() and kvm_resume_vcpu(), so it won't build in
> > stable without this patch.
>
> My take is that there is no need to backport this patch at all. A
> valid backport of patch #6 should simply halt the full VM, not just a
> single vcpu.

Makes sense, so this will be resolved on the backport itself.

/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

