Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06359C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q34M/yB/cQDsaQGLM78DLdQn24/bplv98nkSF+8rs08=; b=ihlgXahy3N5MshDyzZs1jzLoSO
	u8Sw4DOKAGpptyyHIrSjBqurxO6NeYSkCsROS8HgWLAGZeRyKb0x/K3nBPM+BRISbK9LjoprMA8pe
	KzRkQxXTtixCC87C7pMFxdpohsygm68um8UnsYanOLWsO/q05n+3/D8Omu32+48D22Zf9r+HjYuFu
	H6AhEG1IgTKo6NTEaWOUUD/TZ+cLi59Yf17UESZbDEXFRRQ1zuwWokAF3rwwrBI792aW+C5X0JNNY
	060kTJc8wHCU+Bj/PXovmbP+/sfw0nyA0fK7LoaXwj6mqYaQlA4RbG5LdA1iJ5WTvNhtrr1I27XRN
	80Bf6Yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FEj-00000005Iss-3dSl;
	Tue, 08 Apr 2025 20:07:57 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F71-00000005IA1-1s4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 20:00:00 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-227a8cdd272so52204455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142398; x=1744747198; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q34M/yB/cQDsaQGLM78DLdQn24/bplv98nkSF+8rs08=;
        b=4tqz8akrl+RRrnt0oGh0jgk9F0OJEHJ7ioUYxGX8ukSLTTOO7RFTi4/iBuUEwiEDrd
         XRQH9Ha/TGFYnAAbe5PPZUAFO29E9JnfvZLi4xd6lTmhALVipNf+p+kK4/ie/W8sM0ba
         OYGEdSbXTMmV7YSjbgxkp7Sjujj10VRYSsuGsLGqF5A+mX72WL1JUf4DsdAi4GzDnN2U
         Z9YJn22E6D5aXG9tZnbUf1xiTnCeXHBHh40CpdOlJgGou70oFwZuIkiYAJRiiUrDUeuS
         nwyNJqHVOmT/+exyo/Bx0gP0DG595+OzVwYXFLXluwt2ZKQoKN/YmETYSlIAvxQZD5e1
         lfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142398; x=1744747198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q34M/yB/cQDsaQGLM78DLdQn24/bplv98nkSF+8rs08=;
        b=naqenXtGYPFBHkz1okX1yFo8ZOJauVS015bMvBdjMR5weoDKRTItVHK1uATDMdDTLl
         sszB3kMrHBOS495mjg4GvA1T/2DU0DVS92yQV/fbIOQUBdPmCJxdAd/M3TmWMlYgDSV5
         gnMOoSxera71E37NJ9UANLD3WcItDMfabGYp7J32zEkaSs2XBFttOMXu891X74BBxr7n
         xtWPb1iDAUg7+YUSAQP/NN56qMnREzyijSgfoefVPhTeihMURXDqXl1AAGW72RviTUFM
         wTBP9qPmGpeNrPznVW6fCxXAI7ECVNBh/86aMn+lvsU4/H4clsD2OF98MOD4xDnaJF+l
         ACTg==
X-Forwarded-Encrypted: i=1; AJvYcCU1+YqLJadkb+lMnvts4TQQOynX0rer/rGypEyaUaF3XFH/hQMupyt3GikPL36EEJvWzx+1GSk2zXpFMEmwr4gw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5if/0ht4BDsrHuncNUr6Viu9gCAhI5DblcnvvCpZUcpUKEPIu
	Boi49sWV69PGoSityHELMzcZWUm4B7xj1GTMXLNoDlIS0kn4ObziVRo6YvHFQ7lhottTOWsq6zj
	k
X-Google-Smtp-Source: AGHT+IGNR5b/BrzCv+igEUSxJYcjHRcZBXMY8xbV6NXow+K+OzxccVFEs8fcuddoHlcYKYCwVdfk4FJMh9g=
X-Received: from plqt8.prod.google.com ([2002:a17:902:a5c8:b0:220:d79f:a9bd])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1450:b0:223:53fb:e1dd
 with SMTP id d9443c01a7336-22ac3f2f26dmr387475ad.9.1744142398107; Tue, 08 Apr
 2025 12:59:58 -0700 (PDT)
Date: Tue,  8 Apr 2025 12:59:22 -0700
In-Reply-To: <20250408195922.770377-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408195922.770377-3-yabinc@google.com>
Subject: [PATCH v3 2/2] coresight: core: Disable helpers for devices that fail
 to enable
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125959_504571_8E013CED 
X-CRM114-Status: GOOD (  12.12  )
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

When enabling a SINK or LINK type coresight device fails, the
associated helpers should be disabled.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..a56ba9087538 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			 * that need disabling. Disabling the path here
 			 * would mean we could disrupt an existing session.
 			 */
-			if (ret)
+			if (ret) {
+				coresight_disable_helpers(csdev);
 				goto out;
+			}
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
-			if (ret)
+			if (ret) {
+				coresight_disable_helpers(csdev);
 				goto err;
+			}
 			break;
 		default:
+			coresight_disable_helpers(csdev);
 			goto err;
 		}
 	}
-- 
2.49.0.504.g3bcea36a83-goog


