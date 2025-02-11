Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48785C021A8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jAgG5PbVpxfjPiUq1P9KoLaJMoVyaxTfP/N5PAh92BE=; b=f2orUB5VdM7OB9wuMFlj66r6KE
	9S7Bk5wDpu4J8EhPuFqfsSXjh52YjRUbNxDPLiz0a+6idVJ9jqt8lhxBBT18pXzFgmP6XH+Ix+Zli
	dxa8YTKrS0mJHnWgUV1ZnsO4eMA37Do8VsKorx0iX9PnEOx/YgidEGrQ8XeeI9m4ioG7lHSGdxUn8
	4S8rGoqz8t0YQFiSPg6O9cYvj+zqrPySvzPL/24BeqgYUlBoBe+s705g3BCeQwb7YS4G+Vmzn/dRZ
	GLlm7Y3PDJ1mOi0xmwJvp8J1846q0TWxtWLDCjZb2ZLUMql8EkhvqUCF4w66xEVrwMIRy/YvdYaq+
	tRJ9k+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgCj-00000002IRo-3xfG;
	Tue, 11 Feb 2025 02:40:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrv-00000001wTZ-3Ba7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 00:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jAgG5PbVpxfjPiUq1P9KoLaJMoVyaxTfP/N5PAh92BE=; b=dQbPys8qp8XI3logD5DmXw/YwX
	wxpFyPHyekeSACVEU050nRX+yLCZ7lFCsN3zGgcBtLWQLh+L/k8lXrozXHI10ZZDLnNA+5Q3NYPdF
	3khvxXcLbexWdJSoROJqOBmNB4gZ9K5SYPLIA4UQXZbZhoPYHhLLWbBgMRRyycyvmrYhk1U7wIxQ5
	OBlck7rYH6odPrBdXgwfUCvA5J9M3bD1IURFuuPkWN+qDdueWBw/H5zmUbtp1vLhA6VzhqZmkB9kU
	U7D1rdmYeCw2BUtcp1FvO1STtRD6nCA79OhOChuD6wK30CLgmRdLCusGOoAjbzBsxnh8qapHQEomp
	/nuQQexQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrs-00000000O4q-1y6Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 00:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739232671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jAgG5PbVpxfjPiUq1P9KoLaJMoVyaxTfP/N5PAh92BE=;
	b=RiXkBx3Mcs1RlfBfocity6/XrNNI/g9Yh4CcloSK+BUcx+jzCBePmsyYT1YJ62HJmepeNM
	ATkMHJ67FjXoo0NupO+o0Yruzs4SYxJC80YUz1K+ySItPDZ0nJsrJcbTXA77q7xKHHhuWd
	3BT3dNpd+urTLOwVHu0j7HTIRu1ZWcw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739232671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jAgG5PbVpxfjPiUq1P9KoLaJMoVyaxTfP/N5PAh92BE=;
	b=RiXkBx3Mcs1RlfBfocity6/XrNNI/g9Yh4CcloSK+BUcx+jzCBePmsyYT1YJ62HJmepeNM
	ATkMHJ67FjXoo0NupO+o0Yruzs4SYxJC80YUz1K+ySItPDZ0nJsrJcbTXA77q7xKHHhuWd
	3BT3dNpd+urTLOwVHu0j7HTIRu1ZWcw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-4NLqzznmNha3XRZVRKy4uw-1; Mon,
 10 Feb 2025 19:09:30 -0500
X-MC-Unique: 4NLqzznmNha3XRZVRKy4uw-1
X-Mimecast-MFC-AGG-ID: 4NLqzznmNha3XRZVRKy4uw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCD7B1956086;
	Tue, 11 Feb 2025 00:09:25 +0000 (UTC)
Received: from starship.lan (unknown [10.22.65.174])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6AAFB19560A3;
	Tue, 11 Feb 2025 00:09:18 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jing Zhang <jingzhangos@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvm-riscv@lists.infradead.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-riscv@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvmarm@lists.linux.dev,
	Alexander Potapenko <glider@google.com>,
	x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Anup Patel <anup@brainfault.org>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Atish Patra <atishp@atishpatra.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/3] KVM: extract lock_all_vcpus/unlock_all_vcpus
Date: Mon, 10 Feb 2025 19:09:14 -0500
Message-Id: <20250211000917.166856-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001112_837774_E435AF9D 
X-CRM114-Status: UNSURE (   7.61  )
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

Implement Paolo's suggestion of reusing=0D
sev_lock/unlock_vcpus_for_migration in arm and riscv code=0D
for the purpose of taking vcpu->mutex of all vcpus of a VM.=0D
=0D
Because sev_lock/unlock_vcpus_for_migration already have a workaround=0D
for lockdep max lock depth, this fixes the lockdep warnings on arm=0D
which were the inspiration for this refactoring.=0D
=0D
This patch series was only compile tested on all 3 architectures.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (3):=0D
  KVM: x86: move sev_lock/unlock_vcpus_for_migration to kvm_main.c=0D
  KVM: arm64: switch to using kvm_lock/unlock_all_vcpus=0D
  RISC-V: KVM: switch to kvm_lock/unlock_all_vcpus=0D
=0D
 arch/arm64/include/asm/kvm_host.h     |  3 --=0D
 arch/arm64/kvm/arch_timer.c           |  8 ++--=0D
 arch/arm64/kvm/arm.c                  | 32 -------------=0D
 arch/arm64/kvm/vgic/vgic-init.c       | 11 +++--=0D
 arch/arm64/kvm/vgic/vgic-its.c        | 18 +++----=0D
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 21 ++++----=0D
 arch/riscv/kvm/aia_device.c           | 36 ++------------=0D
 arch/x86/kvm/svm/sev.c                | 65 ++-----------------------=0D
 include/linux/kvm_host.h              |  6 +++=0D
 virt/kvm/kvm_main.c                   | 69 +++++++++++++++++++++++++++=0D
 10 files changed, 115 insertions(+), 154 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D


