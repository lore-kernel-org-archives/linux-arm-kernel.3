Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0BAE668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OydFKkDpfz0JNZEUkqtMwzrbBMI1EBnQentxl7gcByE=; b=ERwluYLO87lnrhWHEWGPJus5M2
	fgyH8Tl8yIqL/6E1Z2uxw04DUBXaw5GxaQ5QE5F2AU5FD3M8yfas163UkMov4JT3BWHwNAr3IF3YX
	SEqKYY1vEKbi4P7pf4ofwb9q9trFklySx+lkEnMTUCSXgPZF0lc2KsBk5yXZGHLSK+amLCjsOLsat
	I/Mx550KuPOttzVYFBA44o/lHpirDl7Dd5r8FLz2TyQPIiAWcw5wNxvGuALOpwFn8UFlfHFhdQhy6
	AkWexcKcu9GjtmbLWJWB1k5dWCvcO5BeJ3zvf5QGDNs48hOj4jCLGygj08KhKF4VZNgjb+eXAvQPL
	YYKSm7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyKx-0000000BfZ8-2Y28;
	Sat, 20 Dec 2025 14:53:39 +0000
Received: from mail.cock.li ([37.120.193.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWyKu-0000000BfYI-3Arw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 14:53:38 +0000
From: kemal <kmal@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1766242400; bh=FvJyIGbhT430uL4AduCETNPEqBcVp0n1bnrWN7I0HeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfzRVLsEFkIM21P0FTdJOSWJO+jw0Wt6iFL6DQHVlqVaL8DjaLDBAzoim1FjNdj+7
	 HdHvbqmAJ09VNl98g5MDoUZ6kG3IziPEFPu9mEJ0aZgMVZYTZz3I5X5sKm7QJSiCW3
	 eeaKop1ZaZipTF1kw6YvIGD01fb14KW88sfqqTQSH6AdE4Wrp5WwuoVF5NEFQnnKE0
	 XhaedY/zpkHtVdiItyE0OFsFY0lC18IbsmZE86eWU7onHJ31gAez1mJQR9qZI06RzI
	 qHpL8oZY7NacJF0FZHz+dbHIektcoBnRmiWyxKL5/nWai8WpgTqMnEUoVUFd94VQbl
	 YXnGlKk1/Syog==
To: ruanjinjie@huawei.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v9 16/16] selftests: sud_test: Support aarch64
Date: Sat, 20 Dec 2025 17:53:08 +0300
Message-ID: <20251220145308.35716-1-kmal@cock.li>
In-Reply-To: <20251204082123.2792067-17-ruanjinjie@huawei.com>
References: <20251204082123.2792067-17-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_065337_336068_5574F5D5 
X-CRM114-Status: UNSURE (   4.94  )
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

You should also make sure TEST_BLOCKED_RETURN is defined in
sud_benchmark.c:

/*
 * To test returning from a sigsys with selector blocked, the test
 * requires some per-architecture support (i.e. knowledge about the
 * signal trampoline address).  On i386, we know it is on the vdso, and
 * a small trampoline is open-coded for x86_64.  Other architectures
 * that have a trampoline in the vdso will support TEST_BLOCKED_RETURN
 * out of the box, but don't enable them until they support syscall user
 * dispatch.
 */
#if defined(__x86_64__) || defined(__i386__) || defined(__aarch64__)
#define TEST_BLOCKED_RETURN
#endif


