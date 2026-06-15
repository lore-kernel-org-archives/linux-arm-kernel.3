Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11A0CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoY62TWG3USyfrv4K40Mof0mBqYsQixr2LFxTUwTjFg=; b=YIo4GpmXBvi3ldn1707wkmvEaI
	bP1loWdaXHxVYfNQmbQLpOLX8vFm/YvD7ZCO/qM9+FzmhAMpycKW/9UV75eTd9fMOOV2IzC5+6EU4
	A7Vr5uZiWBTZBh9eFFLJCRk2b+cIKK/a99C7MY5X5jcJq7mLlTiiKz6hGtztDu503Vaaf2tFmqVPp
	ysnjmUEjpES0kHqpI088XyEFplW8qHMYlyJoh2nCyi3inxmn1pDjAyqOhZrc0Fo1ZE4SOu+wqG5NA
	z3QjWLAfemYWPjskr8bb+ChHhZWqasHteSTUIjD8qs0WWf6rHLlZVZmanbGP38egIr10INyI+UqmE
	LVo/PAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFZO-0000000EtBh-05em;
	Mon, 15 Jun 2026 22:14:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZFZM-0000000EtBZ-42Jn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 22:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 101EB406EA;
	Mon, 15 Jun 2026 22:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63431F000E9;
	Mon, 15 Jun 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781561651;
	bh=HoY62TWG3USyfrv4K40Mof0mBqYsQixr2LFxTUwTjFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UiPAPa9zcJMm0tSx74C2rr5+OJCf4YeK4rcnIyhCzGd+2FeXf7/TGpxxNpVhERTsD
	 fvnCZxh0wV0adIZGVZ8uXXC3fhp4xq0Ilhn6F06MY+NqcBQT9/Ufg5wzm/wK2YnaHS
	 azN34FXtsdcFP6WBL5LMGVCUqeHeSZdNm4VK8c77Ypwsx93bDZRTfcaNEk35yr3Rma
	 OLCy3XFAIZ9PT3nRyrBtkSn3q/9SxeeG7yZpobLMRG8mhQ13VWBFxBG2hXlN4o+z4U
	 eXqABT9u1Rjy1UcCFb56N1UOs25PaqcYhJ1Iou76VTWPEGJlEtvcByFOL0DjJsOjuj
	 RjcT8hADPwoxQ==
Date: Mon, 15 Jun 2026 17:14:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-doc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	puranjay@kernel.org, usama.arif@linux.dev, philip.radford@arm.com,
	devicetree@vger.kernel.org, souvik.chakravarty@arm.com,
	linux-kernel@vger.kernel.org, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, sudeep.holla@kernel.org, leitao@kernel.org,
	vincent.guittot@linaro.org, james.quinlan@broadcom.com,
	kernel-team@meta.com, linux-arm-kernel@lists.infradead.org,
	kas@kernel.org, arm-scmi@vger.kernel.org, peng.fan@oss.nxp.com,
	linux-fsdevel@vger.kernel.org, michal.simek@amd.com,
	brauner@kernel.org, etienne.carriere@st.com, d-gole@ti.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, f.fainelli@gmail.com
Subject: Re: [PATCH v4 06/31] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <178156164845.1820518.478350687908291764.robh@kernel.org>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
 <20260612223802.1337232-7-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612223802.1337232-7-cristian.marussi@arm.com>
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


On Fri, 12 Jun 2026 23:37:36 +0100, Cristian Marussi wrote:
> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v3 --> v4
>  - changed protocol number to lowercase 1b
>  - fixed misplaced block for protocol 0x1b
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


