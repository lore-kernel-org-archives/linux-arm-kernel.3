Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E413BCD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcImQOqL6PDWwrlJ5hBM0I6IaHZiTAIqROkPTLemc4E=; b=LYKh5sUxS5W+80R3tC+b9rdl1E
	eDMjU9B+Pccenjy/NNl1is2YIySztQiKTxhzNtc+rCWRmUjq5qD1umjC8xVhWYBK0u9LnCzWgj3vf
	xldeLonUTOXWUvhfExjbZJwhp45VS0IjjfNCYKiAFJaIqgMvSBZaVOnmxFSvAdOa2fmXwhJLjOI2e
	z5B/Qx9bxGJ8XMGp27/qm5932F0aa4wv7aznRRISUeUalh4XZwfsMfvSJ/mik9ufgamDcq1mJWJTA
	XZ+uA18YESBAvzaJB9GnFJRsFWXHXvJd8141jA+muKi4jW6GT1q5B0tYsENiHL14G51w9tLkefoth
	K+AU5TYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq7i-00000004tFd-3ELw;
	Tue, 09 Jun 2026 06:39:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWq7i-00000004tFP-0sCg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:39:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8873A436C0;
	Tue,  9 Jun 2026 06:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA601F00893;
	Tue,  9 Jun 2026 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780987181;
	bh=xcImQOqL6PDWwrlJ5hBM0I6IaHZiTAIqROkPTLemc4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oPFZzgONsCmpDVEnv1PkmSV4RZfIndjsWDO3yz8yPSWB+KrMr5I2cFId1WVCrxzuT
	 KXoUETYrs87Kh+wLbN/mv970JcAgST1p3f4tqGMqvxCZmMIB4Dp9AA8drEmo995ns0
	 c0ewJGdIjsbYHzwTakmBvn835Hn+Wzzt5T013EycT0n0LkfTvkSHVYmDIlbxEGkWlL
	 z3ZlLFWbhdtvNloBiKXD3VQ2oSU6/lVkKCfcVqwIwePxro17ihQa7WPNxTzj3wN6L+
	 DwWGeMR11TlydKxOuWsC8J8e9Ri1D9RBTJZi5DhYXyQ0vbBEsFlViVC8yEav10MmUz
	 pBUABFqv051sA==
Date: Tue, 9 Jun 2026 08:39:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ajay Neeli <ajay.neeli@amd.com>
Cc: git@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, michal.simek@amd.com, 
	srinivas.goud@amd.com, radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v4] i2c: cadence: Add shutdown handler
Message-ID: <aiez0H0PPX2NYkyv@zenone.zhora.eu>
References: <20260430053050.3590173-1-ajay.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430053050.3590173-1-ajay.neeli@amd.com>
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

Hi Ajay,

On Thu, Apr 30, 2026 at 11:00:50AM +0530, Ajay Neeli wrote:
> During system reboot or kexec, in-flight I2C transfers can cause
> spurious interrupts or leave the bus in an undefined state. Add a
> shutdown handler that marks the adapter suspended and resets the
> controller, ensuring a clean handoff.
> 
> Signed-off-by: Ajay Neeli <ajay.neeli@amd.com>

Michal's ack was missing here.

Merged to i2c/i2c-host.

Thanks,
Andi

