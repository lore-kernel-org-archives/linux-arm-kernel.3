Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F3P9WASZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fi7NGqVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=; b=F3P9WASZyhTf0o
	ufiWwYNbSZ2JS0oz8WDJJ07clNpiBrp7nv/hTQ5CPpT0SmEOwVMmc2JKGSJ2QZzmfyVS1lCBGisZp
	kNo0d1o2OgC3Y7pARelWAE64KiBy6ijC3oHcey4qCV8DBbWlLZqn8/SgV2QkiJIps5AT/iz65XenQ
	HHrfvPl33uiMB3Dp0MDvjYQQbPBkPNbiCRYnj+WUSgum0s9kuQvnJK4dYcVb7uQk7UMWOKTJTRBCJ
	OKCftKIBu7f6jXCN94+EYwMLt1YJPYNAlkM4zUdXZOvjLvVbu0MV8hzUBjGjRi6jHFX2Bl7Pr8GH0
	5HPPvkQ4f0hP/9opcD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9hl-0000000B4tt-2VUp;
	Fri, 06 Nov 2026 02:29:25 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9hj-0000000B4sO-1BmQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:29:24 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-353804b591eso323887eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 18:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932162; x=1794536962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
        b=fi7NGqVWQte1OiBDFr+7Zr2yktdBe5UBkoLlzq7CvjuUn6ck8ZKR9qAVQeIlzZ4xuq
         eYtBQyxBLMkLdOMJW/twpMNgj43gpIkk8mjT3/tcX7Syi//ygbIJF/c4jBCAR1JkhdtV
         FDumWhJB42bhiVFFegHRKqK1A5l9FzJ9NefCSjZs95aoAxbl7IOyuWGMt1syLgC76s/w
         2fy4m+oercnbvp5eGPryp2kYkHNq8kHCdP+0DDDe58V4bHWaKib8O8CcdvIaj23kgqqv
         IQqIZkFGPN9yw0CCw4bOOCnOvRx2mLmz8eiznSE0eddEYX9qqCx84CItBg3VZMyAPhnG
         9W5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932162; x=1794536962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7t6qfqKXOFT9HGLkohs0lc0zBkf/KGLioAvYKS1zgk=;
        b=Wm6T1a8/fH3pbYjzB3xr4iml6jI+fJIaP1InG08WDNo6Uma8lgZAmrh0CF/k4I5sHE
         5COgugicp7K2BwDeU1CNUjLBDoyh8C2rJGKFWuiPZmStZaH4Bx3I7Wq6JfTG7F/P00/2
         FVNHCf5d1EeqfuWTpNTdTIB0FUpXstaGUElaLB25NBjKxEGLjiZo33LgImT7KFnjdQIH
         sJjOkD3FYCgcalbbqiKPyluGuO11/nxsiRWM6ghu4WaYznO886pkToXoULFj/1Ov2jWm
         I6AdOX4QNsb26+EAx7ZZAGIP+36+qwfyH8s938rWosOZUkniF4x4fikdFuABEgQ2yX/7
         djUg==
X-Forwarded-Encrypted: i=1; AKwUvBzzJ7K5Yc6HzMd7MgRFDZEbQPVh7TA6O7CqyurO6I4mjiJ4s1wRqDpfsx+mhX6mq5rWngOuspjPgmNmBEyWz1/g@lists.infradead.org
X-Gm-Message-State: APuU4Z+OoWRVONDNzGsazR132+aZZIt8E4IOfraCvOSvfTOoYr5Mugwf
	BCSkc2MrMxwJLCNCMpbFxPXER7v3CZuspqu1BHqEUbzCRJJ3RaoCpLAb
X-Gm-Gg: AYBFou3Pbi29vB7O8Q+FyiGXUGFpZVaijcXz6MXMjfMWFbsxlFBliEHgtfqRbkM3wQx
	dXfjXKvlJS8598FqvWonSmnFncGEF5AQYqMy3ONAXz6t8zTGHOhTK0il1nx/69ByE1R7qmLP4y8
	k/R8vtW6mnHKlfz6wFFHnDCe29Z1HFX0wt5m5M2UBYauho5QMMxW4T/bPq18UfcnlP/qixMwsL2
	jHrsXG2shVw2QgJZwfCq7KnLyeYqGvG34Ih3T1adih8z8t/FBtWx1VwhUMHuLa503xhRuiND4QB
	HjBBVn2Sy+vAA922yDMG6iGXfQgTGqLR8sK+CTU1gWk4HrBfALHbL4N0IiwdVOy4uE0I1hNDRKS
	Ut0oH+gboiRv1rrMbkGeJ0IYhsEDr/8oaI7KPTwLydyPsc/fz5moUQ8cIa8KK30vG9cf7YVbp8d
	+kvuzXjlFzTjmUqHo9pW+LX9J0/T6rEqJVuD2wxJpK61fRPVZLaXOu53nkfHLF4X97p17iP7iwV
	u2txHzk/OmfUsUYzwXxPc5yYn3XVvocjlYB3jsaRPzkfdI6pkqZpasnKXjzR/SnEp+86Zn03yVK
	cv80ajHncMaa4DiKmXB7gPsPC4y5nFPk+tT/FSpadUhnRhI=
X-Received: by 2002:a05:7301:fc02:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36f761249e4mr1506830eec.34.1793932162278;
        Thu, 05 Nov 2026 18:29:22 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm1700358eec.6.2026.11.05.18.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:29:22 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linusw@kernel.org
Cc: andrew@codeconstruct.com.au,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	brgl@kernel.org,
	tan.siewert@9elements.com,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 1/2] pinctrl: aspeed: Use managed pinctrl registration
Date: Fri,  6 Nov 2026 07:59:06 +0530
Message-ID: <20261106022907.10735-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_182923_329497_7D1B7C0F 
X-CRM114-Status: GOOD (  12.91  )
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it when the device is
unbound. Registration can therefore outlive device-managed callback
data, leaving a registered controller with pointers to freed memory.
The G6 handover change in this series embeds that data in a
device-managed allocation.

Use devm_pinctrl_register() so controller teardown runs before earlier
devres allocations are released. This also cleans up the registration
if later probe processing fails.

With this change and the G6 handover patch, one unbind/rebind cycle
passed under generic KASAN in AST2600 QEMU and on B650D4U hardware.
Controller debugfs entries disappeared on unbind and returned on
rebind; a subsequent pins read succeeded without observed KASAN
reports. The unfixed control case has not been runtime-tested.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11a..d19b4d23c 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,8 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	/* Unregister before earlier devres allocations such as pdata are freed. */
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3


