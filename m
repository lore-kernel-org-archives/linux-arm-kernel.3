Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y+GutL69;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPR1Iezx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=; b=y+GutL69YvvvqD
	aa+xoqiAoCNe/lXmL/+gvxc7ujUc0rafFQlUB3X23ajY9YfPHgNYs3zajZa5q1cpIIgxkgBnlUGr3
	dg8Tn94YmkbLQQ065Z1xlwWjBFg4w6MogLm7Ep00TJRagO4pay8CjCNePnIze1ZZyvclNJE1OeDcn
	jZZG159guAEGsYKYfl4xRiycOonIv3GQeibHYXy91CP0LgJ6wAsJ+D7VJXJYY+239S363zMepcPCQ
	v15S9+7Kt/n+yE7arHQDA/WxI1Vau+j6ZG3sSzfamGd0zGoqQx4dyV4ET4c03JBKf69hJhxO99K4K
	R/xMTkZUxqsbT+9YmC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEp-00000003jTf-27ay;
	Tue, 03 Nov 2026 21:40:15 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMEk-00000003jOr-1cSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:40:11 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-8451a619da7so18352a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742009; x=1794346809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=qPR1IezxPa4BCgNwpN9tNOB0FjjisYuVpubTPN4Kdzefo4EaXQtgVEq/Qrgu9KNY7C
         NnmBxTUcSPb5A2VQbjv1r/SlqUHVcoM4Dpx6xGkyw5ql7ZaE3cYL9fKvIJgOk/Cy+pTE
         e3ZTWHJ1Z43VabDcj1/Q/xvCDEJti4EutjatWZxv47bPeMnJ/lP0H5XlAwzDJSvLXgAp
         rGuzhN+RTPqAuxedeqtdJo3vu46xOYl5C/olZa1UkbKhIcPYmIRNOqZy0Dxu552yxzE9
         52wYJWuRrrzAshCCZL63h4+OEH5In1NYV/hv5b5/NLTL6nmjqfQt/k1tE++z8cqA2nA2
         rpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742009; x=1794346809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9v6fhE64vJST/e4wIKc/qZZ4G1qcfWVja1/2g7y5JFA=;
        b=MbKljfRKDSrylyLf3mMQMc/3skE1LAwKp1FqXnNKJZRfpOZmr/vZJe6YqDKU6yZfjT
         iu2QtyQRw5k2Bj4ztDIXTnrqLym0VDKJePCENQzf2nx0EaOz/ORlwhsU1lEbspsI4cf9
         pRG0ZVjtKkj1igWdq89cOgxjT4oNfX19YrdtireUig8Qp9AYDHcHKvGP0xtZTcHQ0rEu
         hR1TiE0warYtC5Lfj0kLCNYtx2XStOwBDg0UJv2sh7EvseSe0yP2i5qf/WE321C/92GB
         H/sq7EN/+eLUS691Q+/3RBh/HkGL1vScGSIHT5PeAovETpOzAYWTO4IvEMqB+tV9skfv
         PeiA==
X-Forwarded-Encrypted: i=1; AKwUvBxgsq8+IS3DCRjn3swocJPYpKh8Q1CRCtyD3/A12YxtzW6vVZYSLhugm/CflGrUZDTPEmpK4dpTYuu8UgnLQnPs@lists.infradead.org
X-Gm-Message-State: APuU4Z/oMX4VYMsr6hC780BLnY7pV5nu+D8BmZFUovXD/czEJvTa1kJS
	WTIbZ7G+8rb2DDTLtz0oI/nAeUfZjCMiDR/NJD9+EWfl3ZT9WDW+08k2
X-Gm-Gg: AYBFou2r2fdJoSS06+kE1eZT7bUzTJZnayeUYlXgfWkcRdfIB3E2BpacwJ+u023/u0F
	N/EfMkAh//pPcxKRtgIlLCfTy9gnMRYkPmO/YvwwUCO84uVoldB+LgcLU9bh4n67n17uUYJ1Uin
	sHDXofiA5ctbcklx3QnPUubdc7wr8nTm2VdchXsit8Tjw2q2DEFny6zC3CqOfuKqWPtkEv4BVyd
	NWBO7MVbcmB/cPYIuB9Vfva1x4/Yjz5XlIR02i/OlornqVZoMQ9bpy4kantzpKFz61a3u6e1BU7
	K6Pe6SbsNXH5AKXOqKI0iEh17sqFAKOWjGIIxpcGsppuzIylgcMgKOhnhzKhr3rEmMyWXwr2t1h
	FMmOW5liKT5ClWgGCxXz+s9KoFA2GPRp7WjBfCMwIHW8OfZOnsnxjEQvesyjRC2j0AWP6qgEQrZ
	9HEhJcO1M0olH3IBsUgFpo876JKhPCXJWH5W/UbRpvYwhcgVMeA6zfwwd8k1xx8EGCOiXQ9SQck
	8MfVDN6QxnS79cjmmsKEy1VbEXB09aIpQzXh5VDS18cWZS8V+JS+Mse2NcvPFbp6vf+SWXNJijm
	EiB0sl+unaeR7OG0IsrkXQIKjbohBhe/+ahQpi3F+kUgAiTyQFchyYEcwKc9gOjVGgcsnuqNOgw
	9WoDI5S4lrxQTgGTWpuWEDbRONWKgK/MdGfz9Jm5OzEnDUx504dWS0ugc0AF+H4ZUqalhmgM29D
	XrNEZRGS9r4zws75m/NHpqdnfDlz6O8jsvxwvOfSGx3JIfre/yOzkK7w==
X-Received: by 2002:a05:6808:1715:b0:55c:836:5950 with SMTP id 5614622812f47-5640de0af62mr9879107b6e.27.1793742009246;
        Tue, 03 Nov 2026 13:40:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:57 -0700
Subject: [PATCH v7 04/12] serial: 8250: expose RX trigger controls for
 custom callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-4-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_134010_435319_1F266BCC 
X-CRM114-Status: GOOD (  14.14  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The rx_trig_bytes attribute dispatches to a port's get_rxtrig and
set_rxtrig callbacks when present, but the attribute group is registered
only when the port type has a static receive-trigger table.

Allow a port that supplies both callbacks to expose the attribute without
a static table. This lets integrations such as Octeon provide their
FIFO-relative thresholds through callbacks while retaining their existing
port type. Require both callbacks because the attribute is read/write;
ports with a static table continue to use the existing fallback handlers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 73bc9e7ab703..d87e2b852c3c 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3152,7 +3152,8 @@ static void register_dev_spec_attr_grp(struct uart_8250_port *up)
 {
 	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 
-	if (conf_type->rxtrig_bytes[0])
+	if (conf_type->rxtrig_bytes[0] ||
+	    (up->port.get_rxtrig && up->port.set_rxtrig))
 		up->port.attr_group = &serial8250_dev_attr_group;
 }
 

-- 
2.53.0


