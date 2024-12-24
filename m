Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08228E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0GYJNCreNKeiqS8nDDLgAEq5nbjMlv8pyHF1gavhYhw=; b=2NNLD5d5u3QKxYn3QFKm4ePufa
	N0MIvmCZPhLlz04dkZA3x788Ibe0r2p6UIy6zBVuzIC2OTWGUMA0BFMHivvRBuHwBKZekXXgaBQb5
	deMrfGmeprdN1pKvXYkkmwvapskA+jH8ygxRWKPxTdG2CIpcN6XuYyOYlOEETVz87b3zWkghu897Z
	DApXFAuFi9/XeMuQewQ9eSqwqMfuj0qzulL1BiIZ42F7qd4mVRX5kQZG9X5kWiRcZ/jCd2ut2QB/d
	3gyD7Mt5zymO9lDUcgtpB75dSKnspuf5AgMMThEmN7WQ/PFv5G5iJPb8raxjiHLZyIG8s/whIHrqO
	NcLSE7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5Y2-0000000C6e5-2z7o;
	Tue, 24 Dec 2024 14:06:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ5TH-0000000C5xi-1r6z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 14:01:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A10B01FC7;
	Tue, 24 Dec 2024 06:01:40 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 03A8C3F59E;
	Tue, 24 Dec 2024 06:01:11 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Tue, 24 Dec 2024 13:57:50 +0000
Subject: [PATCH 3/5] firmware: arm_ffa: Align sync_send_receive{,2}
 function prototypes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ffa_updates-v1-3-01233aba3e1e@arm.com>
References: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
In-Reply-To: <20241224-ffa_updates-v1-0-01233aba3e1e@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1948; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=llehAUqDTyE8tsnbqX0XKeEGbtFXiSKUAGLSD+1hoi8=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnar6lKJfdHam6FeVWG42YUMpXeCsFSzOJsUilN
 hH0jV9Mu2qJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ2q+pQAKCRAAQbq8MX7i
 mN82EADVvfvkYjVUKuiZ//EelRKjidbK7CzDOqavttrf0Ekezz4zeL6HxKSsNoyHDEghl3PU3/p
 c6QPtsp8pB0p9V8xQ++5xVLPdQx+N36ymHJbDuPa277xTgr34efa7KFbZQnRPg72xPBj2fCruvt
 rAGi0u+E6KRQ/7mFvNLcb6ZSs1O6mDP6dYo4fKtahXrR8wzqLz6bHPgQOCB9Hfw4quZQFgkg5on
 E35cdOTk5wCO0NR4ZIF2sr7VqREvYkajyXKbf3faEV0nyCJbOBZZ2u+KsvZMAAuQCsnHNXvtf3H
 w1WNjbiBnK8Q/TbZ91ceXE5P/2GulanKGN4SK6OY2Na9GPckTAax9TsTwLG/QZ/sTcwpw7/rYYr
 Fm84nspk5FMtW/ZZzhzlyUYtTePnAH8NS5wpIvsxok+KxXHhwud6POD6ZAi7sXHp/49JZJvMf2+
 VAKxDFtHMTdOqnpJmJySFt17dXLm8N1xhBZlPrwga9BWMy+l1+kT643yLeS7l2jr5gfb2t8D9F0
 3Cm+JEU+xPS4axMeY5B8nZt5i0N986t7PO8AwTP9Ni8XsCg0bELi6MWi4HHKlRbJmkS0W1yvTm5
 +6/JWa2ABoVG+M8yUPp4GkETmMUV1B9GDRoJBQlWZr7lbqcLwEYHJSw88Oqjjabk4hytGDTddEK
 ScRstBTdD0ExdOQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_060115_534440_F7208586 
X-CRM114-Status: GOOD (  10.02  )
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

Currently ffa_sync_send_receive2() takes UUID as a separate parameter
instead of using the one available in ffa_device structure.

Change the prototype of ffa_sync_send_receive2() to align with the
ffa_sync_send_receive() and use ffa_device->uuid.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 4 ++--
 include/linux/arm_ffa.h           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15612168cdf0ef94022e00c08677b5..037e0d684994fd30971f40bf139367d1e45c1bf0 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -1018,14 +1018,14 @@ static int ffa_indirect_msg_send(struct ffa_device *dev, void *buf, size_t sz)
 	return ffa_msg_send2(drv_info->vm_id, dev->vm_id, buf, sz);
 }
 
-static int ffa_sync_send_receive2(struct ffa_device *dev, const uuid_t *uuid,
+static int ffa_sync_send_receive2(struct ffa_device *dev,
 				  struct ffa_send_direct_data2 *data)
 {
 	if (!drv_info->msg_direct_req2_supp)
 		return -EOPNOTSUPP;
 
 	return ffa_msg_send_direct_req2(drv_info->vm_id, dev->vm_id,
-					uuid, data);
+					&dev->uuid, data);
 }
 
 static int ffa_memory_share(struct ffa_mem_ops_args *args)
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index abd0208f0f74c15ef4ee4c81de81eb7800a0eb1d..e8b8ae8b192ab11d5550c16fd33fa9d192b07f67 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -439,7 +439,7 @@ struct ffa_msg_ops {
 	int (*sync_send_receive)(struct ffa_device *dev,
 				 struct ffa_send_direct_data *data);
 	int (*indirect_send)(struct ffa_device *dev, void *buf, size_t sz);
-	int (*sync_send_receive2)(struct ffa_device *dev, const uuid_t *uuid,
+	int (*sync_send_receive2)(struct ffa_device *dev,
 				  struct ffa_send_direct_data2 *data);
 };
 

-- 
2.34.1


