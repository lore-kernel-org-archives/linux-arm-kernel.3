Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 02:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cDiuV0+L;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mbjQTgRz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IVlkwGJQd53FilqK8CCX7q0KQcQC9PlRvrNFImbfNek=; b=cDiuV0+LStLOHDvIuSf/QZbwyP
	v2XZOO4mC9t0d3TGKP3/BZ7KEKAK2cKfpZVYizDpeB3R4Osix1GPAGXocl1oVnJ5r8eweYuvO/SiX
	R/u1ad+hhPBf4qDMosYz2KEKbL00tsfKVLB9ueQ802Aaq6uOlQfviDgr8YkOit1l/n+FbqxtaRbVa
	qVNaDndARXVg4yxA1XI1jfJqYqBCY+cGPyMlOB34X8rKk/CSz3LyAk6wJgc9rX7WalOYnZr8BlbZp
	5Ollpmsjbgq5HRjD6psrVAoXsRn+O+lDFProYjG+pjspkctc8pjon5kZ8PgeenqHwyMh0PT58zPaD
	s96vg7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRRZ-0000000HLNC-1g2X;
	Sat, 24 Oct 2026 02:25:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKRRK-0000000HLKw-1e2q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 02:25:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a214af2076so8599755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 19:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792808694; x=1793413494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVlkwGJQd53FilqK8CCX7q0KQcQC9PlRvrNFImbfNek=;
        b=mbjQTgRzKU0dwTBBEfLoI4nze+o6uhP41byGszvBsRHwOdC3SnUzvyzZgnCSm4uAm9
         2xwmQ9/nUU2kTDJ1blM+dqa6M85qURXFmf4RMWewCSkxus3xJyIUBaZ219PgUOobbTNc
         i4slEIpSmHY8vckf5WclZE5BtEnEu6Y9YQ/4yjVZzfHlpkWaddrwsMlK+c2shUGfmpku
         0k0qDyqxnbuc7S2SwYKV8p6LD6WYwgQhqxRk0/Tfyn6a8Ji60Y2ubUGcT3blwoxaqQnv
         R2AQzqTQyaB1+zfKLQm9412LUkCYMQHp1wdI2uWrKtbNHPHlc3wk4N5RVoyz43ShWKds
         ZwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792808694; x=1793413494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVlkwGJQd53FilqK8CCX7q0KQcQC9PlRvrNFImbfNek=;
        b=gldkRA97/gvWIdc+KcsJfuvtkA8VhOoUvHL1t6EiY9RwWhZNeD285zBOenZViMUlc6
         dUGVz77qtl6QZZZjDZBwF521jIBNg/cCwVa3lxyTBstkQdLA8Y+qh6Df5VNdH1mils2U
         bBvkjHqbwSZKZ1v6PZyT6H3lYJt0K7jtYdEJ+g/HDLqOmWmDgQhJMbqpOGlme0t2AKNt
         +pBQqlJqnjNUmJJzeu3mK64Z3gE+Rx6GeyE0mOd5/9gkqoPmCymObV4Qbr6YjnYne/HP
         4+sDY1xyu0XgSLdthPX3uc8tn8P5seVieZN7hu5zBOYJz4rZSRVz8XDYMuUKek8S/Y+M
         g/1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/GYT4qCDES8Aqfys6s2n7vYvKYTThkKTx3wtTn0z+xZm7qacy6WwlhHzkqSwNLDv8o5QgpJXXls0YTf+IZ0AG@lists.infradead.org
X-Gm-Message-State: AFq9FYIUzDnW2aY7wcoErzZzmIm7e1zJRKdcwnrGwHTTc36px6+WeVca
	MyRux/wuLd1hLxKBOlAgA6rulQjuoTXCCAUlB4+Ge9sa0NyLu5Coh+ay
X-Gm-Gg: AYBFou0W7hnE0OoDTI879t2bpbN3iQmi/vs8RfrvLuWpJ9+Zk5NMcB2GHVu2cu7+3n/
	FbAYYlWG6A+lFACYxoUn+taBrmckUONGLDnRXGpoWPqs1ETWoYS3f0hHPjBx8V24mY+wdPGhE5f
	0gqvB4zVm4aScs2suciTnzsm+Uir4tDDEMz79V0XSrt6Yiw6bm3P2bJjljjEaewUSVcPR0m35AJ
	2/COAy62H5wo61CGsF0B8rwRoR8O1CmDZhQOwF6ZOJvAjY10FMmaMAgr8Jr5O6Eft4LOnczJIwn
	JEW9QfdfWUGWNenNbPGdoikTRJja4ovf+T7E9NBwTV02B3sPXPVPFq9joY6/dBpsMTWZLs3CQUW
	rmvbc4oY+tVCwM36iIup5A35fiXOezfeEXuo7DZVzXEgPHmxwsW3NrS/J9FhvpOTfZNeCtxHlXd
	trk7CubcSOI+a4+wbkuR4AimNhXKsvTLyijPHkL7dUoRI5Hxmjg9DeUnFfoBMQJJIyuJsCu2na2
	Ip4a+/uMoiPUt1yGF949m+ZoeDHoR7CqRZDp1uayWLOCi85DUOWFhn47YMTiftYFPRRo1leoPwk
	sos/
X-Received: by 2002:a05:600c:4746:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4a35ac8bb3fmr10452595e9.7.1792808694219;
        Fri, 23 Oct 2026 19:24:54 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm21088415e9.8.2026.10.23.19.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:24:52 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <cdall@linaro.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amir Noohi <amirmnoohi@gmail.com>
Subject: [PATCH 0/2] genirq, KVM: arm64: Avoid the irq descriptor lock on vCPU load
Date: Sat, 24 Oct 2026 02:24:48 +0000
Message-ID: <20261024022450.629980-1-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_192458_490958_45C2EB8D 
X-CRM114-Status: GOOD (  18.35  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM/arm64 vCPUs slow each other down even when every vCPU has a physical
CPU to itself. On a 32 CPU Ampere Altra (GICv3, VHE) running mainline,
with an in-kernel GICv3 and each vCPU thread pinned to its own otherwise
idle CPU, a vCPU which exits to userspace in a loop manages 320k exits/s
on its own, 120k when 16 vCPUs do the same and 59k with 31. The aggregate
rate stops growing at 8 vCPUs. No two vCPUs share a CPU and nothing is
over-subscribed.

The cause is the interrupt descriptor lock of the host timer interrupts.
Every vCPU load sets their active state with irq_set_irqchip_state()
(twice on VHE: virtual and physical timer). The timer interrupts are per
CPU interrupts, so all CPUs share one descriptor and its lock, while the
state being written is per CPU (a redistributor register on GICv3, a
system register on GICv5). The lock serializes nothing but CPUs updating
their own state. At 8 vCPUs, 99.9% of all lock contention events during
the test have __irq_get_desc_lock() or irq_set_irqchip_state() on the
stack.

Patch 1 adds irq_set_percpu_irqchip_state(), which sets the state of the
calling CPU's instance of a per CPU devid interrupt without taking the
descriptor lock. Patch 2 makes the KVM timer use it. With the series the
same test gets 326k exits/s per vCPU at 31 vCPUs (5.6x), the per vCPU
rate no longer depends on the number of vCPUs, the aggregate rate goes
from 1.8M to 10.1M exits/s, and at 8 vCPUs no lock contention event has
either function on the stack.

The series is based on tip/irq/urgent, as it builds on
__irq_set_irqchip_state() from Igor Velkov's patch 717862eac6ef
("genirq/kexec: Do not take the bus lock of an interrupt chip on the
crash path") [1]. It also applies cleanly to v7.3, current mainline and
kvmarm/next on top of that patch.

I'm aware this arrives during the merge window. There is no urgency on
my side; I'm posting it now so it can be looked at after -rc1, and I'm
happy to rebase and resend then.

Results
-------

Reproducer: a /dev/kvm program (no guest OS) which makes N vCPUs exit to
userspace in a loop, each KVM_RUN being one vCPU load/put, each vCPU
thread pinned to its own otherwise idle CPU and running from its own
guest page, with an in-kernel GICv3 or a userspace irqchip.
The test program is at
https://gist.github.com/amirmnoohi/91560854a63cd3e5fc7a359eb5e17302

32 CPU Ampere Altra (Neoverse-N1, GICv3, VHE), mainline 864c07de0c7d
(v7.4 merge window) with and without the series, same kernel config,
exits/s per vCPU, mean of three 5 second runs:

                in-kernel GICv3           userspace irqchip
  vCPUs       before      after          before      after
      1       319694     324584          319670     345088
      2       298808     326063          289274     343884
      4       294895     328420          284269     343528
      8       278579     328736          112423     343984
     16       119943     328887           56120     282905
     24        77267     327478           36948     253529
     31        58722     326056           28114     250586

Aggregate with the in-kernel GICv3: 2.23M exits/s at 8 vCPUs and 1.82M
at 31 before the series, 2.63M and 10.1M with it. With a userspace
irqchip, which also clears the active state after every exit, the rate
with the series still drops to 251k per vCPU at 31 vCPUs (runs varied by
about 8% there); I have not investigated that.

Lock contention events within 5 seconds at 8 vCPUs with
__irq_get_desc_lock() or irq_set_irqchip_state() on the stack: 122800 of
122847 (in-kernel GICv3) and 7865871 of 7865907 (userspace irqchip)
before, none of 49 and 24 with the series.

If all vCPUs instead run from one shared guest page, the aggregate rate
with the series stops at about 3.6M exits/s from 16 vCPUs on this
machine (also with the timer's GIC writes removed altogether, as an
experiment), and the extra time goes to guest context (front-end
stalls) rather than to the host. Measured that way, the series gains
2.0x at 31 vCPUs instead of 5.6x.

A second machine shows the same: on a 384 CPU HiSilicon Kunpeng 950
(GICv3, VHE, 6.6 based distribution kernel, userspace irqchip), 8 vCPUs
on 8 idle CPUs ran 2.4x slower each than a single vCPU, and 69% of the
time spent in irq_set_irqchip_state() was spent waiting for the lock.

Under QEMU TCG (virt, -cpu max), 8 vCPUs, the series removes every
acquisition of the descriptor lock on this path (LOCK_STAT, 10 seconds):

  host             irqchip     irq_desc_lock_class before      after
                               acquisitions  contentions
  GICv3, VHE       in-kernel        393878        36682        none
  GICv3, nVHE      in-kernel        199654        32080        none
  GICv3, nVHE      userspace        429928       122152        none
  GICv2, VHE       userspace        321430        59542        none

Throughput under TCG does not change, so the real hardware numbers
above are the ones that matter.

Testing
-------

- Built for arm64 (defconfig, debug config), x86_64 (defconfig,
  allnoconfig) and i386 (defconfig) without new warnings, no new W=1 or
  sparse warnings (arch_timer.c has two pre-existing sparse warnings),
  checkpatch clean, bisectable.
- On the Ampere Altra, with and without the series: KVM selftests
  arch_timer (8 and 31 vCPUs migrating every 2ms), arch_timer_edge_cases,
  vgic_irq and vgic_init pass.
- Under QEMU with PROVE_LOCKING, DEBUG_PREEMPT and DEBUG_ATOMIC_SLEEP:
  arch_timer, vgic_irq, vgic_init, vgic_lpi_stress, kvm_create_max_vcpus
  and steal_time pass on GICv3 VHE and GICv3 nVHE hosts (on a GICv2 host
  the vGICv3 based tests skip, the others pass), without warnings or
  lockdep splats.
- Not tested: GICv5 (no hardware), hosts with no_hw_deactivation
  (Apple), protected mode.
- Not changed: on hosts without a vGIC (e.g. Raspberry Pi 3), KVM
  toggles the timer interrupt with enable/disable_percpu_irq(), which
  take the same descriptor lock. Those hosts have few CPUs and their
  interrupt controllers do not implement irq_set_irqchip_state(), so
  the series leaves that path alone.

[1] https://lore.kernel.org/r/20261015-kexec-irq-bus-lock-v2-1-2af15f0757b6@iav.lv

Amir Noohi (2):
  genirq/manage: Provide irq_set_percpu_irqchip_state()
  KVM: arm64: timer: Avoid the irq descriptor lock on vCPU load

 arch/arm64/kvm/arch_timer.c |  2 +-
 include/linux/interrupt.h   |  2 ++
 kernel/irq/manage.c         | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)


base-commit: 717862eac6eff0eea8ac30a0c0de0bed84922aab
-- 
2.53.0


