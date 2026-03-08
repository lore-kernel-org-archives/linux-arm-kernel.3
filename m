Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882AAC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFbVL7xlZ6DjZTYq6qUlUgBqabUievmiFw4Qk4FnexQ=; b=prDQhCgjoE06qqylszFZjL2WWm
	GytkWvYDYxnRwGXgN5wugRHDZGwoDfzO4cLg4z7edpObyaitortDDXsD/x0Djo0fcPPhSt2rrIuQV
	dG3yNoT9MBqsJElw/xFrYngfcqlFWxH4eYSMl0MejdGfeSy2JYJInnQDc/AnOXaSwwUgh4BSJCFcU
	pt8poiKOiWIWTdNmGfMST4bDuqCelXmqyW7QUDePBKm3/n6xZqyxaSSHnJY7dqv8mOdIGqR/EH/V9
	gmyYPwSpvk7/UPrJWbLFhtBDllHFnpvD+l+Mrg7a66Tm7eHno5Ca3M7yhcR/LLAfYtei2liIwJwuM
	IzindXsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDW7-000000061sA-0Ghq;
	Sun, 08 Mar 2026 12:45:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzDW4-000000061rn-2SvC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 12:45:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB5D443AB1;
	Sun,  8 Mar 2026 12:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E05C116C6;
	Sun,  8 Mar 2026 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772973948;
	bh=ZFIV8Ee9/6ASXXuHKe4ooqhpMJfSkTQUrYAxVmmta4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdBHFTv1xkV6UQK8IfOdpwNthbwz7Q/Zu83ZG6Jl1KW2DYyncU3xoE3KQit9Skztr
	 p9jN4QRjm/gdlppqnsELjQBxottcA+TWBuXKx/FwNjAKT2fxaHPeF/qAQxG8k3aVqF
	 v2ebx9KYWWvHVxVyy23Gah2IZzzWnUtS0IZHbcXZqWyvTR8JpMAfWQ/IK/ZAhQYn8H
	 M/9RMHU8v0L/2Mr4L4tqVAYpPV3sQloTxeR/9QoxK38t/1JREKV7kqiOGX5RrWIc44
	 SwKJvTvD497WSVktLNkH93Hy0UWBx4JdmbBbKf91KX3nrzXxYTcEiHwHU+Wt4msvx8
	 F+9D2jqHjHhZg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Debbie Horsfall <debbie.horsfall@arm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add Arm Zena CSS support
Date: Sun,  8 Mar 2026 12:45:41 +0000
Message-ID: <177297386811.1084512.762352333880367472.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212-zena-css-v2-0-d33ea23cb9c2@arm.com>
References: <20260212-zena-css-v2-0-d33ea23cb9c2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_054552_648311_C522DB2C 
X-CRM114-Status: UNSURE (   9.85  )
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

On Thu, 12 Feb 2026 11:16:50 +0000, Debbie Horsfall wrote:
> This series adds the Arm Zena Compute Subsystem schemas and
> Devicetree. Currently, the only platform variant is the Fixed
> Virtual Platform. More information on Arm Zena CSS can be found
> at https://www.arm.com/products/automotive/compute-subsystems/zena
> 

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/2] dt-bindings: arm: Add Zena CSS compatibility
      https://git.kernel.org/sudeep.holla/c/96a43d3325e3
[2/2] arm64: dts: zena: Add support for Zena CSS
      https://git.kernel.org/sudeep.holla/c/164148d0a163
--
Regards,
Sudeep


