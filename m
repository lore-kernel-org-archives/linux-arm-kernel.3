Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87002C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on+FJ6X1xNkCIQ65nwcMAX9/5kAcHphhw8ux+eFi7aU=; b=FmEXBQG1d/f8YfkE1ujLnS9Eko
	mZHypbq+dvscEBvpOJ5/K3g5odou1WCh3t2Mkp1qcYHOEVUHDPU2b+WJQa74kKx9Qz7Jxp+Kw8nzA
	/I2gNkHnCH7z7DgDtjMeVwyUtplLO5qcnoLqMSF3MEX08xT1l3OpEeoXj2py4T1wctxgN9bbyIMaX
	DQEwpU3obPjSHBv0DbfXScFsqy224EVfYsuve4TZEVn296DHWSScaW23o5uP3mgAtyY0XN/tmHh2Q
	py2+VHYLCVczc33O/PX4AveeC9YVHy3ol1pgsAACV5Qg/50Xo2Hu2lXhEwmJmVZtJEaZbg9tyo/7n
	VjCJ7IOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqImX-0000000FC33-3dej;
	Sat, 01 Aug 2026 23:06:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqImQ-0000000FC2R-2RJj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 23:06:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7BE414BF;
	Sat,  1 Aug 2026 16:06:02 -0700 (PDT)
Received: from [10.57.44.153] (unknown [10.57.44.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6AE63F86F;
	Sat,  1 Aug 2026 16:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785625566; bh=VCsMPvENB/EG0ir/PH84HdgJjSI3j72YuLIrMhnfdkA=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=Yp/uRh90VqPz42sF9aRie/eqh6p9OoYcgrGqrqgn64ZWpljGswNWAOki31o5x/PIt
	 ChYrKh+pF8eZB7HAWA8klSCQ8WjRXOZkFZwsxwCAKzPaSdoTInlaNhzq5cP9suPX2G
	 IdtzvzRUI4W24ddET3VprlsptbQv7U7hk2o0nxKY=
Message-ID: <eeacefd9-e8da-41e4-858e-5b28ab0c3571@arm.com>
Date: Sun, 2 Aug 2026 00:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>
References: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-GB
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260801195613.235430-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_160610_751283_E27D053C 
X-CRM114-Status: UNSURE (   6.20  )
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

On 01/08/2026 20:56, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Patch applies on Rob's for-next branch.
> ---

For:

>   .../bindings/arm/qcom,coresight-tnoc.yaml     |  2 +-

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki

