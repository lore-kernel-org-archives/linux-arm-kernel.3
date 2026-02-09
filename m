Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666DEF06ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zdf80m6iia5xIhe9PY6XN+0habe8icFkZYue+zSTHR4=; b=XVyviqbo/lRMZJ1siZhR1o8Z/l
	Jpg755yohtJXDv9HSEoUR8lKFoUk8r/kKCR2h8L5bM1OFAn81zmm4oxRevheKrjuCzr//wYLmkV22
	IERDOnq6iGEGY6sFNPLmCs7Yz4Zta8QdchLGlZYrcatXeNTknNWy48O8eDhBVsy/bNMC2Y2S82y2p
	o3vTGOPAWPS4Q29C8NDoKCrdLR9t42qo7+7cEzKR+AXqrFJkNe6zDMunsDDXZw8LXksmRCCfFYtCS
	RyUGGi5sjGHGAhX4O25GdzaKz+zmQVu6xBNlx3U0UhF4r2tkMXwA/24B8YvnTFVx+t/7et+f84lYV
	TBnv6V8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHuT-0000000Eluv-3ibA;
	Mon, 09 Feb 2026 03:26:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHuR-0000000EluS-0Qcm;
	Mon, 09 Feb 2026 03:26:00 +0000
X-UUID: 082c0cba056711f1ad39f32c34db0b1c-20260208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zdf80m6iia5xIhe9PY6XN+0habe8icFkZYue+zSTHR4=;
	b=HEwH8cDbsOEpF/LN5SZZNb0dhhP5j4F8rudHNj7qN21UmKhw/aN7zx0XxxVhUM74aK3D8SJ0AcAK3dmu5rS9nbQpDY7VH+QdeeJqYAV2dF3yG3maF6Vu6gNcMCsGiXl1FtH3BwuUWLvX/1tCI3rgN2N1+/BbR8UjyhFRcZVKLqo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8e93d860-8560-411d-a35b-16da45660f3e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:f765135b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 082c0cba056711f1ad39f32c34db0b1c-20260208
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyle-jk.liao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1702595252; Sun, 08 Feb 2026 20:25:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Feb 2026 11:25:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Feb 2026 11:25:47 +0800
From: <kyle-jk.liao@mediatek.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey
 Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Quentin
 Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
CC: <wsd_upstream@mediatek.com>, <rock.yeh@mediatek.com>,
	<hungwen.chien@mediatek.com>, kyle-jk.liao <kyle-jk.liao@mediatek.com>
Subject: [PATCH] KVM: arm64: Allow module-owned pages in host stage-2 range adjustment
Date: Mon, 9 Feb 2026 11:24:13 +0800
Message-ID: <20260209032421.1278325-1-kyle-jk.liao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_192559_160903_99F72CCE 
X-CRM114-Status: UNSURE (   9.97  )
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

From: "kyle-jk.liao" <kyle-jk.liao@mediatek.com>

The host_stage2_adjust_range() function triggers a WARN_ON when
encountering pages marked as both PKVM_NOPAGE and PKVM_MODULE_OWNED_PAGE.
This occurs when load_unaligned_zeropad() accesses memory that crosses
page boundaries, where one of the pages is module-owned.

Extend the check to accept pages with the PKVM_MODULE_OWNED_PAGE flag
in addition to PKVM_NOPAGE, preventing spurious warnings during normal
module memory access patterns.

Signed-off-by: kyle-jk.liao <kyle-jk.liao@mediatek.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 49db32f3ddf7..baaabf4b5112 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -495,6 +495,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 	u64 granule;
 	s8 level;
 	int ret;
+	enum pkvm_page_state state;
 
 	hyp_assert_lock_held(&host_mmu.lock);
 	ret = kvm_pgtable_get_leaf(&host_mmu.pgt, addr, &pte, &level);
@@ -505,8 +506,9 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EAGAIN;
 
 	if (pte) {
+		state = get_host_state(hyp_phys_to_page(addr));
 		WARN_ON(addr_is_memory(addr) &&
-			get_host_state(hyp_phys_to_page(addr)) != PKVM_NOPAGE);
+			(state != PKVM_NOPAGE && state != (PKVM_NOPAGE | PKVM_MODULE_OWNED_PAGE)));
 		return -EPERM;
 	}
 
-- 
2.45.2


