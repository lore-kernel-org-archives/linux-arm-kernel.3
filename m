Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B6FCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 23:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wCKYk9ipCH/BA7MdLEIq6BkUVsdEsoO78w2x/7sZ2o=; b=gvJbx/VV5qf+saVywlkhx6/s0v
	LS8W/nA2ufvktWoq144RqMHjhRv3c5EpUpJp+6PCfcm3JEacL/Y27aONiUJWQTbtJa8i/KSt59PXZ
	fACMkPzp6pIIbVXiWUIM6tgtFhyEV50qNfFMIbylINkO1jjW7cgazp0DR5VJUVMtLrNGQtEaNuHqX
	hmIgmfrp2HmDYTQROSePsm0ifxmQ82js0UuudZuOmsaDUHUMap7wE2dgmY4DtQE26r8OAqaWBQbPg
	MNwTNYHqj6jET6oDONEiL/5uHFFbYGigyfxOP06EzQ2pfqpHNMjqnpN6Gs+G5LK4Flu6AE279t+Gj
	FUFq/7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXSEb-00000008Se3-1aFa;
	Wed, 10 Jun 2026 23:21:21 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXSEX-00000008Sdk-3Vuf;
	Wed, 10 Jun 2026 23:21:17 +0000
Message-ID: <cf1a1f6d-df63-45cd-b73a-cd3e26f2ce4a@infradead.org>
Date: Wed, 10 Jun 2026 16:21:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] Documentation: PCI: Add documentation for DOE
 endpoint support
To: Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org,
 linux-doc@vger.kernel.org, mani@kernel.org, kwilczynski@kernel.org,
 bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org,
 skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org,
 alistair@alistair23.me
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 s-vadapalli@ti.com, danishanwar@ti.com, srk@ti.com
References: <20260610100256.1889111-1-a-garg7@ti.com>
 <20260610100256.1889111-5-a-garg7@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260610100256.1889111-5-a-garg7@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/10/26 3:02 AM, Aksh Garg wrote:
> Document the architecture and implementation details for the Data Object
> Exchange (DOE) framework for PCIe Endpoint devices.
> 
> Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Aksh Garg <a-garg7@ti.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> 
> Changes from v4 to v5:
> - Updated the DOE Abort handling setion.
> 
> Changes from v3 to v4:
> - Updated the maximum size of the DOE object from 256KB to 1MB,
>   as per PCIe spec.
> - Updated the DOE setup and cleanup sections.
> 
> Changes from v2 to v3:
> - Rebased on 7.1-rc1.
> 
> Changes since v1:
> - Squashed the patches [1] and [2], and moved the documentation file
>   to Documentation/PCI/endpoint/pci-endpoint-doe.rst to match the existing
>   naming scheme, as suggested by Niklas Cassel
> - Updated the documentation as per the design and implementaion changes
>   made to previous patches in this series:
>   * Updated for static protocol array instead of dynamic registration
>   * Documented asynchronous callback model
>   * Updated request/response flow with new callback signature
>   * Updated memory ownership: DOE core frees request, driver frees response
>   * Updated initialization and cleanup sections for new APIs
> 
> v4: https://lore.kernel.org/all/20260522052434.802034-5-a-garg7@ti.com/
> v3: https://lore.kernel.org/all/20260427051725.223704-5-a-garg7@ti.com/
> v2: https://lore.kernel.org/all/20260401073022.215805-5-a-garg7@ti.com/
> v1: [1] https://lore.kernel.org/all/20260213123603.420941-2-a-garg7@ti.com/
>     [2] https://lore.kernel.org/all/20260213123603.420941-5-a-garg7@ti.com/
> 
>  Documentation/PCI/endpoint/index.rst          |   1 +
>  .../PCI/endpoint/pci-endpoint-doe.rst         | 333 ++++++++++++++++++
>  2 files changed, 334 insertions(+)
>  create mode 100644 Documentation/PCI/endpoint/pci-endpoint-doe.rst


-- 
~Randy

