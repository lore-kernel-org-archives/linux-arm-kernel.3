Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1DBF327BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83aVEK9f9SufcwCkUntBBw2eItisKLS4TV7VwcFpGhQ=; b=xSmzxHotprE3/gRTOcP/rX8o+o
	wrlpAvDBNFa5gyZ6lpZ7KqGIQk0Zuoxii5mhjGeaJCJhsjxkGOMO5viQE5gCv2mM7spzvx+QrohQu
	nsr0IUuwIAhbSjIx4RZCCnBQsfDS8XayvvkqAdX9CjAjZhpK53uKy3TKyD+tc93v/dmDH9bzNZzz6
	jb57Gz3F00x3EqCYyzjmWHyLsFxvHvl7BPBtnUJTSIAGZ63TFT16bL+vn6v+0VRb4NEjXMciQftY2
	m/SNzRGUCTXMKMsOlg7JNMDP97HANcLHBhiKRkV7x75mW0VteYrzUutCjTRzEwsY6vLcMYyBlWagt
	dFyQFyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7m6-00000008ND4-3TpP;
	Tue, 21 Apr 2026 09:52:10 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7m4-00000008NBx-2mtM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 09:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=83aVEK9f9SufcwCkUntBBw2eItisKLS4TV7VwcFpGhQ=; b=p2CwlWz8heTBsicOtaS2dH9rBt
	Kr4Td/2WmHq18jsZCKQDBg+pO7qQBnsluvlLuZkKpBNRyCr07yRuJMh0U3YcVpMTX6TqmB0/XDT7j
	Jpyttg3XmIA+/oVluiKg+WX0jEB4BAfgJcYOJSCHyyMvtrwoAHg9kpJVrSA7ZPQ08IsYKt1/EuKSi
	d9pvrqYPTApN5+eYn/4kGTcHeTz/KLCe/5NlZZ/9OB4gqj+qoiPZE5xx6056yfvcs4Sivix9RU52p
	LbT5mT65YUAtTEjy4OPDHHSiz+zYjo8M7QzF9svrO1RI8A2pZh3RkXmV1mq86aZM1yRKogYzo8SWy
	KX9JieMQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wF7lj-000lhS-10;
	Tue, 21 Apr 2026 09:51:47 +0000
Date: Tue, 21 Apr 2026 02:51:42 -0700
From: Breno Leitao <leitao@debian.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Huisong Li <lihuisong@huawei.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, pjaroszynski@nvidia.com, rmikey@meta.com, kernel-team@meta.com, 
	stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: arm64: cpuidle: Tolerate platforms with no deep
 PSCI idle states
Message-ID: <aedGoi-Fk5HPK0OO@gmail.com>
References: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
 <20260420-sturdy-unique-shark-c4ca8c@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260420-sturdy-unique-shark-c4ca8c@sudeepholla>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_025208_700719_C5968756 
X-CRM114-Status: GOOD (  13.38  )
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

On Mon, Apr 20, 2026 at 04:12:38PM +0100, Sudeep Holla wrote:
> On Mon, Apr 20, 2026 at 02:27:13AM -0700, Breno Leitao wrote:
> > -	count = pr->power.count - 1;
> > -	if (count <= 0)
> > -		return -ENODEV;
> > -
>
> Does it make sense to retain this check like
>   if (pr->power.count < 1)
>   	return -EINVAL;
>
> Though I see the assignment to pr->power.count in drivers/acpi/processor_idle.c
> is through unsigned int. So I am fine even without the above check.

I don't think the check is necessary. When count is 0 or 1, the loop
for (i = 1; i < pr->power.count; i++) body won't execute, and the
function will return 0.

This seems like the correct behavior — if there are no FFH PSCI states
to validate, there's nothing that should fail.

Additionally, returning -ENODEV would trigger the "Invalid FFH LPI data"
error message, which would be misleading since the LPI data isn't
invalid, it's just not present.

That said, please take this with a grain of salt since I'm not deeply
familiar with _LPI states and their expected behavior.

Thanks for the review,
--breno

