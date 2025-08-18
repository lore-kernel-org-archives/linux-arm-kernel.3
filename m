Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53D9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPn1FN8sp4GGoUD3tpDW+Holf9bFEHra2JNM2nDhbAg=; b=WEsThma7HG+6W5OIzyjt4l5LIv
	OJZ6rK47cU8dEnGf98+w33HrL5G5dWgmt6wciNxmNqB4PtAKnJEfWFIS54JAlO/T51Ujm0s3NsW3Z
	FziwEKwSgYz8yATUx9982EYnDPR5EeTl55hy8N276yTUdYNWNsj4GUcaWvS0T4PPWOkYqOoy32V6m
	aQbriTVuapHZFLr/GRH4WM1FVYaUcQ0h0RkRh68LnW7/AZQ7y0iL9pSsClw2TG0uE6tH6qMZcuuHH
	W/bUF3J6zOjVMobHSLG/51K3JK8p50UTTdITHYPW6TyZin3rPOl7xVhtHVl62i276PYXR8JvGNFlG
	SVoGwO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untaN-00000006gW9-3hMr;
	Mon, 18 Aug 2025 06:43:15 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untXh-00000006fjz-1jpe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=IP
	n1FN8sp4GGoUD3tpDW+Holf9bFEHra2JNM2nDhbAg=; b=etvIdd9hPkOSpqQObc
	R+rOFpoKSwuSj4KoCtweaiA89dHvrr89OvXFoXy/4cmqK2S4mlxIffSmwB/Vr9zN
	oUJkSPgIwdV28qzpQD8OGjPUZCqZWFk0xn/ttKhXJj9sqgeOS37E/J578YwH8d26
	R/uCzRdlrmVfuttG9l3X1tM/0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCkvCgD3v_qxyqJoi5PoBg--.55496S2;
	Mon, 18 Aug 2025 14:39:46 +0800 (CST)
From: lingfuyi@126.com
To: maz@kernel.org,
	oliver.upton@linux.dev
Cc: joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lingfuyi <lingfuyi@kylinos.cn>
Subject: [PATCH] KVM: arm64: Fix whitespace inconsistency in cpu_reg assignments
Date: Mon, 18 Aug 2025 06:39:42 +0000
Message-Id: <20250818063942.1900014-1-lingfuyi@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCkvCgD3v_qxyqJoi5PoBg--.55496S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4UGrWUWry7uFW3ur48Zwb_yoW8ZF4fp3
	y7tr1jyw48GF1DuayI9a1DX3y8GrZ5tr95Aa98AwnYyryYqwn5Gw4kGayY9rW3AFWxZa4S
	vF1UtF13WayUAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uc18QUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: polqwwxx1lqiyswou0bp/1tbiYBytR2iivT-o3AAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_234029_844302_EF8898A9 
X-CRM114-Status: UNSURE (   7.08  )
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

From: lingfuyi <lingfuyi@kylinos.cn>

Several cpu_reg() assignments had inconsistent spacing around the '='
operator. Some lines had double spaces while others used single space.
Standardize to single space for better code consistency.

This is a pure formatting fix with no functional changes.

Signed-off-by: lingfuyi <lingfuyi@kylinos.cn>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 3206b2c07f82..cfe7a82730a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -232,7 +232,7 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 		fpsimd_lazy_switch_to_host(vcpu);
 	}
 out:
-	cpu_reg(host_ctxt, 1) =  ret;
+	cpu_reg(host_ctxt, 1) = ret;
 }
 
 static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
@@ -266,7 +266,7 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 
 	ret = __pkvm_host_share_guest(pfn, gfn, nr_pages, hyp_vcpu, prot);
 out:
-	cpu_reg(host_ctxt, 1) =  ret;
+	cpu_reg(host_ctxt, 1) = ret;
 }
 
 static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
@@ -287,7 +287,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	ret = __pkvm_host_unshare_guest(gfn, nr_pages, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
-	cpu_reg(host_ctxt, 1) =  ret;
+	cpu_reg(host_ctxt, 1) = ret;
 }
 
 static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ctxt)
@@ -367,7 +367,7 @@ static void handle___pkvm_host_mkyoung_guest(struct kvm_cpu_context *host_ctxt)
 
 	ret = __pkvm_host_mkyoung_guest(gfn, hyp_vcpu);
 out:
-	cpu_reg(host_ctxt, 1) =  ret;
+	cpu_reg(host_ctxt, 1) = ret;
 }
 
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
-- 
2.34.1


