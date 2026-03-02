Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F5D58E61
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TqCugejn+OGjGM2P4bwUziYu78OGaka0Bim+UNMgjx0=; b=mqy4ncoAj0e9ok9dBg2mOxpjfb
	B6qWGU6dM18F8M+T8xpdCU5bDLTjfwM3/NyNq8ap56qRy4ME7U8d952qgMxkIQYAaCuk8n998SqLU
	DeL+xJK4VRVGB+8tg8XrHgHA6GK5JF9vBt4zV9mc5He8s/VxNQXlBz7uPJG8XoTaVGhyK5rhHw0Iu
	kNS7j39gZgMnoZH39YuonxFtYa7Xs9ypcbxA+02pdqe8UXDHFRsPu3udo8BFjar8bpr10sj7azlmr
	K2JhJoiaE5OoHUIy1ftbVr1IAW/Xbeou4SObvuDermGfei5OVGPc3spc9TOMSpHLypHOIHTDlFOJu
	qgwffRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KC-0000000D6ZD-00Ko;
	Mon, 02 Mar 2026 13:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3KA-0000000D6Wk-31TX;
	Mon, 02 Mar 2026 13:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TqCugejn+OGjGM2P4bwUziYu78OGaka0Bim+UNMgjx0=; b=OtZpxxKQqQCLImjBvsY0i+tYm8
	Su7gCZDwJhhzI7e8ENVRu+KXI5hXe77qIV08uBrDpqaEGXcSszbOhSwdDXg0r7oqbFEs/VKUt6OmT
	Wh+2rWgMG807wsPtrqn/Wi2pc9e2IUuzCXciM8qk9xwGJvs0miVBE9evATCEWzmYgwcrwdMsI+W3c
	bafs7Np7f5n4U80R2dC1xd9W0lY1jenQiwxySBVpWUqQFn4HQoEjjF5KpVDpdo8q7y5eCN5oKDfV7
	rDZpFEf6FzA88dXH5BWTWBzqtTK0yVLYKoHymKWIsHY+txZplHHHjbOrHk2dr5KAQGfa9KzxfGgsg
	YLo50Ubg==;
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3K7-00000000A5n-1Llx;
	Mon, 02 Mar 2026 13:28:37 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-003ZDt-84; Mon, 02 Mar 2026 14:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:To:From; bh=TqCugejn+OGjGM2P4bwUziYu78OGaka0Bim+UNMgjx0=; b=CnVsYB+8+
	VTkexEkCIXtWxDk0ct8bmk056FpnSkPCeP5i9Yz34bIo3y9sfFFKxB70WZvWoa5uqvPOn8FGr0qGf
	EbIp0aausm3TBu9LxPZnWweSATT+ezR5WZWL2ZB5A/AohwyvAn5sRz/2VIhze8//praDWx5tUs3Kh
	uSZ5LHvoL37lkFaTAFRYZPn6z3367lk4BEMixUtiAnxmBvTrEt3Nok0C2xREQl+pFHBZNSGve89hN
	sVBOcOV0Nc47MyZUOiMqCn7FnHZ5wI0tCUtCptdrGMcotngqvg2PlvnsYF2JihFCbaufaLijoNZFG
	NDR1Prmpt8MS2YYeGDqIb7kqQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Js-0003sJ-UZ; Mon, 02 Mar 2026 14:28:21 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jf-008UTR-B9; Mon, 02 Mar 2026 14:28:07 +0100
From: david.laight.linux@gmail.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Andre Almeida <andrealmeid@igalia.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	David Laight <david.laight.linux@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jan Kara <jack@suse.cz>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	Kees Cook <kees@kernel.org>,
	akpm@linux-foundation.org
Subject: [PATCH v2 0/5] uaccess: Updates to scoped_user_access()
Date: Mon,  2 Mar 2026 13:27:50 +0000
Message-Id: <20260302132755.1475451-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_132835_413397_E0E2A3CC 
X-CRM114-Status: GOOD (  11.57  )
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

From: David Laight <david.laight.linux@gmail.com>

Converting kernel/signal.c to use scoped_user_access() had compilation
warnings because some of the pointers are 'pointer to const'.
This is fixed in patch 1.

The same problem has been found compiling arch/powerpc/lib/checksum_wrappers.c

For v2 I've changed the code to use 'auto' and replaced the over-complex
CLASS definition (and its for loop) with a much simpler __cleanup() function
on the second loop.

Patches 2 and 3 factor out the 'autoterminating nested for loops'.
I'm sure there'll be a 'bikeshed' discussion about the names.

Patch 4 stops warnings from -Wshadow (enabled by W=2).
I did think about making the _diag_xxx conditional on a W=2 build,
but since the pre-processor just emits #pragma lines and they are
smaller that the for() loop it doesn't seem worth while.

Patch 5 is the change to signal.c that prompted patch 1.
The generated code looks fine, but I've not tested it.
Most of the changes are to 'compat' code - so are probably not
usually performance critical.
IIRC the non-compat code uses copy_to/from_user() for the structures
so is probably slower than the compat code's member by member copy.

David Laight (5):
  uaccess: Fix scoped_user_read_access() for 'pointer to const'
  compiler.h: Add generic support for 'autoterminating nested for()
    loops'
  uaccess.h: Use with() and and_with() in __scoped_user_access()
  uaccess: Disable -Wshadow in __scoped_user_access()
  signal: Use scoped_user_access() instead of __put/get_user()

 include/linux/compiler.h | 26 +++++++++++++++
 include/linux/uaccess.h  | 51 ++++++++++------------------
 kernel/signal.c          | 72 +++++++++++++++++++++++-----------------
 3 files changed, 86 insertions(+), 63 deletions(-)

-- 
2.39.5


