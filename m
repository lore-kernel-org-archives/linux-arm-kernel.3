Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F06B4C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLaoyTUTkI24Ev64JhZR5CvLRX7h4m4aghyw+YsD6Eg=; b=dE9KuSd7IXesZSBMGtn/9i9Chx
	TIdjx1SWBClzMf91d3XQ/QGgkd27Om19leSE2QliWRhxjb/e6Qi3ZBxhhvxce5NyfoqmuNVrCyNHX
	yNqjsUuheICkA3OrGjNx+qMw77cVWgrPue2QebX01K4jiWKOUy8LZAN2ORg1cpFdy8cFhouBM9UhQ
	b1Eytm0cia91YI+oyk+ew8SkT3mtI6MaaiemEOfbzYZQY1DQeIcaDlQwVqoaoJkwhzPTfL1RqHLcI
	e9yftlzf6mTcbuggxs7WQ9zvDkpnUmqRBpFzszmLhfKoczlq3cAXPmX0IQ/gf8pu9jKpt58VQkJPk
	4k35L7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lGE-00000006kmz-3vb9;
	Tue, 15 Apr 2025 18:43:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lC5-00000006k84-3L98
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:39:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6CE51756;
	Tue, 15 Apr 2025 11:39:34 -0700 (PDT)
Received: from bogus (unknown [10.163.48.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23D2A3F694;
	Tue, 15 Apr 2025 11:39:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:39:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v6 06/10] mailbox: add CIX mailbox driver
Message-ID: <20250415-beryl-malamute-of-kindness-7fba06@sudeepholla>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-7-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072724.3565533-7-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_113937_871196_EF69DD12 
X-CRM114-Status: GOOD (  10.83  )
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

On Tue, Apr 15, 2025 at 03:27:20PM +0800, Peter Chen wrote:
> From: Guomin Chen <Guomin.Chen@cixtech.com>
> 
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.
> 

Do you have a specification for this mailbox ?
I see lot of resemblance with Arm MHUv3. Is this a variant of it ?
I just don't want to see a separate driver for a small tweak of MHU v3 IP
itself.

-- 
Regards,
Sudeep

