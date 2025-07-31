Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF58C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjUm1/RbVFM/xJkaHabW6i9Bcnnwb6KYfWqdSi7YJb4=; b=LfO/Wwf931bCIaBxaZs0TTFiRJ
	B0vH+MD8jsUd4+tabnJ7vEe6xqKGgQsbsibLw/LWTNUEVIdChDDRcSxagO0mcVzTk5bacDEElBWqx
	mSI4kKlbHdDNw3cTkDDvWFyr8u2Bj3yFw/GgmHoFg71ywhVZVx3x2Ka7W32x1GOByY9+MBSu7GgWI
	ToWVNNWCDkrRsf3rgAQLu7e4nLluzZ9HyYiMrmIXoMwhVvhYFeBtV4+mPhJrlwd8RJ8uaqPl2Attg
	ZEseSdL1rB2w4+bjsjhneDPQ6SEAsMUYIl5TpHQuhNRTZop0ybmu+8w7tC3iycAKDzelmjNgJCI9E
	N+mBbFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUJ1-00000003q5y-2oKm;
	Thu, 31 Jul 2025 14:30:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTiC-00000003kIa-1Eae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 13:52:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69D6CA55075;
	Thu, 31 Jul 2025 13:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69D7C4CEEF;
	Thu, 31 Jul 2025 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753969967;
	bh=XdzNgiFrq59/+bhLTk3tmfCHWzWelXvJVRNyC573BUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sfrGE2XjpbFnGJ4vZ2vCSUn4m0X1yMDzIzKdb/bOuAc4BemdM0NnaN8PrBSP1LZpp
	 q6Kz3ikx8T6953wCUG/S7HKiVL9R1mk87ZfE1MU0R+RQHHIYgp4OXhIjSFio9yKhbN
	 MA/ccfQtI8HsmS5xBsIxtQ22DH6gkPdWYKhL+tXU/9cGmRAzsH9dmPqIwzWcxlqQn6
	 wQ5Uz8WpWl3EQeVdwjs9rSyIg2yFXJfh87CrW374TtX96gS4wRWZKB9YR8VhUsla2r
	 xbj0S4w2UXYPqaS9a5eiBk/uGegJgJ3zoOD6anzlI19S8ZvSNDbkzyBGFPwBsCoPoY
	 O9et9Z1d+V65g==
Date: Thu, 31 Jul 2025 08:52:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Le Goffic <legoffic.clement@gmail.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>,
	Julius Werner <jwerner@chromium.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Conor Dooley <conor+dt@kernel.org>,
	linux-perf-users@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 08/20] dt-binding: memory: add DDR4 channel compatible
Message-ID: <175396996558.2138050.15303219446364860423.robh@kernel.org>
References: <20250728-ddrperfm-upstream-v5-0-03f1be8ad396@foss.st.com>
 <20250728-ddrperfm-upstream-v5-8-03f1be8ad396@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250728-ddrperfm-upstream-v5-8-03f1be8ad396@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_065248_403149_C441AB4B 
X-CRM114-Status: UNSURE (   9.24  )
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


On Mon, 28 Jul 2025 17:29:39 +0200, Clément Le Goffic wrote:
> Add in the memory channel binding the DDR4 compatible to support DDR4
> memory channel.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


