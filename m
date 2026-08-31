Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C064AC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 16:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+P7shhjvj4jGl8Oj99Y+U9YcvQ8GI3dI5cVnZqFmdg=; b=1b/ltBAXiJgjG/ay6QQdMaMpNj
	zZKJHJBJuRHmiF1vcukb7n8KsTv4k8W4dA6SqpQtwQS5VTVQ7awDCra9Nv29BXD/1IkpK7xspmv16
	vh8n2G8OJ/jyAvZX51x0lrGSS1htpcDlVq1QsCqA2uzQ4CIdFm4HNOM1Q6V1fr5buqCKfNWOSJeWk
	JhOsEVyaw9dOnb6lsZ4wJrGlGMNZ+yX/8IGKJCTof5HCyw46jXWsLaNEujNPQgPcKlOPbB0pKja/T
	mYYsQvaIkK9Su2XDcDL9rCpbW+a2rD680/IBsk8PreFMmKL3ELCwNo4G/T4MCZy9lVKDbDOLEFix2
	6bHiTlXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yU-0000000A40L-0yL3;
	Mon, 31 Aug 2026 16:35:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x14yR-0000000A3vP-03ns
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 16:35:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a+P7shhjvj4jGl8Oj99Y+U9YcvQ8GI3dI5cVnZqFmdg=; b=YBgDpc5Hp2xn+2KMigbIqcHhTs
	tZuV21Ir2XBDLUMlq+6d3DJk3CPWo0DQJPuPtwbrieNzpXdKgFH5sNYKGwmKvjknBVYI/G8kppSQ/
	9UH4piV0T4MRONGBz+J1paGlu4cQ5GRaw4qBH/qyZdOkW9wsNlZKqrbCEEWEzT+vRTDaYMjFHxQg0
	w9JMwkQyuh3la33AT0ZwlHLmI5XAZNTBTivKs0ulkUtJWOznL1Ej0KzhwDm4Pjyxdrmwn4K9OEEKI
	7qz9JsdAVhIiFRmRgSmJDVn5Hhc986aYrkHys1gDHO9x5oM9lhPyJTj9m9sYVEkCU4jqvDr5t0DR5
	Zni37gjg==;
Received: from out-104.mta0.migadu.com ([2001:41d0:1004:224b::68] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x14yM-0000000A3fx-1yDx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 16:35:05 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=U/axjWQAfQSFNwOk+gQLgXnGQvfOgoP7MHtzfv1LyiQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788194100; v=1; x=1788798900;
 b=Ei3HO2TICRTj7admtDmRqxINvc44J6WV/8zT9R7q6lwWCLXd7kOWEDBVJUuXDBVObnMXfVid
 8gYe93I1xrGjaMaEVFNtX/Sta5zYn8NwKD4jt3v9rf+rsQCTSy6CdqcCDVXmQ1w4QT4NOADooE/
 BTTXjheF1kU0WBFxiIsns4aY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d1286ff7c0158266;
	Mon, 31 Aug 2026 16:35:00 +0000
X-Mizu-Trace-ID: d1286ff7c0158266
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 14/17] KVM: arm64: Pend a protected guest's SError with HCR_EL2.VSE only
Date: Mon, 31 Aug 2026 17:34:18 +0100
Message-Id: <20260831163421.272420-15-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260831163421.272420-1-fuad.tabba@linux.dev>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_173502_643949_21FBF256 
X-CRM114-Status: GOOD (  11.70  )
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

kvm_inject_serror_esr() emulates the exception entry when
serror_is_masked() reads PSTATE.A clear, but the host has no view of a
protected guest's PSTATE.A, and an emulated entry never reaches the
guest: the SError is lost. Set VSE instead and let the guest's own
PSTATE.A mask it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/inject_fault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index d6c4fc16f8795..b88098a7e756c 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -378,8 +378,11 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 	 *
 	 * As we're emulating the SError injection we need to explicitly populate
 	 * ESR_ELx.EC because hardware will not do it on our behalf.
+	 *
+	 * The host does not see a protected guest's PSTATE.A: leave the
+	 * vSError to HCR_EL2.VSE below, which the guest masks itself.
 	 */
-	if (!serror_is_masked(vcpu)) {
+	if (!vcpu_is_protected(vcpu) && !serror_is_masked(vcpu)) {
 		pend_serror_exception(vcpu);
 		esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
 		vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
-- 
2.39.5


