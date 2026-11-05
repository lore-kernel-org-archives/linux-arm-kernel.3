Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7725F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0frSBM5P;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aaId2nGu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=; b=0frSBM5PVAgjtP
	a+PtVY5zguFawJMXYjsBVfdyb3ZKSEkU9OhxssB9kqTsWgFObkuyMmrIiseJzurc5BMESJfMxaYVo
	Q8KKsu/oqrStyiCI/PJz/5usc/9gN25GBFgo19fFkcCkleS0308CjTNYt9t3pS0YCo5U7taxR8GOz
	u716NiQIxeHBum3j/R83X3REJtiFEzl+/YKMNYGgu/B79zRcHmQBTzDuwPuUNGk7XKBuMZkPH3PxP
	8NKJSsn8lZ+rCAXaMjbgjoobsvOfFgRzce315Bi4BiDi/+E+8FIg+/6IO1G7edxcja2eO7SA3QUTW
	xz7PEyxTLsIxV2+5NKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgS-000000087mn-1zSE;
	Thu, 05 Nov 2026 08:18:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgJ-000000087hl-02U1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793866726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=;
	b=aaId2nGuZNWHy19uozoi1sVXPidBs/wvHXdFkz7JmBwWqcbbETsGZbJssVrhO3t6MclTDb
	+VIwdAxt9u+pcFJcu4zY5KpvJcafzkAtAUuM41mV5nMXpCfO4DVzrZfB4RUPK2hA9US+v0
	C40UdIYTwLXWasnYl4Txocsxeu676Zc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-b1WAWuyXMSmwzeOqIuhrcg-1; Thu, 05 Nov 2026 03:18:44 -0500
X-MC-Unique: b1WAWuyXMSmwzeOqIuhrcg-1
X-Mimecast-MFC-AGG-ID: b1WAWuyXMSmwzeOqIuhrcg_1793866723
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6e69d62aso2402365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866723; x=1794471523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMMaHhKFGPel4o9R+b5ZeHtuJGRm5DfNPq77qvI5+Fk=;
        b=jY7I9lf/fyCqh82Decy4IXo4DFLoiHHpxaoFnENBOQh2PUMzWUzXGa/S9R7BChKRNz
         NJxGZiBSlvcACbVXtZAbNqGl4RYusSulKRPk4aW7gVQ2KQpuY/2pQ8Anj/kYpLjzkm7V
         015QEtD2j4spI7maZhL2gkKNETv+70IoP32wjbc5JJHSoYsLW8Bjij350qxZv56mgD4A
         QUprJv9W6f1LZ5H5R40tWkls5oOEYYag1IjlbPCPxemw2ymTxazMaYr0Lva2Fhl9C/jf
         57sUeqLBOMGzdIuSULIvMEkPNO6usuWnpw/Fs5juObJtEvRMtaYQWYvLtH6N55zn6fX1
         YZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMhLl76LNxDZJoFctJbEVG88cwf7IP7chfsFDyA7BxVWpWy7GtxiFh4mrJZxxvkla+yaGMuESfvQ7QRxWk8IGv@lists.infradead.org
X-Gm-Message-State: APuU4Z8ImxC5S8pJxN6sSArEy+66MiWPwzwBGL6+NwosLdghbVbmxJL0
	36grKtTYIJwBOCXW2CWMzCTyDfrraV8rCkP7IwxoQ6gDwClfyIATCnyYLoZyBs1G7PvIWh9bYG9
	QlIaF+LpLMV2uaxxGZ9lpyA7o+i4MK1jLIYFrYoAprbO/oLv8oXKQT8nbr+4fdkVnnbLV62RiMf
	YR
X-Gm-Gg: AYBFou0e2ALED/m507rowlTmbksJwNK6F2PVx3J9odCXJkVnvBKwJEcNnb6fHgAEDUX
	AsgGiiBF17meH6uFQ5etEtyAjvYsEZSU3kPTF+1nYb5BWg0qGqsyjt8YlxodhKUfGm09kN1pdB0
	sVQ+IrKIGQjuT3J9Ot/FQVugA68j8ti3iEO8YjX2fHoQXzczile71vcJniRkDiNymZcOfwe/m18
	mbJbXg9AQVPmp/T0uDAnLWwkHA172t4j+RCl/IBOFZoSP7GD1lXsd12xATXb6QuwiLh6qvrSFjY
	vCAMqdTZ8JpFFMD/isLMxsbZrjdsRA9t7U1W/qib1Te4/fKXILDWOk4o+xgtMvOnq7Ydwt41EQt
	3aJgVvn/e30PVA420xoqIvxkRG0doX0Lb2ww+6jrx62mXLP5DjGdl7VV91xmi5Hmp7M5hzqlvLs
	9d2dq2RkKSlcaVsw==
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr306356035e9.1.1793866723504;
        Thu, 05 Nov 2026 00:18:43 -0800 (PST)
X-Received: by 2002:a7b:ce0d:0:b0:4a1:715d:1913 with SMTP id 5b1f17b1804b1-4ac177538c5mr306355815e9.1.1793866723106;
        Thu, 05 Nov 2026 00:18:43 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm4513405e9.2.2026.11.05.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:18:42 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 05 Nov 2026 09:18:32 +0100
Subject: [PATCH v3 1/3] clocksource/drivers/nxp-stm: Fix max_delta overflow
 on 64-bit platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-nxp-stm-fixes-v3-1-8129b912e74b@redhat.com>
References: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
In-Reply-To: <20261105-nxp-stm-fixes-v3-0-8129b912e74b@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793866718; l=1276;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=3tQAzS65C+p+CwI89Nw27cv/4Q7pCmNGpT6liQLCnCM=;
 b=jaRNvqRfj8/W4VNEnG8r/OzoSDqnNebhjk7Le5MPZPZ/1fZnzaB0e9g3Nb/3xrmRC6O+hw35m
 fCu2NAhD8LSCYKJ4rEV4PM5QL7RRiLqTSmrebz0QAFyprAwC68ZJ6nd
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 03FJT6G9AWz3ywSKYFlTBf0QIsMeFntgus5c6TbqmD4_1793866723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001847_129816_D08898B8 
X-CRM114-Status: GOOD (  12.55  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NXP STM timer has a 32-bit counter and 32-bit compare registers.
Using ULONG_MAX as the max_delta parameter for
clockevents_config_and_register() is incorrect on 64-bit platforms where
unsigned long is 64 bits, as this exceeds the hardware's capability.

Cap the max_delta to 0x7FFFFFFFU to match the 32-bit compare channel
width, avoiding potential timer event misses or unexpected delays caused
by programming an unreachable compare value.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms")
Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 drivers/clocksource/timer-nxp-stm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
index 6fe098a4a33f..ee249fed1b91 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -346,7 +346,7 @@ static int nxp_stm_clockevent_starting_cpu(unsigned int cpu)
 	 * minimum ticks = (rate / MICRO) * 2
 	 */
 	clockevents_config_and_register(&stm_timer->ced, stm_timer->rate,
-					(stm_timer->rate / MICRO) * 2, ULONG_MAX);
+					(stm_timer->rate / MICRO) * 2, 0x7FFFFFFFU);
 
 	return 0;
 }

-- 
2.56.0


