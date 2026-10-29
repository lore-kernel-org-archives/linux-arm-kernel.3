Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qZegHnS0;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YHPWtqa9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=; b=qZegHnS0+LTuHacSzr13JD4ctp
	Q8ARQJekqEt4XLHcjAyQp0EG93KWrsF/JLcJN9h2rwPSuUYHEIn5ppelJ1gP64Ddl+wleHAC2xCiq
	bVZs0FqNnErNyHKfSxzBetRcS8wVvOrEjzfXb39ve1w79X3wL0a19zmFBjZAEIiKURVOUqnM/R7uW
	aDQhuaHzm2PSWddFYOq0bAhDrrfd1F0SHwiBnUF6DyJj7wqYmqG/Ylxf68HGu5z6wIXiW6kkvb3ll
	FWQRzw6NjSHVHE9hWYIbAfdp1wgNmlGuNLCaG3E+GTJH/mR48vwD02s5dJ69z6fF0L2qAyw+msUkx
	0RXgkvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYoT-0000000AULB-1OqZ;
	Thu, 29 Oct 2026 22:41:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYoQ-0000000AUKV-2NVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:41:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso337665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 15:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793313692; x=1793918492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
        b=YHPWtqa9skmFKlUyR2rMVAFWoxgQAEPH/c2aWeTQKR1ci+fc02vjojpHVKqWapB/jw
         rXv0XmMJiDZfuoFo7U+d9ArzwO7iCQ8QnaMogMJnWXjj1d738Sp8VSkPG6ZciN8ktfYy
         Xg2Hk4Uzs25Kxh88kdN7AQAVFY0OI6om7qnFaFgfgpxlbTPjdu1DW/p74haBy+FHODgn
         LkNlp3eXdWcn0RXpf7pjrL/y2wfddxS5yP5UMngwJw8Yb1uTuNSWenXdjL/Ls7/ijNi1
         yckeRPQRmqFensKrD8jR/2IzeyPXj1AQ6giaLlXA3Zda/00MSvS3JH7kVmwftt/Bs8cc
         VuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793313692; x=1793918492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lNXcmee9ZNuCiy3sE8z9e8aCfdm1832qnUnHax1I0=;
        b=mLKxLJEVK+HA5Ryojj+C/OTJS3WVTtTBL/Xp0CUIl657UktF/+o/U6SxTcIuuieWYs
         w1EZ9AD8JJaPRWN/Zqt1h4AZEnPb1QdkutNJPSK30rLjGNnCMA7FaBgcCylJaV6Yzt+y
         F5Bwt/noV6WRm5iN/g6d+R57HHDac6HObhLpk9us30jDItfCBk8izGPNplwUNp6iSsUE
         wtq4Q3dhECpqfvZOYKJlTRYdt6Bwga79qs5zYQuO3qnjfBPPsno1Jz+wOq1ql9xKRFNp
         NA3R/LDS7i6aZdP1CcnnzkRHmLzyIt8s77QVLkZqP9/4WQCwSmasTrzGnhouH2xCqoyE
         Lenw==
X-Forwarded-Encrypted: i=1; AKwUvBxHaDfmL1uNpD399mAF6g1fShRn1wPCLdf7pHegbgTvHTXZRbDECQfgd+PaxrR98D2ql/6W9o5heM96lvFZ3Clz@lists.infradead.org
X-Gm-Message-State: AFq9FYIGykGmy92t4uSAm5PJ8SxHfuGaWp1EeBIX5r/AV6vftTqKO+Qq
	DD8Ak3ot3Mh7LN7yLsrUyY4B560h6StgKhqsxJnyc6zAhP9Lc1nh5kOF
X-Gm-Gg: AYBFou1DVoT/kJV5TgZlt2lj5OK5ISUS3rATe191O3iZgIjHAH6y5qJjpN4ij0cKCV8
	4HPsFybRp6Yojkr4aDB9EsCAJ04xv6tMgD+m5OdM8Gpwacn9RUcgvUwsrQ+KfHb4o+S7Jw9S/0l
	QJlVOW3QT2JJOJrI06aLdC1pL9reIIwG24FTIywaLmEUuNvs8bYdMq+c37o75nJCyYpwDqIScg0
	WCg69QS1mHqszMebIPXNCEOvMnH27MoD5OdtRjUHsjRZCeUsVQUruB4hMR+9lVp04/+thrd4fEZ
	rhdtj8g2zAChHImc4f7uezRVGEjKgcy8rxMJ7kq46AVrv/S/+yjxrSI3TwIN6lFA2Sb9ggTckus
	mzdpHTmQH1Uge1vCGAfcyOqR5v63jdw2j0F+lChmiWsw4TpPLzyibRMlYnnxCc/NNIwPnZfT1X3
	j4E3XzcJl9iJIT3qYpIKRjZz2zUCcgqMRhrIgJvVT1ahprMlri2PF6zyF6TAqL5Clx+M5euufU9
	FKqROFbgRgFzJ0+dwugXfl7xd65Q+loScqKz/0X9k5N9HcTGWpqYlJWZvYI10lM9HTAm062BNfq
	Wa3Q6D0PL+DZeFPpD0ePQNxSHA5WrP5IQusU0UqqehZfNpq5L91MKopaojrG4AmN3QXAovJJc16
	sYoRb9LqPIWZwAqVfQoZmvq8R4eMm4P9RXoHB2UhkcM5MjsWTJiCIFZe/LLFq60HiI9A6147FMB
	5PeMv3wM2TwB4G
X-Received: by 2002:a05:600c:811a:b0:4a3:5d5d:48d9 with SMTP id 5b1f17b1804b1-4ac187a80a7mr6995185e9.35.1793313691567;
        Thu, 29 Oct 2026 15:41:31 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm89557405e9.2.2026.10.29.15.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:41:31 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: fix error handling in btmtk_usb_isointf_init()
Date: Fri, 30 Oct 2026 01:40:15 +0300
Message-ID: <20261029224022.1233751-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_154134_679513_CF5CE4F6 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

btmtk_usb_isointf_init() submits the ISO interrupt IN URB and then
sends the vendor command 0xfd98. If that command fails, the function
returns an error without killing the URB it has just submitted. The
caller then leaves BTMTK_ISOPKT_RUNNING clear, so the driver treats the
ISO path as inactive while its RX URB is still in flight, and
btmtk_usb_suspend() skips killing it. Kill the anchored URBs on this
path, as the URB submission failure path already does.

The return value of __set_mtk_intr_interface() is also ignored: a
failure to select the ISO alternate setting or to find its endpoints
is logged, but the function goes on to submit the URB. Return the
error instead.

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
Tested on an MT7902 (USB 13d3:3579) with 7.2.11 by forcing the 0xfd98
command to fail once with -ENOMEM through a local test-only module
parameter. Right before the function returns, usb_anchor_empty() on the
ISO anchor reads 0 without this patch and 1 with it; the rest of the
controller setup completes in both cases.

 drivers/bluetooth/btmtk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6a48ff0192cf..1b3dab0d10bb 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1741,7 +1741,9 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 
 	spin_lock_init(&btmtk_data->isorxlock);
 
-	__set_mtk_intr_interface(hdev);
+	err = __set_mtk_intr_interface(hdev);
+	if (err < 0)
+		return err;
 
 	err = btmtk_submit_intr_urb(hdev, GFP_KERNEL);
 	if (err < 0) {
@@ -1753,6 +1755,7 @@ static int btmtk_usb_isointf_init(struct hci_dev *hdev)
 	skb = __hci_cmd_sync(hdev, 0xfd98, sizeof(iso_param), &iso_param,
 			     HCI_INIT_TIMEOUT);
 	if (IS_ERR(skb)) {
+		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 		bt_dev_err(hdev, "Failed to apply iso setting (%ld)", PTR_ERR(skb));
 		return PTR_ERR(skb);
 	}
-- 
2.56.0


