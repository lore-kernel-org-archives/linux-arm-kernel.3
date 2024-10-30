Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D41D5CCB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ12oL1TMxUtX0/WV/egYiMw4/82g7s1FqB3IDjGGWc=; b=tlyBP48BOh8xK8ryy3QAXOTU6r
	JxpKQsBb9m86hw9tuycDFlzZ6VeLhzJDPcKpSdRBnvwN3GzeXfNshf43eavMX3/Zu53Aw0061oc6o
	Y7aq1DedUzyPYIIdjXPkVSKeSvGB4ZmmN5Gm79VxBcGexRSQyLGHyBBamF0MecyYEmwItVx7upnax
	XEkICZzVjFVEgdTZT0BonoovU5yuWH0L0Su+vP7kJRbBtPLZxzJZJwIXPJAmo8riaC00GQKBAVvkh
	tuE6+D1Fc5hbuViivaJn8VhbQTMQPjos/M/l3Ea6nzzfoW7N7/A8oDxD/4+AAvXx6SZCMqbbmpK0g
	RM7eNtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Auh-00000000w8W-1BT5;
	Wed, 30 Oct 2024 15:47:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AoI-00000000uR8-20Lk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 08A0C5C5E9E;
	Wed, 30 Oct 2024 15:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F130C4CED0;
	Wed, 30 Oct 2024 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730302837;
	bh=txJPBAKW/px8wqxUeO43xJFh9Jn0eyt07T5bMMNoQs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oNDcyWypyH3JXmdBfzY2hjjJC9FUkktQ+8ZS7KzScTsTKQoVmqG1KSftOJjyJC8S8
	 wFfzQHtrQXCauwV3RY1DiCipPYR6d8b3f5L/moVqymUTvLxahjzCNIFcCpisjCEXOq
	 xc0ZE6O9gidDuKzO17cgf0HKkVethYDJUrYq9OvLma4yKYYT6PVL+AdE6jqyYUelwi
	 wVcUXZtPH/wD6kXFVyjjDa6haqkLoA8T+Lg1HOCFV+nxbRnkPePWgFRbotZ/SU1VTA
	 SGIf/18ZWz1kckoY/rJtMgyvn4mu4QhP93e8uEREfjgy3P0OQV6RUFczLMViade+Nq
	 3SyvbtkJshmrQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Oct 2024 15:34:48 +0000
Subject: [PATCH v2 3/9] arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-arm64-2024-dpisa-v2-3-b6601a15d2a5@kernel.org>
References: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
In-Reply-To: <20241030-arm64-2024-dpisa-v2-0-b6601a15d2a5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=766; i=broonie@kernel.org;
 h=from:subject:message-id; bh=txJPBAKW/px8wqxUeO43xJFh9Jn0eyt07T5bMMNoQs0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnIlNjLXhKJVoKwgkAhdsWtohTPWBWcUPKrbk5HU+X
 21nUD6SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZyJTYwAKCRAk1otyXVSH0GKvB/
 9RsjAbX++HHrZn5lx6ACubG9OuypNkVBXCg7syA34+aKKqTtQPynS7o/hFeyCqvLTHQh9zhMEjPTAz
 DMArnNB2uZ7tXTWfzGi8IZ9dCkdC+0lZhYjVW6dM1F+sHYXzwEqDzbnVe0/gfXfiykF5ESQ2uV1auu
 /aneOPRTvU0wuDeMXZ8j2AAhTDle+G09f03RQZAVmaOmcLpE61dq3RI6+HtlSEfFavesflwbgv+Cs2
 51YQlhGvHpUSOzNAexHIrhjXmk8uz/fKIxE0E23Lu859GFVSPptFo7n6xJQk2D7yX8aDR7UrXkJHYr
 hhOQPGk4huEt3sepT23aGtIJSyVI8c
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_084038_582408_1C04F260 
X-CRM114-Status: UNSURE (   9.05  )
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

DDI0601 2024-09 defines two new feature flags in ID_AA64FPFR0_EL1
describing new FP8 operations, describe them in sysreg.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c77343ff0901bbaee98eb76615dc7b81a563c4b0..26f1350c9d2e3baf39ac3bdcc96fc1e6deb5a5c6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1180,7 +1180,15 @@ UnsignedEnum	28	F8DP2
 	0b0	NI
 	0b1	IMP
 EndEnum
-Res0	27:2
+UnsignedEnum	27	F8MM8
+	0b0	NI
+	0b1	IMP
+EndEnum
+UnsignedEnum	26	F8MM4
+	0b0	NI
+	0b1	IMP
+EndEnum
+Res0	25:2
 UnsignedEnum	1	F8E4M3
 	0b0	NI
 	0b1	IMP

-- 
2.39.2


