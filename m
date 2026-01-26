Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070EACF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcuxT0tCf/T7ct2VsPnptK2x4TV5cU08DiX9A8D84RY=; b=b2OSKFp/UrBYNY64u7NlWLW+W1
	DDiojPtMvLYEv0GGq/zIXCjaWshtcWEz4DU/MgOVOTsHF0VfrkEUC1xgU4EQM3kgddPc7JHwG/vbr
	tO7ZwpQ9wYqWfR/WIL0vq6VC4LVo/FsxV6etiRldQOi7OqSXyUl0nqLcUJZnogn1t72pX4PikQ/rd
	WYN4jZZwJS60GSDj5MCGa0cWCVMk2FA0DAOX0Gl75E3PHcEt7tElowkX4OG5lEzU/3YQ0b1ZS9oCQ
	n2IH2x5Mq3tyaRzOd3WV/+fx6L2aHtf21+5ymAcrap429XSBG64dI6V0c91YyrSYJQmZxHE32OiKw
	1hXgiLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK6w-0000000CLGa-3qz5;
	Mon, 26 Jan 2026 10:46:23 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5X-0000000CJhV-3FEq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-47ee33324e8so33358035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424293; x=1770029093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rcuxT0tCf/T7ct2VsPnptK2x4TV5cU08DiX9A8D84RY=;
        b=F0iVQBI6oQlxtUYrGm0PIqtH2+SdvOm2aaONGlAdxBpJkem9Mcu7KtxN3X1HLyIgOI
         j2BT5PwN7fpOFl+Uy+cIZazffIV4Vy/9pe7y+sU2vMXoPq22wKqavqewLcOoBPAfyAMr
         giVSMUXfIEYxL5K6qaRuVytOTPNl99ewhyz6J10Hr3NljRSMvK8ziwPx+eYBNPuNFfDV
         Umd73QPSButV+UwDMOWi7jLTU0F1CxlXakvNhfyjy8IgLTHp6KZbmQiPTQNnHS/rKCrJ
         EAhr4HfdxdZ94I1MBL00Nvmf+cDpJycW9KaLL3tD19o29MXWbd5JWoC1ePnupqZbXMy0
         ET8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424293; x=1770029093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rcuxT0tCf/T7ct2VsPnptK2x4TV5cU08DiX9A8D84RY=;
        b=l3aFXin2UDydeHDAugYhEBNreLHhcUNgkRscMplx1XwC9exbvInNTljMI9wK6/9g3c
         JmRw9iV1y9BVMdfkt15fi2KIA/6/c/addUWVaZGZChv0glR4mqL6ZhZ4qs1clOSg72nZ
         ND8ioE4PvLr8XIp8shdN8bBOAKz3UWRTk89z7Nq5CulbebbvirTTXky6aGlp53VL5LhV
         LB9MaJ16uHiw4iN2Q+Fan04mDBe/i1wCSTCMK1ZQYA84fLBksUlV2xp9aPzrGay0ctrj
         wdVO6Cyl1KUPsrgVX9bI+tie5ZAHShrKXNw555clUsUSVuAtjoziVaV76e6DqNFFknUs
         wzPA==
X-Forwarded-Encrypted: i=1; AJvYcCXP4mUlkbFlluL/56oQIcvlShyMtga3jHm01JpmwhnlvAUlOhhlfnGI5Q8tcBBYpox7irpGF7z5w96LB5IEKmiy@lists.infradead.org
X-Gm-Message-State: AOJu0YyYqs9h61Ff+D2ACQlzTwt6apBnVhHG91qNS8Tr/PKgQOn8JznO
	KSkZYEAmsKFlrf85LoONIv4VdGMg9ZoKrp88xyNNEWc/5FAF/SFLCGN2xsi/W04PlfyiBE12pNJ
	TEwc8cqNl9mgzd3xHlgZIgQ==
X-Received: from wmbdn2.prod.google.com ([2002:a05:600c:6542:b0:477:9b3e:67e3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba0:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-4805d064554mr67628505e9.26.1769424293569;
 Mon, 26 Jan 2026 02:44:53 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:19 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-31-vdonnefort@google.com>
Subject: [PATCH v10 30/30] tracing: selftests: Add hypervisor trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_024455_881995_24ADCCA6 
X-CRM114-Status: UNSURE (   8.62  )
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

Run the trace remote selftests with the trace remote 'hypervisor', This
trace remote is most likely created when the arm64 KVM nVHE/pKVM
hypervisor is in use.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
new file mode 100644
index 000000000000..64bf859d6406
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer size
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/buffer_size.tc
+
+set -e
+setup_remote "hypervisor"
+test_buffer_size
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
new file mode 100644
index 000000000000..7fe3b09b34e3
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer reset
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/reset.tc
+
+set -e
+setup_remote "hypervisor"
+test_reset
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
new file mode 100644
index 000000000000..b937c19ca7f9
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor non-consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
new file mode 100644
index 000000000000..66aa1b76c147
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor consuming trace read
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
new file mode 100644
index 000000000000..1dafde3414ab
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
@@ -0,0 +1,11 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test hypervisor trace buffer unloading
+# requires: remotes/hypervisor/write_event
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/unloading.tc
+
+set -e
+setup_remote "hypervisor"
+test_unloading
-- 
2.52.0.457.g6b5491de43-goog


