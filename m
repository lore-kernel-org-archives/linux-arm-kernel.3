Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E72ACA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BU8FrrYxJtVjuWI+jaNz6hLEtjMMOJYa/QcIW3P8I8U=; b=sjMJsGpBe7X8dAvmpcGqDC15/7
	BCNgVb8cl5hw823v2mSyBDGD+A8Q/8xQrgCKF/BCbNUGLvoySZN5LiZoQxUFlGyPs0dzRiq7tvi4T
	My8updtP1iQYZJ1YPcGiJDfS6VvRIe1Bwr0+/jqmjWw05/oro7HLn/qLcjA+u/yjgIjth0rGSxoGH
	oLdfw4WD/dOUbPFt5wN6E6H2t/2ouVLZNyx2+O2hhs8/PZYcORgMa/9uuuzrCqroRjOO2It9JZyv8
	m87sjaqWzaNieAXEN8mAj+Ri16FjpQZNZwtu/CRU3pSfzxOWqQkj+hHyGwAi4gE4IsdGildgkFy2u
	XfGKcyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGnY-0000000AfBm-31iV;
	Mon, 12 Oct 2026 14:14:40 +0000
Received: from out-34.mta0.migadu.com ([2001:41d0:1004:224b::22] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGnT-0000000AfAi-3svz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:14:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BU8FrrYxJtVjuWI+jaNz6hLEtjMMOJYa/QcIW3P8I8U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791814473; v=1; x=1792419273;
 b=I4kuPUJzyeTmmli19TmPyxPrArq33p3W/ia55/v7rD1VlU4l2BQCt3AlopfzsWkNjGVZXWov
 ZpYhIXB2NAQhl8b2pOh/gFDmrerCdVzCDrxVueWpcTzAd0niKDyOdJ7JXE5NePs8hwZaSGfdy2u
 MUHgp/BQmj52kt/AYm6qO+DE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9f7f143eb0dd9765;
	Mon, 12 Oct 2026 14:14:33 +0000
X-Mizu-Trace-ID: 9f7f143eb0dd9765
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba40832934so7813e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 07:14:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTkmEV57Qx82mYuW2eq00Q2B+uI5mT8UjFksBLbz8MKk6i6m+tDbCQ9hssCMBOcguHHFFiQ2Yko7RSW43AeJqW@lists.infradead.org
X-Gm-Message-State: AFq9FYLbogf/yB8E9rsllu4rM9/MFP40eLQofrtC8CKCh2/FIcdVaKlc
	/Myl9ggkvw6ycuBvIAF9vDfzxiT43Y2TRpQ04LTGfQEgm/nElYYLphBkDqzdTSipDro245RZ8Zc
	sD61VE8WMEFNGrUAqXMbDseCIQjV/S1uOYyS4ezyC
X-Received: by 2002:a05:6512:3043:b0:5bb:661:7db4 with SMTP id
 2adb3069b0e04-5bce97ff24cmr161841e87.0.1791814467633; Mon, 12 Oct 2026
 07:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261012084743.2228612-1-fuad.tabba@linux.dev> <8633ub2mlg.wl-maz@kernel.org>
In-Reply-To: <8633ub2mlg.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 12 Oct 2026 15:13:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwyQPPVG4tGY0i0DRk=kwbdEmjca6+GNjLDXrGxkNbMOw@mail.gmail.com>
X-Gm-Features: AclHuK8JAr7VKAyNHjXlm8W06MLq8y4tWsehOxWPWjdhocCzuow2M7Ozid4Azug
Message-ID: <CA+EHjTwyQPPVG4tGY0i0DRk=kwbdEmjca6+GNjLDXrGxkNbMOw@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: vgic-v4: Don't forward an LPI with no
 target vCPU
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_071438_246969_284EA5CA 
X-CRM114-Status: GOOD (  13.21  )
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

On Mon, 12 Oct 2026 12:18:51 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Isn't the core problem that we don't correctly handle the UNPRED
> double mapping of the same LPI? I'd rather we attack the issue at the
> source instead of papering over the consequences.
>
> I hacked the following, which is obviously untested. Can you give it a
> go?

With your diff on rc3, the second MAPTI is dropped, and forwarding the
vfio-pci MSI to its event leaves the host up.

However, a vgic_irq outlives its ITE while the LPI is pending on a
vCPU, so the check also drops a legitimate remap: a guest that
DISCARDs a pending LPI and then maps it again loses the new mapping.
On QEMU, rc3 (baseline) keeps it and your diff drops it.
vgic_its_restore_ite() also goes through vgic_add_lpi(), so restoring
tables that hold a double mapping fails with -EEXIST.

v2, which I'm still testing, drops the second mapping at MAPTI too,
but tracks in the vgic_irq whether an ITE maps it and checks that
instead. A restore keeps the first ITE and drops the duplicate. I'll
send it tomorrow.

Cheers,
/fuad

