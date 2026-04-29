Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B4CFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEyBNEEa6BE7g50eZDPwXBoN+jkJ9pIq5A7tYO1W8LQ=; b=sdQvXP6B4TXChRJtCgZB79EidG
	aVMNjRn4Ma9bfWagVEuFUhikIYezg3KpYo6rk21JAepudr9qG+WRyMIVFBqJDRFEIp5XFA+2njSYq
	Ujzqh7bDVEfDDoOzXmyYxeVFA9gE7OgcbtntSecdJ0E3igiLaHoUWQ8z7ne6F1B0lGZevrKETXhCk
	8ZJ35ZJGi65f5v6up/KdquTcogevnJvYlEDpRyDcxR+qMtL5NqJX5a8DOtHc/1TlBspNuQY0iVSOt
	bJNqpWsybHRAxrvrbisKO61MIWw2/RRHgMxgBFH+fZGMgsM4ZMYBXgF8x0ngfYD58pAAFEVbMh2S5
	3JzuNsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHz2A-000000037pC-1myi;
	Wed, 29 Apr 2026 07:08:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHz27-000000037oM-2boN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 938E94432C;
	Wed, 29 Apr 2026 07:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03515C2BCC6;
	Wed, 29 Apr 2026 07:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777446510;
	bh=xzf3jDb9geA3dFUjFfPguBRjQRDomeV6ObB0wINZalE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrXvBnVqhSEcru+ida6yeaq29fsRfpdCwSmfZhRUCu7paHArurk7TddV+cSRxv64X
	 7VsIVPKD51v1+BcACw1SN22fqck7/4SQiTt7bsodNtX/gRSxizO93s9YIb5U9ZZTQL
	 f2UB/WpEuO7RMvFuLKzhHwudSEfuhsYRrSi3v8zFo4llTccyYlJ4LzrkAUJkFy8Mh7
	 SZmk1AyLZGEe19jHL5ggfIAOiFsxwRMka1OGSdh7xBphutGogF6uiu0IHK14fMFh2M
	 Tf4VMX8NsRxKwAKQY249eu7PX/lJ20L0oMPVZZ++67MjYATzi4PgvfIFP+fYjQ188f
	 xcRLKi2UGliTA==
Date: Wed, 29 Apr 2026 00:08:28 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: acme@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com,
	dapeng1.mi@linux.intel.com, james.clark@linaro.org,
	leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, tmricht@linux.ibm.com
Subject: Re: [PATCH v8 08/58] perf data: Add open flag
Message-ID: <afGubL9LrZKEJBH6@z2>
References: <20260425224951.174663-1-irogers@google.com>
 <20260428071903.1886173-1-irogers@google.com>
 <20260428071903.1886173-9-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428071903.1886173-9-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_000831_697538_5F05A831 
X-CRM114-Status: GOOD (  26.02  )
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

On Tue, Apr 28, 2026 at 12:18:13AM -0700, Ian Rogers wrote:
> Avoid double opens and ensure only open files are closed. This
> addresses some issues with python integration where the data file
> wants to be opened before being given to a session.
> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Signed-off-by: Ian Rogers <irogers@google.com>

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

> ---
> Changes in v2:
> 
> 1. Fixed File Rotation: In perf_data__switch() , I added data->open =
>    false; after the file is closed. This ensures that the subsequent
>    perf_data__open() call will not exit early and will successfully
>    open the new file.
> 
> 2. Fixed Memory Leak: In open_dir() , I added a call to
>    zfree(&data->file.path) if mkdir() fails, preventing the leak of
>    the path string.
> ---
>  tools/perf/util/data.c | 26 ++++++++++++++++++++++----
>  tools/perf/util/data.h |  4 +++-
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/perf/util/data.c b/tools/perf/util/data.c
> index 94dc534a7386..17baf71897d1 100644
> --- a/tools/perf/util/data.c
> +++ b/tools/perf/util/data.c
> @@ -346,8 +346,10 @@ static int open_dir(struct perf_data *data)
>  		return -1;
>  
>  	if (perf_data__is_write(data) &&
> -	    mkdir(data->path, S_IRWXU) < 0)
> +	    mkdir(data->path, S_IRWXU) < 0) {
> +		zfree(&data->file.path);
>  		return -1;
> +	}
>  
>  	ret = open_file(data);
>  
> @@ -360,9 +362,16 @@ static int open_dir(struct perf_data *data)
>  
>  int perf_data__open(struct perf_data *data)
>  {
> -	if (check_pipe(data))
> +	int ret;
> +
> +	if (data->open)
>  		return 0;
>  
> +	if (check_pipe(data)) {
> +		data->open = true;
> +		return 0;
> +	}
> +
>  	/* currently it allows stdio for pipe only */
>  	data->file.use_stdio = false;
>  
> @@ -375,16 +384,24 @@ int perf_data__open(struct perf_data *data)
>  	if (perf_data__is_read(data))
>  		data->is_dir = is_dir(data);
>  
> -	return perf_data__is_dir(data) ?
> -	       open_dir(data) : open_file_dup(data);
> +	ret = perf_data__is_dir(data) ? open_dir(data) : open_file_dup(data);
> +
> +	if (!ret)
> +		data->open = true;
> +
> +	return ret;
>  }
>  
>  void perf_data__close(struct perf_data *data)
>  {
> +	if (!data->open)
> +		return;
> +
>  	if (perf_data__is_dir(data))
>  		perf_data__close_dir(data);
>  
>  	perf_data_file__close(&data->file);
> +	data->open = false;
>  }
>  
>  static ssize_t perf_data_file__read(struct perf_data_file *file, void *buf, size_t size)
> @@ -457,6 +474,7 @@ int perf_data__switch(struct perf_data *data,
>  
>  	if (!at_exit) {
>  		perf_data_file__close(&data->file);
> +		data->open = false;
>  		ret = perf_data__open(data);
>  		if (ret < 0)
>  			goto out;
> diff --git a/tools/perf/util/data.h b/tools/perf/util/data.h
> index 8299fb5fa7da..76f57f60361f 100644
> --- a/tools/perf/util/data.h
> +++ b/tools/perf/util/data.h
> @@ -50,6 +50,8 @@ struct perf_data {
>  	const char		*path;
>  	/** @file: Underlying file to be used. */
>  	struct perf_data_file	 file;
> +	/** @open: Has the file or directory been opened. */
> +	bool			 open;
>  	/** @is_pipe: Underlying file is a pipe. */
>  	bool			 is_pipe;
>  	/** @is_dir: Underlying file is a directory. */
> @@ -59,7 +61,7 @@ struct perf_data {
>  	/** @in_place_update: A file opened for reading but will be written to. */
>  	bool			 in_place_update;
>  	/** @mode: Read or write mode. */
> -	enum perf_data_mode	 mode;
> +	enum perf_data_mode	 mode:8;
>  
>  	struct {
>  		/** @version: perf_dir_version. */
> -- 
> 2.54.0.545.g6539524ca2-goog
> 

