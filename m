Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LNxVJGEMAXRCpSTfvSk7rdKi0pYQo3rQCK08bwqgoOk=; b=HaISx1XdF6zj9drwsXLgclB+sn
	QCouACm/MxsvrH0KBqw4rrA1477wgzJHjGNFSFZNv8GQc53v6OyPR4lG/WeNPXRiSap3wcRTnCyiW
	3W/iHvVXpBebvL7b2B8vTp02EDFPIRaEXhT4kCUTK9HqBuu9UU4cdvOSFjMPLkoWAOIWUvEOQzkbi
	KPOYL0qnVxpGO9CVVb3Erha2X4uRZMPWQnA8iAUMgSQpHDgblpJw09XyRh8U6e4kOJ9VTgtWq0jC3
	AhVJ4miTLxYEVwgcxO0IHBW1FkAG1j2m+/AoavpNfW6spexf96FywIns4F+ep5+YiXrVgHxpxd+ej
	43azxLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weshO-00000001Os9-0nBl;
	Wed, 01 Jul 2026 11:01:46 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weshL-00000001OrH-387f;
	Wed, 01 Jul 2026 11:01:45 +0000
Date: Wed, 1 Jul 2026 13:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782903701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNxVJGEMAXRCpSTfvSk7rdKi0pYQo3rQCK08bwqgoOk=;
	b=3HifUbZ21ScKQtWF6SIw5j3fCUEdR+xRpgI6ZiVs3+DcPllGZA8Ji94V+XUdwDrNcM/7ij
	+H8qYhqLmRVhTFU9Xbty5DTZ8XxGKDqRxQxL1vTqr6BEMw6zmurDnk/JsaoKxSXYAcjN1F
	6Uzt7JsgKFkfst0NWwo8OmJzzjDn+oVuzb9b+HlGgbTb3HddAJsW7TEB+3Wy+xPQgTAZW4
	rSQ74uPNXSFR1hJkaQBX03oVNJspPKuqg0v9yXuMEiJZy1/UuO/gMZkPv3oZJ8hom+tEGH
	PvfGbzUklh8YNbdEj41qDzenKHO+aXOoCmp6dRiLzh0hagRlV5ggtMdszJWLcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782903701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNxVJGEMAXRCpSTfvSk7rdKi0pYQo3rQCK08bwqgoOk=;
	b=LJJCbaRz0pqf6PD4GbhO2SME6PRZyX4Kho1+qmiOyaUmczMK9UnqGhmiZqX5vxb5Za35B/
	Y1Mq4Y/RXRZ4NvBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v5 8/8] futex: Use runtime constants for __futex_hash()
 hot path
Message-ID: <20260701110139.z8WokGYM@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
 <20260701084150.GNOeboLw@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260701084150.GNOeboLw@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_040144_062172_B398697A 
X-CRM114-Status: UNSURE (   7.04  )
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

On 2026-07-01 10:41:55 [+0200], To Peter Zijlstra wrote:
> This makes it go away at no extra price but yeah let me boot a big box
> and see.

as-is:
|$ ./perf bench futex hash -f 1 -t 1 -r 10 -b 0
| # Running 'futex/hash' benchmark:
| Run summary [PID 3588]: 1 threads, each operating on 1 [private] futexes =
for 10 secs.
|=20
| [thread  0] futex: 0x5555e5ad4740 [ 6449632 ops/sec ]
|=20
| Averaged 6449632 operations/sec (+- 0,00%), total secs =3D 10
| Futex hashing: global hash

roughly that area, repeated runs usually change the last three digits.
Patched:

| $ ./perf bench futex hash -f 1 -t 1 -r 10 -b 0
| # Running 'futex/hash' benchmark:
| Run summary [PID 2375]: 1 threads, each operating on 1 [private] futexes =
for 10 secs.
|
| [thread  0] futex: 0x5585ddebd740 [ 6532004 ops/sec ]
|
| Averaged 6532004 operations/sec (+- 0,00%), total secs =3D 10
| Futex hashing: global hash

for private hash there is change within the noise area for -b 8192.

So we have here +1.28% ops/sec. Not ground breaking, not bad either.

With more threads:
| $ ./perf bench futex hash  -r 30 -b 0
| # Running 'futex/hash' benchmark:
| Run summary [PID 2424]: 144 threads, each operating on 1024 [private] fut=
exes for 30 secs.
|=20
| [thread  0] futexes: 0x556f3a3387c0 ... 0x556f3a3397bc [ 2104422 ops/sec ]
=E2=80=A6
| [thread 143] futexes: 0x556f3a3d9660 ... 0x556f3a3da65c [ 2105480 ops/sec=
 ]
|=20
| Averaged 2111486 operations/sec (+- 0,03%), total secs =3D 30
| Futex hashing: global hash

To:

| $ ./perf bench futex hash  -r 30 -b 0         =20
| # Running 'futex/hash' benchmark:                                        =
                     =20
| Run summary [PID 2723]: 144 threads, each operating on 1024 [private] fut=
exes for 30 secs.
|
|[thread  0] futexes: 0x560a09e487c0 ... 0x560a09e497bc [ 2135688 ops/sec ]
=E2=80=A6
|[thread 143] futexes: 0x560a09ee9660 ... 0x560a09eea65c [ 2137668 ops/sec ]
|
| Averaged 2139685 operations/sec (+- 0,03%), total secs =3D 30
| Futex hashing: global hash

+1.34%. Again, not ground breaking but still visible. And the memory
savings.

That is btw, 7.2-rc1 on a Intel(R) Xeon(R) CPU E7-8890 v3 (4 NUMA
nodes).

Sebastian

