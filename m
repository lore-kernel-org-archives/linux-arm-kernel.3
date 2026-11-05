Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA326606D82E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lvz104As;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=YWh8tyfE;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=hL3j5FXT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mlozEQJqTD17Kdg9fKmit8CMQRbYKQwG4XIhXLnNK9c=; b=Lvz104Asd9nEii
	rlGzvtuWPssgtXlFg9QYaCwgbOXBxFOJekKoSo3ZN8CJML7jOs91PJwvqHOwmGS11C4XhSzdtPWCl
	7I6TXlWRyGewB3zhTHAvW6Fc3YUrDiSOsb0LGm8YgYMKeEC2w/KGrsQQ3WDABvRMyKLt7EcdWhvnS
	93xIwfBmsa9XZQUXPwJ8AGO4L+hcG4gD4kf0Xe9dYgevI+dnhY9sbzJryDKgSMVf3O+r9sbGW5gej
	BUcwpo6cMRTQeZid1LUsaUQR4IQ4Yud+0CRvOE36TqPpexKLJsmz8+C9BXoyGp3VRW5Dy082PKxLP
	DKBclJy6QiJwkEZVA8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14x-00000009qn0-3u2b;
	Thu, 05 Nov 2026 17:16:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14p-00000009qik-0fwE
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mlozEQJqTD17Kdg9fKmit8CMQRbYKQwG4XIhXLnNK9c=; b=YWh8tyfE3BGybUOK24W9d4jcNT
	2V13uxnAK7XGEwNkOEXxgSkNoRdYoa4yvdLqTQfxT70Yks8sARrGJ86kIVuur01wWV7YGo5EOoeyN
	/f7l8q8HTgxFpa+jEaDhUz7Vkrp5tgNrdMUkRyG6soFHukVPbudEQq8x1NKjN8mCZA1/fTKSVBTTI
	b9L/+VRl0V5dWbAt9luY1aZvGLer2m7S2iPfgviP0pK6i++5RpWYCWDucRzb5DGj8PMm7aA6I1Hzo
	0ISaiUXDCrWTI94FpjbhVHEtF/hEYKk7apLefd4iw3Aov4eAbhXoZhx7/ifwzWoDZYi608IzLjngW
	rFlQGRMA==;
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP14l-00000003KQ2-2KQu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793898995; x=1825434995;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=3jyyUN+2uw6JFBOwpE+o/eA+FGjKrA2InO/IUR82Kg0=;
  b=hL3j5FXTLN4j6bDYEBVlrHen5DymYNh0iS+49R/Gb2E4DMTr9EfxrU60
   HMV5CGkbMpGr3OpZ8hjTj22rdJAwWDhAUW2sqZDEIfQzwfe86MXvkrzjF
   SqIQXbS8beC+cPMJr9X6fo0CB+wl9Nud9/Y83+I97JIfiuo3+H7ERMFC5
   ggCJ2EEIjcNU0AZFOzXFfBwiSl75fZQjgwncwlhB3FKndBfRRLNuBjkqb
   m6qL0c2dPpzoy6zPESamgl/j213kWxqR0eT7yFFA20ye8uakr2/j5PPK2
   mJQ92+DL910bFB4t1U62w9oL5M33J6+wymDbv8Jro86sBPlNmiF7Wezkl
   w==;
X-CSE-ConnectionGUID: r8XgZcLvSViWzkJ4LTFhqw==
X-CSE-MsgGUID: jdhbgyTgQHu+P5nR3p7p5Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 19:16:32 +0200
X-CSE-ConnectionGUID: Q2rOifoGRTWF94W7W8RBmQ==
X-CSE-MsgGUID: uJOAv3ouRK+VlizjS+FESw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 05 Nov 2026 19:24:30 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 05 Nov 2026 19:16:30 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 05 Nov 2026 19:15:26 +0200
Subject: [PATCH RFC v3 05/14] i2c: trace: pass message length separately in
 trace_i2c_reply()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-i2c-fault-reporting-v3-5-515ad74ac4c9@mobileye.com>
References: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
In-Reply-To: <20261105-i2c-fault-reporting-v3-0-515ad74ac4c9@mobileye.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171635_493246_74C2287E 
X-CRM114-Status: GOOD (  16.24  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In trace_i2c_reply(), add separate argument for message length and use it
instead of taking the message length from struct i2c_msg. This allows to
trace the read data of an interrupted read message.

This is preparation for implementation of detailed transfer reporting
feature.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/i2c-core-base.c |  2 +-
 include/trace/events/i2c.h  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 12b49c01baed..3dd7ef02c562 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2349,7 +2349,7 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		int i;
 		for (i = 0; i < ret; i++)
 			if (msgs[i].flags & I2C_M_RD)
-				trace_i2c_reply(adap, &msgs[i], i);
+				trace_i2c_reply(adap, &msgs[i], msgs[i].len, i);
 		trace_i2c_result(adap, num, ret);
 	}
 
diff --git a/include/trace/events/i2c.h b/include/trace/events/i2c.h
index 142a23c6593c..b3267dcec420 100644
--- a/include/trace/events/i2c.h
+++ b/include/trace/events/i2c.h
@@ -88,22 +88,22 @@ TRACE_EVENT_FN(i2c_read,
  */
 TRACE_EVENT_FN(i2c_reply,
 	       TP_PROTO(const struct i2c_adapter *adap, const struct i2c_msg *msg,
-			int num),
-	       TP_ARGS(adap, msg, num),
+			int data_len, int num),
+	       TP_ARGS(adap, msg, data_len, num),
 	       TP_STRUCT__entry(
 		       __field(int,	adapter_nr		)
 		       __field(__u16,	msg_nr			)
 		       __field(__u16,	addr			)
 		       __field(__u16,	flags			)
 		       __field(__u16,	len			)
-		       __dynamic_array(__u8, buf, msg->len)	),
+		       __dynamic_array(__u8, buf, data_len)	),
 	       TP_fast_assign(
 		       __entry->adapter_nr = adap->nr;
 		       __entry->msg_nr = num;
 		       __entry->addr = msg->addr;
 		       __entry->flags = msg->flags;
-		       __entry->len = msg->len;
-		       memcpy(__get_dynamic_array(buf), msg->buf, msg->len);
+		       __entry->len = data_len;
+		       memcpy(__get_dynamic_array(buf), msg->buf, data_len);
 			      ),
 	       TP_printk("i2c-%d #%u a=%03x f=%04x l=%u [%*phD]",
 			 __entry->adapter_nr,

-- 
2.43.0


