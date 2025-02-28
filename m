Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D421C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbh5IPhsiu/FQ6dkIC689ZFNba03S3wozy5QcqeXKxU=; b=C4r5HRKytj1eHw2ILBQBKdS/9g
	z8zxiNBUbBNmTeG0wYAFoSSlRP7ub6PBD/U5r7oEQ1o6QN47nw+nnnWMTNnkBSmmkYOeiyfMyOku6
	SmvmwavhN8Ba+eVzwySYQU171eTqckf3o8/PIn+tA+9amxcjFT9PNcrXd0ZHom224LcwjWe5J1cbu
	QPTseM+NoC4DmueRGXgnHlKzO9esq1R3ayprrv2ppbq8BMs+bMXzJspvlscguJdW/QXjS9Cqx0nEX
	PMj3dInv4sH/1qfPBXO8C/+YoyCm1s1QQJcnKyW82HRWTB1bgFUBcY2zfr10xddjjWg64Ucc/OktK
	ioS+uHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzCb-0000000Aqpz-0b6b;
	Fri, 28 Feb 2025 12:10:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyYR-0000000AkqO-21lL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 11:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 83CFE5C0782;
	Fri, 28 Feb 2025 11:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B84C4CED6;
	Fri, 28 Feb 2025 11:29:11 +0000 (UTC)
Date: Fri, 28 Feb 2025 11:29:08 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: yazen.ghannam@amd.com, mark.rutland@arm.com, mingo@redhat.com,
	robin.murphy@arm.com, Jonathan.Cameron@huawei.com, bp@alien8.de,
	rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com, tanxiaofei@huawei.com,
	mawupeng1@huawei.com, tony.luck@intel.com, linmiaohe@huawei.com,
	naoya.horiguchi@nec.com, james.morse@arm.com,
	tongtiangen@huawei.com, gregkh@linuxfoundation.org, will@kernel.org,
	jarkko@kernel.org, linux-acpi@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	linux-edac@vger.kernel.org, x86@kernel.org, justin.he@arm.com,
	ardb@kernel.org, ying.huang@linux.alibaba.com, ashish.kalra@amd.com,
	baolin.wang@linux.alibaba.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, lenb@kernel.org, hpa@zytor.com,
	robert.moore@intel.com, lvying6@huawei.com, xiexiuqi@huawei.com,
	zhuo.song@linux.alibaba.com, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com
Subject: Re: [PATCH v18 2/3] mm: memory-failure: move return value
 documentation to function declaration
Message-ID: <Z8GeBJ9tTayTm9s9@arm.com>
References: <20250107081735.16159-1-xueshuai@linux.alibaba.com>
 <20250107081735.16159-3-xueshuai@linux.alibaba.com>
 <Z8BbFRupgknBTvH8@arm.com>
 <0c93542f-4521-41bc-a030-5b2d8621aa6a@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c93542f-4521-41bc-a030-5b2d8621aa6a@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_032919_562945_E285B2C2 
X-CRM114-Status: GOOD (  11.00  )
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

On Fri, Feb 28, 2025 at 09:46:30AM +0800, Shuai Xue wrote:
[...]
> > On Tue, Jan 07, 2025 at 04:17:34PM +0800, Shuai Xue wrote:
> > > Part of return value comments for memory_failure() were originally
> > > documented at the call site. Move those comments to the function
> > > declaration to improve code readability and to provide developers with
[...]
> By the way, could arm maintainers help to ack patch 1 and 3 if there
> is no objection?

James Morse is listed as reviewer of the ACPI APEI code but he's busy
with resctrl/MPAM. Adding Lorenzo, Sudeep and Hanjun as arm64 ACPI
maintainers, hopefully they can help. Here's the full series:

https://lore.kernel.org/r/20250107081735.16159-1-xueshuai@linux.alibaba.com/

-- 
Catalin

