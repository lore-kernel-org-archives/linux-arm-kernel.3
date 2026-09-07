Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE92C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oR5cKFf/2jw2DOu0W7McNmQ/NcK1+PxvNuJfcWNEzD4=; b=Nzrmsp3fIpCXdOoLUVMTdhxlq9
	hJ9B/R6oYPJGHiWvk5iD6boqVu7bvr9SHan8+yQP5t6Bg9XdYfMCnltFcXi6pbXA57M42xBLz6eqN
	v4kV9GiA5oTelttGEqBsDES3qGgmUAvnnU1zjKcY8ELA+RhTNujVnj44W/kyjsx71s0t8AK2yZ0uR
	Qkm+uPXd64nMy+uQGPY6cLEpLX/CHNNDmxorzVizKJXIv/buNfV2V7MXLoa5+gpnncfBTxSYpdXCM
	ZUp1GMMCDl3P6jnSYJJiPVrt8g22eqJ0GuBpufQV3+FiMoIL92VNHZxlw0/ZAjhCy2Q4TVq4N7OiV
	Dcihxvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WZv-00000006Typ-2S0G;
	Mon, 07 Sep 2026 10:27:55 +0000
Received: from out-85.mta1.migadu.com ([2001:41d0:203:375::55] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WZs-00000006Txu-0kUF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:27:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=h902rDfmlKFI7HEFtHSfdriDpJHjffat8oxgIkNBmPA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788776868; v=1; x=1789381668;
 b=qD7NRm2T2MG6b07b/85jTnr8B3Fn+p2Aajc2PvYdpdcrlinz2IpGXosupHOc9qgx0MozHdKK
 tUfaDNQLw/r5xUVRK+Gyhxp93oEOJG8kXd+hAsDbo+P4K1Zx+01WY8irEatJwdrznS7BqYYNAX2
 b4SAeJL6AEM3eDhcc2akcBXWsfdA9hMhDPsDbtOu8wjbauEyC90iKCz0eJvQAJVKFkbazOpPwQ5
 X7Hj0AbDi5gVaTROZENRZYvhdyQuHgsa/ALr5eZvoDzKgPjn5ysMu7LNAKWzBF3Nht5gaaUN8Vx
 C5PXa3OCXttSiN5W4gk6ZCOE1m/4FF7iDLgB4JLgMvHFA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4c1fba6a1308afd3;
	Mon, 07 Sep 2026 10:27:48 +0000
X-Mizu-Trace-ID: 4c1fba6a1308afd3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 7 Sep 2026 18:27:43 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: arm64: Fix typo "initalised" in booting.rst
Message-ID: <ap6Rn5We1wDJ3KkK@wyuan.org>
References: <20260907091248.31415-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907091248.31415-1-hemanth.selam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_032752_623505_B7FBA74B 
X-CRM114-Status: GOOD (  11.79  )
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

On Mon, Sep 07, 2026 at 02:42:48PM +0530, Hemanth Selam wrote:
> Correct the misspelling "initalised" in the arm64 booting document.
> 
> v1 changed it to "initialized", which quietly moved the file from
> British to American spelling.  Randy Dunlap pointed out that
> doc-guide/checkpatch.rst asks that both spellings be left alone, so

doc-guide/contributing.rst ?

There's no checkpatch.rst in doc-guide, I guess.

> this uses "initialised" and only fixes the missing "i".

And, future readers may not know what was in v1. Or rather, I don't
think mentioning v1 here adds much.

But I think a brief summary of your discussion with Randy in the
previous round might be useful.?

> checkpatch.pl suggested "initialized" because scripts/spelling.txt maps
> these two entries to the American form; that is addressed separately.

> Only the documentation text changes.

Nit: You seem to prefer spelling this out, but the diff is fairly
     straightforward. Do we really need to mention it explicitly?

> Assisted-by: Cursor:claude-opus-5

Of course, I don't know whether this commit message was written by it.
;-)


