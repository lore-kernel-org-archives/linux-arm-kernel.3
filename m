Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58152EED626
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buQKpkuGz7eFeRq/4bAauUCoGLoEeRElA2aGh/iuDic=; b=u1bfviJcNzKVEC575yGFIcfi5I
	sqMTcyPTPPe8G4kOSCjpxW/bCDLhTb7k4TAssp+90Ppp7jgGEktvy5DfnEarVNQv8pYK3R1FmSALS
	clvxg5LxnglJGi2yvVqmB44T8OMwe6H7Re4KAUwMd4p0gRJiO4uNEwaB9i6QoTCpL4uu3m2Ansant
	A2FfrgFVPJWRAYY+LZdPk2uNiG6v9uOAqw0TkzlZ9k/2zxIJGpdYT+yLaQfK9/I8gyilgEQM4uK8c
	9m+3JIM2L+awQd27TrAFJ+gp1W3npMCzs7Wc5jQOTUonn3RMw+ts+q2H3xqLaiqQRMBc2t97Ofjkc
	KbBi9dFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMqi-00000007PZQ-0CfM;
	Thu, 01 Jan 2026 17:52:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMqe-00000007PZ1-2kj8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:52:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DCA5497;
	Thu,  1 Jan 2026 09:52:25 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 284543F63F;
	Thu,  1 Jan 2026 09:52:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 1/2] arm64: dts: arm: Use hyphen in node names
Date: Thu,  1 Jan 2026 17:52:27 +0000
Message-ID: <176728989347.117137.9756787781927906118.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_095233_911706_820239EB 
X-CRM114-Status: UNSURE (   6.56  )
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

On Tue, 23 Dec 2025 16:24:58 +0100, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/2] arm64: dts: arm: Use hyphen in node names
      https://git.kernel.org/sudeep.holla/c/f0d0f087227c

--
Regards,
Sudeep


