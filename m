Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD37606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1fQfkwG;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fI6SXdKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=; b=h1fQfkwGw2f63d
	bMfhTL4ksLv22Q6BEgQGygrDWUXxN+odC5D/6bo1/Mji/xQ5W3ykhMUEbyOfpKcLn/iUUrdjjOuG9
	bFzbkw8AdFKAnO4mL2Zq8+rvi/0boHEvHw2JeLabtZgAyF/YHVX9WHztGt7pisuiX9sCafk/8f422
	ay7bqRytZVK8kngNu+YgFJ87W5DZo5/i95foj9NCYrGRY34S0w1raIVWM1hY7VDug5KMGr/hI9YOz
	jLmgLXMGAEbQjTQkYylQpICOldv8iAN7g8W6UMqWU0OYJy/7lZKTxaLBw8i93fHzv2bdYC9MjGUtF
	f8KrhozKEFgyRSa4gVCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0F-0000000C3Ud-0MLD;
	Fri, 30 Oct 2026 15:58:51 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp08-0000000C3Lz-360K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so7954555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375922; x=1793980722; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=fI6SXdKSGq3fhd2lE0zjum86Lr+lG5+HdJB398/sWP65WNaGtEq+TTMUDlXoLnydJe
         HpuSzWKJj8kVdAoq37DsCMrmKPEV+amMiw9lFUxxXwZx/jdebdKSQzehU8oCXurzcPO0
         E71dKQRerqL0sKPd3+cs71Yxp7sVryG9ZeJS8tdZX/YxRZ5gzgCD3nfIy4eeBagAezsi
         w8DjBUrSEYUkVqAOsCWERh6rJ9/r8sVpU7FSHD3qmHlb0F7jB3SiKVk0IPtg8vWoiEkV
         818zjo5Fa5KUEKNXJ9MMVffyXUSBG7jphnRc2A++ytq9pGkDXUVAXw6UP1sRVeFI3Ivu
         I+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375922; x=1793980722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LeFt7P1mVFRjUvJApqNjloRcS0qu8nw+PQFMs/A+hxo=;
        b=UJeYd0bndKICfMBWpbDKQiX0kJZ+w6t3iSlG+52h4LKv3Zvs93z0YtJ/l/5D+cl3Qk
         XcITdp3I0j3gOl8DSbL2pJeEIIK1dwbQMQtSI13AO/4yoFue2NOT0sB8o8BSDuyOPTFq
         yWh17XriGS8cgBIEw9v0tnP0S8hymKZd87IuhXezt6wb2+1Rmw6Mx7N9WeHrA/Xyl3GY
         CsQEEmYLHuSEOCzHf3EtOranb17vE9PrIXXMQ2x8PJPkO5Urylr5dtAfgujd5HLD89/G
         7gzHKWRGkp/ZHYF9vx2ymOzC00BbzWkGM3YdW2eqW+HUGda8z7r7cQXShWCjKLP7fU0J
         TQxA==
X-Forwarded-Encrypted: i=1; AKwUvBwVj1pz9PgySbOW0pLB0WPabfJlUNyhpqxBrTtRjn8eO7zLtUGArq9WQWTFdbrb90x00KMWR567cLPpyecf6eXk@lists.infradead.org
X-Gm-Message-State: AFq9FYLf5MuLrDhND00WBWZh4savOGRw9DEvQjz3qmgFGlsnbmD/8W96
	K+rHtUq4okMQkwa+imhGU2OC6s1kv/kJZ64CWGMjFKu3XMxT0bkaiYBdZSMFQt6+vmiYplqR5hg
	WsuZ3xxvgzA==
X-Gm-Gg: AYBFou2FuVu66gyPBDHWhzviVmCWAme5e5OCIGXMvkhijBaqe7WrV4izAi5jmu0wFzC
	afxPMLHx7vEays+sFhtYtN8cLInRiULyHTxHlB4NfJUO0y0ZqI8j4p5Syi8F6nvdKuI8CeIHXb+
	TZVj9PcPPkP7GfFImVuzfGGlMPubf41MhUieBUclfdsCa5FdPylvVRsRTMZH+HoZMJcO1R9GfAA
	KKW2ueuKK89n98vzp4JCTm+F1XJliIi0d8YILgfCnCwKXdsPQXF2WvCQpj+/hUd25yfVgusZHJ9
	KAdRSAUQoJLYVmVY1ryHZspkM9u5zGT12Eof7tKjTGCFGM43Ho0gc/5kzSBBdc01XQ7e+v764mw
	7mHzu4rV1oqVu1MoUSfOn919+QAGIwYbenBWEXQOvoSy91N8ji+nA2ijwZq6YV/lwVBnBOP+GPH
	LIKmPXyEjd9WR/6i3OqjYTKqfCAuDBhrMhc3Hd5ygyNC9OfMb7clnLxZvVrDW80CntOkOyin4Ck
	eYYUkK/Fqj0PltQEYPOqk539GpyBiuPO2eY3Ezr5W3tXHz0IGwedQTLv7U5nU/G9oqDqwYY2X4i
	Ez9d3FClFa5d7ZyBOIwCbAUCnD4q3KkBJxyq+X+oLDxkGtO6NCk=
X-Received: by 2002:a05:600c:8709:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4ac181e75b7mr66361365e9.31.1793375921690;
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm3802033f8f.51.2026.10.30.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:38 +0100
Subject: [PATCH 07/11] pinctrl: scmi: give no groups to pin-only functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-7-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085844_819327_17BEFC9F 
X-CRM114-Status: GOOD (  11.79  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 355ad26cb215..1a14e254f011 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -443,6 +443,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -455,13 +456,20 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only,
+						      &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.0


