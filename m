Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BE6C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd4CLhxtm6Nku5TYccn9s1xeuinOAeEKoW6YDsJFSTw=; b=AlNPMLppF4hZcgEPAvxSK+NOJ0
	4xxVb79V3oR9Z4z89g5GMSjAXfcFF6PPMh/KyCK0050BfocOwOdzn22oeFNqfAvmWAOBTkPnIH9VO
	SKfPvW5oSZcbq2kWt1qCsnC4l0tmaT8YzA1YQpOHF8ybT5+fSEpMhVkNdxJdLirDZvBmLGA2uGGj4
	m5mLvCP/SXPSvwNwMn5iNdUy8SOTtysW/3j8fh1Im/T0Nl/Ij26rwEg7XLXAydq0VHYaUAOnnD89m
	3cY7RKdKMZK/vUaXx0ARBSbFnG+pZRwOlmI8AQEE8pmKGRm4aK0qycvj5T4NMf05RXqjgwVswXT+v
	CfFWpBWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdTh-00000005ld7-2ao1;
	Sun, 04 May 2025 17:50:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdRn-00000005lN5-1QbF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:48:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BFFC5C537B;
	Sun,  4 May 2025 17:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC989C4CEE7;
	Sun,  4 May 2025 17:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746380894;
	bh=u7zg4TKgR84wCCaIild5C6PeqFwsEVoPz8+I0+3drZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7a6YV4o/RqJesWo4nxNV+s51I3AilTGtz+ZiubAwVysOuEGD5kPqC3hNlpKYiodf
	 hT42En9eCV5qEH7k8/dQhxbwJyQScNppULB9LkY4aTerP1O7WXMOFecerZibwCnL99
	 Dm2u6v+NRlzqAIK9OqZIJ+flyC2Q4gT+axSQQ2g8Ls5f///caO9Trmh50RUTnTsVsu
	 O0TPtf+yQtlEuU7qeB+lWfph2Q30Ug9PFkcRVSphTq8dkP7n9Gu42L+lStRVCgLKot
	 1X16dq+bptZ9wdNsboGNXJhoJd/pxdmeaL4R1UhX34kV5ybbn0ZDocbZyqQtKRW5yt
	 qAeccxRfuGqyA==
Date: Sun, 4 May 2025 19:48:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, 
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com, mark.rutland@arm.com, 
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 1/6] of: add infra for finding CPU id from phandle
Message-ID: <20250504-eminent-sepia-cuscus-fc7f7e@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
 <20250502161300.1411-2-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502161300.1411-2-alireza.sanaee@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_104815_424615_718B0F96 
X-CRM114-Status: GOOD (  23.00  )
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

On Fri, May 02, 2025 at 05:12:55PM GMT, Alireza Sanaee wrote:
> Get CPU id from phandle. Many drivers get do this by getting hold of CPU
> node first through a phandle and then find the CPU ID using the relevant
> function. This commit encapsulates cpu node finding and improves
> readability.
> 
> The API interface requires two parameters, 1) node, 2) pointer to CPU
> node. API sets the pointer to the CPU node and allows the driver to play
> with the CPU itself, for logging purposes for instance.

Run checkpatch - missing SoB.

> ---
>  drivers/of/cpu.c   | 24 ++++++++++++++++++++++++
>  include/linux/of.h |  8 ++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
> index 5214dc3d05ae..1e8d1fa04d3c 100644
> --- a/drivers/of/cpu.c
> +++ b/drivers/of/cpu.c
> @@ -173,6 +173,30 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
>  }
>  EXPORT_SYMBOL(of_cpu_node_to_id);
>  
> +/**
> + * of_cpu_phandle_to_id: Get the logical CPU number for a given device_node
> + *
> + * @node: Pointer to the device_node containing CPU phandle.
> + * @cpu_np: Pointer to the device_node for CPU.
> + *
> + * Return: The logical CPU number of the given CPU device_node or -ENODEV if
> + * the CPU is not found. If the property is not found, it returns -1. On
> + * success, cpu_np will always point to the retrieved CPU device_node.
> + */
> +int of_cpu_phandle_to_id(const struct device_node *node,
> +			 struct device_node **cpu_np)
> +{
> +	if (!node)
> +		return -1;
> +
> +	*cpu_np = of_parse_phandle(node, "cpu", 0);
> +	if (!cpu_np)
> +		return -ENODEV;
> +
> +	return of_cpu_node_to_id(*cpu_np);

You leak the node... or intention was to return it to the caller, but
then you need to document that caller must drop the ref.

Best regards,
Krzysztof


