Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FCAF3D61D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Njz7AHRDbaSqIUIxMUDLk2rTZS4/tpP/qxaKpZyrLqM=; b=z01Qwa4La+OT8Fws5NscWAUPLu
	LQi9KdAqtqPR2Xju6TAalYvpiBf3l+/Gbxxg05LRnzCB5Qj7j0lp2n38yT42ba/+5Z0M/HDLhVvSi
	tWVASmtqBFoLrcwENW/rqJaF/LS7IRdWg3D2zrvmeWthyGXwTfHNpquSMcIik6EWjF/RkAvxV7Tz2
	sf5mpw0hb7Ld/d1eeyauiqhhMQrwGn9v0ASHmHJ9qYbiIWNCqF61PIwQE9buxqacl53aaXdHVxVy1
	bS8xJWyBv3hx0R/tHKswXjUoE6LV7yfi9Lqe5uu9jwZr5pTRH/mNe2nQGuXULpu1tr9MSfTx7eFWY
	uagxT+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6uRi-0000000ADd2-1D1D;
	Sun, 29 Mar 2026 18:01:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6uRe-0000000ADcd-3WsZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 18:01:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1379A1595;
	Sun, 29 Mar 2026 11:00:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8BA3F7D8;
	Sun, 29 Mar 2026 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774807264; bh=HKatBNWBO7yrOGYf1pOvBsP48x6K9AIg6H3XVc/TJbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YCwOPgcZIVYs3aDQ0ppSMQfkYBYlGucjp7xkJ5OFSjnc9K/ooxAme9pTzGioZXxsv
	 4y2ctyjetjwvKVc+2YlDF1AEb+p7VdsB7ICiSxpHIZiADz1MhL8stn2jTBscXBKW9i
	 v84HJwGTet3zeESOelw+I13CF6GhWbUH8++3TEB4=
Date: Sun, 29 Mar 2026 19:00:54 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, etienne.carriere@st.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, d-gole@ti.com,
	linux-fsdevel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-doc@vger.kernel.org, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, philip.radford@arm.com,
	souvik.chakravarty@arm.com, peng.fan@oss.nxp.com,
	dan.carpenter@linaro.org, lukasz.luba@arm.com,
	arm-scmi@vger.kernel.org, sudeep.holla@kernel.org,
	michal.simek@amd.com, linux-kernel@vger.kernel.org,
	jonathan.cameron@huawei.com, elif.topuz@arm.com,
	linux-arm-kernel@lists.infradead.org, james.quinlan@broadcom.com,
	devicetree@vger.kernel.org, brauner@kernel.org
Subject: Re: [PATCH v3 06/24] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <aclo1laTrsQFSan6@pluto>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
 <20260329163337.637393-7-cristian.marussi@arm.com>
 <177480549380.3925363.5137815678176793743.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177480549380.3925363.5137815678176793743.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_110106_948220_DE57CB65 
X-CRM114-Status: GOOD (  13.84  )
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

On Sun, Mar 29, 2026 at 12:31:33PM -0500, Rob Herring (Arm) wrote:
> 
> On Sun, 29 Mar 2026 17:33:17 +0100, Cristian Marussi wrote:
> > Add new SCMI v4.0 Telemetry protocol bindings definitions.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/firmware/arm,scmi.example.dtb: scmi (arm,scmi): protocol@19: Unevaluated properties are not allowed ('i2c2-pins', 'keys-pins', 'mdio-pins' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260329163337.637393-7-cristian.marussi@arm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 

Yes...the new protocol block definition ended up intermixed with the
previous protocol block...totally wrong.

My bad.

I will fix in V4.

Thanks,
Cristian

