Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50EED7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZUIc60w8aDIxM9yUNkpf1enaQr7Rd+FSbamqcyyReA=; b=fq0l8IWZ4/oKfbK76bqSh2tFe/
	s3p21YX40MtDOt2Frv/89ME45/45dh/+DKb6OH6g2Fiblwu5whlXZyQFIyivNb6tOWaRfezbsmCc9
	s3sz+eYiX70ie6ju5HiJ92NnzYIPXI4R+0t4Ter5EoZo40SJfX2RB0m8asNHryF6QyxuCawq3ES1G
	1XQISYaKTNfAAaoYpNSxOuPktmayMzXUUyiAofA+MkGeYF7VtgR+PKM9cV0IblBHIpia3E7ZGRvxw
	fJxCzykBwVJF/T8UI7dVTidZ/MATYBpswLYM+4xfG3RPifWukSWnSYUkyuKwnWBCRQHV3iMx12djQ
	v2dy2pFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2V-00000002bpz-0xMK;
	Sat, 31 Jan 2026 13:29:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2S-00000002bop-3bcz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-477c49f273fso27862305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866163; x=1770470963; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZUIc60w8aDIxM9yUNkpf1enaQr7Rd+FSbamqcyyReA=;
        b=IL3p45rqNrSMdizQBHiW4VW5aCywdc0WJqh2fV8PShH3phbKXtTrrpvJA/nlLxuCd+
         f5zblwDjOTGbfjosTIbTn0t3f1tGgRHb8knbx9TIqU1N4lMJovCrj0WhQsLwZmYFtmeQ
         ebHMwpDViMDuuY2bsQSYmo1dlzTSkG7bmlDP8aYB68eJgNaRJpqa1u0Vn20AaR2ZHa7z
         C/Pakl32My+4fh5Cvgd0ryXnHqWoZEsdJfOxi2LxT4r5KpaOj28dHHp6GPCZFeb34AHo
         5UqoBRm3REgHlUB3bQyCHv74MXoWCNnfpwE4ABES1TEcwwtverdawybMhUdEAs5jodfV
         W57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866163; x=1770470963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZUIc60w8aDIxM9yUNkpf1enaQr7Rd+FSbamqcyyReA=;
        b=HclK3L3jLc55jsybjJbJ0MUPpUYpr2EGrL1tE6Xl3ojAZqklAmu2SfQK/Owixa8mQk
         wpxCblC66jU4/5aUH0WrYZ/VGPRRiAkv0xT08LK3uW19yjFtMamnHf3wjxUnD9KB65Ca
         iAc2FTpVw84BQHT9ud9Qz9mtcm0AILRzcUki3xGRG8u6NoWohSkZzWrbfPgrJHmaav8U
         efy5ABWwgSukuJYof9x5aJLVouT9XGVrtGYJ1WEiXuDXeaZbPieuenJKZQFzKs3gJfHI
         S5vGuByRXWW8lc9owhathzrXRh8mP/+eclz2jJ76XdqMAmSlerj2LD+CMBk7cQNXr8Y+
         GrDw==
X-Forwarded-Encrypted: i=1; AJvYcCXXcmF/xvVYtMSnGOtckGCRb0ECa+rAI1Nl2YC/6yO8clX/0Ceab+bRwcFhrvSclRJSqFcXdk1kKleb1y7b6BnD@lists.infradead.org
X-Gm-Message-State: AOJu0YxVA8+zvlKTR7A7qvoxttkRgpTBUtwF0aeEoiXw+8ehI8/Hf6xt
	mYdHEN1Pg1ZHWjCrax5EWkDCbq9hySvfnZrMUqh7nYMsihmUoRYmM/IausEB6ky/U2ACEANBWgK
	zTc5Znm3gP5VgraJfMn8S5A==
X-Received: from wrfi9.prod.google.com ([2002:a5d:5849:0:b0:435:a2c9:8c02])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec7:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-482db463c13mr79331465e9.16.1769866162768;
 Sat, 31 Jan 2026 05:29:22 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:19 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-2-vdonnefort@google.com>
Subject: [PATCH v11 01/30] ring-buffer: Add page statistics to the meta-page
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
X-CRM114-CacheID: sfid-20260131_052924_903647_964A11B9 
X-CRM114-Status: UNSURE (   9.06  )
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

Add two fields pages_touched and pages_lost to the ring-buffer
meta-page. Those fields are useful to get the number of used pages in
the ring-buffer.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/uapi/linux/trace_mmap.h b/include/uapi/linux/trace_mmap.h
index c102ef35d11e..e8185889a1c8 100644
--- a/include/uapi/linux/trace_mmap.h
+++ b/include/uapi/linux/trace_mmap.h
@@ -17,8 +17,8 @@
  * @entries:		Number of entries in the ring-buffer.
  * @overrun:		Number of entries lost in the ring-buffer.
  * @read:		Number of entries that have been read.
- * @Reserved1:		Internal use only.
- * @Reserved2:		Internal use only.
+ * @pages_lost:		Number of pages overwritten by the writer.
+ * @pages_touched:	Number of pages written by the writer.
  */
 struct trace_buffer_meta {
 	__u32		meta_page_size;
@@ -39,8 +39,8 @@ struct trace_buffer_meta {
 	__u64	overrun;
 	__u64	read;
 
-	__u64	Reserved1;
-	__u64	Reserved2;
+	__u64	pages_lost;
+	__u64	pages_touched;
 };
 
 #define TRACE_MMAP_IOCTL_GET_READER		_IO('R', 0x20)
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 630221b00838..1187d632dd5d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -6131,6 +6131,8 @@ static void rb_update_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	meta->entries = local_read(&cpu_buffer->entries);
 	meta->overrun = local_read(&cpu_buffer->overrun);
 	meta->read = cpu_buffer->read;
+	meta->pages_lost = local_read(&cpu_buffer->pages_lost);
+	meta->pages_touched = local_read(&cpu_buffer->pages_touched);
 
 	/* Some archs do not have data cache coherency between kernel and user-space */
 	flush_kernel_vmap_range(cpu_buffer->meta_page, PAGE_SIZE);
-- 
2.53.0.rc1.225.gd81095ad13-goog


