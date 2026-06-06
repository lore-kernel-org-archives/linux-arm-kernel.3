Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF692CD8C99
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Jun 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gt51o7gJucZDYngX+zezYd8oMcYGRKCaBEJDS7EqeeU=; b=f0OuptkeSyox9L
	E5J+AciEL3KHBmKo/97e5c/K3+NZPq1bp0MGZpjy78vjMvIfM/8m7ict4N7LJ482jcltmPq37wwPE
	B59DeZzwVn3GlarKMSeHa3xrfa6K0KNenqUCkEXAgIGC5OqqVqq+Bbzt9LAoPKYkKsGoerxUsgz2C
	YYpjaWC3TYIYi0WXWbedmOgF3bhlU8GVr5uRskkQdafrjpuZXg4wF90Tj2imNlfz/EoHEcyuso/ce
	78YstkvHMtYsJdBLMyUSw7TtNCFn599vkOgx88dEwtE4uXHS3mrsT5OnP4ViYNvNgMqgd12q3WD8k
	Raocn+Wqb92CNuyB5d+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVr2R-00000001c88-1hS5;
	Sat, 06 Jun 2026 13:26:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVr2O-00000001c7J-2qvY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Jun 2026 13:26:10 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so1981216b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Jun 2026 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780752367; x=1781357167; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gt51o7gJucZDYngX+zezYd8oMcYGRKCaBEJDS7EqeeU=;
        b=AcbBa/cWnI+r1cKvmBkS6HPdgEJ+PmrCQDR7gKMgiuLnH7/L71Fq70DkHZHBk975ld
         TlyGTCYCfSQEgWP+oaJKcV9H2O1pJ+3T1DSYxUOQmnxqCIMmv70d4K0o6Y8E70iV1aoy
         8Sejs8tpxn2kQN5+JyValrmflqJoyaCPSl+fp+QmINTZ1MKff1sgqNxLNkO5MHzGDSfy
         +9Fzwd6MBDHPTAh3IsnYOAqc6ADrvv2h4wpL4fQsz2sDfDwqpKNZ76TN5ycnITE2xzUx
         G9QefbzXSnT7lje872LY8wv/rVnEdBrmYRlMwIyatoSpv4SKSpbi89oiGn4sxL5OCTP2
         bA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780752367; x=1781357167;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gt51o7gJucZDYngX+zezYd8oMcYGRKCaBEJDS7EqeeU=;
        b=Tudpme7dV8TNp/9nBOcw5i4MVPKOnjeshxORF/KIv+5B9p3qj0Ms8qyMWQ/lJQfBAY
         VC9wW3kQl84cfszm8zVVJYtLTszTy3D9/L8dsR6vn2YhgAOoxNlE0X3lk/lrpOpfrKR4
         4JiOmS/IwfyjAblRBrlDFSsfASE2k2r1rOJAHSJaPL3gxPK8/x0rRcUr2yEB/+3mIHuG
         Aya25SR2dAlz2BAQKk/sXsDRAbJh+PzbZIs17hTNEmVlUGsYClUqKFaQ/hOtImE1bvkD
         +RIXIM4g1pUHuehJVkpsFYbdLG0KTxAR7cyVcLPE13VytYAic2+9kJJ5NOn+Ji7uLdjC
         Bbxg==
X-Forwarded-Encrypted: i=1; AFNElJ8MIeGG530LWicYuvj9dVbLpdGgso3CXx8jqwcLiEPlNeeYMAsegTb4lyLgFy90mMUu4p78XimbOk2uCJH8SFu9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5vZVyK934RASfPaU9cb2eTxrtYANVLir82yG6jsP7AdUroZ1N
	OfAbN2pqsQWByp4DzjQfNKbLJOMUKFLMezVryRZUShojbKLNBtFqViuB
X-Gm-Gg: Acq92OF34bQijOUxOH7J7BWLI357o2Kr/gJrC1GVyKmUJE36cQcU0pcW5Nv42t8rbGx
	JdDUAZGjwmNAOwQViwRhudJtmrZnLhvo2cfvnLQWMpH5jUM/NyHddKKMmvOS2dgJqkWxdnhSVqE
	eQVpWTzXuBuf79sSA1WUd2apWnmfVsggr0qaz+xZ3C3MCefGRekT6SvqM8uQbs7rkF74ktFIyIU
	AwWyzL5fiCCmcOa7pi09TnWovMYxid/6JL76tfRi5EH42tpoXwSdJ8mcOej1zN5ncQid0AtO6O3
	oJ/C/QGsV7HoPB9f/e8p9wWrA6Ky/lt75U2vcepC/mfinNNbfqEl2Jy1X/WXKExgazJU689l4FA
	YCQvVJn1GiadXXzveW83bKOnIwWHMImMHXOadGKwU0OZVyJWyRJDk/536V2pM9M8r0UspXGl3Zs
	A5kiXA5BFas74If+scbptbEvu0fc3Aj0nC7kJR
X-Received: by 2002:a05:6a00:2d96:b0:835:45bf:9660 with SMTP id d2e1a72fcca58-842b0ec1242mr8396268b3a.42.1780752367167;
        Sat, 06 Jun 2026 06:26:07 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm12910688b3a.59.2026.06.06.06.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 06:26:06 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/2] nvme-apple: Prevent tag collision across queues on
 Apple A11
Date: Sat, 06 Jun 2026 21:25:24 +0800
Message-Id: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSwqAMAwFryJZG2jrB/Eq4qK2UQOlii0iSO9uk
 LcamDcvJLqYEozVCxfdnPiIArquwO02boTshcEo0ysZnmJRzJjthu4I4X9gHpTuULvB+qUxTes
 JpCDuys9fn+ZSPlccjSltAAAA
X-Change-ID: 20260606-prevent-tag-collision-t8015-1c8adb3234de
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>, 
 Yuriy Havrylyuk <yhavry@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1728; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=N0iat9euPSfI1ozrhTkUFwtonZRHs7P7+pN8pw5Lenk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqJB/qkvWEJiDJdwuAwbXwF80g9Gz+3xtXU5NzS
 q5demgubFKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaiQf6gAKCRABygi3psUI
 JD/lD/9wdAdvVm893ZEs7t9U1NqvQU+m1R8joTO0MSFw3Gz/v9nkAmdgA3DJPgfPJeRAaH2pSln
 COt//d9nV78OoIV7Xd95emThXhNuWWzlZ8+RoipvZ39pCQH18BkE+/k4sH4OmnUfAc9Xn78sXEo
 RXEWIGapLa03efOgvdLSRlWKk9+JM96Ztx1a3uBM0ZLkaan8f6JiWfRyUotgH8FTHZIuYpDwe6T
 +0nx7r7otrfEDHJpCQgO1TsiDHdHGBztPs/DUkSFctKbn3cEBS1jEHBFeKVRlHRVy6xJQIMjZTk
 MDyYGyNKRBKQwygmHU3uVAoxEBu/Di2evar+aLhdUmDMUm9wMaWlKx2ogMsWoX4acncB3xBqCu9
 o/FGp5CAbrb4cXvYj8OahtZeHOFeRbJTsCu1K8GpNRtxwWaYufaTIOkW6dqb5H8CsUrEO1d5p/X
 Xq0XLnqCM5wQJ+CKsUSJ8moOat1zsuhE9NbxGcJNMM8wBUc0GqSLJdhUqZtp/dkHhw/VDSaEwXP
 z5hn2oPSt3ej2qov2bl6Ex2DZvnZGQ+XiTvXiEpmPrerMrp0qsDNNw2QtBqPsEUIJT2PsXtTOtl
 kfRVFEgnIK4Fl6vCImpzDD/YFhJGTnvAMttZJskctGg0/828A1mEjxc15PobAOXVCDT598oQRO2
 ujV8N80CPGZFGsQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_062608_734184_26332AAD 
X-CRM114-Status: GOOD (  11.71  )
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

Apple NVMe controllers require tags of pending commands to not be shared
across admin and IO queues.

If a pending command tag is duplicated across queues, the firmware
crashes with: "duplicate tag error for tag N", with N being the tag.

On Apple M1 or above, this is worked around by partitioning the tag
space between the admin and IO queue.

However, on Apple A11 without linear SQ, it is not possible for either
queue to skip over some tags and must go from 0 to the configured maximum
before wrapping around.

Instead of partitioning the tag space, which is not possible without
linear SQ, prevent tag collisions by keeping track of which tags are
currently in-flight across either queues, and return BLK_STS_RESOURCE to
temporaily block command submission when a collision would have occured.

While fixing the issue, it became apparent the admin queue tag space
is limited even on Apple A11. There is no reason to do this as it hampers
performance and does not help preventing tag collisions, so also allow
the admin queue to use the full tag space.

Tested on iPhone 8, iPhone X and Macbook Pro (14-inch, M1 Pro, 2021).

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Nick Chan (1):
      nvme-apple: Only limit admin queue tag space when with Linear SQ is present

Yuriy Havrylyuk (1):
      nvme-apple: Prevent tag collision across queues even if tag space is shared

 drivers/nvme/host/apple.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260606-prevent-tag-collision-t8015-1c8adb3234de

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


