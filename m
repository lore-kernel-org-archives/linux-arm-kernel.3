Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B99CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCG6hUPGZHU3XZi8of8S5DC77r3qnZlG2MiTARhIXQw=; b=JQfkDVA7rN6m4E5LLXYCb2TTgE
	B0qn6SR4j2+q+xmt6EuEfID0DuSU5o4y834tqxueMNmX2HpfFmlTrMQpyN60Fw4a3cEvpNPfm19/l
	5JZI2oP7eJMAxVmoW6jOCXaSX755DmLg8iEP03MuqmQooZdgAwOIkQcznJpQP3MNhQVnUOml48mil
	+WgRfy8akFoarQ4NB6KQic3QyH37+AcFZOS8t5NHqwLzYNBsiXksy3l6pfReEbhytDawJ7fMEU5+4
	ZA9SlL6lqIoAT7w/y2mL4IApxbPfqyA9nIX+mamWj8WwN01y9n+ojbvn9l1WfPlH4rluNSlMsWufT
	fs/75lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1og-00000008q1A-15Lc;
	Fri, 12 Sep 2025 11:19:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1oe-00000008q0V-0ScL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:19:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D061515;
	Fri, 12 Sep 2025 04:19:34 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6D083F63F;
	Fri, 12 Sep 2025 04:19:41 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 12:19:39 +0100
Message-Id: <175767593833.2285226.9343371180097428105.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
References: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_041944_187755_F826B85C 
X-CRM114-Status: UNSURE (   5.80  )
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

On Fri, 12 Sep 2025 11:24:24 +0200, Krzysztof Kozlowski wrote:
> Print full device node name with %pOF format, so the code will be a bit
> simpler.
> 

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Simplify printks with pOF format
      https://git.kernel.org/sudeep.holla/c/2f86054cc1a6
--
Regards,
Sudeep


