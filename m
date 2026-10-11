Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0067ECA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 07:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNFRYvVDaUFBZPhe3OOZAp9xrDPCoOvOUY4fCTsCUbs=; b=xwaG2bue11uSUWIF1wekm3p/Nc
	CDdWHJisw0Sjyx6WRkc3dL69pgYCDlVx6Idc3yADkdUYUmeode0Qu39LTD4lAjA3KKvF2XBCsFssq
	9kpdDKAbjBVVwHzEkumu8qx1qqq05bQB/dEOqHdQeRzfEVXrLKnbzzNDKPL6vNqxPrxznzg5Y14qc
	5CAuCHBQuKd/cNCeCf21MxuM9oiAzviO+yrmRKx3r+EgJFlhm2yNdVP7aL1ZHn++MP4OlDmwUSDra
	mFyhx6HCpoLPZRg5IoVyt74lywsV2j93K43Q4LYnG4WgfNLRM59LrbDvSUrnwAdVIMBYDbdjePngH
	mzqBHWiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFo5g-00000008oAL-0wJw;
	Sun, 11 Oct 2026 07:35:28 +0000
Received: from out-103.mta0.migadu.com ([2001:41d0:1004:224b::67] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFo5c-00000008o9H-1Xef
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 07:35:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XNFRYvVDaUFBZPhe3OOZAp9xrDPCoOvOUY4fCTsCUbs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791704122; v=1; x=1792308922;
 b=kAjzGqrTFkWGp7M92r5AXKq3PHO8X/DYMmD6ohvad4KDgPkndKf7DlEx0E3YOIidYFE9zz55
 hD1oIQWsW7eIJCr7GtMr3E0jJax8HryydDyDuU4eBMMiajPt07jxjfhg4VQ4OayTahuWoeoZdPL
 7QcFSLA7DXZ7MU6f/8X33fTc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 328ed463f02282a0;
	Sun, 11 Oct 2026 07:35:22 +0000
X-Mizu-Trace-ID: 328ed463f02282a0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcf03d95b8so558e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 00:35:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJAm2f1ZQbWNe2OF1hf97Kn+hnFvTvtoidUZoUtTyPy79dRfEi5Qe3SBlwoiyWuoMC2St4TII9B164SKDU8y0J@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/H+CwlSULOhj2w+QGd2zsGpiljn51J9qWQlZDATcqNGQ7cvh/
	DkLzGNkO22W1mo1dRuXC1yesLP5X8K+pJ8SwQJgYcJ6AVwdLfmzQ+5oiA1PcIg+11WfKhU4Qrkt
	DsIglT7rtcfV4nX2+WJ3AZNNRc1neSJXK7wuZvDr2
X-Received: by 2002:a05:6512:318a:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5bcea60aaf4mr47132e87.12.1791704116941; Sun, 11 Oct 2026
 00:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261009100738.31288-1-will@kernel.org> <20261009100738.31288-9-will@kernel.org>
 <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
In-Reply-To: <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 11 Oct 2026 08:34:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
X-Gm-Features: AclHuK958ZwmXeLPkKS0guZt75r60xrx1-iRJMQxQvR6nqtqq4QaiIIHeVzCYys
Message-ID: <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] arm64: cpufeature: Store every ID register with
 its overrides applied
To: Ben Horgan <ben.horgan@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	=?UTF-8?Q?=C8=98tefania_Ion?= <stefion@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Tarun Sahu <tarunsahu@google.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_003526_339593_F6208E6C 
X-CRM114-Status: UNSURE (   8.81  )
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

Hi Ben,

On Fri, 09 Oct 2026 16:51:14 +0100, Ben Horgan <ben.horgan@arm.com> wrote:
[...]
>> the same way. Everything read with read_cpuid() goes through
>> read_cpuid_with_overrides(). CTR_EL0 and CNTFRQ_EL0, which are read
[...]
> For completeness shouldn't read_cpuid(SMIDR_EL1) change to
> read_cpuid_with_overrides(SMIDR_EL1)?

"Everything" should have said every register in arm64_ftr_regs[], and
SMIDR_EL1 isn't one of them, so read_cpuid_with_overrides() would hit
the WARN_ON() in get_arm64_ftr_reg() whenever SME is enabled.

Thanks,
/fuad

