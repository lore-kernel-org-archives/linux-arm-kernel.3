Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BFECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fs/M7Fqoy0zdu3rq0sxtnZW6IS3TOjHhsegHTeIPLQM=; b=t9FKmLAUEuKn4DXQ+t0Yu99JZJ
	n9Le+XQGXTkxHZcx9l/CLna2Bo1JqezVsibv6B2UsIipILM9GRKHIs2xd/TQ9L9H5rQfBUQWG2Ox2
	KXqM0gWcxbfCiWxYgJNFIHaqNYBX1to1IbSpFchalK5YO0NjIwci/wBYLi584CoVSPUDbt2bFYlCN
	lJ9KQuNkmvpekQQnXn+zT6nixPWpS+NsxyKheCT8IAN7n4f3/clXolX/ctJ6AZfcl3lxJNlF8oWFU
	A6izmbsQiap+GfyEg7qTwtA2LgXT+XF3qYDrwbfRUTAdBoEvUMzbp43OlqF+9zkd2Ei65mokBdbsi
	WjmDsNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0A-0000000CQJ8-106J;
	Fri, 03 Oct 2025 13:39:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g03-0000000CQ7T-2jSd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-46e35baddc1so15645685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498745; x=1760103545; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fs/M7Fqoy0zdu3rq0sxtnZW6IS3TOjHhsegHTeIPLQM=;
        b=hTS0lDlfQeoeOR+AR9kZvg0o6wZnUVXCag1PExRMnrb+176pYb7LAfI0bkAiAr1sk1
         zzEwAvN7CCW1jOMNwGaMFdPhy5vpU4akbUQfRwA60wvKzTbVZAEvZQ3PH6oYKgIOOnUd
         cgz/Y0D4ukb2c0V5auIwjDT/fUSrL57+OwdEyV6qd5Ypl7EJb42KzGqjHSpzavRz//5i
         AGAnielgY6DVAMAfophWdbqTvItiNIPWbikyyhDV8BvKGLIfMExe366HyMZqvi297kcv
         h6XQLUlHFFxxP1pt/T/7cGCexaMqf9hgfnf1pO0VRvaWqiJwbdb5fugPSpM5yokPBURS
         X40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498745; x=1760103545;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fs/M7Fqoy0zdu3rq0sxtnZW6IS3TOjHhsegHTeIPLQM=;
        b=LtP84EVk/T8xDg+cpdvsil6RaCqAVbEYcprM+ktT4b283RLGliekwACqSeZTVwXlDY
         ez3v0gUiXTMS6KGn4X+B18ZKJqUObeSzHhMQGmz3HYa4SOGJZnyymOQT9tSLkne6oXcw
         u3YXvLdI8vQ4ysNkOOGYJ4pUscrzwPV88btPbOgUY4x/OZ05Qjqa0bLUUs51peaDuKGg
         WcWEg4ttk21xuFU9unthEfcR7xPwnV+WcMGQ8sHYTg4+1DTI2vtKWN43T1kFvaZm8eF+
         g4ToOKE9NIBbeD4A9bTNltnwBW2UTCVat4+VukM99yp0aJbhSisFBfnh/vAVc9Rpbaqc
         drYA==
X-Forwarded-Encrypted: i=1; AJvYcCWE01nOi6dTMqhl6GllOQ2kNvZ3rLp5xALwpIaF0UUO/+S+43HmGyeD0VFSLzkxR+i+vLk2eLfhLPYCO9VEt/cf@lists.infradead.org
X-Gm-Message-State: AOJu0YzFRxEdiALq0aNiOWs1Y1YfsKuiapt/DmraiKlPnrrKMKdTz/cN
	/v9LpvlzhNdjCgVqC+uTuu0sfHmSj0hbu4K6tRGLfuEoLie6POEb+R6tRKfivcPa0rLFYEHOcNT
	mXV2uPWqsA3wd8LERXZJEVA==
X-Google-Smtp-Source: AGHT+IGhMHN0dJUUicPDV7IwYD5dxjTKJb2FY9Dk+V7sxgd83geumTaXQTdlEwmEdvOKbgxCexNOxhanuhI6Kor0
X-Received: from wmbz10.prod.google.com ([2002:a05:600c:c08a:b0:46e:38cf:fbd6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34ce:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-46e711408b5mr20342175e9.18.1759498745183;
 Fri, 03 Oct 2025 06:39:05 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:05 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-9-vdonnefort@google.com>
Subject: [PATCH v7 08/28] tracing: Add init callback to trace remotes
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_063907_716088_FFAF7899 
X-CRM114-Status: GOOD (  11.64  )
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

Add a .init call back so the trace remote callers can add entries to the
tracefs directory.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 55754ef78104..15a579633123 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,11 +3,14 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 /**
  * struct trace_remote_callbacks - Callbacks used by Tracefs to control the remote
  *
+ * @init:		Called once the remote has been registered. Allows the
+ *			caller to extend the Tracefs remote directory
  * @load_trace_buffer:  Called before Tracefs accesses the trace buffer for the first
  *			time. Must return a &trace_buffer_desc
  *			(most likely filled with trace_remote_alloc_buffer())
@@ -23,6 +26,7 @@
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index c011df20df95..55ba3fd9e002 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -837,6 +837,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -854,7 +855,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 
 void trace_remote_free_buffer(struct trace_buffer_desc *desc)
-- 
2.51.0.618.g983fd99d29-goog


