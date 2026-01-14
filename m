Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7771CD39013
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 21:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ1qoNAl3hi5ypXf81uyaWM/SL2Im8OnG4dcyA+tbN0=; b=mq61n2rfmmxotiIJy0BxUueBke
	VQEBt2HcoKHWmhipZYk+cRTfTaKk4QTvbsGaNwo8g50CblztbWLJ3B9c8AohhXFjJyaNJGaSD6aA8
	3ZLiWLvuFElpKROa19zrK/yxpvDp/IzOWnI/fmXBpxt5F+aR5E9aRBZRZkpq1ZKntLESu0WmNhoCR
	ESMRRov/8+auyblKzkHpJXj5tHU0a1OTl97in3TmPx9W4QVCYZu9Hn6We+SJHNvBz6oLI++/okybd
	cUPvxiNSXqtghjiiDwsdAkdQN6aIAKTFXc53xeHlatG0SpEf1lPssu//NMorLdgVow4vhi6IIogNa
	UmPeAvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7yX-0000000Ai37-3fxu;
	Wed, 14 Jan 2026 21:00:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7yW-0000000Ai2j-0fhb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 21:00:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so1528585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 13:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768424418; x=1769029218; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yZ1qoNAl3hi5ypXf81uyaWM/SL2Im8OnG4dcyA+tbN0=;
        b=gqjJdZ4a+AjIqD5SELuTIpZHkF8xbXX2Z1ByEHJ+NkfLKL5j8iwJ+cIN4aoBW4KXZP
         /XLvsIQ2mbtNaV+PyPmRyr2Ps43OvD3WTBqoKSXZ2HyBrjIG8+sbxwgDJmc9kFRoG234
         YO6Y7x5JJPVqpLxS71gJ4bSsSMlyonsbCDKIx+eihFCjVfGP6rCzRtcuE1pVVxiiezvB
         AR2fqc3oSL+cbLjK/OZDYKZ/uaLGk2pW/WTsWofbVDSOH5TXePR/ogvtGg9PqHKk7sKM
         WkwWzdXJirQDRJ/QvFki4Pvgjr6oQOtGBttcZb9NmFEAA4g7+xmtKiZZ040uAiuhCeBr
         gGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768424418; x=1769029218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ1qoNAl3hi5ypXf81uyaWM/SL2Im8OnG4dcyA+tbN0=;
        b=OjYsIv9soBJVyWyJD189tFgb2j0bdcIuy6eSu9bNs9AVr1e3017Q44C+PMNKC1L2Gv
         M+tAj/mxXG1Opr9XXpW7MSjwQTIwKmCEoEWThN10Xl7Sw9TcDyHcGbRUy4NAmMiqcco0
         MqBupq6eppX7HS07eDq6gph1c8l4vgKE9zw0mlMIWixu5k2vHoKW+DgSuxcQi963hKxC
         apcXYbBSshJmjU8+VrSPoSxEfLXzMI7BGEItIWrz3h8h1t3pkpIpXXOoPDxIGbCaJjch
         yTjdTF51Gio6Em/dm/u3zu5BdKUcF6kBQbiZlVlmg/NjQMqe5lvFH6nKmC4su37+bkJD
         sGig==
X-Forwarded-Encrypted: i=1; AJvYcCX/pvvTIRCUi/029eXT4O2XIeSShStY/gR6jUdY8MHEyCf56mUtLV421N+3Vk619xgH4+ja3tGDYjxXwCX1fC+9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs8UXsTb1GKy9Pn8mQ3CJb7rOs6xAeXJDK633fVF38hrO7hmM1
	KcWbhn/fnPqTk46awNDguyXpRmaDyciHLhN49mhBDFm3CR5QlGIP9hXU
X-Gm-Gg: AY/fxX4ntbb8Lbfox+KJPHlriJZqXuu5cpsNR4PGYfY1VdsOycoWGTkLUbURH/dh/oW
	j238hyg5OP01lPYpDQq1exCmXheInKzc1cGnClKR6KbtoQayro/P/Xm9uNle04p8QQot7fWnZJd
	pdECmFJsxbwbECEuTelUTGZe7rH+1RaU+1IsG2+K1MAH1ov8fb1qwxWQc7tNW1PTDfoKQN5GCrz
	NdbQWiXRYIC3RubG+ugIJIhCnq7R4Oj3AZ2Lg1QH1UnuGeJczp4ovn9OvxEBg9i3njO6TeB11eU
	ijEpCegj0JeJQ5ZsPUIblv09xSIAagUCKJFrnDciXYmuZE/UzLMpLtisKustm+El3JEE5TD67jD
	Z27N1q59/KchayNetU9swWoX+B8Q0ny3bnBLEk01qaMLU9DOE43+TU2qSRVzq+6YHTWxy/UICB5
	M=
X-Received: by 2002:a05:600c:1549:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-47ee9810b73mr15842165e9.29.1768424418075;
        Wed, 14 Jan 2026 13:00:18 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a666sm1329588f8f.6.2026.01.14.13.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:00:17 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Jan 2026 22:00:15 +0100
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Leon Hwang <leon.hwang@linux.dev>,
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and
 bpf_func access at runtime
Message-ID: <aWgD3zH7vsiBdIcr@krava>
References: <20260102150032.53106-1-leon.hwang@linux.dev>
 <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
 <aWd9z8GVYO12YsaH@krava>
 <CAADnVQLxo1uPbutGNKrv=f=bSVkzxOfSof0ea8n7VvqsaU+S3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQLxo1uPbutGNKrv=f=bSVkzxOfSof0ea8n7VvqsaU+S3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_130020_230100_1950839B 
X-CRM114-Status: GOOD (  33.86  )
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

On Wed, Jan 14, 2026 at 08:04:38AM -0800, Alexei Starovoitov wrote:
> On Wed, Jan 14, 2026 at 3:28 AM Jiri Olsa <olsajiri@gmail.com> wrote:
> >
> > On Fri, Jan 02, 2026 at 04:10:01PM -0800, Alexei Starovoitov wrote:
> > > On Fri, Jan 2, 2026 at 7:01 AM Leon Hwang <leon.hwang@linux.dev> wrote:
> > > >
> > > > This patch series optimizes BPF tail calls on x86_64 and arm64 by
> > > > eliminating runtime memory accesses for max_entries and 'prog->bpf_func'
> > > > when the prog array map is known at verification time.
> > > >
> > > > Currently, every tail call requires:
> > > >   1. Loading max_entries from the prog array map
> > > >   2. Dereferencing 'prog->bpf_func' to get the target address
> > > >
> > > > This series introduces a mechanism to precompute and cache the tail call
> > > > target addresses (bpf_func + prologue_offset) in the prog array itself:
> > > >   array->ptrs[max_entries + index] = prog->bpf_func + prologue_offset
> > > >
> > > > When a program is added to or removed from the prog array, the cached
> > > > target is atomically updated via xchg().
> > > >
> > > > The verifier now encodes additional information in the tail call
> > > > instruction's imm field:
> > > >   - bits 0-7:   map index in used_maps[]
> > > >   - bits 8-15:  dynamic array flag (1 if map pointer is poisoned)
> > > >   - bits 16-31: poke table index + 1 for direct tail calls
> > > >
> > > > For static tail calls (map known at verification time):
> > > >   - max_entries is embedded as an immediate in the comparison instruction
> > > >   - The cached target from array->ptrs[max_entries + index] is used
> > > >     directly, avoiding the 'prog->bpf_func' dereference
> > > >
> > > > For dynamic tail calls (map pointer poisoned):
> > > >   - Fall back to runtime lookup of max_entries and prog->bpf_func
> > > >
> > > > This reduces cache misses and improves tail call performance for the
> > > > common case where the prog array is statically known.
> > >
> > > Sorry, I don't like this. tail_calls are complex enough and
> > > I'd rather let them be as-is and deprecate their usage altogether
> > > instead of trying to optimize them in certain conditions.
> > > We have indirect jumps now. The next step is indirect calls.
> > > When it lands there will be no need to use tail_calls.
> > > Consider tail_calls to be legacy. No reason to improve them.
> >
> > hi,
> > I'd like to make tail calls available in sleepable programs. I still
> > need to check if there's technical reason we don't have that, but seeing
> > this answer I wonder you'd be against that anyway ?
> 
> tail_calls are not allowed in sleepable progs?
> I don't remember such a limitation.
> What prevents it?
> prog_type needs to match, so all sleepable progs should be fine.

right, that's what we have, tail-called uprobe programs that we
need to become sleepable

> The mix and match is problematic due to rcu vs srcu life times.
> 
> > fyi I briefly discussed that with Andrii indicating that it might not
> > be worth the effort at this stage.
> 
> depending on complexity of course.

for my tests I just had to allow BPF_MAP_TYPE_PROG_ARRAY map
for sleepable programs

jirka


---
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index faa1ecc1fe9d..1f6fc74c7ea1 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20969,6 +20969,7 @@ static int check_map_prog_compatibility(struct bpf_verifier_env *env,
 		case BPF_MAP_TYPE_STACK:
 		case BPF_MAP_TYPE_ARENA:
 		case BPF_MAP_TYPE_INSN_ARRAY:
+		case BPF_MAP_TYPE_PROG_ARRAY:
 			break;
 		default:
 			verbose(env,

