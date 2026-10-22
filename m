Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC19606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ch5pJZE2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=phWbpx+P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UxwOL1GCHgPqfUhQREZ4EGaDCyWDOXreH6QpNfsuSK4=; b=Ch5pJZE23fAN01DfsclsTc+ouP
	UTSg8xTAVTrB5Fofoo+ytcBLX/E0vT3+oJcwtbSJ7EtH12yUNkZkdldHpRDGK5VUXE7A1RWBk/d6F
	HXmSjPI9VM+xGiXV6qlwCE7jReb+HXQgGaa6PXi2LKDUP7oOYgbrArs7Cn0m4eYglsA9NwHJpj6rl
	1oD4/NJmrYIZlMO5dhK+1DVCkDiQK2u5iCCW4EgPy1g4Np7PDx/t8loInjUQFXVCX3qmFbQjfSUzD
	Hq+DtarW71GxWxsN9wNKwXTwVwIgsI0bNiruUMVSbWsqKSuLIHZmAV5ndtRhttnQNtH8HX2SMFTZ9
	Cii6/PGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJobx-0000000Dm2h-2Ra5;
	Thu, 22 Oct 2026 08:57:21 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJobu-0000000Dm1p-1NhW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:57:19 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso1080183a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 01:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792659437; x=1793264237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UxwOL1GCHgPqfUhQREZ4EGaDCyWDOXreH6QpNfsuSK4=;
        b=phWbpx+P1NqCLiEWCsCDV+7yc4pLaDn+JH4cpMPSvz6W3fWWv8I9kTkzttZeYb+Xpl
         o2DZoFjWpqmmIj+/Z0sHzi8K8Ude0491WFeplj0UkaV43XKGbILk5j5rqX9Ew0zlwK5d
         ChE14fzEkrGUb7AqT1LsLbearN2AIMfxceaJPb5pxU+834FKlIpxs4tLEBJd2hwJPsuU
         hZJKNyUH+mGmoz2UjNSxhr8BYS3rc4qd6F8+3BqD3v293z6pCTJyEfQACnRFY3fDu+NJ
         MaQLf5Bsa/P9bXXkjr+XCTFtz1UECP6yRTyp3qUEZ3wqM8xicmtXFMTRd56NebDCRwtD
         mqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659437; x=1793264237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxwOL1GCHgPqfUhQREZ4EGaDCyWDOXreH6QpNfsuSK4=;
        b=nteSC36gNbKbQ2y7WMGfuWBNGPaxboZw6l0tOxz+4O6Xnw2sU+/C48OJX1Au+7+nU/
         6Rx73wXzYEezyRaYVsnS1vC1+k7WmHIu91eqllzhCxZwXBShIqkTNWNt+vicytO7nHlF
         ucvjAhbmP4cq6sqEJGj91iEL6JGqQDKLsE5u1Gj8i6/ia4mL7NMBySvK0mYsNKOyYCZh
         wyaqj7H2edADrmvgwakHgyI6GgFtTuuLxQSfXrxnUXuxd0i+ySZZLzSh9vHCG+M1IkFQ
         8b4SU6e0zfWHEYKk4kx3rCTpxAgaCkHSETp2/RkXwWOB+KY+ZylXSIfadVV+Ae/s/l1c
         D9hA==
X-Forwarded-Encrypted: i=1; AKwUvBx7wS5G2ZCWfY+HAtYpxH81wH4RnKMFg9IwP1pSDAHP5C7IrQ1hvAlFamCSVOQ5UMtjhQcY/Q0gISkJBEW2vZZH@lists.infradead.org
X-Gm-Message-State: AFq9FYLuOT5OEu/RxwjsLjGmolMoQgMpcYV4EMn5LKTAX1CLHlHYYmyn
	ecru8RrFjr4Y7dQ/tjGWP0BcP0P9MorggtMOUQJ/wOl4dYE9Ca2U2yhH
X-Gm-Gg: AYBFou1PWWmqvfQx1LTItzKgyUdsUlqPa6XrJQt4l/P4pg9Ta4Hfho4XNFSTz7SXcQ1
	2gSZdLwNWmfnI5nPwBbjANa/Gtt9wWdUseolrexd9mJj0e1hbYEne5rM8FCCBxXy9gexT9p4PHA
	sdtUYG/7Hyhq8YZMpR+AiAHi5Sp9BxpLYA/342q2a7ACKJ01MkCn78WVNrlILb4nut2SJJmJ1ND
	/X9Ik/UB4J2+a3I6g+uqYZWOaTi/BrZWZvlEtNJZuQYpl0ZKfYBJn7M1GvPDr/QMRY5uvtaQrVW
	UDL0KNv/cl89JLteeXtbDAoG4Mh1uZKNwz/CDpyOmIhlxD2Ed3a4FtISivh9YGibV+cGZ4bxsX1
	MMYjQMapRBH//mdtDvfQxKBkBtZkvY3Ur+aBnlbEyXCsZERwfmu/G0S4o8+yTALLLSjxx2DI9QH
	iCN8tRfp8WTmh32FpQp9i7CaFTdgAvg9HSTtpYzsWCURUdR/OGccMa52LmSwZjJjsfvxLqneM7l
	XpqOJUq+3hYATLu+wuxmkODgqIDXsdWX5ettiOpkNyLOLXG5psoAHf5b3t3
X-Received: by 2002:a17:90a:cf01:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3ad86e9eb60mr2614714a91.17.1792659436838;
        Thu, 22 Oct 2026 01:57:16 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48bcb45sm3172774a91.16.2026.10.22.01.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:57:16 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH] arm_mpam: Reject ris_idx == MPAM_MSC_MAX_NUM_RIS
Date: Thu, 22 Oct 2026 16:57:10 +0800
Message-Id: <20261022085710.1597276-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_015718_397801_A7CBB12F 
X-CRM114-Status: GOOD (  11.69  )
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

While checking the driver's partid and ris bound checks, after the
hardware team mistakenly configured PARTID_MAX in an MSC to 16,
this issue was found: MPAM_MSC_MAX_NUM_RIS is the max number of
RIS an MSC can have, so a ris_idx of 16 passes the current check,
and would later be silently truncated to 0 by FIELD_PREP(),
landing all configuration for that ris on RIS 0.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 48adc49b833c..347a5a6d6a1d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
-- 
2.34.1


