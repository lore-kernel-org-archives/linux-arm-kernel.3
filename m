Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07668C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ6o2/t46NvAhu0W2EzFKFxW2V+afeej06DYysO/8e0=; b=vHjKIb5CFNLvolMtModHeqWmbu
	8sMR38ixrxYtOQpZrL9ftUxYwisQLjqNuXXreO0RaQKXAVFANkqviTvNhnnaIIrcvP34X3yDAiLI6
	P6naSgOM5QsyS+UgR55y7BSLUgmT9omJ8YZLOfVm/VuXOZp3ADGJJ+iTH8dJB+Q0NDF1NRDw2VkQk
	j5l5GCMfc2IOBYuKKIqxZcDeMcYaXooHw9x+2HhFQd7SZdUMdwC59SCnYVqM58tcM2hVsanfHdyPV
	jkvyr52xUe8Hw8bvASVlnfWwlspedKO1SmLU78DMp+MKJinPWIyMTkpOhyYift60HooAl40o72FiE
	Z60H5bFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgOG-00000002i2z-1N7X;
	Mon, 23 Jun 2025 12:35:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeTS-00000002MaO-0Hdp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 10:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7474360EDF;
	Mon, 23 Jun 2025 10:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07916C4CEEA;
	Mon, 23 Jun 2025 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750674745;
	bh=EGeyXFdsfxr7KZpT6G79mftHlRMgrE71/+ChmGLxj2A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b/otWl7mH6gUD6120u91A4shQyhwDjQK/XF57IoyHx/pvO+4w3pCfYB8NNfroQzxv
	 dgcukgYvgsY1ds1YaeKUOrC6Zs3ly4TcxwiX8n9eQkHBm5V+FgnS4ZuiznXEj7nI84
	 xrnua+iSQPdPAXWvw1ZS0nftkw+8zQAPS99gLXvovcJbHkNCwTEVEJxVPO9dMb8x88
	 iJJDxLAKEeyTncO6PqV7f/0L6y8VJUOE5+QpnSW9piE/HSs6r3fu1GI+3SQGwRJjfW
	 TjvlC21dh2u1zGaPPj8habmBy8SXpKSa703cbJQ2FmClzEXYaTtY0TcyfSVo5Zahqv
	 Bp6w9Auijcd2g==
Date: Mon, 23 Jun 2025 05:32:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-doc@vger.kernel.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Will Deacon <will@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com>
Message-Id: <175067474413.2253758.6430293849129423927.robh@kernel.org>
Subject: Re: [PATCH 02/13] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
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


On Mon, 23 Jun 2025 11:27:07 +0200, Clément Le Goffic wrote:
> RCC is able to check the availability of a clock.
> Allow to query the RCC with a firewall ID.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.example.dtb: clock-controller@44200000 (st,stm32mp25-rcc): '#access-controller-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/st,stm32mp25-rcc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250623-ddrperfm-upstream-v1-2-7dffff168090@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


