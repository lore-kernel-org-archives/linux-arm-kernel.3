Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03F6D6ED28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLajkVQy/Y2aYjAZBGr2E6XZOyGH8+TkY4budniKf3M=; b=xu6HETMA5ekG24
	tBWpMB1lp3/vWVOCyEZA7AQdESQ961TpkQPWGqb41Q2ZSPzMAGW+BaBhlUQTBhae99/5TAddD637+
	mNpLd4iwLo0q2T2zF422j3fLZ7j9hDQLktzjObMkUwok+RolZgGkUIYFlCjTyhtQ8HCI18UKoAKFM
	edphRYPLuPD/1ku3xBlI9MRCpk7uTFulHGMlzouuNOiHBRNKc6eZOjbhXYVZSC1+P8lqI45z1wkEO
	5WiHxTmmtvwOVsI80ryzGEoWFhXjQHgJ7EB8+H2EYkaj975hU9xu0eERLnnuPnooxAj5MFNy3Ijs4
	0sqZ61V9bXp2iT2K8Uhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE70p-000000005LW-2AZf;
	Thu, 21 Nov 2024 13:14:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE6zt-000000005EX-2Try
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 13:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72990A403F5;
	Thu, 21 Nov 2024 13:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89504C4CECC;
	Thu, 21 Nov 2024 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732194804;
	bh=T56RJic84mjGseWEFMdODkz00/doKV0DVthpc7FjRn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jJXK6kXNcg159HH1WH4Z/Rg49Y2MZqn8Nx4Mg2sV5thGdG9p/CwU8w0/2Ae8JyXOK
	 xniA215zDKMjjOUg608GCGxCc7C1sYRIoefHh9bxw+azkQgnNy9+rUWRTZzMsyosIe
	 4ElAcq/W+aYdJZUuRq2nwlWKMn+fAk/nD5thp44MmdrB85BVMKP41PsJ3etpBTbJiv
	 XINFkfblHwx+akqNRduAN+S7PODfE72wlzZkOC8gdKschzKMNimICR5xXe212hcdPj
	 UhyuWqBmMSS1kR9DsiXsvVQouv/Vy2ZW9O0uA47rr5pdi+22Y8cbgofmfqC5gxs7S7
	 YyXrNN4iT1Syw==
Message-ID: <97fbcaf0-ccd5-44d8-8600-f0e0c5c36d41@kernel.org>
Date: Thu, 21 Nov 2024 15:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: ti: k3-am64-main: Switch ICSSG clock
 to core clock
To: MD Danish Anwar <danishanwar@ti.com>, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, ssantosh@kernel.org, nm@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
 <20241113110955.3876045-3-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241113110955.3876045-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_051325_701288_198B0A37 
X-CRM114-Status: GOOD (  11.09  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 13/11/2024 13:09, MD Danish Anwar wrote:
> ICSSG has 7 available clocks per instance. Add all the cloks to ICSSG
> nodes. ICSSG currently uses ICSSG_ICLK (clk id 20) which operates at
> 250MHz. Switch ICSSG clock to ICSSG_CORE clock (clk id 0) which operates at
> 333MHz.
> 
> ICSSG_CORE clock will help get the most out of ICSSG as more cycles are
> needed to fully support all ICSSG features.
> 
> This commit also changes assigned-clock-parents of coreclk-mux to
> ICSSG_CORE clock from ICSSG_ICLK.
> 
> Performance update in dual mac mode
>   With ICSSG_CORE Clk @ 333MHz
>     Tx throughput - 934 Mbps
>     Rx throughput - 914 Mbps,
> 
>   With ICSSG_ICLK clk @ 250MHz,
>     Tx throughput - 920 Mbps
>     Rx throughput - 706 Mbps
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

It would be nice if you could send patches to update
corresponding nodes in am65 and j721e platforms as well
else we will start getting dtbs_check errors.

Reviewed-by: Roger Quadros <rogerq@kernel.org>


