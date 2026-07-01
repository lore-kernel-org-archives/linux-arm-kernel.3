Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CD0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGRGPG5nxs0MWmKVH1XE9+ETMnAwiphDMI53H6S+Wgo=; b=Pkp5N7jkWOuMfF7aS4Z0g7zDaw
	NwiCxcOOTHrNzMeUVWqtVISbtjEahQbIQUyo0NmKQwFIIz2mjADJmMJKksFruGbmECzrv5ynji0vJ
	dUFQ4awOvP2LPzB3u0T3X4cr8UBwHYgdQsa+YOYhghIyqI0Wyd0JAOWVTuv741+qpZ4dSHaCVjKF+
	XE3XSHUU8JVhzC8PlUDHKirjHsGlRcg6+qB9UhJ3tBw9YwrTrNHB+Uwn6gmgiqftSvHD/thiayseq
	8Jjk/s/yRu27LboHrnvRAQoghSKFraFZXX4hVEI47dOqD9gvNFicGB+V+jQljofX6pD5D+C3tfwbr
	Zhx2eing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf158-00000002vjQ-2iq0;
	Wed, 01 Jul 2026 19:58:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf156-00000002vii-0KUx;
	Wed, 01 Jul 2026 19:58:49 +0000
Date: Wed, 1 Jul 2026 21:58:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782935924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGRGPG5nxs0MWmKVH1XE9+ETMnAwiphDMI53H6S+Wgo=;
	b=RAJ3EfqoP6AG9c1WaCNIITbaruiAfTva7N92jqjyzHz99/OruOfTsQ9TCd5norcqHnFuwa
	K9sh09kmJbujZbohmQiFhoRumZZlkBpyLFNp1xSsQHibl5CYF+m/TJNK1JhQMyAn4LmeYK
	vdaEeUVaGAU+fb3jPhlEJA3GzYYBti4GYIH1mbLCU4yq2vg0A1P6iRNphahOyuLvRiQCzs
	G1ZivJCtGVTCUncdkOK4rty08ys6o4EvaF5DGpYcDpyLTW6lNjZo45NVlQ3WiTzvV04wgl
	nuZ/G2Tc5emil0fKKVXCMNNGwnTOt8sLqOwW9B3eQ381vduezgRl0dPzG4QrFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782935924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HGRGPG5nxs0MWmKVH1XE9+ETMnAwiphDMI53H6S+Wgo=;
	b=1SUZz5LD4PErOtj5qqBP0NkzivGmhqyBp9E8O8FyVIUjOEo15F26+TZGAU3SxaFSaSBgu/
	gXmhX52PlPw+fiAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20260701195842.GKzb73-i@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260630045531.3939-9-kprateek.nayak@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_125848_256349_8217AA26 
X-CRM114-Status: GOOD (  13.62  )
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

On 2026-06-30 04:55:31 [+0000], K Prateek Nayak wrote:
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -395,13 +391,13 @@ __futex_hash(union futex_key *key, struct futex_pri=
vate_hash *fph, struct futex_
>  		 * NOTE: this isn't perfectly uniform, but it is fast and
>  		 * handles sparse node masks.
>  		 */
> -		node =3D (hash >> futex_hashshift) % nr_node_ids;
> +		node =3D runtime_const_shift_right_32(hash, __futex_shift) % nr_node_i=
ds;
>  		if (!node_possible(node)) {
>  			node =3D find_next_bit_wrap(node_possible_map.bits, nr_node_ids, node=
);
>  		}

I replaced this with:

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 79e770d4d166..30d8622958d2 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -382,6 +382,7 @@ __futex_hash(union futex_key *key, struct futex_private=
_hash *fph, struct futex_
 		      key->both.offset);
=20
 	if (node =3D=3D FUTEX_NO_NODE) {
+		u32 node_limit =3D nr_node_ids;
 		/*
 		 * In case of !FLAGS_NUMA, use some unused hash bits to pick a
 		 * node -- this ensures regular futexes are interleaved across
@@ -391,9 +392,9 @@ __futex_hash(union futex_key *key, struct futex_private=
_hash *fph, struct futex_
 		 * NOTE: this isn't perfectly uniform, but it is fast and
 		 * handles sparse node masks.
 		 */
-		node =3D runtime_const_shift_right_32(hash, __futex_shift) % nr_node_ids;
-		if (!node_possible(node)) {
-			node =3D find_next_bit_wrap(node_possible_map.bits, nr_node_ids, node);
+		node =3D reciprocal_scale(hash, node_limit);
+		if (!node_possible(node)) {
+			node =3D find_next_bit_wrap(node_possible_map.bits, node_limit, node);
 		}
 	}
=20
I don't think it is worse, I hardly see a change perf wise. Sometimes
op/s is reported almost unchanged, sometimes it improves a bit.

What it does it reads nr_node_ids only once (which has no effect here
because I have no sparse node) and it replaces the shift + divl with
imulq + shift.

perf was pointing me to the divl but now it points to the imulq.
=C2=AF\_(=E3=83=84)_/=C2=AF

But having that div gone, can't be bad, can it?

Sebastian

