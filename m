Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090CA1039895
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYyRSetlqylah8/QdNebjp0c2RtHTtrWCx74F8AAY04=; b=DRPgctqh7Y0oujqnj/zy1LwxO6
	kAmZnspMe4B3/VsWJPr66FRc1M8pRskRG3O1Me9h7IT3z4/3GioF/byHZ1SF84yw7q5JJRLMkAdsI
	FZa2yausi+XzOINzTowpcf4Q5EbMnXBxHv7sJXmd8EY+cWQ3JI+EbZRXR0ACw7bcuY39FggKx58et
	mLZ3hvjXC3z/XnMw+oKkhSXpQ5cRs4h/lUIBE5vpC7LPnBtmh0Ie45gciaV6+QIFE6WUrg/9PeTO7
	wkdgE2TtmRyizMM0mrsLBwAfET2csKfl7V/BwrxV2lGkl5BoEz0n52LDV7yhBh6oS7l+UplSoFwBy
	4PEDGbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5KH-00000009BB1-2FWo;
	Fri, 27 Feb 2026 21:24:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5KE-00000009BAe-3DqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:24:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4833115090dso24950925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 13:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772227481; x=1772832281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYyRSetlqylah8/QdNebjp0c2RtHTtrWCx74F8AAY04=;
        b=jv29wrn573n5baGD4YVdMjoEVzmDNp+PxpDCwBOYxW1MIbjeeC7tRQpWsMWZCgsWKr
         zFweirSoyaBvuFEYhMKHuqdzQFnGog9DBLnGB2NSbkhN4PR5tt9A6dxF9jthqwMFJtpl
         98YqviGouw6T90cvqwn5aKerpUohCfESDs4ZFQSZTx9+DmPn6WytkGNDDOgKhYfKG/ey
         ta2/cqtrekGhSqyUzivenwG/kb8VPnVYKNbIu7Hpm9AEs55LJmUvXdd+41L6SUm3F+BI
         eU5dIEU59KSQFV1Jr6K1bgAmXXO5AwQ0QPVImU0cZUCOpBPqLscrKl6lbinvWe73odjQ
         dhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772227481; x=1772832281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYyRSetlqylah8/QdNebjp0c2RtHTtrWCx74F8AAY04=;
        b=c0q406DJF8BnlGnF+EeYG0ds90mIsrp4YX2LqAi2c6XjptOZnN1TL0cd60d8LjB/pi
         Hw3Ckb7hcf61VhN0EBmsSSZCsJP6FHMoUtmuBIlEFj7BX8WmtTLv64vSr9Z8CN83FPtt
         /UoJThCxUDJc8tBwDIYr92Fr9Yr2saJXDiv33PfB3GrQwROUm16UPhbKeezrh4ccoWQg
         TeDaBrjic4Kh9G3qrKRAaG0d3K+JErvMLRSKit/U7OkaTPcp8UMJQfk3Kt2QePBG/ks5
         20GafVSTjtRwqZVgLMpkVNHjS85AZw7P6dUFwdEIxju6N8j8/LW5vgxt69I8P0VNM4av
         h29g==
X-Forwarded-Encrypted: i=1; AJvYcCUH75Dg5X8r3lUmyPMtO8kLLjgIlwUPyGCFmrI7lxxwoI1VO+xCojhzBabjnhuRKMcWRZ55aIcDIMd0cjHqcOuD@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6HwzNLARki8sUxAuf4dUB7RsEeJ3+b0mvHl3BiivU0dP7KDdl
	at52iwx5Wqdm7Yw5kSm6OJyo1HVAn/eOfaQtRS0+RSPcbZq/OTJqTvmS
X-Gm-Gg: ATEYQzwqxEcGQUm7LvOrTtc3GQbQySHdRrtPnkInn605ViRn9M72ZXE23+eX7WUkZc/
	M+FctzFcI4GKtRyThVe2z7eP0V23r9oinrgnUOgLI8PGXb0qIMHRQKJudMCr+jl/2gnaAaSk6d+
	czTZktfSre+xLg/ZC6Y+kGetIbtL88mDGPlh18FBvowe8a6NQVsi4acGdLTmKdm451xOSWkcdNv
	xkcLp9r4okJbqdkNy2kOZuwaC82Z1Jw2dtQbIT+wFzoTM1ky3qzAlF9ZTy25gSII3eCUAO3ukDi
	rEfMVCfOsdKrPpOlVKkbNmPl1EccF3QfvnMkKrm8KzyJuZ1JSNP17DGLHjfIu2azMS7f5V8fgAH
	CbegMATcnm7ifoz2WtBsDlaeiA0WlanAGoz2KXfHnXEn8FsYK3UliQBJlWgRCLXIZujk90XMW4V
	j1Og1ho9AKWAHdf+h9jEkc8Q==
X-Received: by 2002:a05:600c:314a:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-483c9ba7e58mr64072115e9.4.1772227480275;
        Fri, 27 Feb 2026 13:24:40 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c764546sm10133971f8f.29.2026.02.27.13.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 13:24:39 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 27 Feb 2026 22:24:37 +0100
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Jiri Olsa <olsajiri@gmail.com>, Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: Re: [PATCHv6 bpf-next 9/9] bpf,x86: Use single ftrace_ops for direct
 calls
Message-ID: <aaILlSuEgaYDq41r@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
 <20251230145010.103439-10-jolsa@kernel.org>
 <1b58ffb2-92ae-433a-ba46-95294d6edea2@linux.dev>
 <aaIAoBZGkP7RQrvc@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaIAoBZGkP7RQrvc@krava>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_132442_823954_1B3169C5 
X-CRM114-Status: GOOD (  30.39  )
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

On Fri, Feb 27, 2026 at 09:37:52PM +0100, Jiri Olsa wrote:
> On Fri, Feb 27, 2026 at 09:40:12AM -0800, Ihor Solodrai wrote:
> > On 12/30/25 6:50 AM, Jiri Olsa wrote:
> > > Using single ftrace_ops for direct calls update instead of allocating
> > > ftrace_ops object for each trampoline.
> > > 
> > > With single ftrace_ops object we can use update_ftrace_direct_* api
> > > that allows multiple ip sites updates on single ftrace_ops object.
> > > 
> > > Adding HAVE_SINGLE_FTRACE_DIRECT_OPS config option to be enabled on
> > > each arch that supports this.
> > > 
> > > At the moment we can enable this only on x86 arch, because arm relies
> > > on ftrace_ops object representing just single trampoline image (stored
> > > in ftrace_ops::direct_call). Archs that do not support this will continue
> > > to use *_ftrace_direct api.
> > > 
> > > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > 
> > Hi Jiri,
> > 
> > Me and Kumar stumbled on kernel splats with "ftrace failed to modify",
> > and if running with KASAN:
> > 
> >   BUG: KASAN: slab-use-after-free in __get_valid_kprobe+0x224/0x2a0
> > 
> > Pasting a full splat example at the bottom.
> > 
> > I was able to create a reproducer with AI, and then used it to bisect
> > to this patch. You can run it with ./test_progs -t ftrace_direct_race
> > 
> > Below is my (human-generated, haha) summary of AI's analysis of what's
> > happening. It makes sense to me conceptually, but I don't know enough
> > details here to call bullshit. Please take a look:
> 
> hi, nice :)
> 
> > 
> >     With CONFIG_HAVE_SINGLE_FTRACE_DIRECT_OPS ftrace_replace_code()
> >     operates on all call sites in the shared ops. Then if a concurrent
> >     ftrace user (like kprobe) modifies a call site in between
> >     ftrace_replace_code's verify pass and its patch pass, then ftrace_bug
> >     fires and sets ftrace_disabled to 1.
> 
> hum, I'd think that's all under ftrace_lock/direct_mutex,
> but we might be missing some paths
> 

could you please try with change below? I can no longer trigger the bug with it

thanks,
jirka


---
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 827fb9a0bf0d..e333749a5896 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6404,7 +6404,9 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
 			new_filter_hash = old_filter_hash;
 		}
 	} else {
+		mutex_lock(&ftrace_lock);
 		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
+		mutex_unlock(&ftrace_lock);
 		/*
 		 * new_filter_hash is dup-ed, so we need to release it anyway,
 		 * old_filter_hash either stays on error or is already released
@@ -6530,7 +6532,9 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
 			ops->func_hash->filter_hash = NULL;
 		}
 	} else {
+		mutex_lock(&ftrace_lock);
 		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
+		mutex_unlock(&ftrace_lock);
 		/*
 		 * new_filter_hash is dup-ed, so we need to release it anyway,
 		 * old_filter_hash either stays on error or is already released

