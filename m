Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFF1EF06E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 04:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+bhAXarAsiDSi4QI3h1a+wfZmeyXg3FMQowAFnpxGg=; b=BA/yZuX+ylF9iRKDgczWEa5g4b
	nzHJcCjXxKhHArxy6fOn0PzVq6LuRmIFLEFFJ40u2aa8Fh42ozMTJs8Zsj7PWqS0D1ZCvHOD76OLe
	MixHG9X+If+DsurZrPPuLiHIPfGyJ3Mxdz0X67Ea9mhZuwEDBuZ45GjgW4Vy0X0+czyD+xUCvP1MC
	H5pG8B99leStNb0poJ6r2JpOT0dhsF87FrLlGXwXzTa1zAc862FWxncfAgnqFwJ6WTwJHLw9ILwv7
	RtyOA+8HUrfCay0r/gUEzpTKRvwUUIggB0WcfHKlYmFmL7ENypGuyzQLF8g4D1fKH9kKx+N7Y8Bdx
	30p1hNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1v-0000000CzYY-1YqN;
	Sun, 08 Feb 2026 04:04:15 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1s-0000000CzXq-3ZFk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 04:04:13 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1248d27f293so8708715c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 20:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523452; x=1771128252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+bhAXarAsiDSi4QI3h1a+wfZmeyXg3FMQowAFnpxGg=;
        b=KCPs9XHQmimfxJjPbP3pSQWtEoUz7D5WVkgInXK/dcLLdzB4vA1Lb/fVSf13Wigshd
         aMghyyMnmMPfTgJdsosfqlYngxqK/ykjX13WzB8LfjaxXay3GneVdmP/g3VC6oD6vJ1N
         6F3VDoL+OMpONvSE9Y5WF+2p4MAvyetx6LJi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523452; x=1771128252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+bhAXarAsiDSi4QI3h1a+wfZmeyXg3FMQowAFnpxGg=;
        b=IsPjC0T1TR1iz5RiwBD7MHTI/xOYX8G8eyJ4uVt7ffugh9YFguj1GEs/QywLZ3bzTJ
         gmA7hxi7Sxto1vNv1AfUWcTUFnz/BzhEUYiJ2o+2TjunKsc8Vc2+o1TngOlmMwFppXMz
         fwxu84a9UuVanJgXNhejyKuSS8h/kC6qSVAtWnPTzntA7rTYbUStOAi1uodno35bqQJV
         IY7uh11fMIA7Ee4mQKVUs3wiaRCt/ILMlCWRIAYw43TUQ61qPwwUc0bDeacf8RzPDFKx
         rLOX1i55h8d+q3cf4UKDytDwgE8nFgj4GMWiOYGMSRWrZGMDnA8Z51UqvbhGDCZir6oh
         tXrA==
X-Forwarded-Encrypted: i=1; AJvYcCUO7TKDOLFs/1DjVUqxFWs71DKM4jPH5PhKlvf8EoanyNpB3J9qT+hm0m65OwJSdOEGYpc1R1BX8wtTQzRhjTFr@lists.infradead.org
X-Gm-Message-State: AOJu0YwWDCrkUTRgsB2hf9ztjx8mSEUVasVvkQF3Sh7F8pmfb6FnIxMI
	gkmml/SaiRlrBM3GMuD3i4a/c91I7gK3cG12+E5tOWg4iScSqtABB3inxjjoMfsgc65CbvA8V+H
	xHKc=
X-Gm-Gg: AZuq6aJxDJ7LS8wJzl4AigwconYvhtx1krhq/IAhy3l/I1dA/MsP2pBDQF60UCinJ39
	3cQa4m4fdoVqh4XcjYy2MfTGar1zTrJe4LfMiM/acmb9hAruLdkDkWe8LqhDm/0b1bBfIU+h/vp
	gtrUsb1QoqhHjkfIp+G7cs5ZTZDyYJmT3kntSUD1haKXTXnbJfThJp/r5Z1XDkoWKH/cl/t1gn6
	xDMKUiSN+H5l3cKVE3LpUAcfs4B2Ammv4ykw5aDbxBxSvhHQoNwnOEEPPdDXGCFPKmsSzFPKdt6
	f5uPM+XOTur5LiLSTZRmLoiajU2GMMSdHNxY418ASReypmWDp9F6ZNkmsmRzldQwIqkJULffglA
	ITXQJW+zRkD1iPeK4mLzGv5g159dqptibpzcZ4r4zPa0hb9HY3i5lKNav5+K1tnpfLNgXUAPGFJ
	k5aOyPI5jSUCRSQO+NKWvr7T2L/GOUC0gr4vwX7O3G7Y+ZcTDWZYQt0sg0QqbWtvdKiUWPIdE=
X-Received: by 2002:a05:7022:6ba3:b0:11b:8278:9f3a with SMTP id a92af1059eb24-12703fe4606mr3754776c88.8.1770523451893;
        Sat, 07 Feb 2026 20:04:11 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:10 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@kernel.org
Subject: [PATCH v2 03/15] firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:25 -0800
Message-ID: <20260207200128.v2.3.I4a01e1fa771c0b1ea7e35882784e4b7f8f33f65b@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_200412_892709_9760B3C7 
X-CRM114-Status: GOOD (  15.29  )
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

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

The mbox_ring_doorbell() explicitly documents not to call
mbox_client_txdone() for doorbells, so remove the call.

NOTE: this mailbox client appears to send doorbells and regular
messages on the same mailbox channel (smbox->chan), so it needs some
extra attention. Specifically, the new API behaves differently if you
ring a doorbell while a non-doorbell message is in progress. I don't
believe that this is something we have to worry about with this
mailbox client, though, because the code was calling
mbox_client_txdone() after sending the NULL message. Had a non-mailbox
message been in progress, that would have marked the in-progress
message as done instead of marking the NULL message as done.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Given that this mailbox client appears to exercise the mixed
doorbell/normal message case and the behavior there changed a tiny
bit, I'd love any extra scrutiny on this patch. Thanks!

(no changes since v1)

 drivers/firmware/arm_scmi/transports/mailbox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index ae0f67e6cc45..c4561441ac2e 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -324,7 +324,6 @@ static void mailbox_clear_channel(struct scmi_chan_info *cinfo)
 {
 	struct scmi_mailbox *smbox = cinfo->transport_info;
 	struct mbox_chan *intr_chan;
-	int ret;
 
 	core->shmem->clear_channel(smbox->shmem);
 
@@ -338,12 +337,7 @@ static void mailbox_clear_channel(struct scmi_chan_info *cinfo)
 	else
 		return;
 
-	ret = mbox_send_message(intr_chan, NULL);
-	/* mbox_send_message returns non-negative value on success, so reset */
-	if (ret > 0)
-		ret = 0;
-
-	mbox_client_txdone(intr_chan, ret);
+	mbox_ring_doorbell(intr_chan);
 }
 
 static bool
-- 
2.53.0.rc2.204.g2597b5adb4-goog


