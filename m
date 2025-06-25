Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3824DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJhtaUGyscplD3YdgVLEORd5yL9VDpFqXTWoDBgg5v0=; b=sSxi4gFqVbfg029lwOCylpuzlE
	14H1WvKFmovN7Qd2BYsc1iVoP4hkzckOc68NohYpfh4I38Wf6hTOEfBkijtwpy1hx3R40rrp7gb9Y
	9TnEEl0H8J8phDzbKgUML3UQ65/xOQjARfeV6cfCU4P41EC/6LiKfEpkfiOQYfQu8pkw8g0L2xpBK
	XBHzEiXE2EVwZzbFwA4HrH1mWz0AI6mlJTun1bkoET9xxswY/OCtHuwJr/gfDZVQwxnzbYr37G8rO
	JPxYmpMzcn0au05PGizoTTJA3yM+YFUstWRk7j0PhDwjy5LTj2AiP9vvikKn0E1wC0NYTZkmjzwLC
	Klqif7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXPt-00000009wfP-1JGe;
	Wed, 25 Jun 2025 21:12:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUV2E-00000009dEx-2BKg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 18:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 943A3A52B38;
	Wed, 25 Jun 2025 18:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D290C4CEEA;
	Wed, 25 Jun 2025 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876789;
	bh=Ne3gQDGNR+fc9eT5DJJdL5V8H/ySv24dUclSgAsgI3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8RXNkr5OwQEpMXK4RtS9V68i1Qvq4HEAJav6fuIAKALQUxJMU6tKWh8NO6ushrn5
	 zCRTdqWH7DdODZySzkau7PCNaDBXcOw9jmstHn4bOYi5csSpCSFM4zvV+iOBhFjTI7
	 iMocPlkq/T3MltzRWEZw4xMK9+ux8p79GjOx0pjCXPFruteFC7LB3WkubdO19Wvcy7
	 deizZzbng8niI2ibvLX4zNp4sY3BOftfvri48XQNigiT5B5Q6xmer8ILjjschjt08f
	 hxvb5jJlH6iJGfUuCIqFXOG8f1LMqC/ntianHDZzsH+pIK3Ea7XfCx/NA7a5G4oyRL
	 /P0ol9R0EwZJw==
Date: Wed, 25 Jun 2025 13:39:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Pascal Paillet <p.paillet@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: regulator: Add STM32MP15 SCMI
 regulator identifiers
Message-ID: <175087678758.1997493.17415728035364820579.robh@kernel.org>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
 <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113950_635884_901856C5 
X-CRM114-Status: GOOD (  11.27  )
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


On Tue, 03 Jun 2025 11:02:09 +0200, Amelie Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@foss.st.com>
> 
> These bindings will be used for the SCMI voltage domain.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> ---
> Changes in v2:
> - Add external regulators and Pascal's SoB
> ---
>  .../dt-bindings/regulator/st,stm32mp15-regulator.h | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


