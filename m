Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD2DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgEdqVZzkg8EdfvsvaTXXYI6aDMdt2t7UIchiBP7OMQ=; b=boOjX9sg0PWIxvPOUAHe/IGLxj
	jW0mtTxqVnqAQUH+Vtjs7W58AvjhQ+Mv1rtBay1pCMXfWjjm/IggK8WdO7peD1EU/MkicpZ0945S4
	xIDKiXc7ud+6OtrGrHFctJq87G5Je9EfqUnNm5Zu6VopOlC3kUCWYmfTH/ibSJplc3BMEYZbHCFQl
	1RrcPkkJ/QYCbvy/wEl1JQulJYlxnzjBydUbfPomYYfITSj+sqQMvzG+Snv/jff63yaRfP+YghXIi
	xiphQagblX1ZGqLeuB/UeKiyCrfhXLvTQgORJ7QSuQbeT+5YJR3A+saRDlme8seJuO/hLZ97p0UnM
	DDjjc1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pq-0000000EBZt-0oAo;
	Mon, 29 Jun 2026 09:36:34 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Pa-0000000EBRb-2Z4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:36:19 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-695f710d929so2290076a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782725776; x=1783330576; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mgEdqVZzkg8EdfvsvaTXXYI6aDMdt2t7UIchiBP7OMQ=;
        b=ZDCEL6Gem9cpMxymh8GMWvOQSsufMermT8ZbLdHhqMvhxmz/nXaArvOGqAClzJzz0x
         /5SgxISCAMX05CzCh+38KkJ5DF4Lkrg8iOMVOBPEkebqZkKYMnTzapmlxQq4NWrZzF0l
         NkvrjNI28IBWQ7NZowjm1hJ52SWnLr4uyvYOpVwzZHdmuwE06SyQJI/O+S5w+kNMp9k1
         KKwff9JUMEaiyhs+EOHrCZsYtTrQGdhol0Eb/4qbMNLkHdVmRgPnaDCGIZBzZVMz/AVo
         guVhYbVfJKPR6bz1ppFOXXtw7cfEE8Er7ZhSYBfICeU8lufMy6dKVTGT8918pOgqzGT3
         N+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725776; x=1783330576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mgEdqVZzkg8EdfvsvaTXXYI6aDMdt2t7UIchiBP7OMQ=;
        b=cnOFm/7OQr3CrNzC83nfbsSRclW/tJvPGzc3AG7ZkMysVOSIHErZOxMKBom3NgR7Ip
         gj1jmm/Pp5zgvX/eYPHi7vJNMhSxIxsKKkC0ttodTRTsgsfHlnJKzmuQk+6KnVzCAFaW
         8732ZAaBsvroA7/6uXQu/6J15UmjDUYYZgAreBgaGN4lwat2PVI75tUCeMdeskq1qwvj
         gb+su9egN0JnVSutalJ3dw4Qoo9OBWAHn7uKi1DaKW1LmL6lnoKUUJx3GLDQibk6N3Mk
         GqEogiLW3clhnK1i8EyQKUe/Ud+IqZ1U3AtxuqM1KE7oIVENah1tmTc36PiusLsyGCbU
         zd5Q==
X-Forwarded-Encrypted: i=1; AHgh+RruQ42rcjBXCl4L9uUpcd0wJlSR3euBj8ewOj2KxUS9OQYAUTOtXVzx3IdPdQVYXFp4Y1tEC7HQSUu7VWpbTerS@lists.infradead.org
X-Gm-Message-State: AOJu0YwrmHhM5p2C/o13TuR+JMka0gkRzdy7w/Dm9fty+prVvZdDyj25
	7SggHQu7tfdk0YrV6IxP+kp9EUYcMULQqhd7TfSVqJZW11aImJ0bNx3snkQ7PJkfG87tq2wkwD4
	IW6Zd2n1V1XMYmosTGocmBua29bC+dw==
X-Received: from edyb2.prod.google.com ([2002:aa7:df82:0:b0:697:8356:d9d4])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5249:b0:698:62b7:a4cc with SMTP id 4fb4d7f45d1cf-69862b7a909mr1588559a12.5.1782725775494;
 Mon, 29 Jun 2026 02:36:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 09:35:55 +0000
In-Reply-To: <20260629093558.2425257-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260629093558.2425257-1-sebastianene@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260629093558.2425257-5-sebastianene@google.com>
Subject: [PATCH v7 4/7] KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_023618_663034_DC486157 
X-CRM114-Status: GOOD (  13.87  )
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

Allow FF-A notification SET messages to be proxied from the pKVM
hypervisor to Trustzone and verify the arguments.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index d52d7c4d5e7f..2bb16aa414f9 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -43,6 +43,7 @@
 #define HOST_FFA_ID	0
 
 #define FFA_NOTIF_RECEIVER_ENDP_MASK	GENMASK(15, 0)
+#define FFA_NOTIF_SENDER_ENDP_MASK	GENMASK(31, 16)
 
 /*
  * A buffer to hold the maximum descriptor size we can see from the host,
@@ -678,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
 	case FFA_MEM_DONATE:
 	case FFA_MEM_RETRIEVE_REQ:
        /* Optional notification interfaces added in FF-A 1.1 */
-	case FFA_NOTIFICATION_SET:
 	case FFA_NOTIFICATION_GET:
 	case FFA_NOTIFICATION_INFO_GET:
 	/* Optional interfaces added in FF-A 1.2 */
@@ -917,6 +917,27 @@ static void do_ffa_notif_unbind(struct arm_smccc_1_2_regs *res,
 	hyp_smccc_1_2_smc(args, res);
 }
 
+static void do_ffa_notif_set(struct arm_smccc_1_2_regs *res,
+			     struct kvm_cpu_context *ctxt)
+{
+	DECLARE_REG(u32, endp_id, ctxt, 1);
+	DECLARE_REG(u32, flags, ctxt, 2);
+	struct arm_smccc_1_2_regs *args;
+
+	if (FIELD_GET(FFA_NOTIF_SENDER_ENDP_MASK, endp_id) != HOST_FFA_ID) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	if (flags & GENMASK(15, 2)) {
+		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
+		return;
+	}
+
+	args = (void *)&ctxt->regs.regs[0];
+	hyp_smccc_1_2_smc(args, res);
+}
+
 bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 {
 	struct arm_smccc_1_2_regs res;
@@ -985,6 +1006,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
 	case FFA_NOTIFICATION_UNBIND:
 		do_ffa_notif_unbind(&res, host_ctxt);
 		goto out_handled;
+	case FFA_NOTIFICATION_SET:
+		do_ffa_notif_set(&res, host_ctxt);
+		goto out_handled;
 	}
 
 	if (ffa_call_supported(func_id))
-- 
2.55.0.rc0.799.gd6f94ed593-goog


