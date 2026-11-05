Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCFC606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ppHhzWRo;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JUDW+kyc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fa9CP0gkzkemp29oqw3QTLDptskJjZgFq/jn4p5Ch+g=; b=ppHhzWRonyX/1LWkQ+TGtwP00X
	LtdqDpRQ/eJwo+lpgwN77wTQdUvDVXd00sNOam6w3t4qGHg1bMSHCT2iF79w4UQnUpFo6oK3F1not
	zm1QqYrFXwOuNoUYQuuJIOeos3at18HgA+OZ+/KDje0AfzJTeWysp41FVrN8UWSdHMkWHIlaT5LOn
	u/HEr4YpYJ1/G0WvCcuvADFLohloIb/aNClf4RoFNGEUUfDXCMi0P81zIQtieLV+W3GzFpmKPwemP
	kt+dzkGKF3B3QWGOgteutjb6ePt5isQShCdR3rhS4wTiugcyHLUPjSFKuEllKOyo4uKlteq6Ym5L3
	KUKmXN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5wz-0000000AnYZ-25Db;
	Thu, 05 Nov 2026 22:28:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5wy-0000000AnY2-0KHw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:28:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9E8B43613;
	Thu,  5 Nov 2026 22:28:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793917731;
	b=gzIwERIXum4ErveU/HXF9qBPB61I+rATv3nt4RqIQ3/96rjSsOIYEXssFh5RvajB1/bg
	 Dyd00B1HElTjIUEeFinCq6x5ZSY7yK/ApL0StIJjJQFyrPQWp1UzEAjS7pmw63avlW9L1
	 Mb6pZ3/d9uEDiMYZQBgeMyWa/1Nxm7voaaqjYE5UuJ9F4L9Z611mXp+XlfNpINBTpWBN9
	 x75iN79ogQUnznz2De9aoE+d+R53So31FIm45uEtX3Ga/eq2NJ2eYVo73x8sO7FYbf+7j
	 JVyB0dhjhUKI6oqX2nMY10eKyYtAHbeXLpUYsaw9J2q3YSXMCFNQ/pJKYOgW7duE36w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793917731;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fa9CP0gkzkemp29oqw3QTLDptskJjZgFq/jn4p5Ch+g=;
	b=mrhJpEpFx93zwYkQySIYAIzkiOnuI85ohsunH2YvxCPUUQtQmDSHyCqudxxxKp4Ken77
	 C2tlvS0k+f6MWJPM9y3KPeHv0hHC+z08WCY/OYi3FtIEiAfdF3tf6U3i5q3ivwEWdprzk
	 dpAfK8yO+8wRT8PkQjuWRLO42neud4iWik+WBMSTMOknsOX4dNjRKqyVHuZaxPd8Rp4z2
	 DBr+dXAeH2p3g7JISsUfJ25qTL2H8WwfOAdRIxh9a0cQzI86Of1P40kWsrDwbSoQoQfQ6
	 4PvNNXfABRiBTnTYyPkdmi8VQaNx+/rkmwHhyk0zCEeChKHjgmvLrBYra/1YCfbSbGA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 633291F0089F;
	Thu,  5 Nov 2026 22:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793917731;
	bh=fa9CP0gkzkemp29oqw3QTLDptskJjZgFq/jn4p5Ch+g=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=JUDW+kyctfEVYw5n6iSnWvaHJ/BEpuqvJkBWfEMPQ/84lW6sUIn7sai66E2Kp+DMg
	 83gm+5wxceoNzxLhZfWUoKZpFpu+Gq9uw8odGau4rU99OXLJaRck66JhZ1yEGvYAdC
	 cShKyPpc4rXqrok1EGiHFIHVdEtp03LXsTQd/E4J9acQaDe5xJr+UYD75C71bN2iyM
	 TL42j9YVcY4m3Iua6z4n9V17ARvSOSf9dm000VptAB/489TNG6NPh0IzgBL0SeWaRP
	 BmPalaZNjzM3wIzWzwkCYhzxQ0Mzhtegh3q4bOrn8vtAU33hHIZz2AfwniE1PobwQd
	 5yklIqcgrKOrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D20D145AB7;
	Thu,  5 Nov 2026 22:28:49 +0000 (UTC)
From: Xuheng Li via B4 Relay <devnull+xuheng.cs.columbia.edu@kernel.org>
Subject: [PATCH 0/3] KVM: arm64: Fix the hyp pool size on large machines,
 plus two hardening patches
Date: Thu, 05 Nov 2026 22:28:49 +0000
Message-Id: <20261105-hyp-pool-and-map-v1-0-756bb5d8e067@cs.columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtohAq7SrSwnGqgVBSiiO6et
 HyL/x/InIQz9OqBxKdkCb6AKgXzZv3KKK4YdK1borrB7Y4YQ9jReoeHjTg13E1sLJEhKFlMvMj
 1L4fxfT/QCcPTYgAAAA==
X-Change-ID: 20261105-hyp-pool-and-map-b5e7be9a1191
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xuheng Li <xuheng@cs.columbia.edu>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793917729; l=1436;
 i=xuheng@cs.columbia.edu; s=20261028; h=from:subject:message-id;
 bh=gQekyKtD9gqE06JU2ATVEtl2lW315Pl8Hsi4FhanixE=;
 b=4VskGk/nnncCTlFFpyv3yW8wjN2DEulU4CGjyKuATzAXd5ZtSIs40RgAyCWjcH90faDMofvwW
 QBW4Q1u4euzD8W3zGQ3dJBTFllXoV432+H67kpL3UW0tDIXSTi0QnmS
X-Developer-Key: i=xuheng@cs.columbia.edu; a=ed25519;
 pk=L1HVV+goqxYmEMO/OXakL6uf9isSpgk2QrLlFqyZ2Qs=
X-Endpoint-Received: by B4 Relay for xuheng@cs.columbia.edu/20261028 with
 auth_id=1349
X-Original-From: Xuheng Li <xuheng@cs.columbia.edu>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: xuheng@cs.columbia.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Three changes for issues we found in pKVM as part of our research
project.

Patch 1 fixes a 32-bit size computation in hyp_pool_init(): a pool of
4 GiB or more gets a truncated range and maximum order.  hpool and
host_s2_pool reach that size on machines with about 2 TiB of RAM.

Patch 2 checks the host stage-2 PGD allocation for NULL before using
it.  With patch 1 applied that allocation cannot fail, so this only
turns a mis-sized pool into a clean -ENOMEM instead of a hyp panic.

Patch 3 makes hyp_map_walker() refuse to replace a valid block mapping
with a table, which would skip break-before-make and unmap the rest of
the block.  Nothing in mainline maps into an existing hyp block, so this
is hardening; Android's interface for EL2 modules to map pages can reach
it.

Signed-off-by: Xuheng Li <xuheng@cs.columbia.edu>
---
Xuheng Li (3):
      KVM: arm64: Compute the hyp pool size in 64 bits
      KVM: arm64: Check the host stage-2 PGD allocation for NULL
      KVM: arm64: Don't replace a valid hyp block mapping with a table

 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 3 +++
 arch/arm64/kvm/hyp/nvhe/page_alloc.c  | 6 +++---
 arch/arm64/kvm/hyp/pgtable.c          | 7 +++++++
 3 files changed, 13 insertions(+), 3 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-hyp-pool-and-map-b5e7be9a1191

Best regards,
-- 
Xuheng Li <xuheng@cs.columbia.edu>



