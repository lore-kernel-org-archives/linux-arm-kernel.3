Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B8ACCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwr8jY4tfv8gNGyWz73meGsYksDOkZoFOfsAUctlsxE=; b=Nn4Kiukx0qiXwiJQOMmAnQaprg
	Ct7JhX47ULNXmfzYvVOPDFZWm24PtslbYvO2rsSNR/eRI03zT/l7TmrJMRbpn1TB4wIRel/UL855B
	3Waz4KmoSo8kx+4jEBo3/etpD19atHoLza4hLt7E/qDnio2/H514TN2x7Yk1N2S77eLmjQjbiU2ms
	EfUvddrKDIcUSyi84mp7MBatT5y3mHz+UQK3yaWcascOybvdzXBhJSAMg1QIwPbHC7OkJHzGKA9Xd
	l40ws48FpOgMGRfcNaTFyAbRvEn06Y0aNW21CBdBzSRGPeCrl0BjUGHmoEHLB5nr4BGIxmoxr3T5J
	UbiCbVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3So-00000000m2N-3XCa;
	Wed, 29 Oct 2025 10:31:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Sl-00000000lyU-1jIb;
	Wed, 29 Oct 2025 10:31:32 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9557311DD;
	Wed, 29 Oct 2025 11:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761733780;
	bh=wPwLQXSELR0ixBqTwTTJFnBDsK4IZ1P3IckTUrJ9amY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T0QfsYMFrTEo0tcF0OduiTysUSlCbLTfZTSutctxMaCul6A2p936Abix4HmTjd82D
	 kEZ0WGzkT0WGriYtZagpgK62VVb16uOWuQiWonX/4bOyqSOHa9b2rvGU/9P3SgUz0+
	 eHN/z/IgFkNdBl1H9uH8RboLtC4IQEREZdSIoznU=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 29 Oct 2025 16:00:09 +0530
Subject: [PATCH v3 5/7] staging: vc04_services: Cleanup VCHIQ TODO entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vchiq-destage-v3-5-da8d6c83c2c5@ideasonboard.com>
References: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
In-Reply-To: <20251029-vchiq-destage-v3-0-da8d6c83c2c5@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Phil Elwell <phil@raspberrypi.com>, Umang Jain <uajain@igalia.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=wPwLQXSELR0ixBqTwTTJFnBDsK4IZ1P3IckTUrJ9amY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAezdMJ1O8pQVmB5jUByA2R6K4BKl54dgbBTjl
 x8IGOtViQ2JAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQHs3QAKCRBD3pH5JJpx
 Rbj/D/9vlEDbMgomGvt5ehFPRPdChwLo+N59QY+S38u/sGKWHaWBI59dYVQK84U8uRHCNSwtk97
 BRHe+1Kgfrk5YGJCvno+KCG16D8jtuRwltG+ESy4ycAPh2W7snrNNr2AVAyJJdyR7XbdSUHKNbI
 4ptZ7EvlWZpg0rTiGUs4W+ZUIl0nCVYNgnFYsc9x7YCln1L4mZ4mr4fWq7Oz5MYotP62+bzww34
 6qTxUAYUye91glfFzbApgjWv1g1y0sd5iublxRR6+HK4tSPnRaYxXLWva5nFxRT86sTTgpjTRc1
 LLKkV9vCSRRYI0TJ/HbBqvk24eRvhymFN2n8kNywTr/Xdtrl8ptw0ye6ICk4ZiswPEqfetAVwLi
 +kIpZNe08KMuFTVjjCx67x08nJ3TX4F7l9Kw92V395QbNYjdURb6TouhcaBkqBXR/5t7WNQXxGG
 h0CYfh1PfhUramxNJ0KYqlCOOuq2yeOjmFicPIk/pOjdbRE4fW3izI95h483ByMMsDrDWvdaIIz
 BGkAl1ZGjuhAJF0yemOlql9d/xTxuxA2evPhX1crWzPCc9ooDoEgb2O3Ww1c1rYjirbbKhBkixS
 P++G56puqqABeGXqnv61nC2vO48REz5v6pCl1p8Nr7/8Epb9Mv7pjQeQgDep4v5+EfzKtksbb8h
 6AayKjOcr+OZdIw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_033131_604285_42D67656 
X-CRM114-Status: GOOD (  15.06  )
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

Raspberry Pi downstream drivers using VCHIQ have changed a lot since
kernel version 4.4 mentioned in the TODO, and are tangential to the
destaing process - so drop those items from the list.

Secondly, the code indentation for the vchiq interface driver is not so
bad anymore since Umang's series (linked below) got merged, so drop it
from the TODO.

Link: https://lore.kernel.org/all/20241013112128.397249-1-umang.jain@ideasonboard.com/
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/staging/vc04_services/interface/TODO | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index f6f24600aa86240fba77169f62f3e657e42727c3..2357dae413f102df49a233f7263ad0299bfe004a 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -1,28 +1,4 @@
-* Import drivers using VCHI.
-
-VCHI is just a tool to let drivers talk to the firmware.  Here are
-some of the ones we want:
-
-  - vc_mem (https://github.com/raspberrypi/linux/blob/rpi-4.4.y/drivers/char/broadcom/vc_mem.c)
-
-  This driver is what the vcdbg userspace program uses to set up its
-  requests to the firmware, which are transmitted across VCHIQ.  vcdbg
-  is really useful for debugging firmware interactions.
-
-  - VCSM (https://github.com/raspberrypi/linux/tree/rpi-4.4.y/drivers/char/broadcom/vc_sm)
-
-  This driver is used for talking about regions of VC memory across
-  firmware protocols including VCHI.  We'll want to extend this driver
-  to manage these buffers as dmabufs so that we can zero-copy import
-  camera images into vc4 for rendering/display.
-
 * Documentation
 
 A short top-down description of this driver's architecture (function of
 kthreads, userspace, limitations) could be very helpful for reviewers.
-
-* Reformat core code with more sane indentations
-
-The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
-indentation deep making it very unpleasant to read. This is specially relevant
-in the character driver ioctl code and in the core thread functions.

-- 
2.51.0


