Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64836CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7YNrTkQkeujqQwWvpA8ASZwQ7ZTxXH+2ZnF/uWdS/fE=; b=DwN36dVXtT+UHFXPbABuCjPTbg
	6/k7EtVuoDnu8CREOvW7Vl5Ak6kxN8XE4fGOrGVJWCr56qRP3aYkSac+4SYTNtIUgKu2Wbe8XkypI
	23C/UF8i0+S6RIIEpnUcieofbH1oWQBGRJE+TUtuk+4Pg8XTcHwNmR3qDAkjIxIPN5TYJ12AkkL0q
	fgD/rScJwUkkZmfJErfpqkfP6VzRLJBnangvw9NWfDJ1bOu4NtB3FtCwteGRL4Ep7kPHPw+SjVPwj
	p6ZGq/IFVEis6L2wKr4oIlID9os1FNjiYvmjheWhrmGCxb7wrSG2Yi7/rYxK6yN/5LG1AZ2SE7CfQ
	GhjziDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utv7y-00000007hO8-3ojz;
	Wed, 03 Sep 2025 21:34:51 +0000
Received: from cvsmtppost104.wmail.worksmobile.com ([125.209.209.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utp2d-00000006pk1-0qA1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 15:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1756911890;
	bh=3FhiaCfmZwkYLyKJbI+B3fuYEbKg6EUl6NdwQ1AxukY=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=yoeS5+qLqwx51cCugDjTqy/HAuqvWmjhXmTMaOBS2ZR7ht81xBTCXx8WyrysE3QJJ
	 gSgUmt9qJF/+tQe0Be5xHgunSYVvJqPVdiNesCr0bjNFoDQ9buoHcHZo8EhUp1TaNN
	 Bi1g2x4atDw8iIZxYz+Q2QPUv/GR6OkS2GiMmMxTrblO2qwMoHvyZD/Bc4ytNOdLMT
	 /gABI8y93gSX733fVKDQEx/7ij5xhAHoxlU3dN8WV5zK0+rUcqLFPyZRfH+1JWOc3w
	 eiZynDBdqJTxRvegMLncIkSI2U/qOotbvbClgay43HllGGvI3Ii730J6WafNYQgux5
	 zSXJ6ZSqz7U2g==
X-Originating-IP: 130.162.137.185
Received: from cvsendbo004.wmail ([10.113.20.173])
  by cvsmtppost104.wmail.worksmobile.com with ESMTP id H0kQQm4mTQuMa-YoioN1nw
  for <linux-arm-kernel@lists.infradead.org>;
  Wed, 03 Sep 2025 15:04:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1756911890;
	bh=3FhiaCfmZwkYLyKJbI+B3fuYEbKg6EUl6NdwQ1AxukY=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=dsAQssHOInAbkx77EBdrK50Cc/qJksE186U24D/5Hg2iqMTOllmi6xSx1+WQ0F07J
	 FxMh2k/I/PrMUpjvEbjaVec/KRkpTAkK1Uyw9yWZcQy8RDJWHvg+yC+B41ClQHQeIB
	 8vNSBIBg917LJnvOgvvu7dbv17YwtF5NDwsfwMLA=
X-Session-ID: paH7lmGFTMuO7byS2M2b2w
X-Originating-IP: 130.162.137.185
X-Works-Send-Opt: L/bwjAJYjHm/FqMrKBmmKxg/FACYjHmm
X-Works-Smtp-Source: VdnXaAM9FqJZ+Hmmaxtl+6E=
Received: from camellia.vcn11051708.oraclevcn.com ([130.162.137.185])
  by cvnsmtp104.wmail.worksmobile.com with ESMTP id paH7lmGFTMuO7byS2M2b2w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 03 Sep 2025 15:04:50 -0000
From: Geonha Lee <w1nsom3gna@korea.ac.kr>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geonha Lee <w1nsom3gna@korea.ac.kr>
Subject: [PATCH] KVM: arm64: nested: fix VNCR TLB ASID match logic for non-Global entries
Date: Thu,  4 Sep 2025 00:04:21 +0900
Message-ID: <20250903150421.90752-1-w1nsom3gna@korea.ac.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_080455_829902_B7B37321 
X-CRM114-Status: GOOD (  13.86  )
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

kvm_vncr_tlb_lookup() is supposed to return true when the cached VNCR
TLB entry is valid for the current context. For non-Global entries, that
means the entry’s ASID must match the current ASID.

The current code returns true when the ASIDs do *not* match, which
inverts the logic. This is a potential vulnerability:

- Valid entries are ignored and we fall back to kvm_translate_vncr(),
  hurting performance.
- Mismatched entries are treated as permission faults (-EPERM) instead
  of triggering a fresh translation.
- This can also cause stale translations to be (wrongly) considered
  valid across address spaces.

Flip the predicate so non-Global entries only hit when ASIDs match.

Reported-by: Team 0xB6 in bob14
  DongHa Lee (@GAP-dev)
  Gyujeong Jin (@gyutrange)
  Daehyeon Ko (@4ncienth)
  Geonha Lee (@leegn4a)
  Hyungyu Oh (@DQPC_lover)
  Jaewon Yang (@R4mbb)

Signed-off-by: Geonha Lee <w1nsom3gna@korea.ac.kr>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 77db81bae86f..24eab94d7d7f 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1276,7 +1276,7 @@ static bool kvm_vncr_tlb_lookup(struct kvm_vcpu *vcpu)
 		    !(tcr & TCR_ASID16))
 			asid &= GENMASK(7, 0);
 
-		return asid != vt->wr.asid;
+		return asid == vt->wr.asid;
 	}
 
 	return true;
-- 
2.43.0


