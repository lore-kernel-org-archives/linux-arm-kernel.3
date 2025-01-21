Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7704BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLlgyRyStArmIFUOO0SSD+KwmRWB1muBwX485RB8ANg=; b=f8GpTPubeATnI83Unbq4+i+67y
	WKQx5ARpbzGZZ5H31qe7xjrTWf+QaaByTHUH2sYHmzv5LLD85u0rtxDYka/Fh+OLnY3KEHigsjGvc
	T13+ekjdhU1NISo0iz1zclsfn4k/lc/TxaPc1vl1GcKolik/T3hvIztMLP/NIivMx30BruzExgGYU
	/E2qyeEA/y6mnl43duWvFG6X4gb3F2rofrI8kvw6XVe7qsWSwFqwPcAZ8txmhzv7JiIZn1i0eG8cY
	Gpqa7eP1nOjcTDqwhh08gw14bsZp/PiSHBzJ7vqCORHitGbdbTrKQmR8/ZHA5EELdVevipywzbGf7
	iwRWyRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taB3f-00000007Vfk-2PdJ;
	Tue, 21 Jan 2025 10:00:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taB2M-00000007VBa-4C4N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:59:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB1E5106F;
	Tue, 21 Jan 2025 01:59:35 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E6783F740;
	Tue, 21 Jan 2025 01:59:05 -0800 (PST)
Date: Tue, 21 Jan 2025 09:59:03 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] firmware: arm_ffa: Setup of_node for ffa devices
Message-ID: <Z49v50epNMm6YvAr@bogus>
References: <cover.1737441631.git.viresh.kumar@linaro.org>
 <0e863a4baea59865aff0d1b5657f548bc0aa8d2a.1737441631.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e863a4baea59865aff0d1b5657f548bc0aa8d2a.1737441631.git.viresh.kumar@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_015911_081645_A6A0F10C 
X-CRM114-Status: GOOD (  10.26  )
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

On Tue, Jan 21, 2025 at 12:26:39PM +0530, Viresh Kumar wrote:
> Match and bind the of_node for the FFA device.

I am bit confused and need more details than the above line 😄, because

1. We don't have any binding for FF-A and compatible "arm,ffa" is not yet
   defined
2. Even if we have binding, we will not have vm_id and UUID which are
   discoverable from the firmware
3. DT maintainers rejected the bindings when it was initially proposed
   as it is discoverable. If we need it for a valid reason, we need more
   info, this patch doesn't provide full picture to change their stance.

I would like to add minimal binding not for vmid or UUID but for interrupts
only. It is still WIP but I haven't made up my mind on how that should look.

--
Regards,
Sudeep

