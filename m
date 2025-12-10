Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C396D3E77D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmKUDGSIoenOR5jY/OguQ9WDrsXzJON++/3Nn7YURL0=; b=2FTUbIjYQ/VP/WHjEVgAPKXfl3
	hCirAcYvVYX2oUiW8WCNKuKxvdzEVIjotLzBslAz+CB0ouHkSNE7noRwA8MvGz9/cLerzWvWrLuBQ
	Fl57PUroXbU97z3W6JIHf9tEaub3O0M31xpXTRsEFIH19Uo6/qppwd9ABp4BTz25aopfE6YjTFOm2
	msd4a6N02A+IpGQJM25yE11+/O3Ff0ZCAO0XeVkITT/igrO+CETgCQpgjcSkzCxbECxSw4LWDCd6N
	qDEAVulzk6EZOWx0SlghDJpI7D4mXQo7r0BhHCnXLgtkqZJy24vH12ORsj/CSqiXqSCG2ToGVRN/v
	Ts5XePiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRDH-0000000FsIb-22En;
	Wed, 10 Dec 2025 20:55:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRDG-0000000FsIP-0DV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 20:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B05D36011E;
	Wed, 10 Dec 2025 20:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C2EC4CEF1;
	Wed, 10 Dec 2025 20:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765400103;
	bh=J0WqnwnE4efMoOX19CT1EwVxRbH+WTqgRyVB3omnD2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjrsgxwjjpSfLHYOY5btt9lFsCSon0poUS7SRHTLxh8KEiHzbhUgvuyfN9OHcwzic
	 Nc8iNNmivG6d94T1dm2BCjedWr4PZFTsJHY9ko27xYp54wS9owE7ZIpnRgpcPBgbfJ
	 Ypw136ETA8WRpI+Q8gFNqM59tUc6hjt/ZL5CC5fz0XuJjfxM8qjATYmVdMtK9yKkKO
	 OQ7+4yY3L/xkn6QVwfervt9Nj/kweRRBIV6AWNU+lLFPThNK60F8xj6WMsrPY/gvPk
	 InSsbGbW08Sl0kfuDoZMHkM8cmW6EYRHRxOLRwMqNE3ZQwlPWZrNtWLndH+SyBsVF5
	 DRmjXPS5cimXg==
Date: Wed, 10 Dec 2025 14:55:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Songwei Chai <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, james.clark@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	kernel@oss.qualcomm.com, alexander.shishkin@linux.intel.com,
	krzk+dt@kernel.org, coresight@lists.linaro.org,
	andersson@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v8 1/7] dt-bindings: arm: Add support for Qualcomm TGU
 trace
Message-ID: <176540010050.3328122.16194666326592248573.robh@kernel.org>
References: <20251203090055.2432719-1-songwei.chai@oss.qualcomm.com>
 <20251203090055.2432719-2-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203090055.2432719-2-songwei.chai@oss.qualcomm.com>
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


On Wed, 03 Dec 2025 01:00:49 -0800, Songwei Chai wrote:
> The Trigger Generation Unit (TGU) is designed to detect patterns or
> sequences within a specific region of the System on Chip (SoC). Once
> configured and activated, it monitors sense inputs and can detect a
> pre-programmed state or sequence across clock cycles, subsequently
> producing a trigger.
> 
>    TGU configuration space
>         offset table
>  x-------------------------x
>  |                         |
>  |                         |
>  |                         |                           Step configuration
>  |                         |                             space layout
>  |   coresight management  |                           x-------------x
>  |        registers        |                     |---> |             |
>  |                         |                     |     |  reserve    |
>  |                         |                     |     |             |
>  |-------------------------|                     |     |-------------|
>  |                         |                     |     | priority[3] |
>  |         step[7]         |<--                  |     |-------------|
>  |-------------------------|   |                 |     | priority[2] |
>  |                         |   |                 |     |-------------|
>  |           ...           |   |Steps region     |     | priority[1] |
>  |                         |   |                 |     |-------------|
>  |-------------------------|   |                 |     | priority[0] |
>  |                         |<--                  |     |-------------|
>  |         step[0]         |-------------------->      |             |
>  |-------------------------|                           |  condition  |
>  |                         |                           |             |
>  |     control and status  |                           x-------------x
>  |           space         |                           |             |
>  x-------------------------x                           |Timer/Counter|
>                                                        |             |
> 						       x-------------x
> TGU Configuration in Hardware
> 
> The TGU provides a step region for user configuration, similar
> to a flow chart. Each step region consists of three register clusters:
> 
> 1.Priority Region: Sets the required signals with priority.
> 2.Condition Region: Defines specific requirements (e.g., signal A
> reaches three times) and the subsequent action once the requirement is
> met.
> 3.Timer/Counter (Optional): Provides timing or counting functionality.
> 
> Add a new tgu.yaml file to describe the bindings required to
> define the TGU in the device trees.
> 
> Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,tgu.yaml     | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


