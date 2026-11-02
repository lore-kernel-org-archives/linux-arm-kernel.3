Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB9F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lFrbrQaB;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZA9DL3zL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=C1/iihW28aNu18mLJFGbicoB+M36ExxUuA1vjoQI5nY=; b=lFrbrQaBALzDX5Ym6W8xh0xMPQ
	9sscwt6zD53LMX4CU88ZlpY/2yaEPm4fz83DfKVQyXCYi1dL2J9txSxOBLhkA5N5NBP8e7aJO6oql
	VqAA1S4NW6M13MJggboSdIEKnJAPaP5QxYSSN75xur/O0IyNMIEFA8aO8IEwGbuYqUyCSYtgyted/
	tzVuEpUXy1LEkuLRL1bu0dLX3MS0BIf9dd+lJw5tT1O8ZboWA12j4VQlvN0TjEtKb/+u68vZhxJ1i
	LEyGPnw3l86AQ3B2Txqni7U7IE8amozeXq31za4dZsO9NwWhKx6AqWNwnjMqs5FeGmXsv6WzVpXXn
	MBZfJm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmEC-0000000Fiti-48gd;
	Mon, 02 Nov 2026 07:13:13 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmE9-0000000Fisw-22CN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:13:12 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1520026a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 23:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793603588; x=1794208388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1/iihW28aNu18mLJFGbicoB+M36ExxUuA1vjoQI5nY=;
        b=ZA9DL3zLHZ7B2ClyNjH6XlG2e4PmoyxD3XKAMkARzoS/ZSjX1hHyGm58IMm1Emp3en
         4XjJ8Ciyiw94O38hy3aONTnR+t6IzB08LeQTlzc9DcHkKc7Wt3wkXv61yPimM3uoLBce
         f8Z6rvUc030/wYERVOPooeAfrTb1ONfWPVgeUnwzZQJQ3RELBdDMnxdSvKB/p2n4uiNF
         CABJmBuP6xH8vKibppXhb+ERj7fSyeA8REyol3D9N4fhi0UiDiFUPRmbQ3cTJ5TAgLF1
         FN/kDnI80O7Dw0VZGkJUo+q9jUJ5P6tOFs9JoZxKjtfh/1nVNnUyCw1gAJbxSCiWv/AE
         6voA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793603588; x=1794208388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1/iihW28aNu18mLJFGbicoB+M36ExxUuA1vjoQI5nY=;
        b=sb6uYnnvKVUEEb1lhg8M9TRZvdo2n69a/As/VMhee29JHV9hEHDfWjY/Uzu61Jp7gA
         5NwWdPAzITKIEtHWnQs32bSr+PcZ59qrmRu76edKYaofOB1or01ouskCAJm9+ObYKrM5
         yP8KuqNNfGBmGPQtCgZ5vDp0XgKkFp1HB0+GwDdmWaY7CbMoVMVGPrFjBlh1qgj2NV8U
         h6TjlfAEUdqu+Ss/m7ydZruSbQdcL0T9f/SV3nI5CWKAus/lVzg9zO3VXqDkVWHTxDt8
         0YpYgA6EyxMDC894+L4c2vSeTtRu0V8XZiWK2ZqEkL52Bbr4OKrxZuaKpxmAZ0ukiEMa
         EchA==
X-Forwarded-Encrypted: i=1; AKwUvBx7o+bSayGd5rRDmMRztkcJuuZshyWjiI6Oj0WHDp/Imlc4EcBAcewNI0+6v+YQ0aEEJwdxz+5XvIR5hk/EQvXg@lists.infradead.org
X-Gm-Message-State: AFq9FYLqF3R5qsquDMpRNcNm/Fohc4i5D8Mz38VU+4wSwGWKNLRTRCgP
	8lhSD9cSGSdU6JkpuhadmoH2WIqGSsaDudKOZ4z/Dz5ZNikkc974M6CO
X-Gm-Gg: AYBFou1K/t9DF2p9GOvnUbeefvnkz14I8gpWD8wozEVz5OEaAw1Ig3s9xq4F2PIqZbr
	0sL9NoFjXkN36yGJnavQRqxx3JhyOqcRAUYVyMlYkm83vTuUjTYQZOosz0xZiqImV0vaVwNSPxZ
	gvI7cAiYUfoa3WKw+uFJBhJXkJl5IfksjiVk6oYHP7lP1pKg0D6eRxxFcHlmk5ZvjQDuvZ831K1
	8BQj63meQTYEbebCiXybiwn1CkOncAqSQnmAHSEWtkm7Ci78o53GuKuCdaMGz86tPepxAVigDMd
	nVqbmcQqJLJ2BuPeqSzE5I8LIE7IEapTkH8+T1sgx0CUsVRyZ7GsVrNXPkaQDZorHjiULHdCcQl
	NMPu8VinKLu7fuYhQ4SJXOCZ14vmxfdwxSDbcGrPkuxuGsjv7nNxo6ksoxBONI02E2bo+HrqWaM
	2ewoaLdg+wsoBFQJdyasKt5ys7oB4gtvXSrWTzkVKXHuvT3KAYRuAaQw8FFrayhXooxBJdwEZKs
	fi3cJR8u/uGvYnfLGUDsOkLl1ANlf703CTt5Bajc3pfrzYXQNWZThp+Xxlvg9EZKSnYkHUgMSFU
	gPlODdwDdJf7v9ION4FsfVTPcKu7fnEaYg==
X-Received: by 2002:a05:6300:67c7:b0:3e2:47ab:6a25 with SMTP id adf61e73a8af0-3e9289d5d85mr8302838637.46.1793603587953;
        Sun, 01 Nov 2026 23:13:07 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096fcf15sm2660232a12.18.2026.11.01.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:13:07 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Mon,  2 Nov 2026 15:13:00 +0800
Message-Id: <20261102071300.554160-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_231309_529078_71C9C8D5 
X-CRM114-Status: GOOD (  15.55  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An MSC of ours implements the MBWU monitor without PMG support:
MPAMF_MBWUMON_IDR.NO_MATCH_PMG is 1, so MSMON_CFG_x_CTL.MATCH_PMG is
RES0. On this hardware resctrl monitor reads always returned 0.

Tracking this down: __read_mon() unconditionally sets match_pmg,
because the resctrl (closid, rmid) model maps rmid to PMG. The
expected configuration generated by gen_msmon_ctl_flt_vals() then
contains MATCH_PMG, but the hardware ignores the bit, so the
configuration read back never matches, config_mismatch is always
true and the monitor is reprogrammed on every read - the counter
never accumulates.

The architecture allows an MSMON implementation without PMG
support, so read the NO_MATCH_PMG bits during probe and only
program MATCH_PMG when the monitor supports PMG filtering,
falling back to filtering by PARTID only. The CSU monitor has
the same issue and is covered the same way.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c  | 22 +++++++++++++++++++++-
 drivers/resctrl/mpam_internal.h |  4 ++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..2086ff121b59 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1089,6 +1089,9 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				if (FIELD_GET(MPAMF_CSUMON_IDR_HAS_XCL, csumonidr))
 					mpam_set_feature(mpam_feat_msmon_csu_xcl, props);
 
+				if (!FIELD_GET(MPAMF_CSUMON_IDR_NO_MATCH_PMG, csumonidr))
+					mpam_set_feature(mpam_feat_msmon_csu_match_pmg, props);
+
 				/* Is NRDY hardware managed? */
 				err = mpam_ris_hw_probe_csu_nrdy(ris);
 				if (err < 0)
@@ -1118,6 +1121,9 @@ static int mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 				if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumon_idr))
 					mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
 
+				if (!FIELD_GET(MPAMF_MBWUMON_IDR_NO_MATCH_PMG, mbwumon_idr))
+					mpam_set_feature(mpam_feat_msmon_mbwu_match_pmg, props);
+
 				has_long = FIELD_GET(MPAMF_MBWUMON_IDR_HAS_LONG, mbwumon_idr);
 				if (has_long) {
 					if (FIELD_GET(MPAMF_MBWUMON_IDR_LWD, mbwumon_idr))
@@ -1309,6 +1315,20 @@ static int mpam_msc_zero_mbwu_l(struct mpam_msc *msc)
 	return __mpam_write_reg(msc, MSMON_MBWU_L + 4, 0);
 }
 
+static bool msmon_supports_match_pmg(struct mon_read *m)
+{
+	switch (m->type) {
+	case mpam_feat_msmon_csu:
+		return mpam_has_feature(mpam_feat_msmon_csu_match_pmg, &m->ris->props);
+	case mpam_feat_msmon_mbwu_31counter:
+	case mpam_feat_msmon_mbwu_44counter:
+	case mpam_feat_msmon_mbwu_63counter:
+		return mpam_has_feature(mpam_feat_msmon_mbwu_match_pmg, &m->ris->props);
+	default:
+		return true;
+	}
+}
+
 static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
 				   u32 *flt_val)
 {
@@ -1322,7 +1342,7 @@ static void gen_msmon_ctl_flt_vals(struct mon_read *m, u32 *ctl_val,
 
 	*flt_val = FIELD_PREP(MSMON_CFG_x_FLT_PARTID, ctx->partid);
 
-	if (m->ctx->match_pmg) {
+	if (m->ctx->match_pmg && msmon_supports_match_pmg(m)) {
 		*ctl_val |= MSMON_CFG_x_CTL_MATCH_PMG;
 		*flt_val |= FIELD_PREP(MSMON_CFG_x_FLT_PMG, ctx->pmg);
 	}
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..88cd5ac4cde3 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -227,12 +227,14 @@ enum mpam_device_features {
 	mpam_feat_msmon_csu,
 	mpam_feat_msmon_csu_capture,
 	mpam_feat_msmon_csu_xcl,
+	mpam_feat_msmon_csu_match_pmg,
 	mpam_feat_msmon_mbwu,
 	mpam_feat_msmon_mbwu_31counter,
 	mpam_feat_msmon_mbwu_44counter,
 	mpam_feat_msmon_mbwu_63counter,
 	mpam_feat_msmon_mbwu_capture,
 	mpam_feat_msmon_mbwu_rwbw,
+	mpam_feat_msmon_mbwu_match_pmg,
 	mpam_feat_partid_nrw,
 	MPAM_FEATURE_LAST
 };
@@ -645,6 +647,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /* MPAMF_CSUMON_IDR - MPAM cache storage usage monitor ID register */
 #define MPAMF_CSUMON_IDR_NUM_MON	GENMASK(15, 0)
+#define MPAMF_CSUMON_IDR_NO_MATCH_PMG	BIT(22)
 #define MPAMF_CSUMON_IDR_HAS_OFLOW_CAPT	BIT(24)
 #define MPAMF_CSUMON_IDR_HAS_CEVNT_OFLW	BIT(25)
 #define MPAMF_CSUMON_IDR_HAS_OFSR	BIT(26)
@@ -655,6 +658,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 
 /* MPAMF_MBWUMON_IDR - MPAM memory bandwidth usage monitor ID register */
 #define MPAMF_MBWUMON_IDR_NUM_MON	GENMASK(15, 0)
+#define MPAMF_MBWUMON_IDR_NO_MATCH_PMG	BIT(22)
 #define MPAMF_MBWUMON_IDR_HAS_RWBW	BIT(28)
 #define MPAMF_MBWUMON_IDR_LWD		BIT(29)
 #define MPAMF_MBWUMON_IDR_HAS_LONG	BIT(30)
-- 
2.34.1


