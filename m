Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA788C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y14VXvwtwtg3Y4vvRgIeuvAFRuMj7c4tcDMazFQblQg=; b=PIHvqPmM+M/xhJatGaVLZWqZDy
	NF/99iz/2QevehLDr3sO8prSD5oYgodQvoQr5rcvyYx91d1r9vJSZDaPBZCB9yJSvmihFkJNbkkVH
	iLmstZrKcoXmOfY3jfJK2Qmx3gkMxd8gkz9tZArIHQF5/THfPRdFDijSxy/vLFUXvn6TGOjHiE/Jy
	hJi1vf8o5T8Oo6APobAwTYve4xJLmYRQNIbYC5ie6RqXPsPFER/GkU1B4nHXNB+oNlGWquKIMk6YQ
	v1UWggtarrDhyZpt/v+5dXGmD7AtzIrUocjPakro0a5QoZ5olXowI0z/Fn/rGToeqxs+elif3BtL+
	+lZ7Vv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZhN-00000009kWY-0SdF;
	Wed, 26 Mar 2025 22:58:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txZfe-00000009kRI-0qbi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 22:56:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6965EA4113F;
	Wed, 26 Mar 2025 22:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328A1C4CEE2;
	Wed, 26 Mar 2025 22:56:24 +0000 (UTC)
Date: Wed, 26 Mar 2025 18:57:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <mricon@kernel.org>
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <20250326185710.5ad0f9ad@gandalf.local.home>
In-Reply-To: <20250327094502.6ae56227@canb.auug.org.au>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
	<CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
	<Z-NHugcLdLqkEHFR@arm.com>
	<CAHk-=wg_HipugbtswxFnekQy2g_ksKKXj+yht8naj2FEMtRMgA@mail.gmail.com>
	<20250326124025.1966bf8a@gandalf.local.home>
	<CAHk-=whwmmU+hv1SyMoyr8yAGP2JiAAP+g5BZaMajzAukzrM9w@mail.gmail.com>
	<20250326131200.1c86c657@gandalf.local.home>
	<CAHk-=wiXEvC2r=Sa_tpYjd=g+AxZDxxjSdq1WADTvZYZ9oUi_g@mail.gmail.com>
	<20250327094502.6ae56227@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_155626_308593_5708AB63 
X-CRM114-Status: GOOD (  10.43  )
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

On Thu, 27 Mar 2025 09:45:02 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> My understanding is this:
> 
> for normal SPF checks (i.e. not DMARC's SPF checks) the test is done on
> the envelope sender and in Steve's case, goodmis.org DNS SPF record
> says that anything from goodmis.org can come from the kernel.org
> servers.  DMARC applies the SPF check to the From: header address.

Ah right. Thanks for looking into this. This brings back a memory where I added:

 "v=spf1 include:kernel.org"

to the DNS TXT record for goodmis.org.

-- Steve

