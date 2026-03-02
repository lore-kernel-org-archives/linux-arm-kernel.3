Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BC4E9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2ClYLRupqDrO68wbhPYoX/KO8vhOPlwFWoOd/NbY3w=; b=1eLDe+p8ukxpWvWit+cQdM+XZ9
	V6xv9VoUqTHLFP7O8p4fmBc+FcUHakdWEwONtr8H9wUih4vZFU4ZYlctmCbgJ7o/ccT3gwTY6d2hi
	t2o80vpCYgOCs44ywAdFhsw6u20QLbmGlczteTcddhxkNgWKW914XWoDZph6SHfl0ryR96BsXzRF6
	maPRHov3JCdGCmni/8wQqoFuIcyHDnDJYkDgDNeP97RK7OCojtJ157mWIDj7KqB1vUcZOYvmKb/Fi
	7NkPXn/KHQ+VcFFyipHK9WsOtvMRt6dVokwstqGVyJyT7dtO1T499q2R8Ix3FLiCtL6Cr++dn5ETQ
	kECyauZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3K9-0000000D6Vn-0TnI;
	Mon, 02 Mar 2026 13:28:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3K8-0000000D6V0-0cDL;
	Mon, 02 Mar 2026 13:28:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=o2ClYLRupqDrO68wbhPYoX/KO8vhOPlwFWoOd/NbY3w=; b=jQgi8QHV+OBPcM8R0JbAogpIHw
	sfcmMr8lAPRhrnf+RaQnylbB5/pjF2UdPETcZ/e0aeneijfhKpxCNlKR3C2/eAizeCAyG76E9MISM
	z8dNJ4GKTE2SF6vSHBSKrU9A3SEewURnoqXGiBjj6l6fMUGqdC6yjcBuwgDjcJv1FCO3VzuUJhhcz
	wYrxMfHgInetX5nreidsh6KWe5vrcg5elYELQO9pjWhIW0jdE1hivMbIOxijeXzTvDZOm3J1MUYsJ
	zkeOVcyPmdmPXZ9NZRWCl0kbFKOuuRg3f1cjIgWbQj6QIB7sn7ppceSEpKGoOrXJv6Gvyl1eSGLE/
	Uk6YyGzw==;
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3K3-00000000A3v-45aP;
	Mon, 02 Mar 2026 13:28:34 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jx-003blN-9N; Mon, 02 Mar 2026 14:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=o2ClYLRupqDrO68wbhPYoX/KO8vhOPlwFWoOd/NbY3w=; b=RaIJo34Y0Q7j2egm9oaHOlOtOd
	qIf5fI6+l/d2wpNaqq8G9dXTQ9MMLD3B96RqcrmcIuZWAbHSJrVvAOsCyxNnHmB0ApiOwjvIA/WUq
	2QHmlroveisu5RbpBCARdjIwFelcSMWSgnuhcGGnezIcVvrdSc/czwp60dIuZ0dJ0UBhYTt3Dir6A
	kPjMxT6Sx+w5jzEelLAoWpF5WZwr5068t7N9pLbu3BuEHsUXyhRpZNDULOe1NTcLEJsTarSsqPA3q
	jO3BiP4+6U4spuDiRYWorjNHk7ZXXdxC/8mJTlzMjB17nS6wB8o7mn+sdiXsOXXocQv+tO32ThUWi
	FRs2OCew==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-0001hU-9m; Mon, 02 Mar 2026 14:28:24 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jj-008UTR-SY; Mon, 02 Mar 2026 14:28:11 +0100
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
Subject: [PATCH v2 4/5] uaccess: Disable -Wshadow in __scoped_user_access()
Date: Mon,  2 Mar 2026 13:27:54 +0000
Message-Id: <20260302132755.1475451-5-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302132755.1475451-1-david.laight.linux@gmail.com>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_132832_109501_7236CBA0 
X-CRM114-Status: GOOD (  11.95  )
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

-Wshadow is enabled by W=2 builds and __scoped_user_access() quite
deliberately creates a 'const' shadow of the 'user' address that
references a 'guard page' when the application passes a kernel pointer.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/uaccess.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 64bc2492eb99..445391ec5a6d 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -739,7 +739,9 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
 #define __scoped_user_access(mode, uptr, size, elbl)					\
 	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl))	\
 		/* Force modified pointer usage within the scope */			\
-		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr)
+		__diag_push() __diag_ignore_all("-Wshadow", "uptr is readonly copy")	\
+		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
+		__diag_pop()
 
 /**
  * scoped_user_read_access_size - Start a scoped user read access with given size
-- 
2.39.5


