Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB260A5BE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oGmMqZhJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TQH5kuCk;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DfFADJBH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=; b=oGmMqZhJNbQGv9v8NYh2D2GnFO
	qFf9whgEUHkX92bOkYoWgaSsCB7Tr+kMN/G+VrJgLGJSTeLpNK+fsL3vH2sFN8ljwhM9/FUEl6N/R
	so0owQ/+IGYKFdHJERA8RpyeW+BbKSM8q5JtAliZbIH50TaNZJ9RjmfRmRu7ZcB5YADGVYJxRmyoa
	0Q0/Y6LmwsyBSIYtjHXh9v+MRIT86WSO8LxIUpL/Kq+5VFKn83frv4YIvVB6OazlO2iDkcZs4yznq
	IgjHiqmoSo/xHmi2BGIzLNfUSpuG1RibyjsrjWlgUMxAmthxDQcTh0MRCZaJCZAz3vYb+QsUtMECY
	fp20QWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoS-0000000Gkk9-2ZYK;
	Mon, 02 Nov 2026 14:15:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoR-0000000GkiW-2urZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 14:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=; b=TQH5kuCk/blcebFKF60UdYW9Oz
	5dwxqI0eka1+yoqq6VKFYAMXflEQ2271DdBfhwhG1S/gBsyx83Qua4l2ftnKDCj5OQo+KmmA//epx
	vgTiy/bv0kKptpm5NKXRLoM/9DEftRNXMK/feu456oJfKjF9/cFvig5KQQJCeHGQSl1nUSKTX36RB
	QdirSOJgQKCuCIMjUE47DPtsCZ8jWVPG5ISt3yh2nA9LOieFNbL2cqO8PrwpJybHzzEczIXsTg2qV
	YZWby/rzc/QG4o5f3d+shXUk+g/3pDvAyPPVsgW0TXv0EZ43fNO21RUILNSxUdl/Kyt9iyu4VRm9V
	Nfb0ZK8w==;
Received: from mail-ej1-x645.google.com ([2a00:1450:4864:20::645])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsoE-00000002cIH-1h9J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:57 +0000
Received: by mail-ej1-x645.google.com with SMTP id a640c23a62f3a-c4322d31021so191642666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 06:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793628887; x=1794233687; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=;
        b=DfFADJBH0/axBkOueNxGKSxHSZdbYKESRFWys4vf9CKMWXSEW8eUVylgTUpCJ9n8M+
         +23B8xcLGvF3NUyQ7ghHA0fwH1Awz+qKBUOgXuqRbnUPmhICHouxyauuZqSRKapwfm7W
         +NudCpv2HwKhaUWpv3pyIX/vlbMXclb74EbwSqjf40/nLbtjIGayKxB3/QNBoeKCGNA9
         c6mdBs88Ia/P0UDB7Go45Z4aK3egHwk0KuvbOwapXBt1Mo2/0hOlG8duIEuqd95fJehe
         hgChvcDL31cV9HdjAqpP6x2jf5N/2mcyfbiHXgZZ4AXX/65EPVaSt1X0E9/9Lbl8s35/
         Hf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793628887; x=1794233687;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tq1Dinw97u5EFy5drMhI1ClpCkMeAoB7KpvZ0g2Cdjg=;
        b=znEQGzmLXmxgLdkZeRpghZe3AIu60LnesacN+nHJzoxvZEoRLJV6SwBKOQehV5PRhS
         BVypMI106HluT5Hzg0j91Y64YF3x34z059miwq7LbWFuh9dKiKjmzjMd2E1SEzWo9Del
         lJ0mE7QjuZIsMhqiVQFdRig13BxT7cpAr3CwQ9PGJxboS2HuxZziK4I3E306HgmMiHDa
         ErKOma0AMHiD9Cz8ycvx/3ez6s9W0C3ZusRgyGwbpXrTzTnsPZH2FaayKipLef0EJL2u
         T/Yaz6D7sohvX0PqypBp1A7kPdU9O5HERp/jLTAliZP+f6oyafIDHdnI4kolD9fehg+1
         4Zsw==
X-Forwarded-Encrypted: i=1; AKwUvByK/iYy42fJux8NHjR68ZbKB2gKrtgQzNxchEJwSprKT+cSQ4PyMpLp9uVZIwx+3NGpSl/ie26EIYKdYNay8RqN@lists.infradead.org
X-Gm-Message-State: APuU4Z9HrR8LaSF5/KisESRFIWyknENJEhZq2V1i4b9i9TgzL7T81C7l
	cg1bFWd3Nr7fMbKEboDgAUoiArJav6OzJATZHiIgqi0DGsUkt7P2vw31tpvvyWQ9Iul6i6g9W0w
	eCRxCoxhOl3hF/AewwKb7ElUtww==
X-Received: from edgd16-n1.prod.google.com ([2002:a05:6402:a510:10b0:6b1:b88a:bd11])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5683:b0:6ae:550e:59e2 with SMTP id 4fb4d7f45d1cf-6b4d5ee26a2mr5205769a12.35.1793628887174;
 Mon, 02 Nov 2026 06:14:47 -0800 (PST)
Date: Mon,  2 Nov 2026 14:14:43 +0000
In-Reply-To: <20261102141444.1830221-1-snehalreddy@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261102141444.1830221-1-snehalreddy@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102141444.1830221-2-snehalreddy@google.com>
Subject: [PATCH v3 1/2] firmware: arm_ffa: Add FFA_MEM_RECLAIM2 function ID
From: Snehal Koukuntla <snehalreddy@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Snehal Koukuntla <snehalreddy@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_141455_256282_A105C36F 
X-CRM114-Status: GOOD (  12.62  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FF-A v1.3 BET0 (DEN0140 rev K) introduces the optional FFA_MEM_RECLAIM2
(0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
a subset of pages of a memory region without requiring the Relayer to
maintain intermediate transaction state.

Add the FFA_MEM_RECLAIM2 function ID definition to arm_ffa.h.

Link: https://support.arm.com/documentation/den0140/k
Signed-off-by: Snehal Koukuntla <snehalreddy@google.com>
---
Changes in v3:
- Drop RFC tag and update specification reference to FF-A v1.3 BET0
  (DEN0140 rev K)

Changes in v2:
- Rename FFA_FN64_MEM_RECLAIM2 to FFA_MEM_RECLAIM2, following the
  existing convention for 64-bit-only ABIs (sashiko)

 include/linux/arm_ffa.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index e71d83ee0aef..85c2e490a387 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -78,6 +78,7 @@
 #define FFA_EL3_INTR_HANDLE		FFA_SMC_32(0x8C)
 #define FFA_MSG_SEND_DIRECT_REQ2	FFA_SMC_64(0x8D)
 #define FFA_MSG_SEND_DIRECT_RESP2	FFA_SMC_64(0x8E)
+#define FFA_MEM_RECLAIM2		FFA_SMC_64(0x91)
 
 /*
  * For some calls it is necessary to use SMC64 to pass or return 64-bit values.
-- 
2.56.0.317.g454f8302e1-goog


