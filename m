Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F07DC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KXqTd7PPb7bWRRZjvBJh1gwkg1xwH5pZvn+1xoPIRo=; b=ucJuYBQqiqrVzldb9OkvRIc6z9
	fddy1bR4qMI7uOmXb3WFBAqGE5n0Szpp+dq3H9Bnl8XqQVPGt0P5wRp3If/Df7e0fZ0RYC/M4xpKY
	LeUyLjgQQ1BMSR50HhN3G7UsTAR1H9XS+9p1fMM1lGClimNJPxe6iJDDfpwqBNlBGF39NCCvwY4+h
	E4AC2Mmz09CA1pKJxj6sa1D57bHbf3HIupfQyYJnNMl/im7AoXBoUXOwEbAw54jdsGuQEX2ZsecO9
	t2uY4vfY9gGoYXvK5nLuAVUTYBTwae1XMiM0rnqJM8b69fTtcU/eCEBMcJxjTV2fEYGHJwZDAPlyw
	B31E7j1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9ih-0000000EGwL-1fak;
	Wed, 27 Aug 2025 06:33:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur9aq-0000000EFpl-2b9o;
	Wed, 27 Aug 2025 06:25:14 +0000
Received: from mail.ideasonboard.com (unknown [223.190.80.94])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E03F8300E;
	Wed, 27 Aug 2025 08:24:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756275848;
	bh=oxgoNFOnO9Qd7ov9g61UmXAsIpwnrJppNkMBXs+e4Os=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rbDgvQ0KaD8nEdfAISGE4R1o/OuWgVvPe0wSt0RfGq6QHAMzh7gbALvjPDm3C/yuB
	 VCUg0IhGlW57zoBdwdzK3Z0ZCpPCDVSSwgHS+yChCxG+KiE7zMUzpCotOphMZ9gP6h
	 xmQJVR1W344qCy7pUW78ZOB8W+qZLB3gQ5kmDXws=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 27 Aug 2025 11:54:09 +0530
Subject: [PATCH 2/5] staging: vc04_services: Cleanup formatting TODO entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-vchiq-destage-v1-2-5052a0d81c42@ideasonboard.com>
References: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
In-Reply-To: <20250827-vchiq-destage-v1-0-5052a0d81c42@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=oxgoNFOnO9Qd7ov9g61UmXAsIpwnrJppNkMBXs+e4Os=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBorqSaJ9hpyGNWfMMl3VFVfPZ/dAIfR6p5Dtzp/
 0tDnZ2tvkKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaK6kmgAKCRBD3pH5JJpx
 RVfvD/9FA4ZMcYtquE5NriSJyqWfJu9WPllIsiorvJLkTeSIrgEW++iIoBgcJ15R2a06jguwIbB
 a5zwHHKSZl+/FPd8B7Im5mUBJcIYyMlwkZaqOueF7DK/4DoaAWtAfqf3u21+1Z0Idk2/Ebh2Fc4
 NH8hbNJIFQzOV9iDH6mMDlD4VYfES3KLqYE7UVuqNrbm0UdAPBA4rH6Uk1OeJNjL2DD+dD1TsoD
 2geJVanK2rvOp/wmA/Xk8+Uv+XJqs5lXRQO0fRJzBqIEzlam9d9nQo4JT3Sa6CG+GXZ7P09etwL
 pZwfb9NEYLdt2rjKLMRDJ11aVO9rNCwEyvuQF7+5INmbPa9hgZw/BI0OiQ0aNIgq3FJB/xnTVKP
 7n7TQcq48BV5SCA+jeEtTnqK3EpkmYmGZWkPRNdE1+sKtUUsFQyHzWXR/Jh7OPw8Uk4BvghEAfe
 Wc3ieThVt4PvuAPg2d8G9mt5+Kw5BWpp/y9A87m6XytBgHH8t1ChlbBeRMM2yWz00R5Z8yhjSK7
 A+VCBgFjoFFYfX+RtpCPUtD2T1ms2H+dA1RyOdJc7l+UsHcM3kfNyhAbSedXFGAk3e1ZPRyFmtF
 DKR37cHkt5Ve01hC9DKz/3rk/Pl06RkLjjtHi4eYETqWF+Kfh8NdNrtl7FuR1sxgz20VoFGZvKP
 8k8S25FTGZSgLhA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_232512_800892_E5A47F8C 
X-CRM114-Status: UNSURE (   8.94  )
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

The code indentation for the vchiq interface driver is not so bad
anymore [1], so drop it from the TODO.

Link: https://lore.kernel.org/all/20241013112128.397249-1-umang.jain@ideasonboard.com/ [1]
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index f6f24600aa86240fba77169f62f3e657e42727c3..6e5f27db88ba8e533ee1fabc3091771d8efe66a2 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -20,9 +20,3 @@ some of the ones we want:
 
 A short top-down description of this driver's architecture (function of
 kthreads, userspace, limitations) could be very helpful for reviewers.
-
-* Reformat core code with more sane indentations
-
-The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
-indentation deep making it very unpleasant to read. This is specially relevant
-in the character driver ioctl code and in the core thread functions.

-- 
2.50.1


