Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3831CD637DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 22:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9oy1mVBHtCuqnsn3+BU8JFCo5GJkRzJZT8ov4L0WnE=; b=bMAGzsscGmGZX6yc+Jnwq5lP9K
	U4QhtsEvd6EaaN6j6WB7mA2tvZTnW1OkyiNxUhbmuOwEyjGcDXWpNrBaa4MLMnf+oQcpQbNkB8XYu
	z0bGWH3x3ZOB0AXxTcikJRzqQEE184E4/ecPITZRppHGe+hLAnYw59lYAu3afQYBs33275OpUqMDW
	hmUtHj31MomApjXGjqoagoTriizirno+iNtovL1Xn3I77d/vDAF20ENUdMiKJEIhLcCMRaC6q6WZU
	6UPpY4KfC28QgLQ1LSAO3ZWZPCkuqQMa5CqIMiYjdW800nTSSZ4edVaFIu8Z9irn0DORkQOxfomL7
	jApQNQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVddL-00000005tzY-1Sp7;
	Tue, 16 Dec 2025 22:35:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVddJ-00000005tzD-07PI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 22:35:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 247D34005B;
	Tue, 16 Dec 2025 22:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4495C4CEF1;
	Tue, 16 Dec 2025 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765924504;
	bh=Bn9sSdytmqzw2IsPFuvFcTMtuAc3guBz6pZ8asbkXrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHyYRmgfN/vXayDad54aIDHHAohwGtgtbiScN3oRVaBkYCy+8eGkqyJ/i8lgFkzUZ
	 chXu7EkDOCCemRDdu6VsUMi9Znd3g0tragVQP+nOtlVxD8qEITHkIiACT0zxZXcxjM
	 7OSbJAfBk9M13Q1GdHsn+3e558ibo67tO1v2hk0ak2VtoqEDn41J12DSxB1og7oOVA
	 zyQK7NPU5t4cujbzZyE+v5s1BoGVS0yjuYwdMPGfQIPqmx80JZ4mBOIJXeQoqe/WT7
	 sgssLM0VoM3Y6EZlLDxdqnTXWcIg9AAYggeEFmAzd8TISnRJGSoiA+t0r0Oo+RWuRw
	 6usyPV5C5ycFA==
Date: Tue, 16 Dec 2025 16:35:01 -0600
From: Rob Herring <robh@kernel.org>
To: Ronak Jain <ronak.jain@amd.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	nava.kishore.manne@amd.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: firmware: xilinx: Add conditional
 pinctrl schema
Message-ID: <20251216223501.GB3151380-robh@kernel.org>
References: <20251212100542.2756757-1-ronak.jain@amd.com>
 <20251212100542.2756757-3-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212100542.2756757-3-ronak.jain@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_143505_111762_0D1A6D78 
X-CRM114-Status: GOOD (  18.47  )
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

On Fri, Dec 12, 2025 at 02:05:42AM -0800, Ronak Jain wrote:
> Updates the Device Tree bindings for Xilinx firmware by introducing
> conditional schema references for the pinctrl node.
> 
> Previously, the pinctrl node directly referenced
> xlnx,zynqmp-pinctrl.yaml. However, this patch modifies the schema to
> conditionally apply the correct pinctrl schema based on the compatible
> property. Specifically:
> - If compatible contains "xlnx,zynqmp-pinctrl", reference
>   xlnx,zynqmp-pinctrl.yaml.
> - If compatible contains "xlnx,versal-pinctrl", reference
>   xlnx,versal-pinctrl.yaml.
> 
> Additionally, an example entry for "xlnx,versal-pinctrl" has been
> added under the examples section.
> 
> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> ---
> Suggestion from Rob:
> 
> The somewhat preferred way to do this would be to do this in the top
> level:
> 
> pinctrl:
>   type: object
>   additionalProperties: true
>   properties:
>     compatible:
>       contains:
>         enum:
>           - xlnx,zynqmp-pinctrl
>           - xlnx,versal-pinctrl
>   required:
>     - compatible
> 
> Otherwise, the pinctrl schema ends up being applied twice.
> 
> 
> My response:
> 
> In your suggested code, the schema allows either xlnx,zynqmp-pinctrl
> or xlnx,versal-pinctrl on any platform, which is incorrect. This
> means that if a user mistakenly assigns xlnx,versal-pinctrl to a
> ZynqMP platform or xlnx,zynqmp-pinctrl to a Versal platform, the
> wrong reference will be used, but no error is reported. The
> dt-binding check still passes instead of flagging this as an issue.

True, but you can create a whole DT that's just random bindings from all 
sorts of different SoCs and the schema validation would be perfectly 
happy. We can't really ever check everything.

> By using a conditional schema, we can enforce platform-specific
> compatibility, ensuring that the correct compatible string is used
> for the corresponding platform. This would also generate an error if
> an incorrect compatible string is provided, preventing
> misconfigurations.

But what you have is fine too. It will validate the node twice as I 
pointed out and that slows things down some, but it's already slow...

Rob

