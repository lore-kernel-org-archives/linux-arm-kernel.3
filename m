Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D128607526E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0lDwewpR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Sj2yRlaH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZkkNOwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=; b=0lDwewpR55hE0X
	JALPG8cn/X/oVilABOGpx3ssAbocVibAlx13/ifghEBItkF+ZFDfHFjtLLQuDYcvnZ9WsO4aYGEts
	sCsyBmVv65qPwmCH/vm8VPLqRcSDnxToZJg/Bhy587zzOV/WBwgxJ8yEZZCxfrB86h7k0Dph4XUPH
	UazhsAj8DjEpDAsZRMI6fRSTnclgsFzrNwcRqBcatvZZ4Q9e2FeJbLG2mohMaZZSAii1Gq4oqfXM1
	Dtac0Grfgak/HIUt7ARn1KPcjoAUhmyPTN+yBqjzxgEvJ+kKxY0CubqcASEJZA4FODu82iptva6AG
	JNsMIggU7BStZINUCjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0W-000000076jW-2hhO;
	Wed, 04 Nov 2026 21:59:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0U-000000076hx-15bc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Nov 2026 21:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=; b=Sj2yRlaHwgwaiFmMXxd8iCXzML
	iJWtTGFiPQRKBeQFl9+Te2smhMQQ0eNi4I7xgwNvUi/on/cRyijHGMIqk3Fv77KAvi8FDyVCKtMYV
	yxB9OrK5+hEewvgZplichC6Z1Ihf4JyNX3l6AQrIcxwR5nZhxHoFSJd64yR7ZHkaof5cLxgns/0KM
	Ml9Yj2DOB9uOWJ2elkgHKcz7tF4+9LqE9mq5t2oYPCCRE/K5iNd/gmIj+XKoC9YNXi1dAsx9GlSPy
	70FIlACFp70pEB2coT7jAvmeCgwxVOhpp+tIbMV+tgZGSXci0zrg/BPUimGi0me9K5/cESowdQtAP
	Q/TbjxIQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOj0R-00000002FBK-3ElL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:58:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13531585e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829533; x=1794434333; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
        b=eZkkNOwij4Qd9XTJp7txsgj7YYtMNQmv5DeJb7YGfsPndQFpB9v4sknJwxbH12B/wv
         Ma5Zu5goi4nivSg4uMeZbnS2iv7m9GqEzKsCEX3pm/rBiWE2/C1rAA+8CjfE9qkyX7xw
         29eTkIdThgPwK2aM/hFw8QHbut7nqfkZOlCFtnOcnp5tvjdh0WVw3Wob7fkTU7rlLJ6K
         Gbau5CNWgDB82BJvs+sUkBxt2eCbSYj1JMm9G+229wll5X6etVI9/lPCLdc+wpDOq8kC
         YvOU/WHrxBCK8bRtikY9qGAgIJF2IVIpQ2kVGpPk8SjQyGeNEseWFT4z4wAcc+w6XcZJ
         YCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829533; x=1794434333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0H3EUcqnLUlnXch2HKXz39dCofeKBnFEr/JPTlHIHo=;
        b=maZbfFOqW/oUO92vE6GlEx4hL/8tvXYZXW1gY+FKbnDEO0o6r0fK51gscs7l4MS9GK
         0Bk/kWIAfhSAQN+ZfaHLyGHzJbGYs3YN5ux276ZpvLIPDYCkfSkTvulyFDXssSRw69XA
         5Jru0QOWri6zSIJ+ydBJLPxg2MJMQrRUnFVL0C8s2L2pDisIjUh32CcOcEjvEnlFI99m
         cyXGhlx7RZx2DCaSyeCn+fHq1y3hxEvvTW8EaX0sDolsO9ksSTXjOWqPFqbRfpkVlh4y
         MjlKO9h9yMK0fa0B+GUcFBnpyRZnJuJxyAytOOMpYCYXvSa5KZ0JJnJ4Yr5TbQBdA7Hk
         n5pw==
X-Forwarded-Encrypted: i=1; AKwUvBzdoBwrImAMApV7N7Hw5F7RDsfaCjlWKXq+GmpV48rXyDaxfEUEsmvHiPQUJMY6rWBHLdNFuKGV+Simej/6SPz4@lists.infradead.org
X-Gm-Message-State: APuU4Z+U/bAeQDigpAFo9hz71r9XzcuhGqiL6C5iIwRQ1+bnteUcwUFP
	C6m5k4tEK/wWho6B4tqJj0skNLPopeYQdYcEjhse1fXRTOv+wWW4Ph7daLgXkPWdluU=
X-Gm-Gg: AYBFou3ZazDfNnzJ1yaXPsF2dTqufbv2DejJS7X7nS4tlPyu4jaBl7VS1H7VAhkSa8V
	SyZ4jYtlr4aJvegZ29+CEq5SOAjRIqf+aeqIrfGyEeYg8k/mvH5RS2/b5v9KxqvKgzxf/jn/fbU
	l1uk8V4rm3UU3PXnFfsVRv/TFvPe8J6G/sGMjPt87jeI0XQdG8zCpSOnYA8b2PGndfPbi/wPIuU
	XUG0D/XCy+otSYkULSh3V1qXUjd0/fMELHhyhnuZ+Ohem380/i26wenTIH7ct4NRKX2I7PNeR4p
	EjsAVE7maR1VUOZ4a4SkqzP5oYINoQgWWDMZcy7j+QdbYz/MhNPPfLt52xYdQhIiYL2QJhjCors
	Oz5kq69kjYzoBHb40KD4cGFXW3ICz98a79PGCk0lVVveaJ7d3UulgajRjD9Ii7YGvvDVc7LmWGX
	aWK/zopQlg1m5OFfl95Wsn25r1p249L9Q1cM2hyz3eza9dMz/CgY1OM153QxqFldUykk3fvhnwW
	fOdvg9vkuTj8buRsZIeCFGi8YUgsoEa3/Jmrpti4FuDKoeWyIoQQTVn6eGr1JfyaPYS07KDl69W
	CFaNWypslgILbEMW5m9jrE6bFjr67XckaWGAp5kP1eaoxbNaPVNflY66pA0a7pPkN/okt1AvMA2
	XvzYLy1mbX31lmaeCWtv/xeCdSDZSSf724xl0ZLF95TtG1Q==
X-Received: by 2002:a05:600c:c107:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4b1202673f8mr162862935e9.30.1793829533381;
        Wed, 04 Nov 2026 13:58:53 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:52 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 1/2] dt-bindings: PCI: rockchip,rk3399-pcie: Add PERST# inactive delay properties
Date: Wed,  4 Nov 2026 21:58:46 +0000
Message-ID: <20261104215848.2087944-2-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_215855_658004_E9DB3100 
X-CRM114-Status: GOOD (  13.07  )
X-Spam-Score: -0.2 (/)
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

The driver holds PERST# asserted for T_PVPERL (100 ms) before releasing it.
Endpoints disagree about what they want there: some need longer than the
default to settle, while others stop answering configuration reads when the
reset pulse is stretched that far, because PERST# stays asserted for the
whole wait.

Describe two properties so a board can state what its endpoint needs, named
after the ones the Rockchip vendor driver already uses for the dwc-based
controllers:

  rockchip,perst-inactive-ms      - the delay used at probe
  rockchip,s2r-perst-inactive-ms  - the delay used when resuming

Both are optional and the defaults preserve the current behaviour.

Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
 .../bindings/pci/rockchip,rk3399-pcie.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
index 720a5f9..7ac915c 100644
--- a/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/rockchip,rk3399-pcie.yaml
@@ -40,6 +40,21 @@ properties:
     maxItems: 1
     description: pre-reset GPIO
 
+  rockchip,perst-inactive-ms:
+    default: 100
+    description:
+      Time PERST# is held asserted before it is released, which is also the
+      width of the reset pulse. The default meets T_PVPERL for a slot that
+      is powered at the moment PERST# is asserted. Some endpoints need more
+      settling time than that, while others stop responding when the pulse
+      is that long. A value of 0 selects the 100 us minimum the PCI Express
+      CEM specification sets for the pulse.
+
+  rockchip,s2r-perst-inactive-ms:
+    description:
+      The same time, applied when resuming from system suspend. Defaults to
+      the value of rockchip,perst-inactive-ms.
+
   vpcie12v-supply:
     description: The 12v regulator to use for PCIe.
 
-- 
2.56.0


