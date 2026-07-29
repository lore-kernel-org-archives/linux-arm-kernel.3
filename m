Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C8BC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MD0uIT8ybnFNo/naO0cM//mhD9i97KkKC1yqOwHN8g=; b=HCBvmqaPQVeNdAHM3YJZEHvFg9
	zzebp8Mr6mIObEYJMMthRRv9O8og+BJVjAlAVyknFn+CC6ojNWUBjX+QWIGtlrImDv5KBk4MOK4wI
	px7xJnk594cXf5SG1IIqmPwbQnHCKgba3kx1RZzRcIDNCLIpjaWQCATG+CxUQR6saM//GioSNLh8o
	SYaXc2mGmXnG3mucNx7EllA5Udei3F7Q0rUiIr3OL+xUYv56WIwpW5Z9XKN4u/x4aeJZ4AZqZkn3Y
	28v5289lYwdTYSEWgTnp6//BlbbA3fpMNuXB52SMfG67qJxyxvyQEmPx2tIk61FpbSoe0WbnPYkNi
	2eFvgfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp78I-00000008Y4N-1bYG;
	Wed, 29 Jul 2026 16:27:50 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp78F-00000008Y3p-3Nau
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:27:48 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-848544a8496so1254084b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785342466; x=1785947266; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2MD0uIT8ybnFNo/naO0cM//mhD9i97KkKC1yqOwHN8g=;
        b=P7YrRa9iKmCf4jp32UxfYd27XmiClmT9E1WMV2uLjUWyJqjmnujTDmw1m26yYbPSXN
         dBA+sui/Qw8xRx9TKEGyA4Z7ozNJ7oamTYmbQcVMU/ajvxlAvMB5NiDOhEWJ66ogtsVr
         R86RIBHNu9diZYw6REMvwfAvHd7EM09B5kJhwhlofL9N0jwCpqIuOJxl8JGot1Htnh4O
         d2AtRsyrg2IizpSMToykS5VFyzsGwPLlsbIERH2tDiyfhquXVyGkOVXmxsR9lmJDkhte
         11AsNTqeFt2AAdephrCfnyRQGPw6Q22nn+hcuF2jJ3RWk92EvJ7ApSrkok6fNs1BB2nc
         Racg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785342466; x=1785947266;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MD0uIT8ybnFNo/naO0cM//mhD9i97KkKC1yqOwHN8g=;
        b=PYnDnSbgRVwEDwv16Mz6l6KR7ObBiQuJwuv5VD8//+Xg1YhS5820n0WkVacs3U2ikq
         olZqu+BgVWrbwdU5SCOoT7O9LDBoMz+ANmRUP0+wrJ4f02eVPkyca7PL1CX0W85r692V
         0Rlo4gs9uZKH519sF2LodSDkFKCMxnL/1ftM4Ok7Xl9Wq5PJTqyv7ywJ3hypz46NSfL7
         ukTAbDnoTLQvsNLxpprc8lLs2neWjld2+x0TBG+8m2j4dHTGOaZdPvvX6Vn/EqRCYtQM
         Zbb+vFAyc333ydKRerSbZac6WfWdfMB5jAyeapotstoFYwE1kQL7Vqu5eou+8FH1iXF/
         ldsg==
X-Gm-Message-State: AOJu0Yx4/1DcBxuHjRHNWbEUbrzf0DV7Anbufr366iQlw1OjgPqwBoqq
	k++zlm/w0I+EBUSF2HtMwYMUcNMgHr3t4dNkVQ4msF9485lqBTjMqstnb3mvWLqk1tdfoGHVtw=
	=
X-Received: from pfaw9.prod.google.com ([2002:a05:6a00:ab89:b0:84a:37df:a3b1])
 (user=natg job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:22ca:b0:84e:24df:3873
 with SMTP id d2e1a72fcca58-84e9316e1bemr7196238b3a.32.1785342466117; Wed, 29
 Jul 2026 09:27:46 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:27:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.487.gaf234c4eb3-goog
Message-ID: <20260729162731.1383875-1-natg@google.com>
Subject: [PATCH] firmware: arm_ffa: Call ffa_rxtx_umap before calling ffa_rxtx_map
From: Nat Gurumoorthy <natg@google.com>
To: sudeep.holla@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Nat Gurumoorthy <natg@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_092747_857904_131C9F51 
X-CRM114-Status: GOOD (  10.62  )
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

In ffa_probe call ffa_rxtx_unmap before calling ffa_rxtx_map. It is
possible that crash or a kexec can leave crb_ffa with old mappings.
A call to ffa_rxtx_map will fail and leave crb_ffa interface unavalable.
The unmap makes crb_ffa forget old mappings and allows new mappings
to be set up. In kernels where arm_ffa is built in, module exit
routine ffa_exit will never get called during kexec operation. This
leaves behind stale mapping. New kernel's ffa_probe call to ffa_rxtx_map
will fail and crb_ffa driver will not be available.

Signed-off-by: Nat Gurumoorthy <natg@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8654b3365c9b..44d095bc8569 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2168,6 +2168,11 @@ static int ffa_probe(struct platform_device *pdev)
 		goto free_pages;
 	}
 
+	/*
+	 * Force unmap before mapping in case previous crash/kexec
+	 * has existing mapping.
+	 */
+	ffa_rxtx_unmap();
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
 			   rxtx_bufsz / FFA_PAGE_SIZE);
-- 
2.55.0.487.gaf234c4eb3-goog


