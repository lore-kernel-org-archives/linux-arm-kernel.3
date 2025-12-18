Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162E1D68BF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFHiw7KS45+Y5Ey+urMC6Lnv/CqjydjTc7etoHKEfKU=; b=PAQhb5Xbk42ne2Z6Ti5bVuKWsU
	thE8azCrZkzjVZTPJUt9umvWsgmYjzdrn96ZKGWLkc8jwQZroU9hCfbP898J5dLVZzCXxoO9eOGrx
	e4u5O493/QrPh/sGN0adJvp6m1WtXPaXYnqIME4E/QYb2o6+PQhg43nWPU1NOzgrXsJqPI8BOgMg2
	E9gSkx7wBdbGlfNyDe5tUJCh+3ZaU0Pw+F56WkmVwF+ODkvPmjqWGbfrAwuM4yOtkWl6W8ZDERiEF
	gQ21wXF3WDMrWKZuppIdQIYX1MExdk3ZF+31dHywFg002E6cGeVLbT9yOEpOWXOn3TjOEdikujuM3
	yzCw8TiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB9m-00000008E5r-43QN;
	Thu, 18 Dec 2025 10:22:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWB9j-00000008E5X-3faj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 963B7FEC;
	Thu, 18 Dec 2025 02:22:38 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6D4D3F73F;
	Thu, 18 Dec 2025 02:22:43 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: krzk@kernel.org,
	linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: Re: [PATCH 10/12] dt-bindings: ras: document estatus provider
Date: Thu, 18 Dec 2025 10:22:36 +0000
Message-ID: <20251218102238.2235329-1-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2a2baef6-c294-4c31-bec2-10fbaa3f7941@kernel.org>
References: <2a2baef6-c294-4c31-bec2-10fbaa3f7941@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_022247_948957_F65F70EC 
X-CRM114-Status: UNSURE (   5.01  )
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

On 18/12/2025 07:48, Krzysztof Kozlowski wrote:
> Please follow standard mailing list reply style. I am not reading the
> rest and I still expect to implement my feedback fully.

Apologies for the poor reply formatting.

I will resend my reply with proper inline formatting and full
context preserved, and follow up with a new revision implementing
your feedback.

Thanks.
Ahmed

