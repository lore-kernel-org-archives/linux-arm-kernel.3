Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51EF606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wDabl6VC;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GJVE0Zqc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=; b=wDabl6VChzZnR4
	npz8NryWuMicK9a+O4LguQI2uAR67qrNzdZiRMCWg6svMT3ZN99KM4pYJfPNrtLDDgwjT4OYENILw
	pKQwLqqhWsPUzC2VvwarZhOzQVD9LKOA3mcQploqt5aGcsRmb0dYcFAOOTGqrVAyS2Jm2MuF16uu1
	2de5vItqy6LvJf6d+DJ4WetaY14+JYKpgJmcG5h66RwhXaRk84aQiKGbbJJyekQesX0SLT0c+EwK7
	Day0P2MfB0gbKHGxxJ4Eqc/3umfKl8YHym/EKVWsDSEPBB1fVh2K33XMRkoxjAxIp9Din2MenCHxn
	MiGyuPizX+aRasYCmMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQ3-00000000SDr-40Yd;
	Mon, 02 Nov 2026 21:18:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzQ0-00000000SCZ-1i4E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793654295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=;
	b=GJVE0ZqcgTChfsIbEDv3TdpqojiKrdwiJERg0OYg8zcFnO/wwhE4mHyLSo5Syt48WpZAwp
	OrLSOKg/34zBG7jDZtuz4JJmIwHCuuLpYuqFu+JhDN5qRLY2H+zirTJsqN219XAR26PSi/
	kE/u4JheQ8eCs+9RvK44G4VrK1W62ys=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-sVsEa-AjPlGfjxgGDWF3dQ-1; Mon, 02 Nov 2026 16:16:39 -0500
X-MC-Unique: sVsEa-AjPlGfjxgGDWF3dQ-1
X-Mimecast-MFC-AGG-ID: sVsEa-AjPlGfjxgGDWF3dQ_1793654198
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e2736ce83so83316f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654198; x=1794258998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/8iyy4HZ7/aVXuOHPUsPysy0WI5/Kcxb2nLLftofoI=;
        b=INnKX/xfaLCLlnon1Bw1PLPCAMncwmy7XFzrTJ0vs7guO4nPwQXijP2qjxWAzLw2uJ
         XycjLzFwUBZ1sCF7245+RZ38q8CW815GjJZlh4GegUBteBcf2P+1BIzzSSL7NLhsyOAT
         uAa/JJrr0Dd8m2ysPbmD/6YrDeYvFZ6ahgX9YMe/5NqnaDK5SDeVueptMU7boCkzq3kl
         cgqeL1Lvq9QN6XhBOBuj01mP85Qxe5qi69JVhTGCL5gYD3EkuD9jcu/s9fj1E1eVXkeA
         DlVl9eK6xMv6BrBQOXGmaPnk1dHJNxXhVvQ/2HoNcXKPBraDEnoC/eHrNAK4KHs7IfkV
         otSg==
X-Forwarded-Encrypted: i=1; AKwUvBzSro2E3aecZ5PM8HtKwScaIl8ZNBfEd/wEEXNIJ7bi8+vPssfFqHtExgSJwCPVEKJ+4BrGr/ygOyiGpSKqrKjJ@lists.infradead.org
X-Gm-Message-State: APuU4Z9l7QDh61KZ7ouu9nPvkyQRSr6+0Q18cF7NfUQQoiGFJ/dmxe0X
	2Q2SAgDkuWuMpbfyg2duM7qtYW7AQ6G9j9tkKeUrGnS/o9r0gXPgjvJ9YPYOIuCXLQilu2qXkyX
	PF8ZsJKsMzbNhy+RdLkcZDtnxDSh1MzsZ62Tr/hZfAOLCvJasgmoPUWBHby9MtWEfO9r3X9unDO
	ui
X-Gm-Gg: AYBFou0voeALOrqYTt8bbpdhBxMoZFBP9s8uU0YrNSvxQAc+5UetZRcdZOwoRsxnHZy
	EITjIJB4yQdb/LyNMdngBgu0U2nHJ5Y9QMAC+B855k5vE5tyj11P8vws+2nBTzrMdK+/j2NEVlz
	quUGoEA/enf2rXuOBJR/Z6/iMESoXT0a3u03vhuYS5xK8pin2DyIvv8Fsudi25dJUWiDlkaSjdh
	lnIwUyRX88Je63y/m8Z7QsKR2l1aiYbhrbg8Zi8ghRM5flE4/Tkg2sQ88mzI4GYosPAv0mwTW55
	vCfuN4tBlUws0CsPbybjdFGpiT+sUPQ3TLMpk9NuDmVyU1seOf3/EwWMEDu+VA06MeennQKCpGs
	ShnjLJw0anfdfNzNBqxABF0AioZfEnyqDU1/VbvjEG/N0SqX8AoXEqCip6ue5fs8w9s1OaMGP6M
	kaVAJqjV9icqnMow==
X-Received: by 2002:a5d:5f48:0:b0:48e:6ff2:606a with SMTP id ffacd0b85a97d-48e6ff2609dmr27631590f8f.6.1793654197966;
        Mon, 02 Nov 2026 13:16:37 -0800 (PST)
X-Received: by 2002:a5d:5f48:0:b0:48e:6ff2:606a with SMTP id ffacd0b85a97d-48e6ff2609dmr27631544f8f.6.1793654197560;
        Mon, 02 Nov 2026 13:16:37 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20838703f8f.56.2026.11.02.13.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:16:37 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 02 Nov 2026 22:16:20 +0100
Subject: [PATCH v2 1/3] clocksource/drivers/nxp-stm: Fix max_delta overflow
 on 64-bit platforms
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-nxp-stm-fixes-v2-1-8ca2706f30ef@redhat.com>
References: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
In-Reply-To: <20261102-nxp-stm-fixes-v2-0-8ca2706f30ef@redhat.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, stable@vger.kernel.org, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793654192; l=1278;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=DVfNt64Fa2EP/J0U6rHzSmiL2wOHXcUfdf87XnRZfSg=;
 b=l9hNDdzUrhma71aFw5r9/uBmIB5COcdfl4Gq7cRYpas8co0jiLEqNrhksseawGF7HVyaMLcJR
 wxiPwGkenjpCPQfWwh1t6b2mYj7Q1sJtwNbsSjje6VTqWdOIE/SHRzQ
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ILUNAImAayUu8_VN4WRjAm92cBnFpJc804MHBLlOW1U_1793654198
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131816_542902_3291A1E3 
X-CRM114-Status: GOOD (  13.29  )
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


