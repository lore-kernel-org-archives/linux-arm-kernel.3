Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86396F417F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/el005jPydhTNUS1hr5dgVCq32s5flSC0Li9+BCYSpc=; b=cyHRQhhl9N8bEdya53HguA7JJY
	XkpMJCHRE5ixyGEwXrTD1DHFJt9byRgXInDp9t9TR4iaH0HBlLb5PKEszA+tOwSyHg4wLXekrmzse
	rFa/TOfDWpd/MCFNmm70SglV92n6oMqxm2EqVr8iadARsBCE3Pr4WEa0ralAdgk39jHmzNqCGeNsK
	7Igon6WAJX41cI9zITMaVyhBLZHzvHzP70TQvFF9kuEdjETH5Owv065D4cZeUXHWFNUGjhqO31t5t
	Rawl4sdR6L7tsje+f/BpzM0BdYFRX97YyoVCTuaxpVLcm4n0E46HBQsSkzSoP8O0t+YdSnvOAJolV
	OHss/Oyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdR2-00000007hDx-1ji8;
	Mon, 09 Mar 2026 16:26:24 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQo-00000007gtM-1drA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:11 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b94062e85f9so482983466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073568; x=1773678368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/el005jPydhTNUS1hr5dgVCq32s5flSC0Li9+BCYSpc=;
        b=EG7dOCqiyPcwY1tE4sPGp2G/mbr4Fl9bxDlMJSnBoGkzCB67JGAbJ9s+dediamrdth
         0vDoWVWWTptXct/Ii4xK7Q0UCBTaJ6+1jLSG8eYnTAaVLaAt/H7JiCl6/q3Ti1/kUeEi
         V7JTdS3oOu52yLyOnkJa9St/BF03DYKLGHN/+MFkmBSlqa98JC/ieutJU+xRH+UcCrGs
         P2TOeZVBaBJMzHSBaWAz3EjHOnABDTfs2zfriLU7bmBxJbKaR05zxFfGE5asSpkr/Ut9
         IHPfzekR71IUGlYEgTq4C9+icAjURZSuxhlrZa7SjKZNjqoZK/qyWNnJC1f5HzMDU/7B
         2kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073568; x=1773678368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/el005jPydhTNUS1hr5dgVCq32s5flSC0Li9+BCYSpc=;
        b=xFAkroT4BpIiCDBoKCU11/M6miyRMsZkoMg2p4psiW+ihdGhTTWCc3OvIdVisAC9GE
         kt9Gx1JWEEEXdbIzcXE75q3qhhSqWX/fdhs3MvUEc6a2MgizGdWnfzVDXXN/m2y0z6Kh
         JgeV3FbLYt8NqFhxA1CbTE1LCXIA24iWlZqvRJou49QKO+FA0OFuri8FOdw9p61SEQkD
         dRKSKyIcMzhKFBwBWUUKJgRjGGeyZlunH8spwUgPrBy8tn3VfYdAKNou6Z7W1OJO92Z6
         rLMJpWqZ8XwKbEFgghy/Z77tL+aj/j8PW5s19N5/eKCIVseqIyOmScnr8c9x8SWuxSdz
         TepA==
X-Forwarded-Encrypted: i=1; AJvYcCX2txSyHhSiVK/DXf4q8xjGYii5DCgP4oJH20JiQDYfzvpNo1CWURCT/GqUqc8buZU6nnffBvONsT/izZ42yrNp@lists.infradead.org
X-Gm-Message-State: AOJu0YzbxkGd2NC3/1rS50gsRcgBUzXrsU7rWe4J1nUWxML/78Kk4GHA
	0JSoYUqTWHbae7WrrJiszGraK5WJ258xeyVzCtdF5OMgqsntpfTUM+7rNBeN6q5q2ks3pf7X7rE
	rlJxcPg3CA9aeTOA95aT8kg==
X-Received: from ejzd4.prod.google.com ([2002:a17:906:c204:b0:b93:57d1:f5fe])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c13:b0:b96:ef71:49f1 with SMTP id a640c23a62f3a-b96ef715938mr293231166b.15.1773073568096;
 Mon, 09 Mar 2026 09:26:08 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:24:54 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-9-vdonnefort@google.com>
Subject: [PATCH v14 08/30] tracing: Add init callback to trace remotes
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
X-CRM114-CacheID: sfid-20260309_092610_438203_54942220 
X-CRM114-Status: GOOD (  12.09  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 10ca03dc192b..090c58b7d92b 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,10 +3,13 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 /**
  * struct trace_remote_callbacks - Callbacks used by Tracefs to control the remote
+ * @init:		Called once the remote has been registered. Allows the
+ *			caller to extend the Tracefs remote directory
  * @load_trace_buffer:  Called before Tracefs accesses the trace buffer for the first
  *			time. Must return a &trace_buffer_desc
  *			(most likely filled with trace_remote_alloc_buffer())
@@ -22,6 +25,7 @@
  *			new reader-page from the @cpu ring-buffer.
  */
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
 	int	(*enable_tracing)(bool enable, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 039ba71c3b3e..294d051dcef1 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -863,6 +863,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc_obj(*remote);
 	if (!remote)
@@ -880,7 +881,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(trace_remote_register);
 
-- 
2.53.0.473.g4a7958ca14-goog


