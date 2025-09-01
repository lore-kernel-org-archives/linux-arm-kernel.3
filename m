Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4F4CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AbE/75K2GVqTBVNgvpt+w56HmHXmLPpo7k65ZoP/Xs=; b=EZ3o2lZqKPUvvK5MC7nAVcYodZ
	fDmfhPbPXm4IgJuYJ0S7P0/u6a/OqmAakCpjyOBgmDK23Njr7sc5BsIlucg3i48XV9P0M4MKCOGYV
	rcThT5VWASrzvc1VFp6739TCz/zIbsvhVXrZ3jGNxemAm/HOFAsfAz3KxlHdPC7FIfiSxNvgcwFSO
	OlxYzAsUYUlnHH4zwg8EVyosLaSqLu7DGsTZkCe3kZhB40ZBqZSrs8tdq1K7s5/8ANBRSWrfYk+kT
	xwJ7pmmlgF2sW2OHebKyLFHqXFHDvqSQmkSDNLui0sID6z8M/TU6xk16N7L0etaa9fgK2UvmG7clN
	zuy9yfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDna-0000000EInE-1Aje;
	Mon, 01 Sep 2025 23:18:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB9P-0000000Dnd7-0pwG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:29:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E132B405E1;
	Mon,  1 Sep 2025 20:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E475C4CEF0;
	Mon,  1 Sep 2025 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758554;
	bh=xIsLH653UR9bpg6VTzgFv8umlPBg//nOtGBqWRExVFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sOrMtuokVlRFxgVNtMVpHJEVW3oVaxoEgCPwPi9LEN42ziu6Zc5t3rAmOk0Vo91T7
	 kHG+sVCbL2AIGFI9nAY+DYtZR5qXGISaie+hM3SkCzexv3az3cWCpM4scLm9dWFcj5
	 +8gymTMSRrS5kelGB9ECeoZjR1+bJ+ewRjaqF707tQ7RR6ZHmeaMrGDvqwOm0vnBQf
	 4sTNv4KGmHnJ8Z6oM8FWTKdlhJ1iC0YaqLhjpFM4T1nxS74gBOr8Kz4JR3aoJMSODc
	 TCJC0o7piMc4+GUfBl6/DWNtubQBAaF5VlTAN5NFd6/Lenf8/HTyxgpknXugarlCJO
	 7oh15BkrIBkbA==
Date: Mon, 1 Sep 2025 15:29:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/4] dt-bindings: interrupt-controller: aspeed: Add
 AST2700 SCU IC compatibles
Message-ID: <175675855315.287526.6300698694684294700.robh@kernel.org>
References: <20250831021438.976893-1-ryan_chen@aspeedtech.com>
 <20250831021438.976893-4-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250831021438.976893-4-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_132915_255403_EBC8B39B 
X-CRM114-Status: GOOD (  11.34  )
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


On Sun, 31 Aug 2025 10:14:37 +0800, Ryan Chen wrote:
> Add compatible strings for the four SCU interrupt controller instances
> on the AST2700 SoC (scu-ic0 to 3), following the multi-instance model used
> on AST2600.
> 
> Also define interrupt indices in the binding header.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2500-scu-ic.yaml                     |  6 +++++-
>  .../interrupt-controller/aspeed-scu-ic.h           | 14 ++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


