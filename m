Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A123EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=; b=vskRWD0WVTVzUgJWlgWj3wGdKP
	2myxjct1zZfMGHHWjbc1efXUb4RT/HkuHhOxsnmp+I/cjNFLASYrHGwnOGbiYM1ukPPfv+PX5gqmL
	QF3sf0wVl+aVFK46P0kO4DWAYCJQKezqTkK4XDwueKvABGLw2j6CKszIjYPDu7ySzUxHpiBey1iSE
	Vc98IGXab+YDl7hVtrWhp6p9otZ1ahmey+JA6/6Po7P+OKdY8pe23LELSsPDaXu3icbPySEpv/eeg
	L+Ngtx3iobAULltnBa/SI++q9RiFMRj4iWPzRu7H/PNYYOXSkzjyRRTbtVrYx3xheCZXt31Ip3ZBi
	XSbxpO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM9o-00000009tJl-0YBg;
	Thu, 17 Jul 2025 10:48:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLvA-00000009qWu-0P6x;
	Thu, 17 Jul 2025 10:33:01 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a54690d369so665877f8f.3;
        Thu, 17 Jul 2025 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748378; x=1753353178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
        b=C1F3nmt/qybS1Z/i6ySlvWzE4JGatEPi0Od50w1GPKCz82Zv/iEmczBLAfkBWZhVAZ
         lTHPDsVjjFkeLCAf1kp3sRxmGdPehl6eQKjpffxuP9faEN5pWhnnIBK2mXRy7Y6Gi1d4
         b3J0n5wQIiI8fJCkXN/zg7PZ8r98Xfkp1Rul49q15UZ341owYG+eRjqqqKD6rKnGdWLR
         CNCl7xb/NPafWMpD2IPfhevI0p/6pXFxGSdgcCOsollaGeLxMQ6x+5yo1j6nxo02dO92
         IX6g366Gp/cozp30awDcMZRJVjw2Ad2i1OfirdDpWRFo2eaCy7HuQLqTWOVt3uo04ci4
         bHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748378; x=1753353178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
        b=Vmh5iJ58qy7nyAprbj3d55BcJHJU5BBmxpsTliapOYrz7PCIKDojfXKImVwN4Z0fie
         fu+1WiFhAXqFoVg6SiH6EuU9DP1O2ebUg3f8Pl/q9gMF+7ezcMpO9rv2ZXyUCn5Mgogr
         WcmD2upEGkUiVEoXuzJN0LrYwYHHkqS9aX526CKW98Nc5xzTYd+a1hjwpg6o3G4Sj56r
         4wFuFB4voxbnbWvNDnojDqY8r+r8PyF93UCp2+hmSSjidp+Tc8TBoQCxcaaExkXEXiqm
         vmXZUOgYszegBKmDBsZI1BLIRXgEnKER0etriqMh1yZI/u1q28sdXFgczT9G7ZRilZZI
         tf+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcGBzomT4muNtpWMxyrcwwSKJ/315pDmHsVbTvzhKjOT8L9vB7NNDkc5x22Z5sdjVAK72C6kL2yoIpgirhppua@lists.infradead.org, AJvYcCVGTp9VEBh9unaOrMWbVt4YF1j/5eX7l30FczAxdKteVoetV3WjqyJsAO8K/GfBZ2cM953bq7oXgV+Ju1w=@lists.infradead.org
X-Gm-Message-State: AOJu0YywsQgnxtp4qUaqaZaAejYgyqlppqTFXg2Hj9yEQ3OcMAqeLK7p
	jkEE8tvd0+vvH0LZ7U2NAT0oVXA5bVc8qjfQdJJrsUT1Y4fpnjoM1I8SxgEPSw==
X-Gm-Gg: ASbGnct2OLlqTrcJs0eqEL+VxQ3yv0uTTRPwnGdetDMoGNyyA4rXDPAtNqiF7tgeg8v
	xH50kEhesPmOLzTW1PNKzV+mp0Vcnl0nRdI7lx1o8scTEJbDYhkbA91MBQr/ba2uxkulM29Zv/C
	qCAkTNLKzxO+B/8ln7czmU+uNKVnlg0q8y1y+aQcNLCuMyeuCYryvDThEzcGcA+zSJaTc2kT7gd
	Ic6HOn9YF2znqfeBPpxMHHBCzXF+m9roU1ttpXZ85KVbAWKkQkVELkzBadhZ6JtaBINW7Whvcwv
	slArzKg4XuAqfLoxlKZvHa5Vlg3Iqm4OLVQesWpvtFLpTu9EBMCATnIb28qdNINU8f8P5fexylh
	o3kuT1dr3nHPHFpFaYIbAb0d40c0g1vNHJ9Ps23MxvfhpgwYciotpw4HZ6WPxqp6EEiStZi9M9M
	8H3fO2lYcE2zWz4g==
X-Google-Smtp-Source: AGHT+IEdwrBNkg9M8guchW0vI+6tEPzp3HT7pxcYs5sGp6dD4O7OxQ4GRP3g0Y8ml2hczWmCiC6jOQ==
X-Received: by 2002:a05:6000:1887:b0:3a4:cfbf:519b with SMTP id ffacd0b85a97d-3b60e5103fcmr4782590f8f.44.1752748378428;
        Thu, 17 Jul 2025 03:32:58 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc91d8sm20127132f8f.42.2025.07.17.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:57 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] clk: mvebu: Embed syscore_ops in clock context
Date: Thu, 17 Jul 2025 12:32:39 +0200
Message-ID: <20250717103241.2806798-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_033300_142016_B13EEB0E 
X-CRM114-Status: GOOD (  13.08  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the clock context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/mvebu/common.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index ee77d307efe0..53712c3e5087 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore_ops syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,15 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
+static inline struct clk_gating_ctrl *from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct clk_gating_ctrl, syscore);
+}
 
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,23 +222,23 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
-static struct syscore_ops clk_gate_syscore_ops = {
-	.suspend = mvebu_clk_gating_suspend,
-	.resume = mvebu_clk_gating_resume,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -284,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore_ops(&clk_gate_syscore_ops);
+	ctrl->syscore.suspend = mvebu_clk_gating_suspend;
+	ctrl->syscore.resume = mvebu_clk_gating_resume;
+	register_syscore_ops(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.50.0


