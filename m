Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D786C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 05:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AvQOg1tPoDT2meHewRVvm4BILZo75QenErRGTw3BX5U=; b=AvMPwV8YRpZK86hk+TtxiqcPd8
	JowxXNOrQI//KZnlpYq+p/gwu5tqsAIMYG77G72WvZtTMb+QbMLRZbXu8HJceskyl9Nte3YI7n+rh
	FvHJxRuFJCVkooPRl94MYdRz4KmK4guHUwCYrLClzKAluDPREwVtP/IhOTOVQKOlThckN3NmUdXWh
	CQ4AgoEefJGSTF+a85F3CkcfWPPFpENCpUl1XAhwPT/rfZL3LDKR7aQeTEQ3RlKzRlnoUtdf/pTjj
	5jPQppSNUBGmM8IDqBV2M673RqvVQuA95ULWUX5R/FeCedfDJUf6by6B5ZzpAkyzWrC33FuB7lndI
	7ZTF93xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOV8d-00000003T9c-36DB;
	Mon, 09 Jun 2025 05:33:39 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOV6U-00000003T1q-1CSR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 05:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=AvQOg1tPoDT2meHewRVvm4BILZo75QenErRGTw3BX5U=;
	b=OP+3WZHnqjLcnJefGNCXPvOIJyNhaV/AI6aKi6ETAnFOWcnwXt4JmA+G6Vvx4o
	mJBMvduyWSxhAiH5OqvrzgFfTZgrDT08wtWzEptDF9Plbr4UHoVL7b463733ZhOl
	CSu0fUEjEu1UulZudSBk1Q8LczQx9oWkDafIoIm331Nwg=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33+yacUZoxUA_AA--.25782S3;
	Mon, 09 Jun 2025 13:31:08 +0800 (CST)
Date: Mon, 9 Jun 2025 13:31:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEZxmlHmjeWcXiF3@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: Ms8vCgD33+yacUZoxUA_AA--.25782S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr47JF43WrW5AF13WFy7GFg_yoW8Zw47pa
	13Aw17CrnxJFyxKF4Iy34jkFZ8Aa95JryqgF13X3y8Z3W5Cr9xCr4UKFyfXasFvF95Ca1q
	yr4UW34xGFy8WF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTT5QUUUUU=
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBwvlGhGcZz+bAAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_223126_707894_17EA7372 
X-CRM114-Status: GOOD (  12.67  )
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

Hi Xu, Peter,

I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:

 - USB gadget is enabled as Ethernet
 - There is data transfer over USB Ethernet
 - Device is going in/out suspend

A simple way to reproduce the issue could be:

 1. Copy a big file (like 500MB) from host PC to device with scp

 2. While the file copy is ongoing, suspend & resume the device like:

    $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/state

 3. The device will hang up there

I reproduced on the following kernels:

 - Mainline kernel
 - NXP kernel lf-6.6.y
 - NXP kernel lf-6.12.y

But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down to
Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
connect calls got lost from suspend & resume hooks, when the commit were
split and pushed upstream.  I confirm that adding the calls back fixes
the hangup.

---8<--------------------

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 8a9b31fd5c89..72329a7eac4d 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
         */
        if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
                hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
+
+       if (ci->driver && ci->vbus_active && (ci->gadget.state != USB_STATE_SUSPENDED))
+               usb_gadget_disconnect(&ci->gadget);
 }
 
 static void udc_resume(struct ci_hdrc *ci, bool power_lost)
@@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
                                        OTGSC_BSVIS | OTGSC_BSVIE);
                if (ci->vbus_active)
                        usb_gadget_vbus_disconnect(&ci->gadget);
+       } else {
+               if (ci->driver && ci->vbus_active)
+                       usb_gadget_connect(&ci->gadget);
        }
 
        /* Restore value 0 if it was set for power lost check */

---->8------------------

But it's unclear to me why the hangup happens and how the change above
fix the problem.  Do you guys have any insight here?

Shawn

[1] https://github.com/reMarkable/linux-imx/commit/0791d25578cb0e46fd93ae7a3c36ff7a424f3547


