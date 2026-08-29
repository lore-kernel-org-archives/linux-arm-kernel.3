Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A29C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 05:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=; b=LCAF3uAURZWtEsYUAMtL7CIuMT
	2RSxeWGSVtiMW/aUAi76PpwZcUFbPEsv9L/uf8kbD7yRYRimIBpXeBEVPGnfE996Ek1t5fpB3SjTz
	0YrDUTfSwjxP3h5EhTCk92kshRR1/QmHw4bPWkII6fXt72hHLbgOu2u1X0mIoSQGzyyh69fAOBULB
	nK4FO0rTzxTSJaz4CXoPSoZ3ecO5QbPUe3fz0PK3F6TriAeZBtTq62KEo6vM1qIqkmIdU1dPafZOW
	6XbNB7fUObSVoyf3Wu2hh/KWmvC5A4zMMaD9OlyzXrSySKwaQXYSX2Kd+04tx3VlEIR51QgbYx3C3
	bhqLBjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0BxX-00000006ktm-337B;
	Sat, 29 Aug 2026 05:50:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0BxS-00000006ksK-2dz7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 05:50:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso20660935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 22:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787982625; x=1788587425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=;
        b=isiah0bdUrc2l4g1gGSHuy0ZE+MoVDfUChw1Lo5NcgB9xclr/VuyPOPIo/tJfLJbEy
         9tSv5iEEAJSvTouQdu5iFhZTDzdakWxv1hdHajShlg7A0NnoY6DZpYLn+lMBlxXAjSa8
         IiriCmiiy+o/HKBWUAaspyQJVyQGGSCLIHaKgvD7Zjc0Kog2gaF/y6a0p+NZb0ONxjWA
         PZNHPIfVbshCXAAiXtiK/exa+/7IGOuTDeTxn/eoUz7kLxMtQ30iu3SXA4O6iUA+SaUO
         Lbp6yvyKXYrYV8zMU+lPsS+ruCoEFRUTwMcPRDfVMP5yMV7PYg9sq6IjSEGrkbHR3pqX
         Vlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787982625; x=1788587425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmU2GuULI4+ubbU7oraX4k5FiAqeW6B2DekgWiWauec=;
        b=ZiH//M6l65dEyF7qNhF2K6kO72bsDRK4vWJ9V2blfI2kFE/LcfbEXZWu8zALhdbq62
         IOhPLP2lQp9NtWLbjNIaRgOFIHHxlAgoWZdv9ynMMzz1CJXx7Q5ijxAjH+spWm01Sv94
         ThZ3Ih4Dysy2DUuQ6aYrB0vE18aqE7YvWSc/r75eTy/OhQrEaQrilyYolASnwiQU/VL9
         A0ZT57CmpZ0dUKO5LA1vZ9twbkMqWxskPV9s24qsUf+HpY4SeNPskoisUt3zejpG3PRH
         Ukamod427sBjlhLZIEYL+Ag2EU0OpdzgoMx8zB3xPMbp4WvfWIYAuNFWaDGULTYSmm3z
         jjeQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/RUs47umDEMRYrZ7fEhntvkj2wlbbbSNTnbGYGRwLr4rWpii93AQCaiBiNOV6KbttdT+MyAmOUpGOCaTUtHzz@lists.infradead.org
X-Gm-Message-State: AFuF++ns6vUDNwyatf7O7O+kXvt7emaY2avqLZepXoT+l+dz+LC5KfJN
	qxBb6l7Wo5x7S2q0TT4JRk2yv9u6Rp/gaFTkXJqhvOn3kjMfzknsDj1g
X-Gm-Gg: AR+sD13yb6lTDqceY2sCq+qU/o1kluUQaav4JLh3+euxZwt7EsgYAgoTdvoRr00+nj0
	MXXU1S984bpKQxMRh9ie1hHy7u7ljfnMl1UdyINxSpR+HKpgAJg+4baLGeXxN0NEoErdiG6maKA
	LnMVnvnm+B3fu2brSxGZwp4naI/FeIaVIhamOFRdImgIvauh+AWlXAzPbgMP5+BXofGBJl528B5
	VaGyHoei3EQraQwn34VPZMJahRBq8L00KtsJYe9Nr++Tl3Z1+he1Fhz4o5K70/yCZLKZTBr80Hf
	NDrjD6kExikA2EeP7kvR1Qe1UVBpw5BBOrHI0e+CzgKUPcMYkzqA2jGSCc5SK/v+Tkt2QJv7q1Z
	CD4R1vusxVqnGWXttyi8FigGqvoVhyCvxPPgOQSwTE3jBbOC/yVS6z9ogBxjNeUlGSZFL6H/PIm
	CFzYxFpcktnElL53cx3r2J75lMzn0J2AoXoI2RKstW5PRfnPlvtBF3uCq3SrBop/wZiqbIf7qMQ
	QvQ6H6qevDvC8QGL9SO4M8mz9ktPdyqpTsw3Hl9drOru70+hjtQlKTJVd8rnIXjgpcHx7Zmxp9e
	PqfuOxMLrhRcXiOU46p+
X-Received: by 2002:a05:600c:1f8d:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49b91c17c41mr163125035e9.3.1787982624717;
        Fri, 28 Aug 2026 22:50:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cca3e642dsm35357485e9.2.2026.08.28.22.50.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 22:50:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] KVM: arm64: selftests: Test empty SMCCC filter range at base 0
Date: Sat, 29 Aug 2026 07:48:56 +0200
Message-Id: <20260829054856.70549-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260829054856.70549-1-kmehltretter@gmail.com>
References: <20260829054856.70549-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_225026_683970_F6D308C2 
X-CRM114-Status: GOOD (  11.24  )
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

test_invalid_nr_functions() only checks an empty range at
PSCI_0_2_FN64_CPU_ON, which KVM's end < start check happens to catch.
It never exercised base 0, where the inclusive end wraps to U32_MAX
instead.

Add the base 0 case. Without the preceding fix it fails with EEXIST.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/smccc_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/smccc_filter.c b/tools/testing/selftests/kvm/arm64/smccc_filter.c
index 21e41880261b..a41ed3e016ba 100644
--- a/tools/testing/selftests/kvm/arm64/smccc_filter.c
+++ b/tools/testing/selftests/kvm/arm64/smccc_filter.c
@@ -140,6 +140,10 @@ static void test_invalid_nr_functions(void)
 	TEST_ASSERT(r < 0 && errno == EINVAL,
 		    "Attempt to filter 0 functions should return EINVAL");
 
+	r = __set_smccc_filter(vm, 0, 0, KVM_SMCCC_FILTER_DENY);
+	TEST_ASSERT(r < 0 && errno == EINVAL,
+		    "Attempt to filter 0 functions at base 0 should return EINVAL");
+
 	kvm_vm_free(vm);
 }
 
-- 
2.39.5 (Apple Git-154)


