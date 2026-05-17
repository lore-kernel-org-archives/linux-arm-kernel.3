Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15128CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 03:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PeTf6YbhDCerhwVHb4DL9HDXGEDRICUPG3HbIrPMyUA=; b=l+ivwQXQGTPf3XsP7gjdXAJZ4+
	/SQWHrankoBAL1oHLhOAn2e599mrhRWUn35wZG3jBUUkoEtJaN1+S+PE9ob0FN+RV+kFBCLBg63P/
	A2+M3Bp1g+Qr/Pty/YLCgk3/7oFHPyObHN2NCkZJWMxV3xn6WF5nWtRZn4bg99mOOiyXvVWq8lVrP
	KCyByqw8xVxk9OpniajDkID4bxosYNlCATBvR5CymP99n6W7c2U80+1ESUktb3p9Qj3OIVCSWRe02
	Q04rD9Pv+NKuThAHbwjpouSu9WaCK395yFqg+z5Qz5UXrRzGrH0PCNs7KDEJZnD2p3daLD6vjKCGm
	Bx4exItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wORnh-0000000ByGP-2H29;
	Sun, 17 May 2026 03:04:21 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wORnf-0000000ByFx-42sp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 03:04:21 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso5123034eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 20:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778987059; x=1779591859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeTf6YbhDCerhwVHb4DL9HDXGEDRICUPG3HbIrPMyUA=;
        b=S/rP2+O0j327Hi1VVN9RcQChbTgcs3xJYrB3CkIzN8719YVX1kJBUsFdTYMn2X21qq
         +X/oFeiCgjeyE2AjwTtczCd9VcnUzWx57O7Lru+sNhj0VKQZp1LHr6/aSm92QBUakxYU
         G/WK2kLCEebleDXY575k6mPrVjRfBbEezrhl5SLwpJAgPQWaInUloexjy6k1P83ZiTMe
         BWC4UpH6dP8HsZqXxUKF8YoZUiXbGt/emqPJC+ub0OV5lpqw2hzkBxybRR88yguediLK
         JS4cAjxMYj1l6Y0o+EKrusmG7n2nhQYeHL+Zd3M2yGJjWJnBIOVLahEdaUUHiQZxrou2
         quCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778987059; x=1779591859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeTf6YbhDCerhwVHb4DL9HDXGEDRICUPG3HbIrPMyUA=;
        b=WbX5SFNrF+fGo1JVoZVAYV8peGd2DCU+q6nCxg3UfqTwBbrE1xwrQKQ2npzQcY9sNY
         yestP8F4wcZhnnBFs9lkmcsPFdo6kdrohdW9dlBeZzMWfth+Jmtoz74JuprkUD223Ivt
         7yaQsnt0C+PmLvZ4I+sE3yIOTWAML/1HYabBCBG9WswE1EwC8FLTgAFgoZU6gh+LQXeZ
         2LNjdQoBoHohoWPtjB/jpdLAUseWDWODtvGx/07oItNimd+s7QIc+vqr50NgmotRImE5
         P7IV6MVgXGcW3Peg9ws+F/k+EpIp7+R7qCrplSOxBbAKrjbBsbPf65G7XRJ01E7ACya8
         0AAw==
X-Gm-Message-State: AOJu0YyL0LC1NUxY/JZKMpvnBe2lcULcoPWFfEBjYQsZUT6vyqqvotus
	Il3rhsITWLht3qN/IVT158bSMG2THvGcEZBg7ZnLFSCeiWHvW27glHHXjCBpYc0Oe9U=
X-Gm-Gg: Acq92OEYrck5TfcOmty15OyNxswwPTduhErWMu5XfrPKB+B6VKlp+cj/ttP5Ek+ehGp
	xhjRAJOwFhtKJE2u3WmpYeYaaxcOaYmSY4w8XNlFi1pjaOgSVdEUeYW/uabutI6wzZwGyFbGYDh
	kiBVY+p7yFf2cVqlZkjEofHJKqTKaChplE73QAuuuJeQA/xXL+abwYy9qBEv6iy23GVeKzEJ1AN
	WwqQsqdyOiEGsQR3KTSIqNqgbvxYQgWehDy8efx2ux43tNKorWEiN5NN16n5gf3szF198H7TmVv
	yn2ceKhoKPelM5V1ciatPU86c84yDw87mbVhgIyPOK+GwuTa/h62X0uos0pCeVlV/xJ7Y27Bkwg
	h0Vp6v0NSUfwSeGwICOk9Z3i1wcn2lWRUDT8xaxio2hqOvfdMhweUr/At8205JP/IIxJ7RFhesu
	2P1oPWibzy1g3R892+wZobH7oTLSR60d9BM5B2USIVUqzw1OSfMSiWFJgqrWenFTuuLFMkJywl1
	bBW+Rcl4OgsjSx8QulAtX26LrX/Mud0LXbXJxojjyJw7R1C8N+pgYvc9vD4c9qTNeY1pAQ4EMuM
	KZdOXcxTkcRobEpbrQ==
X-Received: by 2002:a05:7301:2c8a:b0:2f2:32bc:787d with SMTP id 5a478bee46e88-30398637044mr4061229eec.23.1778987059163;
        Sat, 16 May 2026 20:04:19 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc9d4sm10699910eec.23.2026.05.16.20.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 20:04:18 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH] ARM: remove unnecessary architecture-specific <asm/asm-offsets.h>
Date: Sat, 16 May 2026 20:04:03 -0700
Message-ID: <20260517030408.100043-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_200420_006102_68537C12 
X-CRM114-Status: UNSURE (   9.71  )
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

arch/arm/include/asm/asm-offsets.h is identical to
include/asm-generic/asm-offsets.h, and therefore the ARM-specific
version is unnecessary. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/asm-offsets.h | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 arch/arm/include/asm/asm-offsets.h

diff --git a/arch/arm/include/asm/asm-offsets.h b/arch/arm/include/asm/asm-offsets.h
deleted file mode 100644
index d370ee36a182..000000000000
--- a/arch/arm/include/asm/asm-offsets.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <generated/asm-offsets.h>
-- 
2.43.0


