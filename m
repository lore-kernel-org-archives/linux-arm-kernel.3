Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC82BCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rC7Z5GoRNj84WJS1wl/v7WN+NJUqd3U7I4aVi7bAwVs=; b=X4EObAps9oPgIuOdkhts27up7f
	lcVSbkAd1073Hg8WThA/fCIf+qYV8NmPlb0AV/fk+INwz6U8ZpOEa7WiJs1CGYK6Gy+NAJVANHcKU
	ZGp9fyB9596p1vSCc36/zLyZdZ74QH3W2sbrAnD4inWAzzc2RbdI2nsgCzn1Vfz1uUPBDpSsExSYk
	jq0f2jXSd1+7dAwzzPWFV5aep4ppg+Ay2CYusxQdMJnHUyAybImBLxkbxuUryswO0ouiMe9nWMb3v
	EHZDLAiDdWHNodM3Cmu/HsPKsXtqcHXHnHNYlrcbSK7XvvyCBf5ZhBxZHLwKnGDKVuCfgYCSLrEgi
	DPCfaaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDF1-00000000te1-2cRN;
	Mon, 28 Sep 2026 15:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEw-00000000tbH-2v7w
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 15:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rC7Z5GoRNj84WJS1wl/v7WN+NJUqd3U7I4aVi7bAwVs=; b=o9yYngNjclLkt6TCu0DmbLvJVo
	QfGOglitOOzUFo9ELzD47XlB8249EyBICPvmipklQjllj87d6ywp2VEKbIkp/O+H0zlno6vlp60HW
	VoI8OMFHzIvaFsv8QaeWTPxkC3p7Wi5GViQEjaSnQsAH78c2FDB7ymbbvo61Rgd7wYghsaAZWl5p2
	TNzGRNawN7DHr8EiMyHMUWWUX5kvOydTgLC0LlWDhFe2MigNsmylEOR/yv2GglBdbS7vg5mMEaoJr
	fd4dGHI2AidEjTmVhpgYCZ87YW+bntd3JEbIuc7qNgAe8W00nwWHivaqvEjdWmn4XHAVXBeOPgDvf
	t+YlSx6g==;
Received: from out-101.mta1.migadu.com ([2001:41d0:203:375::65] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBDEu-00000001cls-0J0f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:26:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TZTf+tvw3LUL1bGKJNCtbY5lbMJJlJLgbm/WT+dWO1Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609157; v=1; x=1791213957;
 b=i4j446EvswzeSDjBw7nuKeEVuS+zpKJRh+rKzMlIjjiA3S2e24h5+h/RtP3LmgQYkCBbktZM
 7A1ywReMQ4B2MmTg2jlPpQJhUDG/DnAilVNZF2j5jLHYNUPJFCezvzdwlbL0psOKTfyd4u6GR5P
 efT0OC+4KN75WQqJg2GlvwtU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5cf54109416d45bb;
	Mon, 28 Sep 2026 15:25:57 +0000
X-Mizu-Trace-ID: 5cf54109416d45bb
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/10] Documentation: KVM: Fix the name of KVM_ARM_SET_COUNTER_OFFSET
Date: Mon, 28 Sep 2026 16:25:04 +0100
Message-Id: <20260928152507.2116110-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162600_195974_EA742EDF 
X-CRM114-Status: GOOD (  12.51  )
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

The KVM_ARM_SET_COUNTER_OFFSET section of api.rst names the ioctl
KVM_ARM_SET_CNT_OFFSET, which doesn't exist.

Fixes: 1935d34afaebe ("KVM: arm64: Document KVM_ARM_SET_CNT_OFFSETS and co")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index fabb1d4bf8f8d..e5efdc56f3d29 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6265,7 +6265,7 @@ set to 0s by userspace.
 
 This capability indicates that userspace is able to apply a single VM-wide
 offset to both the virtual and physical counters as viewed by the guest
-using the KVM_ARM_SET_CNT_OFFSET ioctl and the following data structure:
+using the KVM_ARM_SET_COUNTER_OFFSET ioctl and the following data structure:
 
 ::
 
-- 
2.39.5


