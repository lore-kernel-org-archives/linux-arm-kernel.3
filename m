Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB304C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDn2Y1WPDMGH4GUDrea/2RLdSifrNwDAD7YIDZdLCAE=; b=dLVJsuR7kOXby2IQuXRwY6Khj9
	nrSSub8+6kGA1uzHBbO26FhSK/UkfsYcMRLfI9d2kfr7/Mvvkh02Q4W3IrDL8LnyH3kVRrcXqYMRn
	rRlXvZGqjvpgMd0Fw47Gqi6fY/gUsYC8NwNPceKouTA0pfKZ4N66lHGduY0nKTYU2iC2Kuab49jJ6
	ML/F1Q7LCihVbXDAnQJXz6/h3tOCADPco16ZMqDv22CF0/LyY8x046VdJ471vbjQwUILFn07bVVaH
	3P1ix7XFnNOupLA/4nHEnJYqEk2j+UZflyB7TLTXx+dH7fEjm+GQyGt2d6zlktAEFlj5HwVnXbQcA
	rHP6QHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRp-00000006YPz-3JYc;
	Tue, 15 Sep 2026 12:39:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRi-00000006YCk-2Ho8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PDn2Y1WPDMGH4GUDrea/2RLdSifrNwDAD7YIDZdLCAE=; b=c0CCRTHE3q12M+VmoasxyDlU1+
	I0CwNOsIYlaWTtg9Cd3d6TKPXeyUOT0YGnFiM4nKUn/nalqxQhq4QJcNPo/1YuC6ZFdpFOZ5gacHA
	8pyCK/PN2I1ws+cbbcGAOJDUieZMTeHSqDsTQjy92tPlTT+kVLBC03ohyRR1j/Vf+NXaKtI8mOHJk
	0E82c8Na/O10qL+gqgmPmcDC0+pjiCiD0LPYPt/Bp9pcDH7SxLlEsulEiOSdZmwEHuzFi1e2Cjb93
	9TcP7+qjhB15msxFK0YmZ6uRo7HC9MVZ1G9TsrfeZCbn621gXaFbTV4xQKfiHiIUtyeLqp9psaTpX
	ieAR6PfA==;
Received: from out-141.mta0.migadu.com ([2001:41d0:1004:224b::8d] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SRf-00000006kPr-3qnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sXzD5OweRtbt4uiu9AwJiDOee0ALx9j8z+8yBBR+qWw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789475968; v=1; x=1790080768;
 b=nyz+h/BAwR5kLcsNmGLMEJY7dQjAHlIyguIRMM6K/gfJF+gO7SNMvfh/rWo4ozH0S04dtMuf
 mfh/8eY93zTxN8B6WBC9dOiCypiegz6Tr7po4/wglpQdqFLzhsOuPCgX5fHvBhsPpNYKvpWYOdX
 oSCQxfXZepL52FW4MnlTQ4zs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3acdc7de5bc4f044;
	Tue, 15 Sep 2026 12:39:28 +0000
X-Mizu-Trace-ID: 3acdc7de5bc4f044
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH 7/7] KVM: arm64: Fix stale VGICv3 comments in the nVHE world switch
Date: Tue, 15 Sep 2026 13:38:46 +0100
Message-Id: <20260915123846.2317931-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915123846.2317931-1-fuad.tabba@linux.dev>
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133932_072910_3F398BB5 
X-CRM114-Status: UNSURE (   9.90  )
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

__hyp_vgic_save_state() and __hyp_vgic_restore_state() handle GICv5 as
well as GICv3, but their comments name VGICv3 only.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f36..6b9e20f6b31b3 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -110,7 +110,7 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
 }
 
-/* Save VGICv3 state on non-VHE systems */
+/* Save vgic state on non-VHE systems */
 static void __hyp_vgic_save_state(struct kvm_vcpu *vcpu)
 {
 	if (vgic_is_v5(kern_hyp_va(vcpu->kvm))) {
@@ -125,7 +125,7 @@ static void __hyp_vgic_save_state(struct kvm_vcpu *vcpu)
 	}
 }
 
-/* Restore VGICv3 state on non-VHE systems */
+/* Restore vgic state on non-VHE systems */
 static void __hyp_vgic_restore_state(struct kvm_vcpu *vcpu)
 {
 	if (vgic_is_v5(kern_hyp_va(vcpu->kvm))) {
-- 
2.39.5


