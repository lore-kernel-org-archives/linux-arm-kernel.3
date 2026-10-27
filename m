Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ryGu6KVY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fYV2TPO8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7YA8P+muIJDBbbr/1PLa8S19fZTHN+SvrUEgHhvUB0Q=; b=ryGu6KVYKUmD/g29R6GE8HwK+7
	Z9Vq8idnJDaMg68klffGqOFf0g8mM35hoXxzMjygr559baZB46e1LWplEAKCEVpl31TNKSC3bcFBj
	nU4dsMB+gzM9FrwzqFLz13FfF9HBD5C1JU0muh31awkifNCfLZOfSzBaIqaC3Ok3Q88zZKgg2P2MK
	DRDLCSb18nagiNjGlUc7N+H4oThHyl52udIdH1eafoY1mPAYz/OisFG3Q0lmjXD2oo7qXlkXCnQyw
	lklJj9J89byZYCTlDqUKvt8FtrFZVsUcVyCOuqajmO8L6KmheElOBxFljMKARasr0g6IIT6Y0C9mD
	kNJ14pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLceM-000000042Jy-3Xfa;
	Tue, 27 Oct 2026 08:35:18 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLceJ-000000042Ie-26rR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:35:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so1190086a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090114; x=1793694914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7YA8P+muIJDBbbr/1PLa8S19fZTHN+SvrUEgHhvUB0Q=;
        b=fYV2TPO8jJF+GXzcPdq9LzB2rySF51EKVeXvMWpzJCDNLEkZ79hjLn5Tx1Uz9N89zL
         c4eTzRlPJksxMWSi6g8oVgG8LIX2QevlhCJC9K3cpEOj5NPMwqEIiuhBpOrxzJguVUjn
         nVdaIy8DVffMYhpN4c386zII1vqEMrQA8VdYyC/N2pKKo2Y+pE4QIWkl/VWN+BJ9h+n3
         ix3d1kuQWeMUbCS/WtC8NK+HA4c72BUAGrkOKkfq/hnrRFfdSnk3KY/E8BOd2Z/B2Np0
         cW8+TASHCKDuBDy80CSpiTvxGLI2PHPzgkvvA5L2loOkFvu778H3X04dH2FQpd1q0Owp
         M94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090114; x=1793694914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YA8P+muIJDBbbr/1PLa8S19fZTHN+SvrUEgHhvUB0Q=;
        b=1WSCdING3Og+9WcLCFdvr1BMtDi8L8GI+A+hohR1dCsATMJWHY/Z77CDW6+Xhl05bH
         lnYlAbBo0ySGI38rbtCmIrTJFPiOLjW/qi/yUq71pxwV9iwWEVf+lmehUaVO1Uwno5hU
         rwpvLd22XVqzzYoksfHA+5zyOdNSvPSvaQUYzO4cg5qEY4kafFktn8UVWCf+eSiTwF7O
         uUFd2FcawEgP+w5yaB6NkeUVuNOTUQcw8D6N9Oe76+lnEEbXJfl8ZNX67BBxxvpqvTJd
         J9//28Q9D3KOAVE2MjGOH3BFtcIDaYRzwGvSCGzj/fpW9ijlhb9xfE2CLtV3avT5iylc
         Ai2g==
X-Forwarded-Encrypted: i=1; AKwUvBxRq95k7Yf4SUFYL677rf7CEfirx2ymMgFydqMSWMe4snpPDu3JD1zxjteQERaQHiKGwfiTCt3eFY8l+1s9agk9@lists.infradead.org
X-Gm-Message-State: AFq9FYJdTbPtNyo9Tp1To7/zq+J+W6WUd4w2GpTwO3Yk+scAlRkFkdd6
	h8wFzmcfkKUnzoMCVeXjxI/4HfqwAz+QLKZyd4mtLfiaSoWdePKH7ZRn
X-Gm-Gg: AYBFou3OrI3BBQbeS+l9r2hXIDse6Ar/YKRSs8l+fNZbyRXEJujvB0InF2ur0x3QziS
	0qaglKtEyehewYxNKhJSqzIeFOPaCVSzXbVTABVB0HCa0MdfTDxQy6RunAgFkglSuQJrKMMcqp7
	yOULFOAGKkUxxnpKep8nV+k/3Md2UeshRZWAUQJ1FCTXT9db6g08/Ikufu10D6y9INO7IVJq3pN
	F0gsFUHHzJYhDybuGwGgHACyvYXfmGROrP3CC8F2vtgFtwFrUEsdSv8h2a581bY0dKFtwt7NXhi
	e8Pp9kIJRM6JAyertzHLMQzGUakisZL0HX8qhKaSgeJ+c7s1zWqnXlw4+XqHckRxY3K8//M6NPA
	GhmsKgWgGJ0zP5z9Xiu/LhxVc4RhqgMl0MqH9d1jx0aRS8KIlB/wr3SJhYYNOKq2juPnqR6twxW
	suMGZD1M/v3xHzMTfkbwlzpnd0WmcJ7YeyFQVdSPJ2ouQDA8e+HAIPPwWVZkzr9bzu7tiAxcKOE
	x/zm2XqosFR19KC/+rNVCuw9R9T3eOc3l4WaOpkMr6kasNX+CG38146UA1Y
X-Received: by 2002:a17:90b:1c12:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3adeafca234mr6397843a91.52.1793090114408;
        Tue, 27 Oct 2026 01:35:14 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404274b2sm2750182a91.5.2026.10.27.01.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:13 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Warn when firmware leaves PARTIDs disabled
Date: Tue, 27 Oct 2026 16:35:07 +0800
Message-Id: <20261027083507.48226-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013515_550972_551CF0A8 
X-CRM114-Status: GOOD (  12.40  )
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

MPAMF_IDR.HAS_ENDIS indicates the MSC supports the MPAMCFG_EN_FLAGS
PARTID enable/disable feature. Firmware is required to enable all
PARTIDs at boot before handing over to software that is unaware of
these registers. A PARTID left disabled silently ignores all resctrl
schemata changes, as its traffic is treated as having no resources.

Debugging an IP that implements HAS_ENDIS but had no visible effect
from resctrl took a while to root cause. The fix belongs in firmware,
but warn during probe so this misconfiguration is reported loudly
instead of silently.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c  | 16 ++++++++++++++++
 drivers/resctrl/mpam_internal.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..f03aa40faa0a 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1159,6 +1159,7 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 {
 	int ret;
 	u64 idr;
+	u32 en_flags;
 	u16 partid_max;
 	u8 ris_idx, pmg_max;
 	struct mpam_msc_ris *ris;
@@ -1199,6 +1200,21 @@ static int mpam_msc_hw_probe(struct mpam_msc *msc)
 			ret = mpam_msc_read_idr(msc, &idr);
 			if (ret)
 				return ret;
+
+			/*
+			 * Firmware must enable all PARTIDs before handing the
+			 * system to software that is unaware of EN_FLAGS, so
+			 * a disabled PARTID here means resctrl schemata
+			 * changes silently have no effect.
+			 */
+			if (FIELD_GET(MPAMF_IDR_HAS_ENDIS, idr)) {
+				u32 en_mask = GENMASK(FIELD_GET(MPAMF_IDR_PARTID_MAX, idr) % 32, 0);
+
+				ret = __mpam_read_reg(msc, MPAMCFG_EN_FLAGS, &en_flags);
+				if (!ret && (en_flags & en_mask) != en_mask)
+					dev_err_once(dev,
+						     "firmware left PARTIDs disabled, schemata changes will not take effect\n");
+			}
 		}
 
 		partid_max = FIELD_GET(MPAMF_IDR_PARTID_MAX, idr);
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index 1f86cc158100..008dc4e10f38 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -574,6 +574,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 #define MPAMCFG_MBW_MIN		0x0200  /* min mem-bw config */
 #define MPAMCFG_MBW_MAX		0x0208  /* max mem-bw config */
 #define MPAMCFG_MBW_WINWD	0x0220  /* mem-bw accounting window config */
+#define MPAMCFG_EN_FLAGS	0x0320  /* partid enable flags config */
 #define MPAMCFG_MBW_PBM		0x2000  /* mem-bw portion bitmap config */
 #define MPAMCFG_PRI		0x0400  /* priority partitioning config */
 #define MPAMCFG_MBW_PROP	0x0500  /* mem-bw stride config */
@@ -608,6 +609,7 @@ int mpam_fb_check_shared_buffer_size(struct mpam_msc *msc);
 #define MPAMF_IDR_HAS_RIS		BIT(32)
 #define MPAMF_IDR_HAS_EXTD_ESR		BIT(38)
 #define MPAMF_IDR_HAS_ESR		BIT(39)
+#define MPAMF_IDR_HAS_ENDIS		BIT(42)
 #define MPAMF_IDR_RIS_MAX		GENMASK(59, 56)
 
 /* MPAMF_MSMON_IDR - MPAM performance monitoring ID register */
-- 
2.34.1


