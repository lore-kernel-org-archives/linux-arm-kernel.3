Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agi18bSwTkeIF6jxl6q5OYZO68PEHIdc/8ycnGopS2Q=; b=m2IvPKfsoJ16JbN/6X4TaWUjwD
	s9I0pxixiEJtm95GWg8xqCI47oq6i7pY2svcIeESEg8+WMcbf7zVTqI8T2um4pVUQUQiCUpFKK6UO
	z3AgJw3bi/wtNtfN0EZ1Rfb0YRcJ+M0LnsLRo933znae6XmMtCQYSBELV9c55WpgUku5+GUnOtdqt
	AJBh7SVlZFphVmArzKp4E6dW1P/dspKpH0dCO7eS71yia3nw6qYZmPsjLbtMWMeYhS2nXipwy1lu1
	3aOYWTPBB6TchrhkIXRqrBbV3lXh9qG0AQQ4wp/W/Tm2ndAGYYhrMsdsTmScd/ieosKt+oLudi4oW
	Kxwdu3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9oC-0000000E4oK-1ZDF;
	Fri, 25 Sep 2026 17:34:04 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9o9-0000000E4nH-0XO0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:34:02 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc7979d1dedso225824a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357640; x=1790962440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agi18bSwTkeIF6jxl6q5OYZO68PEHIdc/8ycnGopS2Q=;
        b=GYjmeBSDzjw8X4XOFLX3r3xP4dPdJjkj2ZeSn4+kvPm5TST1MFQeoHXXJowRT5PjXY
         2xZ52VX3mc0eLzh7hQh44udkdg2E0E+V2uxH3Xt/3vy2kfebtmi4GkyfxWbsbDYjcfHU
         g1WAykrxQDRD6Xa2RdANXTFwPHvKQ7C0f5rIpn4PqkXc4SF8WTpBOuMokKd0qatZMXd8
         1S2EsTaHE28KFZ3w9Jrfrl7yxMwl41iR8PKHLQUObTbTXYG9aXNSY0NKvJlzD2wCw/wd
         GgNcZd67nok+gDUvC/VgckiR9z2YSVQxlqyZRKY476Wh9+1TOdyceJlkKVan1DYlU+qE
         oGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357640; x=1790962440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agi18bSwTkeIF6jxl6q5OYZO68PEHIdc/8ycnGopS2Q=;
        b=G2UXMzDfqk2/oIqOZ5t5N2Iuc7buagyuXSlmuBgUr/dGoNa1rqgi+GA38dGF/iewg7
         xnaDqGdvYMXrQ2JJpju+eOyfQqZ7MvMD1zEpRJclQymC/EKa2B+5TSBB+mD+ZoVq3rZ8
         PPN3e0Eajy5skcMhyxQgNKYC5x8DJktepER5BfSeiB1hcX06+NbieUe+oUmc4nAA9SYk
         5VTCyPF6iNPKbeg6JHDhm3JIhuVzlfV6UAC1G9/pj4FqrzRHog3Ugg2oCzqbKY+2U2wU
         CZHVq+KqOSNL87AiOazgy+YtEAmg1jvJ3LDzs3hT+9S/nBoj7Ff9bewrPCdGU+GnyytM
         NnBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsQv8K94n+hGbIL6mMPrz00OGApwDSZ50C+hHsYrDWHvE6tS3hUVmBhrMmLYmtB8karzEtJbR/wLTOuBDHZdC9@lists.infradead.org
X-Gm-Message-State: AFuF++khG4WoPKiGFlqf105qlciSA7JkIlgGUG3g7VEnZwhpNaD8wQr+
	tL+k4T1I437zL8VLlPrFDTEpHamrL+jicl8RPzzelZWs8A5sAGjaDjKU
X-Gm-Gg: AYBFou3QMnmPn263WKeiYuderubv1k3Z7pHMqbwbIGB5Rj9Mf8J1JU8VyXaOS7Ttkb4
	6USmN/8NQ6Zyc45mSKXtfnigJJX06GnPK6lVYg82B1U2L8znXNgdCYCNrHXnvn8d/kZHIk1SAiG
	hwbHsvD6bK03ntcT+r5co9vTaaF66DOWwdm1MVs20XZ+XtSSR96u0FYH00NVUDiby+ZAJkv/inq
	kXQ3g/rHBnhYE0DpyMZNJ5ATxovkPQKUpEO1co/p02VQH8SLS+9nJevfsrUDdw9PskfNDQlYQDU
	aisFPFAa4/6QuGJ1sgUl8lJjFEK/ISWpPw+LmkGrZrgvPPGFKVUh0Sb/PZIDT9PE3YUMZo2NrI2
	/SBSQriP1NZlCssiIG6QhUafCcb3O35wEv2E2uDoB6VwZZTrE3hpb7bF6AKhcoOAJ4+CC/A7KGl
	xUWsuVJxctCbQ//jIeDJ3IgV8s6LulgbNwteDHxCkdA15dZDM1m9aHUikbJLdAnkBeZBRbfJMzM
	9DQDk7y5Qai6Rsa0qjcruWsvDefmVYw8ifZ9/KZBKJcQIXuq3GYS3mEgPVWUZBmt78B2SN0aSk2
	Pz73DV/iUzL5K8lnSQNMzPGucZK/7o6aeRKUyw==
X-Received: by 2002:a17:90b:184c:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-3a098ad9d5amr5053899a91.6.1790357640121;
        Fri, 25 Sep 2026 10:34:00 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm651224a91.1.2026.09.25.10.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:33:59 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()
Date: Sat, 26 Sep 2026 03:32:52 +1000
Message-ID: <20260925173252.933705-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925173252.933705-1-geoffreyhe2@gmail.com>
References: <20260925173252.933705-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_103401_172307_9B158050 
X-CRM114-Status: GOOD (  15.31  )
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

vexpress_smp_dt_prepare_cpus() obtains a reference to the SCU device
node via of_find_matching_node() and passes it to of_iomap(), but never
calls of_node_put() on it. of_iomap() does not take ownership of the
node, so the reference is leaked. The function is the .smp_prepare_cpus
hook invoked once from the __init SMP bring-up path, so this is a
one-shot leak of a single refcount during boot, with no functional
impact.

Annotate scu with the __free(device_node) cleanup attribute so the
reference is released when the function returns.

Found while reviewing a CodeQL report for vexpress_flags_set() on the
same SMP bring-up path.

Fixes: d2606f81d563 ("ARM: vexpress: Simplify SMP operations for DT-powered system")
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm multi_v7_defconfig, W=1). Not tested on
    hardware; I have no Versatile Express board.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-versatile/platsmp-vexpress.c b/arch/arm/mach-versatile/platsmp-vexpress.c
index 1ee3c45e71c99..b810ad50b98ce 100644
--- a/arch/arm/mach-versatile/platsmp-vexpress.c
+++ b/arch/arm/mach-versatile/platsmp-vexpress.c
@@ -61,8 +61,8 @@ static const struct of_device_id vexpress_smp_dt_scu_match[] __initconst = {
 
 static void __init vexpress_smp_dt_prepare_cpus(unsigned int max_cpus)
 {
-	struct device_node *scu = of_find_matching_node(NULL,
-			vexpress_smp_dt_scu_match);
+	struct device_node *scu __free(device_node) =
+		of_find_matching_node(NULL, vexpress_smp_dt_scu_match);
 
 	if (scu)
 		scu_enable(of_iomap(scu, 0));
-- 
2.43.0


