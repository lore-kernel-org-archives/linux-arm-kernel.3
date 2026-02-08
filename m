Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9665CEF06E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 04:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2/KpZ57tlZKoE0FDCGiBRE/ls/IVaskc6zgTU7KwZw=; b=JR+tPW1oHw9Yp+Xy3gPSQfMDDH
	YesfqImKfHnbmGhL4RAU8/Dt9AXQXyFeZm9tyLOjAWxZwnpJ76FaHsfHOo8AmN70UixJrSMW3ihXn
	B0vf1LoFT4qx8Jlf9JYoVHOGMX8OK3UUB0lIJ/gRq8t6cysy8A3n4UKjl4SV9q3cwfVX97rBpHCTy
	eXFoZZR9ce6Qogzn/pVrQ9Dgu81uxqTQXBJLX+jnIqxjRvpNtoJPR+R1tcfaq53yRxzVHIIULrMiZ
	kLEeCfk0zr90s/jfdK4tUwVUxeuKqB7F13gRhxb4O0xKypKYoSb9zE0mDWofVM3b5ys1Kse5a+gbc
	RUi783UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1z-0000000CzZg-2vDI;
	Sun, 08 Feb 2026 04:04:19 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1x-0000000CzYs-0NC7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 04:04:18 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-124a1b4dd40so6661324c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 20:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523456; x=1771128256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2/KpZ57tlZKoE0FDCGiBRE/ls/IVaskc6zgTU7KwZw=;
        b=KIvbij1naW+ZdkRvNF9DpDL8q7J4r8l6KDrNi562ol/ZZNt+JmDkFa8VKRlmsnyXSF
         7hN0aGdZcY9O2VCyyKL2D5A/VHQZYt9DcwCE2Fc69GYI0lUAyQJI1c6/RNAUiHj3/aK3
         MEyh4hsO6yLovShoiNllBN7dhsKNAunHU3IC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523456; x=1771128256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2/KpZ57tlZKoE0FDCGiBRE/ls/IVaskc6zgTU7KwZw=;
        b=vF7gzyJhLZ3tvWRtwa5xjq+kKhAaKuBAWCLZ5Z2zd5nkwqLc3OiLQPbA4rOYg470Mm
         wYwwxtTDOb2HkDZeiiboQuuIq+4F/oj1prW6jOEpZ/nc2ye+JUpizaD0y+dr3gYfiYS6
         TVG97G0rR3MVL6g1JhlkeiIF/Y60LE99I1fvJ0oHbAsWmZM+0cautv4iPXP3wDV3pW8x
         YlvDac2UEV2zYT4JPYnU7+H2yzCAE4I5rqqCT2dDZqY7nfcwfeJrUBRan9BswWNBA7bu
         A3vfEH9Q7Gmq6mxs+uFDS9Y5kejHT47FMdwJ5Z9xnELTqoR1bGS0ydER7fTIvdET4Wp+
         8DEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWYzR+htMM7YsgEcSTTdf6WIey2hFLewWKzBWW+HJaP5hZI2ygmmYvYrTTA0TaAUYoBwOlaWiA7TUfGJA9jWp4@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ5jF3kP552XQ1QDEjrz1fFCc9zDEm6Zy3jFZI4LYi4kwAFXny
	q5oLwRnPqSOww/HTLlJuR0n3VI1vz7FYFa5LmEtvkLNkZinkbdo/DztqemNrSWE8Xw==
X-Gm-Gg: AZuq6aIq3PbXQausqsBGIXo0RufjYS1xqTbuGk8FUASCNpZ4/ASWQNTKt2Gtx+BcU3P
	pZPDu28kpe9AMls868nnGHfwVilVYapcND8h0NzIxqv9AivwFcMSX+pI/b2I/dqDpDaKikrp5rO
	PFfXeP0uKzjOOtTLR0qHOUEAyyZTw9CsK+TM0r0KsdeH7sOyDATqejNJp42AdQu5ChzOvA+HubG
	k3x753n2xFJFwr0Hfwt24GOzq+9X83aBhI0x7g/DsPHOdA8NdFoqoGRLwSAhbNXZSAWtzbVWAjZ
	iKQgXQ0AnL1HU4aQ0Kpz4LLxLSc2oEg6Lsdjq9gHsr8zTcBcXE5Vw1Hf0CV5FlxWnVhZuZP1N1C
	l0q3ulhQdlL3PNcwojUr8NJ2QJUGx56m5cPKkMNMxNH93nrucs/OOaH6HMKzsCLeaR1ClZWjfEX
	Ppzp+ELlr2P2xrbkzLqPIqqmT+oEnBKCAEEGpxjEzOalv7V0Sg2jAKUwcLZCRdWCienwfZTGk=
X-Received: by 2002:a05:7022:24a0:b0:11a:335d:80d3 with SMTP id a92af1059eb24-12703f9b5afmr4420639c88.22.1770523456083;
        Sat, 07 Feb 2026 20:04:16 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:14 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/15] firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:26 -0800
Message-ID: <20260207200128.v2.4.I4a571bdd344dfe8e819cfcba37ccd0ec29284e49@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_200417_127330_ED8B020E 
X-CRM114-Status: GOOD (  12.17  )
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

This client only ever sent NULL messages, so the transition is
straightforward.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/firmware/imx/imx-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index ed79e823157a..231e9f841226 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -30,7 +30,7 @@ int imx_dsp_ring_doorbell(struct imx_dsp_ipc *ipc, unsigned int idx)
 		return -EINVAL;
 
 	dsp_chan = &ipc->chans[idx];
-	ret = mbox_send_message(dsp_chan->ch, NULL);
+	ret = mbox_ring_doorbell(dsp_chan->ch);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog


