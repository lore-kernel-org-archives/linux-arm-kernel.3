Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA96606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=voo5uQyz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sMYjlm1Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=; b=voo5uQyzp/7cz7QYyaeF52G6pN
	82gd/tzBwxv1CZjgSBwrBhIccLOy7UmdzmtupY5h2Q1HXUqOGzlbae3+oj8GJ4mYHDSd3f5Y8SmX2
	rRcHlCP3MWvmqKU+5RTIbUXoaVw0DqEs04uj3S25y8OpF2Ymyij4LC1gmhbK2MJrxpAsmlJqyAtN6
	tw39qbKmuh4nq5meTuWbMqTSpm53gm7vKXeQs5lZtUx6kca98l0ap1G8fOIVO8Z0u8xrgJv304sn9
	hXWXWLaTM4j/OC2XPXzJMSdBsOPkVBceKdN9FnUKFhSOdnovMQo6ZpiS6LrLwdsYP+24Vmdub6hPS
	U41T8cCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZj-0000000DVN0-2PGV;
	Thu, 22 Oct 2026 06:46:55 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmZc-0000000DVK4-1IRd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 06:46:49 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1067093f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 23:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651606; x=1793256406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
        b=sMYjlm1Zf65u/AD0WIo01LJHlkr4fcIUmMaaProPM+RBT0U3BWNKN3o/LkkfHsaDej
         /mf8lui0Pd6CAchHEBsqJamFiqsZd7sTSADTzXJ5zg4Ep5b4YI3u9uap7FsdlWSw7hY8
         Sj/d4oQhdaGjxoX/KNvqKwq+YzVGVLA9nW/qdQnHHbjgo/77qfB/xNCUCZfuiPisSU5B
         7pvCXi3eXdWNmIA0Zghaa5WYfiJSfrxg/g0noPQXxQkYuuZzodLpb7IrNAUIvpMSfGi3
         AIE4FALJUbW4jfncpxSrW5QBEh7EZFzbkP7CQ9a/EqKya0Nq9TunHsckIafEFm28SmDV
         KqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651606; x=1793256406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2m1NOxjt9F2BRgX+AxlY6ccXZ7NGdaeYHeYEfzi92w=;
        b=Gy6Pvdtm2GQc0gkDTNTfurWEEP6lR5+vLnZaAz1lLubc8LpPMqfwAVSQh1hgV2b8Yl
         Ia+Nh59NeL3UeKyhLifEEqqL2oEfTowBtTnaSIv1fU63cDjev9RyKSL0FvhOuFZXm1UU
         XEh35QAPgWeFhTjDo1Ch6MSFi90QQMQK2qsaTFTVQc5+t38Xd7skBzCtkcICa1Vo/JlY
         yHTEFTRL3hhefdzUVIdIAe1F3kZjfzY66684hkehLpjHHfxnEWndpFzvDt9h/0Daudgb
         2FjbgbSZd3hqYl4HuENhCD/RNpOrGEfFhiVpkTmxKhmTST/Qyty7GW0eotKp8tuRwpzA
         O/gw==
X-Forwarded-Encrypted: i=1; AKwUvBwsRcj4El+B5ikjJndN/qJgeAN9UOZ/BecR/H4Cz+vmA/X6Dsd2WQ03KG3f/F6cySkxYh+HmquVU8wbtqoVZVcq@lists.infradead.org
X-Gm-Message-State: AFq9FYLUenVSzLG1ZH31893vQVTUUz16zhVo1Z5vGUI9BjUQyyss4Ev6
	0AjmwNyTY2/gXubTjeu3kxSFVH1Br0mxvD1Hq48DU+NQZHwbWxPkz0xU
X-Gm-Gg: AYBFou0the1rnzj1LQsHQwCaTc0i4FKEDK6FrldOIGl9hJMNrUE2Zcp/uhyg5nqyBNu
	2b5q54YnPOrX1EUECpKKtF5WTxCEnIZ57X+gTeMfv2NwVPlXG9C/ALXYvjbkJx5z+8uQeopCEpa
	xiVYUvwGzl4cfG7JPLjLZ8n97Ddvxv1UWBYyYQb/dJXvcP3nAWeugBBNAyx7bX5ZI2BiMtsG4NH
	B1UmlTG2rNoi7+MvWVyv9MzhKzFdLrsEKUUVB6tkIt7xMmxNDVtFISy7mGd6m5YjM1ShCj4+QWU
	HLMysc3x4QsRj9I5EqimPwg63jP6wFynWY9/r59uZAfRXiDC41a9kIYmCdyUib04XQI6LLrtnCl
	9AaWHYDrTSjiUnd7mI33Km6PJVqqHSHi0Uuk4bDHy+8ZimvyVlcb1T0FaiEMxhusSDB3cgj3cOM
	KJ779sR0623Oz36sTYPcgKOktUE0ik5uf2lDyDQRYPkCQadgSFFNes8idcKLLear0/rSHQMQ56V
	eubUZN1gJwSPrhElzXRIroEIpiSr9Ix7rNQZCQlvk3kWCpXMKLIRQIR+VUZ7aVScQw7TSInaS+c
	C65O8Hrb06vicgKoeztGjNqeXO3nrQVqQazbusatrfY8UHZFO39hkKbdFPHvjsvdxp18Ihb9Sk7
	1hA8IFk9du6ToljqGnAbhZ9XOGwcUJot7/DG1Wr+H9EU6n/AxtnHzaGfnC8eI5onycQ==
X-Received: by 2002:a05:6000:310c:b0:48d:faf4:54a8 with SMTP id ffacd0b85a97d-48e26493bedmr9081092f8f.11.1792651606193;
        Wed, 21 Oct 2026 23:46:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm10215624f8f.22.2026.10.21.23.46.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 23:46:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] KVM: selftests: arm64: Test pending writes to active level IRQs
Date: Thu, 22 Oct 2026 08:46:28 +0200
Message-Id: <20261022064628.4206-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022064628.4206-1-kmehltretter@gmail.com>
References: <20261022064628.4206-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_234648_439845_E2AABA7E 
X-CRM114-Status: GOOD (  19.23  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a two-vCPU GICv3 test for a level SPI set pending through
GICD_ISPENDR. Re-pend the interrupt while it is active, first from the
handling vCPU and then from the other vCPU. Require a second delivery
after deactivation in both cases.

Also check that the other vCPU observes the initial pending state
before the interrupt is acknowledged.

Without the VGIC fix, the pending state is cleared on deactivation and
the test fails before the second delivery.

Assisted-by: LLM
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 101 +++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 3cb85932ee85c..81f38e523d3c0 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -959,6 +959,106 @@ static void guest_code_timer_spi(struct test_args *args, int cpuid)
 	GUEST_DONE();
 }
 
+#define REPEND_READ	1
+#define REPEND_READ_DONE	2
+#define REPEND_WRITE	3
+
+/*
+ * A level-sensitive SPI that is set pending through GICD_ISPENDR stays
+ * pending for every vCPU until it is acked. If it is set pending again while
+ * it is active, it becomes active and pending and must be taken a second time
+ * once it has been deactivated. The second pending state comes from the vCPU
+ * that handles the interrupt in the first round, and from the other vCPU in
+ * the second.
+ */
+static void guest_code_level_repend(struct test_args *args, int cpuid)
+{
+	int i;
+
+	gic_init(GIC_V3, 2);
+
+	gic_set_eoi_split(1);
+	gic_set_priority_mask(CPU_PRIO_MASK);
+
+	if (cpuid == 0) {
+		u32 intid;
+
+		local_irq_disable();
+
+		gic_irq_set_config(MIN_SPI, false);
+		gic_set_priority(MIN_SPI, IRQ_DEFAULT_PRIO);
+		gic_irq_enable(MIN_SPI);
+
+		for (i = 0; i < 2; i++) {
+			gic_irq_set_pending(MIN_SPI);
+
+			if (i == 1) {
+				/* Not acked yet: the other vCPU sees it pending */
+				WRITE_ONCE(args->shared_data, REPEND_READ);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) != REPEND_READ_DONE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			if (i == 0) {
+				gic_irq_set_pending(MIN_SPI);
+			} else {
+				WRITE_ONCE(args->shared_data, REPEND_WRITE);
+				dsb(ishst);
+
+				do {
+					dsb(ishld);
+				} while (READ_ONCE(args->shared_data) == REPEND_WRITE);
+			}
+
+			GUEST_ASSERT(gic_irq_get_active(MIN_SPI));
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			/* The second pending state must not have been lost */
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+			intid = wait_for_and_activate_irq();
+			GUEST_ASSERT_EQ(intid, MIN_SPI);
+
+			gic_set_eoi(intid);
+			gic_set_dir(intid);
+			isb();
+
+			GUEST_ASSERT(!gic_irq_get_active(MIN_SPI));
+			GUEST_ASSERT(!gic_irq_get_pending(MIN_SPI));
+			GUEST_ASSERT_EQ(gic_get_and_ack_irq(), IAR_SPURIOUS);
+		}
+	} else {
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_READ);
+
+		for (i = 0; i < 64; i++)
+			GUEST_ASSERT(gic_irq_get_pending(MIN_SPI));
+
+		WRITE_ONCE(args->shared_data, REPEND_READ_DONE);
+		dsb(ishst);
+
+		do {
+			dsb(ishld);
+		} while (READ_ONCE(args->shared_data) != REPEND_WRITE);
+
+		gic_irq_set_pending(MIN_SPI);
+
+		WRITE_ONCE(args->shared_data, 0);
+		dsb(ishst);
+	}
+
+	GUEST_DONE();
+}
+
 static void *test_vcpu_run(void *arg)
 {
 	struct kvm_vcpu *vcpu = arg;
@@ -1073,6 +1173,7 @@ int main(int argc, char **argv)
 		test_vgic_two_cpus(guest_code_asym_dir);
 		test_vgic_two_cpus(guest_code_group_en);
 		test_vgic_two_cpus(guest_code_timer_spi);
+		test_vgic_two_cpus(guest_code_level_repend);
 	} else {
 		test_vgic(nr_irqs, level_sensitive, eoi_split);
 	}
-- 
2.39.5 (Apple Git-154)


