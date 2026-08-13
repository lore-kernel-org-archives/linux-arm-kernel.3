Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B7FC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7xFlZn2dL19In3v56MGA4NWAnpSd0AP0zpWmikwEks=; b=mW/xyzyrxrkaYrS1SP+MqQ5p0S
	DnugJjqvDy25mrnDb9B60kScrK4BcF368l4m9DVlHU3MI+hQSfwwliFCySbG6PHA2xjDy4Mb1OuTu
	zd+tidbPd3rHZ6KszfNCz+f8OrSTPskRpGvXsPKQ+KZESuucUis+kb76fgbiYEs3V/FP+MJReJT3C
	o97E8szz+5FUrTI7zTk/u0K5jMenwHiomKDRr/rmFRoyzpbbkm/vraNhWWZFHXq5CiA6pbJWmJIbx
	+2w9rYYEyLvCwcI3LJgjrGxsqx89JNuIkwmOcugyxb55FpNq7hr1jMsSL6ZA9wRfBvzhzBDW3Zd1Q
	4MlpxKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYrO-00000001E6p-1K5B;
	Thu, 13 Aug 2026 17:04:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYrN-00000001E6Q-2dMz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Aug 2026 17:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=n7xFlZn2dL19In3v56MGA4NWAnpSd0AP0zpWmikwEks=; b=H0T0CjYIErPGEW9qItX8djaLYA
	bAhwJB1LzsE0jSzFTR/bNcAbyD53ttNhmVxaB52qGoijlVEl2lPBLWO0ykkGHBFm7XDUlMOKahIZ8
	hMaNpmJlitQ527luDXP7Rcge9yrHYK/qUnN9xi51pI6Dv4HCk3f0IlCPVA+0lT88tMh6xJ6uiU0e0
	LNrHktQ7ME7Ns74K6HtOWJJI5UaVMpypsEsTXgz6HwVoqlUdWpbTdsu/UexzUIbcOFemb8xIaBDga
	My7S3cPdge4eFaTl5GiXTz4t/LjgsNCiRDHkebtuFzai9j1AKfJdcFtWaDm3eF9qWa0dTzRDmYnd6
	oE7KiJ3g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wuYrK-0000000GMTc-3wsd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786640682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7xFlZn2dL19In3v56MGA4NWAnpSd0AP0zpWmikwEks=;
	b=SHUin1Hbyh/PQbb/A/drowACynaZb+oSAYEtf8C//ZKnz5W4/bwlwFzRBtiRfrXQTHvgW1
	49mzZTp6zt8g1uc6Me3DSOP1XdqOcOfJmvf31oUlhG0BPaQDIwLPzl6/MxIrV/DHHvSKJQ
	TwL4JwHzE0N4yUnyFm+QrvANiHWmTPE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786640689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n7xFlZn2dL19In3v56MGA4NWAnpSd0AP0zpWmikwEks=;
	b=DTeNicJyv5EwPZdnOANOkhX1ijxakeCNLIHbnIuO1HVim9dq1w1Sbz1Jcs6W5dV6UikOv0
	fhpV6DOjrrIWJo+aSiJ7y1//2SjfZsugAvczGWGCFZiznuHM4BbeDGujXSuCKDHMB6sVfh
	KDbCqSmKNOBlnivjFoDTk+yblrlZyGY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-F1ZGOoBaOWWr19b0IGlNbA-1; Thu,
 13 Aug 2026 13:04:34 -0400
X-MC-Unique: F1ZGOoBaOWWr19b0IGlNbA-1
X-Mimecast-MFC-AGG-ID: F1ZGOoBaOWWr19b0IGlNbA_1786640663
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1D601955E7A;
	Thu, 13 Aug 2026 17:04:21 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CEE67195DF98;
	Thu, 13 Aug 2026 17:04:06 +0000 (UTC)
From: Ricardo Robaina <rrobaina@redhat.com>
To: audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	bpf@vger.kernel.org
Cc: paul@paul-moore.com,
	eparis@redhat.com,
	sgrubb@redhat.com,
	oleg@redhat.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	monstr@monstr.eu,
	tsbogend@alpha.franken.de,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: [PATCH 03/13] arm: pass all six syscall args to audit_syscall_entry()
Date: Thu, 13 Aug 2026 14:02:53 -0300
Message-ID: <4f787a0c2a27eb919c481875b61a7467ef8ce547.1786626275.git.rrobaina@redhat.com>
In-Reply-To: <cover.1786626275.git.rrobaina@redhat.com>
References: <cover.1786626275.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: lsV6G4M1yKbqmoIt-SFLWBYAmJJI3c9B3fx98X7Cd8w_1786640663
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_180451_136167_28386634 
X-CRM114-Status: GOOD (  10.28  )
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

Update the audit_syscall_entry() call to forward the 5th and 6th
syscall arguments (ARM_r4, ARM_r5) now that the audit core logs
all six.

Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 arch/arm/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index 7951b2c06fec..ace74207738d 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -869,7 +869,7 @@ asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 		trace_sys_enter(regs, scno);
 
 	audit_syscall_entry(scno, regs->ARM_r0, regs->ARM_r1, regs->ARM_r2,
-			    regs->ARM_r3);
+			    regs->ARM_r3, regs->ARM_r4, regs->ARM_r5);
 
 	return scno;
 }
-- 
2.55.0


