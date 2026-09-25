Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166B7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9H6AqcSl8dN0oQQJUPRgrlL2dpmTbG/5cSDKBg4G6Y=; b=cbvddJbWZtd7I1l5Qm7bLtvHrl
	7A6QO+nTQG5/jyQwN/8rzGoRa3UEnz3z/rS+f8pycyGmqnfIGGUuKfZQU6ZvdMWuuvw3t5/WdQ1I0
	eDuE5GYBjQ9sdUaAwSTXtnwuXFpnAb80OolrOEC1GTrIuiMgw2pRRbIt08yDY5BthGpbfDFLezBIz
	H+eeTrLJs4ojOcwkRfw5QtH5YianYFqMETsNxkW8GAWTScDDVj8UmMfheRdUCl0y0y1AckMqpJ6oR
	BaKAPojyISzbwjccEf7zVYckSq22I0bCf+w4OTdWszXUDSscDYh0c/FeBN4/JzZLfxj4y1/As+u4o
	VqVkE1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9o5-0000000E4ls-0kEi;
	Fri, 25 Sep 2026 17:33:57 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9o2-0000000E4lJ-2gEL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:33:55 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0af40d240so668167a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790357633; x=1790962433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T9H6AqcSl8dN0oQQJUPRgrlL2dpmTbG/5cSDKBg4G6Y=;
        b=Ol9N65xrFs2F8PQv30rxhxQZFx3Lqda2avkTDmBzQosp/GRP/ufwb766LkjRJnp59+
         Vb88FSmFsQwScfRHbRdLtZOg2+bo5zWqDEhxkLZ2Cjshq0vFFx+TFa0Px4QsKYeAjji3
         39PU8s1FMwsj1pMpdj11TIfTD4BPQHXzr9OhaCXR6+owaVGODW4a6B9MCASVAjAElaZE
         2Q7EhqY2AYL8TcjMYxISac7f/FWmwGunP3zOKCGbB1Rm20yeyV//QIiF/5cYQmynlv2A
         oSzmw/fmQtZWDhLKYAv1OMdZ6SDODPQR/69b0lBJJgDQ8KxtFeNKmI6ba/1SaawkfQBN
         F3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790357633; x=1790962433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9H6AqcSl8dN0oQQJUPRgrlL2dpmTbG/5cSDKBg4G6Y=;
        b=cECE535rF3BhtX2Pgr+WiGW+7/Dhgtkx9WJOMXdObZ4esF1FGeO2an+S42uiTf1CAA
         AA86MZRKOUO/rBefNA2madHgllq5lwa/UBiM4lGlw5jz8alYlrLtucjDC8NtML8lQZKT
         gVOE2dQYvL2Af+GqZL4/53kd+TBJ3Kkc1vDkdzLQsvKwL6JZLpeZCNhxZ4Ogy75wfUlo
         uZVIozYIvNZzQY87TkW5PVVzEVvRA2dRbWvNoBh103yfTJ4wZ02Whh24SjBCqsOu4a8b
         DBmyxeF1lAXQGfpRrfLMfSlQWii60PEQdtHEPIvRYXdq5+fcrbgZrGyJOzyOWZ80oIJA
         aVHg==
X-Forwarded-Encrypted: i=1; AKwUvBwsowc5RcAkhIdzaGB1hAfI6OfvKlXC6ksGQr2iFpP5tNkeQV4wKCuY9P2afzlskXVyMJBM/eS+0AjbeUgUAJ6V@lists.infradead.org
X-Gm-Message-State: AFuF++mi+sQQDyKiB+aRymqeRf7Aa249K1qVVvgPXyqvNO1VL37tzzR6
	g1RhWFsLZu7xzqb7+tTlpIXQZp5wOjvDxzWR5oTwbWFYquAzVALsZ4wF
X-Gm-Gg: AYBFou09LdH+DbVaRb01SM1qo5DS2XHhi67ZgegnBPX2QZGZaEWbB/R0KjG6ypnKcRE
	MU4V8Wsqsihf2n4JTOe7b+AklNO9fszAhIrtA21NBko0yz6nzZ1CYu4hrMVXkJvRsTezHqIkk2p
	G/yWpA+iX3sBzMVDvPNOSBXh08FFXJ2I86Ycb9tFqOXItVztob/novOZFMpYeE+JkkntghyPjsK
	FgQalLRmdDmXLn5iMS+kbN0Q08tvHybbzXIZE5juWHw32p4WZeRZr8MM1MHczWBT7r2Dshndrbh
	Mk1ePJ3lpIAlJVB73utSJqE6HIi6hFCKt8xbFXunX9ruzIIshjOm9w/okCwx6EqgmG+Fwek/vsH
	f5lhwhssldJnm1JCcCXD3cEwLXKeTSbPqSbD1jEJAMLoyyBIsxFc2+JVlGRTCqHchlymLGLGl49
	+3d6mrbOZZru2C/Kjced7ohc9gJxCyQ+IPAkmBOG2pwhlO4TpliAdJoSqnlgzXPUZhtVrZgO7f7
	Lq8IaijMb0WF/zZhc9tj3dbwveJ3QaAEo9xZ8iNRnqsqWXGE4tcSQe36JodFt+WwHdLd0CTfuf8
	EDG/byHrxMA8yIr+hpDh8Tg67vwvSy8BkJLmM4dyPcEMWEYn
X-Received: by 2002:a17:90b:2dc3:b0:3a0:41ad:6b9b with SMTP id 98e67ed59e1d1-3a098a7d8a3mr5021151a91.34.1790357633221;
        Fri, 25 Sep 2026 10:33:53 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0d22281f0sm651224a91.1.2026.09.25.10.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:33:52 -0700 (PDT)
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
Subject: [PATCH 0/2] ARM: vexpress: fix two device_node refcount leaks
Date: Sat, 26 Sep 2026 03:32:50 +1000
Message-ID: <20260925173252.933705-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_103354_687437_9501D838 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

The Versatile Express SMP bring-up path leaks two device_node references
during boot:

  - vexpress_flags_set() (mach-versatile/v2m.c) leaks the
    "arm,vexpress-sysreg" node obtained via of_find_compatible_node().
  - vexpress_smp_dt_prepare_cpus() (mach-versatile/platsmp-vexpress.c)
    leaks the SCU node obtained via of_find_matching_node().

of_iomap() does not take ownership of the node, so each is a one-shot
refcount leak with no functional impact. They were introduced by
different commits, so they are split into one patch each.

The first leak was reported by static analysis (CodeQL); the second was
found while reviewing that report. The CodeQL query was synthesized
with LLM assistance, and the patches were drafted with LLM assistance;
I have reviewed them.

Compile-tested only (ARCH=arm multi_v7_defconfig, W=1); I have no
Versatile Express hardware.

Weigang He (2):
  ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
  ARM: vexpress: fix device_node refcount leak in
    vexpress_smp_dt_prepare_cpus()

 arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
 arch/arm/mach-versatile/v2m.c              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)


base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.43.0


