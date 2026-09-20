Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA81C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQ23MGRY/u66yXz3UIgk63neNx6xs6J5UyDzagqLxxY=; b=wUPBqsj49PMnHMIr8UhWo1Szky
	DQav9ERF6YJj0BV5IZ/tw/lf7DMTs6vUdE9ZRsH/VKWGMO8TP3iWVi0den+CYp1gyN1D/tdYa8t54
	zwuCLwiiP+jCof4cFoEcHY6Ry787TzPus7COejaJqzRob7tl/0IAhz5TvRU1hrmkrGiWWnQSQ+7Gr
	oB0TTcbdFjTZsc3lGx9mR+ImWdpujxku1IZq6x0ypmNWQSnvwzSWlKcBBh4jXb7ht3o+gJOYAn6IX
	w2PUHXwEEm1VZd4l7cLiAHNhAU997zAXKxxsMo8PXzoconKef5xigviGzimjveELaIIWbjxooOw8/
	LC7FjErg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8If1-0000000Ha9Y-2fIi;
	Sun, 20 Sep 2026 14:36:55 +0000
Received: from out-216.mta1.migadu.com ([95.215.58.216] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Iey-0000000Ha9D-1XzT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 14:36:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=mQ23MGRY/u66yXz3UIgk63neNx6xs6J5UyDzagqLxxY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789915008; v=1; x=1790519808;
 b=egiJDzzyfgxhxocOZs5nkHdd4D7IPBYyyDpELnm1f1yq8wA0GqaY/sXosZpl1kT2Kv8XbA2f
 k2Vbwb2VnYKTPy930piYeHuR0wEao9GQBb6ngFtz5el6b7bfe2Kuh5f3wFuRwlyNUgH9fOP7olp
 ZlQp46i5oRF4MvFCGbM6p6x0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 37a524671f362289;
	Sun, 20 Sep 2026 14:36:48 +0000
X-Mizu-Trace-ID: 37a524671f362289
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso4265e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 07:36:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBysyr3tCm4AX4LTrzFGlU85QIPKHNyE7eos7hXegAd/febAnCNdsBxumo4jkDGp9Ndzie3Iv/arW/sgiJRo6qsN@lists.infradead.org
X-Gm-Message-State: AFuF++nW0FeYHUBdSF1WCR6HFavSs8zt3FDBIXyCAO0UHSdkPdASzutC
	w1qk1+7L6PctDBCcigK12mw91bKV1ArdinHQwVz3FgisTbcvEwlbARP8thYGrpDMPIt/fspvvYh
	Cd4zkuObVlY+sxsu0R3iCYm/9/vcAuBWdy4pDj86V
X-Received: by 2002:ac2:5bc5:0:b0:5b8:c922:b54c with SMTP id
 2adb3069b0e04-5b8c931fa92mr37366e87.3.1789915007153; Sun, 20 Sep 2026
 07:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260919123150.3283606-1-maz@kernel.org>
In-Reply-To: <20260919123150.3283606-1-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 20 Sep 2026 15:36:10 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzBWHjnFcYuPtROsEDS4ZFfSNf=VFYoTuG8F+R3Liyi8A@mail.gmail.com>
X-Gm-Features: AcwNN1XWBFVsMxAv3Snaf6xpDNa73UqKxbPSMTBqLL_7dJeswjfUts5eBsRX5bc
Message-ID: <CA+EHjTzBWHjnFcYuPtROsEDS4ZFfSNf=VFYoTuG8F+R3Liyi8A@mail.gmail.com>
Subject: Re: [PATCH 0/4] KVM: arm64: vgic-v5: Random sparse fixes
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sascha Bischoff <sascha.bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_073653_160233_781D8F96 
X-CRM114-Status: UNSURE (   8.66  )
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

Hi Marc,

On Sat, 19 Sep 2026 13:31:46 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I'm queuing this on top of the existing branch.

For the four as queued in kvmarm/next, fixup included:

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Sparse on vgic-v5-tables.c goes to no warnings, and the vgic_v5
selftest passes on the FVP GICv5 model with a VHE host, before and
after.

The same selftest on an nVHE host oopses in
__vgic_v5_restore_ppi_state() at the first KVM_RUN, with and without
this series. That's the EL1 access to the GICv5 CPU interface that 6/7
of [1] fixes, not new here.

Cheers,
/fuad

[1] https://lore.kernel.org/r/20260915123846.2317931-1-fuad.tabba@linux.dev

