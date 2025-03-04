Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF09C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2VHCTSw3z44n+mEVtHwEjptAEEasvBjODkNE3cADdI=; b=gKwcgxI7mLguBLGfE5Khh92mkk
	MbWacnJwZKHdtq2uxNzMaj1nCwGc80FOhJWja1Am0pAIK7Y3XjAH8K2bP+vLHxWT39Hgl4Nhl0KHf
	CB0jXpN7y2+2hJIUSOzYdWzoUzJV98Q/42yIh8T1FX15x35GgrVZl+KPeJNwj0juY4hSsLldxfYnX
	VKiIA68/h+oMrQz/n9v6my8nrcgj5gBDji0WpZ6uCtq2obA/yLMHObe9q8wcyzMsLb+C632d5rZZU
	eE+Xy2PzDcSdwMut2T+6IwniE+R+n7xyCY9Pu/4q0tOU+/DBKBStZUyyIIPlwrJ3VG42ZhZay0PB1
	blXEwUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPca-00000004Avb-39xK;
	Tue, 04 Mar 2025 10:35:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPCq-000000044G5-2tM0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:08:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1B2FFEC;
	Tue,  4 Mar 2025 02:09:09 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 305BF3F5A1;
	Tue,  4 Mar 2025 02:08:54 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	lpieralisi@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: corstone1000: Add definitions for secondary CPU cores
Date: Tue,  4 Mar 2025 10:08:47 +0000
Message-Id: <174108287362.420865.6246087705407586774.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303170012.469576-1-hugues.kambampiana@arm.com>
References: <Z8XSIx75B4mtcV48@bogus> <20250303170012.469576-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_020856_767797_33775641 
X-CRM114-Status: UNSURE (   7.39  )
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

On Mon, 03 Mar 2025 17:00:12 +0000, Hugues KAMBA MPIANA wrote:
> Add `cpu1`, `cpu2` and `cpu3` nodes to the Corstone1000 device tree to
> enable support for secondary CPU cores.
>
> This update facilitates symmetric multiprocessing (SMP) support on
> the Corstone1000 Fixed Virtual Platform (FVP), allowing the
> secondary cores to be properly initialised and utilised.
>
> [...]

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/1] arm64: dts: corstone1000: Add definitions for secondary CPU cores
      https://git.kernel.org/sudeep.holla/c/21b9f56cec8f
--
Regards,
Sudeep


