Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD1AF364A3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMAf/aAFn2cF17U/6EJfT5ll571ILEGPz4I3Tb9MzL4=; b=xqLgKEFSpPXRAjr97Inf9tr93b
	3NKs2ItFkDnMomB4pn/Q97qPAjNBxYEWaq25mvLEEvjLTvKARXQJN9HiwjhL5byLdx2fF35T141d0
	7yNgaTInNCQWsoTjiOgv6KKe068GhXvUzZi4jJgAc5mjyolW6Am5TePqg6soOsf8DM2DbT3jppOuK
	PEZmO9l4yI5A6ZI2PxPbXBC8Fl1Y7ByXKiNn0LMVvRA3kiTB+e6f4kJ7JSLdlID71MobSzw6nLZMG
	2TTm6wL2hhG5IuijAnVA/6J0gtGHG1foMS8SjtxPo9aSs/Cd3an08AVmgasJBwZB3n4zIfN4+Hbjm
	4mGrKYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAt13-0000000B0ql-0HpP;
	Thu, 09 Apr 2026 17:18:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAt10-0000000B0q1-1xAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 17:18:03 +0000
Received: by linux.microsoft.com (Postfix, from userid 1216)
	id 937EC20B710C; Thu,  9 Apr 2026 10:18:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 937EC20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775755081;
	bh=uMAf/aAFn2cF17U/6EJfT5ll571ILEGPz4I3Tb9MzL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyTJ0T0F6U8+kQZOAwLlJOpHbvHmcTLv1ZKXZ3WoGBXtCTdMmwn+K46HIl8/76vJM
	 bUHquLGXpUfuDi70JCvo3WyEHZQKdvU4Nx/BznJwKLCVcXU+h8GeU5FEcSg17CQqy8
	 rm1/wEAVFn6WefNv0YAR3dz+M/HmOhPX5GcTRQBE=
Date: Thu, 9 Apr 2026 10:18:01 -0700
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jeff Barnes <jeffbarnes@linux.microsoft.com>,
	Paul Monson <paul.monson@capgemini.com>
Subject: Re: [PATCH] crypto: tstmgr - guard xxhash tests
Message-ID: <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
 <adYNClYB6RY820Xl@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adYNClYB6RY820Xl@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_101802_533920_87947899 
X-CRM114-Status: GOOD (  10.01  )
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

On Wed, Apr 08, 2026 at 04:08:42PM +0800, Herbert Xu wrote:
> Please show me the panic.  Normally it's not an issue if an algorithm
> is not present while the test vectors are.
> 

alg: hash: failed to allocate transform for xxhash64: -2
Kernel panic - not syncing: alg: self-tests for xxhash64 (xxhash64) failed in fips mode!
CPU: 0 PID: 425 Comm: modprobe Not tainted 6.6.130.2-2.azl3 #1
Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 01/08/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0x4c/0x70
 dump_stack+0x14/0x20
 panic+0x179/0x330
 alg_test+0x678/0x680
 ? __alloc_pages+0x1e2/0x340
 do_test+0x26f8/0x7670 [tcrypt]
 do_test+0x72c5/0x7670 [tcrypt]
 tcrypt_mod_init+0x65/0xff0 [tcrypt]
 ? __pfx_tcrypt_mod_init+0x10/0x10 [tcrypt]
 do_one_initcall+0x4e/0x330
 ? kmalloc_trace+0x2e/0xa0
 do_init_module+0x68/0x250
 load_module+0x1f2e/0x2150
 ? __do_sys_init_module+0xe6/0x1d0
 __do_sys_init_module+0x19c/0x1d0
 ? __do_sys_init_module+0x19c/0x1d0
 __x64_sys_init_module+0x1e/0x30
 x64_sys_call+0x11b3/0x1c90
 do_syscall_64+0x5a/0x80
 ? irqentry_exit_to_user_mode+0x29/0x50
 ? irqentry_exit+0x3f/0x50
 ? exc_page_fault+0x87/0x160
 entry_SYSCALL_64_after_hwframe+0x78/0xe2
RIP: 0033:0x7715f70fab9e
Code: 48 8b 0d 85 32 12 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 52 32 12 00 f7 d8 64 89 01 48
RSP: 002b:00007ffde8fef6c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
RAX: ffffffffffffffda RBX: 00005d0b39626af0 RCX: 00007715f70fab9e
RDX: 00005d0b1710197a RSI: 0000000000028c39 RDI: 00005d0b39635310
RBP: 00005d0b1710197a R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000071 R11: 0000000000000246 R12: 00005d0b39635310
R13: 0000000000000000 R14: 00005d0b39626c20 R15: 00005d0b39626da0
 </TASK>

Seems like crypto_alg_mod_lookup() [1] fails and that triggers the panic() at [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/crypto/api.c?h=v7.0-rc7#n338
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/crypto/testmgr.c?h=v7.0-rc7#n5760

BR,
Hamza

