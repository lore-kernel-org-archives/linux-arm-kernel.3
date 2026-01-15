Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B573D46613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 19:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+07H+7XNbP1jD4SRzSXdkEkFi8Ke2qGjcFOVQR+4tQ=; b=iAnK9jSXGY0VSZEReafZOkNqrg
	UGI1Y0CiPPn+bU6ZdvcfOIZUlLDBWS1nBA4BZrBbrvEKqYYKrT/AuLzKZ0vxwU2P0qVHIs3AM521O
	IG4PYBN8WRzNolZthjf9S+HimSqw9neftEECe+kzqdOIPYv6Ft/k8LbE2ArKvSRIRF/8Q+PS1sNpi
	ccxehSifPU5gHkeKtTyEBMXwAVmWMc8rtbLcrFrVd1VCRL3NCtQ6qCZaL3/wfbo8Phv1kizhOEX49
	z4SnYvmLHcvwwKGMboA7lr5fLgYYtBbvr1GABbzuaTeHyuXZObG+5ytXJFSyWPyiogSckVLzJb2Su
	Pf4BYlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSef-0000000D1CA-0uAh;
	Thu, 15 Jan 2026 19:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSeb-0000000D1B1-3yvg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 19:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92CBF41969;
	Thu, 15 Jan 2026 19:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B515C116D0;
	Thu, 15 Jan 2026 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503909;
	bh=XGxk5XqmTMXOuSSsKOdhgAHvgmaYT8PkS0TUquQx3Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwln90jqVWwSRdAOYxtgSZO0omEPgP8ktrPfGmotvNNPVIcYxhHjdgRRMcFkpwUSB
	 ZqGC6WhFUPSdqaGrsjTlxfrX1oY52fUkiw3Kyk9YEpJub9jtJW8y9kMDGgkYb6OyNl
	 ZbOivC8lgXJpP1M0wjVOku/8Uv2pJrbmjmPq1b7XEikmHJAynvnxRyOSWdm7nJ2kB9
	 QZqGPu9q3XGBQq/OEMzFJyJK0nZ5EQiE+HXAoYaUKsdlAboi42SfEKoEHxvwxn3z9D
	 BvLiPI17UUsNxB7VP1SV6l+N64QQwB4JKHer229ntugF0sE2ezFuglptl1PmrvT30a
	 1mY8YCTVMND1Q==
Date: Thu, 15 Jan 2026 13:04:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-gpio@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@linux.dev>,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	jens.wiklander@linaro.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: document access-controllers
 property for coresight peripherals
Message-ID: <176850387192.1025633.5139708031708243841.robh@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_110510_008629_D427BDD2 
X-CRM114-Status: UNSURE (   9.79  )
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


On Wed, 14 Jan 2026 11:29:15 +0100, Gatien Chevallier wrote:
> Document the access-controllers for coresight peripherals in case some
> access checks need to be performed to use them.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
>  .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
>  6 files changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


