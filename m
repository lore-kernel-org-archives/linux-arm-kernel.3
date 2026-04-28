Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AD1FF8870
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=; b=SOdK3O5asFMXZSchtlcR7mn5Vn
	rhFyMgPSvD1yx9Siitsa4KxRabY5G3qgnqejBvz88nOKxBLMXetAhJu+PTg5HDd30b2btyDiHh7nr
	7KaB02gfUgd9JX29dbBAhPJzRbprEa26LDHey68FQgS8THATz2zeEbivWSzvQUDYVJeeJzmbqUXxG
	kkpasOEgjazgEYU4QVlvAy6bkOcrYtcBhxzLQmcAVXCQX9ZbzvWns2ZaEewNxALmvSpCl5slWZX+J
	IV32mfOdq46jjLzTQepUjpom1qoPQEdam3UDnh6bhScKLVquOgQBFlL2BTBOeMZAU8nFT0cs6G4Ve
	eB5yu4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjb-00000000gg9-1eJh;
	Tue, 28 Apr 2026 07:19:55 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcjI-00000000gO5-1dTC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:19:37 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2cc75e79b97so31247141eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777360775; x=1777965575; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=wWepk/itKdzBUESl9ZkveD+dX3wyQETL33QxveSmbuSC2a4RDyWnlwTiVtsAPEyqLq
         eabx+rP0lj8S2Dq+CyCePpE57hm8Ujup79XaDNLyvWJ943TqNRgFpxP9ZDXQ2oa/3UaJ
         /4axmq1tt0Ev+ETvJ7N33gIRCLMiu1I0biETesige5iTU6QS6YD/6pgFelm7dcB75D2B
         04Fizi+qerxkqdxb3AlVncOsA2PNzs8t8UD2QYFi2lX/rRcRo/s4vKAXUpWGmKHiFF48
         lJapXAK6Y9zYLpUqC7GOkb7f4UHZDuLDQb5SMMEZmCI+9UN1B49dQj0Ie/QPhQu2u7Vi
         T29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360775; x=1777965575;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=22olXlLY2a/aW3iIRalXE3Od5F0yl9bqDC7eX7ett48=;
        b=eF4gud75A0RCXLXBXsi6tXO3kWiY/VXtp1a5iZsX3FZFNzXolnqrf7DCzjpQ/vyGoJ
         CyYCx+oJo2xeUNHGdQiSI3+GMfnOWR3EWtzjoM0vQqiJu76Al7yRrubYZMSGAezrdfQ5
         6PhanAZckD/oAh9czwfvlsDIEQ74smkghwLqYwmBMC2b+vyJxrlt49HhUldN+vDzRNQa
         Dp00gp4NOFCY7oI5X5YRQcLsBjOFM1yM4HnmtUuP+q5NS0jlFLgla1JoNZkxYNpkALLR
         WxZP3zsUUuImq+bO0qHdkh1tOwL+vT213VA2WcP4v6/JL2ovM5cOAGFpOY9qYMUxmRgq
         aYSw==
X-Forwarded-Encrypted: i=1; AFNElJ+do2QATM9zm46q4zRgLem1FnJbXfB/FlLoYGh0mImemgUnDwmasg18s7FSIpgwTKHlCqAmEpAjUwvik4hOMIFA@lists.infradead.org
X-Gm-Message-State: AOJu0YzrxTrafYPjz2fL8g3298tNhCnYV92bRYaIg1y3XoSBYrsxj+Od
	KeWwksd02Vzmgr0lfd1HLukeQcygakg1DTQ/DdwwWPuiqDmpVzhzl+Jn49cX0zTE8j6sPl9bZ62
	N7IcoAwnoOQ==
X-Received: from dybor13.prod.google.com ([2002:a05:7301:1f0d:b0:2d8:4599:1d20])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:148b:b0:2e0:4edd:64e4
 with SMTP id 5a478bee46e88-2ed0a10cb66mr958174eec.26.1777360775061; Tue, 28
 Apr 2026 00:19:35 -0700 (PDT)
Date: Tue, 28 Apr 2026 00:18:13 -0700
In-Reply-To: <20260428071903.1886173-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425224951.174663-1-irogers@google.com> <20260428071903.1886173-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428071903.1886173-9-irogers@google.com>
Subject: [PATCH v8 08/58] perf data: Add open flag
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_001936_439863_E0885144 
X-CRM114-Status: GOOD (  19.44  )
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

Avoid double opens and ensure only open files are closed. This
addresses some issues with python integration where the data file
wants to be opened before being given to a session.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
Changes in v2:

1. Fixed File Rotation: In perf_data__switch() , I added data->open =
   false; after the file is closed. This ensures that the subsequent
   perf_data__open() call will not exit early and will successfully
   open the new file.

2. Fixed Memory Leak: In open_dir() , I added a call to
   zfree(&data->file.path) if mkdir() fails, preventing the leak of
   the path string.
---
 tools/perf/util/data.c | 26 ++++++++++++++++++++++----
 tools/perf/util/data.h |  4 +++-
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
index 94dc534a7386..17baf71897d1 100644
--- a/tools/perf/util/data.c
+++ b/tools/perf/util/data.c
@@ -346,8 +346,10 @@ static int open_dir(struct perf_data *data)
 		return -1;
 
 	if (perf_data__is_write(data) &&
-	    mkdir(data->path, S_IRWXU) < 0)
+	    mkdir(data->path, S_IRWXU) < 0) {
+		zfree(&data->file.path);
 		return -1;
+	}
 
 	ret = open_file(data);
 
@@ -360,9 +362,16 @@ static int open_dir(struct perf_data *data)
 
 int perf_data__open(struct perf_data *data)
 {
-	if (check_pipe(data))
+	int ret;
+
+	if (data->open)
 		return 0;
 
+	if (check_pipe(data)) {
+		data->open = true;
+		return 0;
+	}
+
 	/* currently it allows stdio for pipe only */
 	data->file.use_stdio = false;
 
@@ -375,16 +384,24 @@ int perf_data__open(struct perf_data *data)
 	if (perf_data__is_read(data))
 		data->is_dir = is_dir(data);
 
-	return perf_data__is_dir(data) ?
-	       open_dir(data) : open_file_dup(data);
+	ret = perf_data__is_dir(data) ? open_dir(data) : open_file_dup(data);
+
+	if (!ret)
+		data->open = true;
+
+	return ret;
 }
 
 void perf_data__close(struct perf_data *data)
 {
+	if (!data->open)
+		return;
+
 	if (perf_data__is_dir(data))
 		perf_data__close_dir(data);
 
 	perf_data_file__close(&data->file);
+	data->open = false;
 }
 
 static ssize_t perf_data_file__read(struct perf_data_file *file, void *buf, size_t size)
@@ -457,6 +474,7 @@ int perf_data__switch(struct perf_data *data,
 
 	if (!at_exit) {
 		perf_data_file__close(&data->file);
+		data->open = false;
 		ret = perf_data__open(data);
 		if (ret < 0)
 			goto out;
diff --git a/tools/perf/util/data.h b/tools/perf/util/data.h
index 8299fb5fa7da..76f57f60361f 100644
--- a/tools/perf/util/data.h
+++ b/tools/perf/util/data.h
@@ -50,6 +50,8 @@ struct perf_data {
 	const char		*path;
 	/** @file: Underlying file to be used. */
 	struct perf_data_file	 file;
+	/** @open: Has the file or directory been opened. */
+	bool			 open;
 	/** @is_pipe: Underlying file is a pipe. */
 	bool			 is_pipe;
 	/** @is_dir: Underlying file is a directory. */
@@ -59,7 +61,7 @@ struct perf_data {
 	/** @in_place_update: A file opened for reading but will be written to. */
 	bool			 in_place_update;
 	/** @mode: Read or write mode. */
-	enum perf_data_mode	 mode;
+	enum perf_data_mode	 mode:8;
 
 	struct {
 		/** @version: perf_dir_version. */
-- 
2.54.0.545.g6539524ca2-goog


