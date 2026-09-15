Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D53C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=; b=n4vSkfe7u5L3nvFYxSEeuvow2x
	Sh82krKhh9YNbtiBo0Ulmacu4wxkjLCB8TDb7XHem3X/PpwEvV+IT+7ktUS2hD505ajLnhwfWomCq
	0CUpeLPPW/4t+ShhTE55crZY2GlyGIMhRV3Raj7SXWeAstiSNCi+emRUNsGU+TtLao6G6GNVYzc/T
	xmhJ4laQ+3k1e+jTM/iuRCma8IkotTHH9JT+a6Gk9mkbmP94HkvheCXI5jW6w3/O15zQpRXesvkjc
	/Z1LyHexHFpGCDWVa93p/KnXigvEUvXNzHpY3+9gPTjrRrh3XUxvDae1smks5clOdooziNuqgjh++
	7sNhiZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAG-00000005ZM0-3yEi;
	Tue, 15 Sep 2026 08:05:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6OAB-00000005ZKD-3hQD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=; b=UJQ314ISZGfaqxvXMm0Wcwo59z
	jgmV1QJTy7T4gnu0g7M0r/koYvEoNQdbNnwChAl8Y6Aqq0LaFFY0MUvdrsWk4nq+GhfrKiXjfE0El
	v18pm/kR3qqxD6Q0+fOWDuVz9pqJKg+Ae7ZtCjZJkFRBRB3Tt6vZX83MZ/vn89tBp18vlpghrW5QG
	UDtM0+AJMKVu8/UsUqOQFiWEi9cl366wzPNKF1PSuIOSRzNtGqrk5eIAOJSJMq8ILKSBaC83+DajC
	SOB8jCTKLYR17KzyUE1RymHCER/QgJQm//K2v+A5Zjx0PqGr+Yl1QvJGFsagvCfRA7R2rzVciVepT
	XcoeD7bA==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6OA6-00000006PQ8-3w6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:05:10 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso23252855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459505; x=1790064305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=Sc5/0Pisz2Hm5wXTBSOHgwHa2j0UizWS/CEEKvxAD2jKX3RoKai1MvGs+AaNjDcNA3
         nG7Q7MFBE+OcX6lfc4mJHRW74L7uvYtbcNNnHLnIeSROLG5s0QIzKJRKznybq09H3vgK
         fEXjafIDaQw2gXLXg7jO0t0f4kB+jZh4mQjgsU2TVZ0L2utbA24wVRUvaWbPw3g7R8An
         kPIfZC5MFqitHwZ+/r5il8iD1mQM9Sx3o+oU0tTSrVUUVRm27W3vFnMbXw4qYL7FlMjo
         rnyPc7uOaFlY02TEfhPFQmWL12KYUAhT8AEjcbq2mNeFzJDqFxvRhBjz16yOaDAAPoBZ
         0myA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459505; x=1790064305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=ealfCkvDpxEc/s7rzZijHdn2HVGxuz1p1XHo5oAO3ARmNpQjpdRnIC7IsqkQfj45Bc
         My0vj6p+aFSH/0jjS1BkoJ0N1EO0kioCIr2fXmmjbFNjMHp9SPrC1cxB8dyMkz3VQvD/
         dE/c0wKkBBK7tMasybj98sv9HO0Wk0RAV707MZpRiPQrOr4E5wdamGooie8HWm5lqwjV
         yiQVpWdtT+Pq7mKdNMmOPHDnag0K6VoHitsOdktcfMYIa+XDmUBAwlV+2WrjGNmdmVff
         EiAMYYiRG/pwFluOpcYlAhl0eluiZdI3q3p0f8nnHOd1RBAxQ+YeWIy8IKFeqI97ARP1
         2vmg==
X-Forwarded-Encrypted: i=1; AKwUvBydxvulYW3H2aa3EWqE6NXStJjgHKIm4g3qrgSwRVfxKw1t1jG6NM9VobYVbznTMYN3DqjKTS8yK8/WbF7nDno6@lists.infradead.org
X-Gm-Message-State: AFuF++mBp0b7iZpMxSlvb3uaU5iEMEoQOo18osppPL86/CseLobTNMiB
	qVPm4Xlej/by2RO/mTYwkRG0RbqePDiQk2Mx9aVin+lqzcOOyTBiUIAR
X-Gm-Gg: AYBFou2PkFhIbGZaVrb/1U4ECMNiceQLJL/33tYk5SD0Kra9Sqf4FwAB02O1A1NWREW
	n338VzEy0886IX6JLSszTxAyPDesT/g+qzB9XXGtNRFLdOcDrWfuS7EOe5/iEDeEYMT6PoOJ9Mi
	y7hz5e1PF2CGb+jKvbfOpyQiK8ctaZJ1BIHRihjQ8Fj7a5OdsgtGsvksRWaCfoTzfiLe4cjT00N
	Fij5Znm+FfDQNZT1KVVJi/obULjSHCl4e+diavO5Zd8DO0ufbZx0y/kSgzhOMfpALmt8GOnkb/y
	KHxPsSMhp+I/33Uj7DelJ1Qex6HWLQ4c0cYcuRRg8ryY8yCkyW/xg6iAAVlmKXHnYPzSRhP2HgI
	sbTZGkrQpcVr2FhZnDQQn3ZvBq5IfxQPeoomDeDfuyspM3CUUP27zktx2Qwsdd7XUAWBo2YKGJR
	3UiX91QivLPHCnY+qYmSSs0TMoqCE9ijTE2oRCu7gZj4o04jB/UnF7HLt3f8xPhvwJbTmccFk83
	5JwtKoJ+8W1NkM=
X-Received: by 2002:a05:600c:1909:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49e7a677ab1mr118558985e9.12.1789459504354;
        Tue, 15 Sep 2026 01:05:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
Date: Tue, 15 Sep 2026 10:04:58 +0200
Message-ID: <20260915080501.329424-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090507_364711_B7513E4F 
X-CRM114-Status: GOOD (  14.54  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config() are stubs that return 0. The getter reports
success without touching the config it was asked to fill, so a caller
reads the packed parameter it passed in back as if it were the pin's
state; the setter reports success for a configuration nobody applied.

With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
without pin ranges, and gpiolib treats that value as "the backend cannot
do this" and carries on. Return it from the stubs too, so a kernel
without pinctrl behaves like a chip without pin ranges instead of
claiming success.

Suggested-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 include/linux/pinctrl/consumer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 11b8f0b8da0c..7be49d447426 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -107,14 +107,14 @@ static inline int
 pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
 			unsigned long *config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline struct pinctrl * __must_check pinctrl_get(struct device *dev)

base-commit: 7257c35db0fdb4fb02d857a8197a16afa84d92c0
-- 
2.55.0


