Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5BFC36007
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 21:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exPX9nLYJApSHjK3I1wo8x7e7OWj82voDG7MKeN/asQ=; b=me4zUT1emxdXc4BlTSWwyb3upw
	iIFYgREsVcNC8MA08vz8DD3VWfrElktrQxywkHhqFg2Rb93nGzobXmhYnKubmG2TcWteyROJKUKyu
	UQCSLQ7RygIkQnnDGohkT/MFsD9/dukZnZ5B2eL4uZkPRI9/VhDvbqQSYJ7H+/rfsA1FdS1CYY/LC
	8z5Xdl0O5KGhK6JGmMp08tiZEA3w8R5URBBOC1QCSZ/Oc1L3ax3DRkYyXwwXnS69CMVHAVMFHJnGg
	g0jbXoEHHRyYQiIHbd4MSZELR2558v7pxKzVWhab+gVPj7cKzITIDjKAtDBNzla3P4YrSIiocyI6k
	RnKRYYUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjz9-0000000GN9N-1OGV;
	Fri, 21 Mar 2025 21:32:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjxS-0000000GMtX-0y2E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 21:31:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8603E5C3A57;
	Fri, 21 Mar 2025 21:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B5BC4CEE3;
	Fri, 21 Mar 2025 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742592673;
	bh=+f32SRn/DhI5x9BgYlZ2PYxvre6UQhJsBBuq0rXKjAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syEkVpux+zdu6y0+JrMVHXsj0id+RPBgMSJRyjmL+naIk5mt42IQWs6Dd3nAj+928
	 KBLOzfA12Nwm5/7lbqEvDsuKjgqQnN7A49uAgr+JDdLUoPjEfvv6CJxQbq6StoUHVW
	 K/2wSMPZhEffNaZV1hEZAcAXlF4NU8TyD5pMDqJv8qPo+n9UfaFvx5VWijvmQw5+1c
	 Z4pfn3XllVxigqeLX3+gX1KhKAGLUgWf6cPdH6KKopA+lEiFIZDftk7nizKc1yz3S0
	 iwcyhZ6RgELBGZw2Oni5ZMUbxyuGNgCtIY+Z4Bqd2e3LJCusxE3U1urKBu+q0DU5nQ
	 86W4XQIgRjVEA==
Date: Fri, 21 Mar 2025 16:31:12 -0500
From: Rob Herring <robh@kernel.org>
To: Jason Hsu <jasonhell19@gmail.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, patrick@stwcx.xyz,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	yang.chen@quantatw.com, jerry.lin@quantatw.com,
	Jason Hsu <jason-hsu@quantatw.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Message-ID: <20250321213112.GA4137938-robh@kernel.org>
References: <20250321123731.1373596-1-jason-hsu@quantatw.com>
 <20250321123731.1373596-2-jason-hsu@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321123731.1373596-2-jason-hsu@quantatw.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_143114_323525_BD9CA61C 
X-CRM114-Status: GOOD (  13.65  )
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

On Fri, Mar 21, 2025 at 08:37:30PM +0800, Jason Hsu wrote:
> Document the new compatibles used on Meta Ventura.
> Add subject prefix for the patch.
> 
> Signed-off-by: Jason Hsu <jason-hsu@quantatw.com>

The author and Sob don't match. You need to fix your git author to your 
quantatw.com address.

> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 01333ac111fb..a86b411df9a5 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -87,6 +87,7 @@ properties:
>                - facebook,greatlakes-bmc
>                - facebook,harma-bmc
>                - facebook,minerva-cmc
> +              - facebook,ventura-rmc
>                - facebook,yosemite4-bmc
>                - ibm,blueridge-bmc
>                - ibm,everest-bmc
> --
> 2.34.1
> 

