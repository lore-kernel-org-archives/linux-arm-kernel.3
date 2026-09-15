Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0086CC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9TVHqMg6DzzuOSZ1h26Nn1hQ6ISaDnr9mEy//ELed0=; b=Ev1rcJo9nv9u14Vi4069tyFcxD
	Gh9mLgiJVu5dy6ahOLWY5WXuorJHUROHNo5LKTZeSUlfCE73WehHkgJHVBbmCTm0lewRSAIJF+P5V
	MuSDw6lgIIRXSIbIceodn5OJB5assOWzdNIyMjK46vbjGarYCTFBd+YuNwjh9fSwi1ZxY33EadHQd
	SSD+RaN6e+IyHyzQsh3o/SE6XZJ8Y5/tF/AXKQPB97geabeGdELaL004Q+vTQ9dxgGXsUfqC9dfDw
	1evdCKmUN3iwEYb6LJpVPaZzmnsVzrWgLrBwyGocRJZFs+OScDY1dMt3AkU3JXjLjWHuQfTp5gvd3
	arlA5qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nsb-00000005Wx6-2guZ;
	Tue, 15 Sep 2026 07:47:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NsW-00000005WvB-0B1t
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J9TVHqMg6DzzuOSZ1h26Nn1hQ6ISaDnr9mEy//ELed0=; b=Y6UYBmTYKYV2O8yQVJFbthEWfB
	TTD0RQz9jNkfZ4/Q+3pQbERTGemzmUL/1sXXhVQmlxZ/ilcx+qhzQFgV6NEQIz9Vy03JzFmlQE7o0
	cK2Q+gOVHUafnabbeKB/PHsBVbt+V0rB01GPXh1F4prL3q1bBHpTgQHx4mykAN6Qpd/iEYNv4xMQv
	IZpDOBmDljbK5BnhxIUohxxutKiYoP87eNsYU/p4wUgI0WmOHKV0tDLp9kgfD6vjDqdYYaXL7rA67
	CGmY6UBR7yh6XVpkAXXcF2UNrZ5efI7N00ObJlq7SVs59v/jjydMc3d5ucxi4Eti40EKSEzmOrNvZ
	WUj6r7TQ==;
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6NsJ-00000006OSF-32Uj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:46:49 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 44038EC062E;
	Tue, 15 Sep 2026 03:46:36 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 15 Sep 2026 03:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789458395;
	 x=1789544795; bh=J9TVHqMg6DzzuOSZ1h26Nn1hQ6ISaDnr9mEy//ELed0=; b=
	gWJOwkn8qVN0hj5f7WGvUZAhs3CZBeo3GtMSnu/ybA444ItsfZGyyR6+lz82aTX5
	EL7LNzJnDcPjzFwK7THKOIdKd+pVUpYX7LxF27ZbNQbvDamNN35AuOBsC6X6iWWC
	gMkW8RwX1lPflvdT5EZNkGaqcVLkBypc3ZpdJkP6I0hlpxBI5eDHQSNs3Ihflz9Z
	wfy+YCcLbTeW11trLS8vNBqg3sMcfvIdPtn4qbJzLODTh6jfPUY6L4WJ/xqWajfC
	8l1ukToruj4EtuzHVD/1s/GJ72cqNlWjljgzwiZeZPlvGw6BdC45WzYMl8uxChxm
	ILs5ft66VzolU0WB9BwLkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789458395; x=
	1789544795; bh=J9TVHqMg6DzzuOSZ1h26Nn1hQ6ISaDnr9mEy//ELed0=; b=q
	dEMAFAKJsWQ2+R7P4+Ed6WvD9pC356dz6S04fOLECMzm8F3kEeumGyrGIp9GdH7n
	rJAZrdpKqns8Sh0JpUZPL+7pZL7A88OOFpWfWmUBFH4cB/ST9byyoJ1fU0/7v3rk
	Cw5a6/yyFr44xw34IwXHNnDR6Ek7yGWQRcAGYSaNnktd1J993qmFQS56O2ETIj8+
	Fi8RqszY9Z+VOG+LjF6463mAlf4Al91GBm9J5INvRXbC4KWaEvQ6BtT7ONVMppEf
	ClnohD6ujLK7MKzAw41NP3nTQtUCgsrb/SAM8tZBZgLHczjucu127P6jZbts1dar
	670Hd9OULOrJVEuZN79Xw==
X-ME-Sender: <xms:1veoaq-s-zK2UArd3jLyOSO5wgaVrbeebs-nQ5DuVrX_z0-9H71hyQ>
    <xme:1veoaliUMKFoItbNkdFPzPq-h_rIyk8e6dnqDrRxPIacByiVZzEhzZipYdnRVMavs
    bYeTGnTMAU98JOQ1tFDypHz-PO5QqWM3P7qsj-YmmYJu9ofMetskFM>
X-ME-Proxy-Cause: dmFkZTFjBJTPSsEvy7MdPYY6zoz5hEujSdjlA0j1/ndTB6CM/iz4MVRXgkhD+6Up0/ryRu
    xEKhw7XJzajgoXQusJgmwVrHZmGtqCQvgETtVrkeGYuXdxEoqFrBwJbIKAeiBLsoCdS4by
    UTMePArx3+74ccqnNttcOua34hzVwQqbxzZEliOytewiy6U/yDTXlu01lwA1i4z02FxOeY
    cQMGEYrfctlDcOg/PWPqgycJxZY6uswSnNn9EWOz2NKeVkGVxOPeVjyHqG+aa3YRBLZK3+
    qDvmOvsQTDC4uQg9wePtcFpouKeI+yVVPp4ahrnz+mqeTgRbjRkbmT7F4A7l5Zg3mRtZem
    V1YTrkyQYtU/UrXQRE+v6Up2nhaqvUqzuxKIYY28PgJxjwr8y6dyBPzzJ8q3igIyZSzb8a
    yi/2ZGz1krnOkI63xE7YqxxTTZTzmzbynlxlCj6WWZOJKyzTNJ/5eL/sHFZ1/cVfS51at/
    gb1AdH/c/zYpgO4Vcice7yl/S7IAL2p29oJAbte/BKvAByatZfMVfT1Gq6V7IXwyrXZ8Ko
    VfyG6z/JW8cm3p2JBFul+1KZzSruB/ey6Nb71FEe7/u1j9S7r6SnUqmz38RuV0/LPP77cl
    eEgXy9ucq2nzC/+/yMwfyDCiv6sTZB0cQCjs5hveFN0OaIIdbgsZibgZq5mQ
X-ME-Proxy: <xmx:2feoauhm05MVTTJFNChLLZ1eEI5vzlR1J4HNxrorZrOq3zNpDqSXkg>
    <xmx:2feoavezASGoXoYquy_goSx0civPySVKcBZ1RDM6sU5tu2LUzLSjCQ>
    <xmx:2feoal36ABBh5m1iTrh0wreAOmUA8HFVmzS3bQvWmDTc_87EzWkVMw>
    <xmx:2feoajr3p3sPVKfBW7otUAqGoHu_zctcV3NxIEfgODa2TeI_vp-uwA>
    <xmx:2_eoahL73tD2rKVLVCoyvzx-4DgTHujZF_SW7UbuyouYn8oDxnXmPXfq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A85E332A0081; Tue, 15 Sep 2026 03:46:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AA0MNwphKERR
Date: Tue, 15 Sep 2026 09:45:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <95b693c0-ca51-4355-99ba-2b37a1ab2169@app.fastmail.com>
In-Reply-To: <20260828-tonyk-syscall_table-v6-0-fdd358456cf1@igalia.com>
References: <20260828-tonyk-syscall_table-v6-0-fdd358456cf1@igalia.com>
Subject: Re: [PATCH v6 00/13] syscalls: Add a shared table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_084648_088058_45C2720D 
X-CRM114-Status: GOOD (  19.82  )
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

On Sat, Aug 29, 2026, at 01:19, Andr=C3=A9 Almeida wrote:
> While implementing a new syscall, we need to wire up it's number to th=
e arch
> table. Since syscall number 403, all architectures are on sync regardi=
ng the
> number (except alpha), which make things a lot easier but more repetit=
ive as
> well. Have a look at commit b36d4b6aa88 ("arch: hookup listns() system=
 call"),
> with 15 lines of mostly:
>
>   +470    common  listns                          sys_listns
>
> There's already a "common" table shared with a bunch of archs at
> `scripts/syscall.tbl`, but due to historical reasons some archs will n=
ever be
> able to move to this table and share all the numbers.
>
> The generic table starts from 403 (clock_gettime64), the first common =
syscall.
>
> I've compile tested for arm32, arm64, s390, mips, sparc and alpha by c=
omparing
> the syscalls_*.h and unistd_*.h files generated before and after this =
patchset.
> For most of cases the files are identical, for the few cases that they=
 are not,
> there's a note in the commit explaining why they are equivalent.

I've tried merging these for the asm-generic tree now, and would like to
send them for 7.4.

Unfortunately, the build bot flagged problems on mips, see the patch bel=
ow
for my workarounds=3D, but I think we have to improve that still and did=
n't
just fold it into your patch.

As you took out the dependencies on the syscall_*.tbl files, the
output does not get rebuilt if changes are made to the table, and I
have not come up with a good solution for mips. My hack just adds both
input files to all outputs, which works but is not technically correct.

The rt_sigtimedwait and ustat entries had a typo that caused a link
error, but I did not check if there were any additional mistakes that
caused incorrect output data without causing a link failure.

       Arnd

diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/sysca=
lls/Makefile
index aaa5443ea906..51b9939ecff0 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -40,10 +40,10 @@ src_n32 :=3D $(src)/syscall_n.tbl
 src_n64 :=3D $(src)/syscall_n.tbl
 src_o32 :=3D $(src)/syscall_o32.tbl
=20
-$(kapi)/unistd_nr_%.h: $(systbl_common) $(sysnr) FORCE
+$(kapi)/unistd_nr_%.h: $(src_o32) $(src_n64) $(systbl_common) $(sysnr) =
FORCE
        $(call if_changed,sysnr)
=20
-$(kapi)/syscall_table_%.h: $(systbl) $(systbl_common) FORCE
+$(kapi)/syscall_table_%.h: $(src_o32) $(src_n64) $(systbl) $(systbl_com=
mon) FORCE
        $(call if_changed,systbl)
=20
 uapisyshdr-y           +=3D unistd_n32.h                 \
diff --git a/arch/mips/kernel/syscalls/syscall_n.tbl b/arch/mips/kernel/=
syscalls/syscall_n.tbl
index e3d278f715b7..84c35c1f0c3e 100644
--- a/arch/mips/kernel/syscalls/syscall_n.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n.tbl
@@ -133,14 +133,14 @@
 123    common  capget                          sys_capget
 124    common  capset                          sys_capset
 125    common  rt_sigpending                   sys_rt_sigpending       =
compat_sys_rt_sigpending
-126    common  rt_sigtimedwait                 sys_rt_sigtimedwait_time=
        compat_sys_rt_sigtimedwait_time32
+126    common  rt_sigtimedwait                 sys_rt_sigtimedwait     =
compat_sys_rt_sigtimedwait_time32
 127    common  rt_sigqueueinfo                 sys_rt_sigqueueinfo     =
compat_sys_rt_sigqueueinfo
 128    common  rt_sigsuspend                   sys_rt_sigsuspend       =
compat_sys_rt_sigsuspend
 129    common  sigaltstack                     sys_sigaltstack         =
compat_sys_sigaltstack
 130    common  utime                           sys_utime               =
sys_utime32
 131    common  mknod                           sys_mknod
 132    common  personality                     sys_personality         =
sys_32_personality
-133    common  ustat                           sys_usta                =
compat_sys_usta
+133    common  ustat                           sys_ustat               =
compat_sys_ustat
 134    common  statfs                          sys_statfs              =
compat_sys_statfs
 135    common  fstatfs                         sys_fstatfs             =
compat_sys_fstatfs
 136    common  sysfs                           sys_sysfs

