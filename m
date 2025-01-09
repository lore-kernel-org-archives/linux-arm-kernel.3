Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADBFE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hItSMR0IDjkdMJUBRKLD8SPiYiiCgPMm35ASO9oVDjg=; b=sZXt2NeYYiNaMxXYvq769trUs/
	CNMy1uIcMvZMDBnjiPMAavABsSWp1q36MhKv+s8thEXsqaxhF+dsGbfprNSSxKNQS2UYQIBi/LO5d
	SFBYxCapDpmj724tlm68Y+esfgv0QdKT9ZBGPpdrTLWMdWBf5/zO/i2CkvWH08qaJOn4WrqoBwkeZ
	fKJYNgopYmYn42Wamgngi1P4mrba0qR4HoIQwjH2g2CD0oy2DzXrI3dX3IpPqNifVQxpiSMyKalzb
	jIRkeHFcGFgJCsOF6wWTa0K8looeTbvRtT+/b50fFt+UUUnHFcaVB0rij1M5L5Eho/H3lT5O000Bw
	oKg2wcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVts9-0000000CJC1-1pVz;
	Thu, 09 Jan 2025 14:50:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtqO-0000000CIfD-4BVl;
	Thu, 09 Jan 2025 14:49:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 861CE5C5A84;
	Thu,  9 Jan 2025 14:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F4DC4CED2;
	Thu,  9 Jan 2025 14:49:04 +0000 (UTC)
Date: Thu, 9 Jan 2025 09:50:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Kees Cook
 <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <20250109095037.0ac3fe09@gandalf.local.home>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_064909_076047_825B7447 
X-CRM114-Status: GOOD (  10.41  )
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

On Thu, 09 Jan 2025 14:16:39 +0100
Joel Granados <joel.granados@kernel.org> wrote:

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 2e113f8b13a2..489cbab3d64c 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -8786,7 +8786,7 @@ ftrace_enable_sysctl(const struct ctl_table *table, int write,
>  	return ret;
>  }
>  
> -static struct ctl_table ftrace_sysctls[] = {
> +static const struct ctl_table ftrace_sysctls[] = {
>  	{
>  		.procname       = "ftrace_enabled",
>  		.data           = &ftrace_enabled,
> diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
> index 17bcad8f79de..97325fbd6283 100644
> --- a/kernel/trace/trace_events_user.c
> +++ b/kernel/trace/trace_events_user.c
> @@ -2899,7 +2899,7 @@ static int set_max_user_events_sysctl(const struct ctl_table *table, int write,
>  	return ret;
>  }
>  
> -static struct ctl_table user_event_sysctls[] = {
> +static const struct ctl_table user_event_sysctls[] = {
>  	{
>  		.procname	= "user_events_max",
>  		.data		= &max_user_events,

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org> # for kernel/trace/

-- Steve

