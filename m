Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D39CCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbzBamjzxXiVtpHrqv9CMUVENI1ThdjIF2HinA6vwbs=; b=3GUONrlBC7lpLxRt+kGN8P5cXw
	OlVFy6xH1gb3gc/IDTcMDMCEHwvXAYhL4pxmk8NVlAR23SyvgwI1XQ8frEQdQ3azMm7/rJdC8668I
	4nC5/mNA03Wb+T5cX2Vl5XCN+Q1j28U/bY8bi2xRYqbG2reStHLKUfgLUpqgpNeEV4TmLD7jokKkq
	CpeVGNu83AQQfNO3uSQ7oZSgqhWas1Y3m+JNeBZif79HjkeDzMB7iESm8ANaCoTmuy6Gvg5v46uuD
	x/bz+rTwdAC8jsn+Gbvd7Gj8xt8DI+k+lF7eifugMhlcHanroRSyjsExzsnHp75fDVDXErenEq06K
	1BQ1EC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRR7-0000000DspV-3nzy;
	Mon, 11 May 2026 14:16:45 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRR0-0000000DsZe-3fQX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778508999; x=1810044999;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/xqH7NH5OnIsXIFChpqYZdEouHpjFOVq5k8bHoem5oY=;
  b=gl1BcOh9PjcHd5rU0pMiIQO5I+yQNwdw5HtHCjjGX09BROkIide7BEFE
   0NBHws09XSXTRgOJWWtz3oIypPU/8eDmPcjqYnW7eWb4QmqpvmAkYcIkQ
   iP5UZRQdJkhRLuvN1kLFJk9kPjWa4pspji1p8umDckg2+IsedlcwqInst
   9RLtNPdFg6EF2X2/ljVCTi6nVqGeeALn8WQlPU3/vNdcMHj+FXc4P5NL7
   sed8ilY76823ACZM7D5JMVUxZ7LiTla93wC5LlQfdbM99m2TvOFD5OBal
   3VgSR0j2cdin56bDMX2A30z18Z9RhqPK4XIqYRrWiylSy2wyhO88bL/qW
   A==;
X-CSE-ConnectionGUID: Jkh3Lhc+QlWLEQReiGct6w==
X-CSE-MsgGUID: Es4DDp2MSw6HizwfNdvneQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79577330"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79577330"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:14:37 -0700
X-CSE-ConnectionGUID: IGMkto1nQuq+i2PCwp8hSg==
X-CSE-MsgGUID: joc20km3Sn+zISkQ0Tcj4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="232986212"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.94.250.159]) ([10.94.250.159])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:14:34 -0700
Message-ID: <15956b70-c6c2-4e3d-8f15-471a274d6e2d@linux.intel.com>
Date: Mon, 11 May 2026 16:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] ARM: dts: aspeed-g6: add AST2600 I3C nodes and
 bindings
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cover.1777058942.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_071638_956861_1B0AD2B8 
X-CRM114-Status: GOOD (  13.83  )
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

On 4/24/2026 10:20 PM, Dawid Glazik wrote:
> This series reworks and resubmits AST2600 I3C DTS updates that were
> originally posted in 2024, but stalled without further upstream
> progress.[1] The series was rebased onto the current tree and merge
> conflicts were resolved.
> 
> The patches first move I2C controller nodes under the APB simple-bus
> for layout consistency, then document aspeed,ast2600-i3c-global in
> the syscon binding, and finally add AST2600 I3C controller nodes in
> aspeed-g6.dtsi.
> 
> Jeremy agreed in a separate email thread that I can continue this
> series under my authorship.
> 
> Link: https://lore.kernel.org/all/9d8c03d742fa9767f30e23d75ddf0baf4296c88e.1714647917.git.jk@codeconstruct.com.au/
> 
> Dawid Glazik (3):
>    ARM: dts: aspeed-g6: move i2c controllers directly into apb node
>    dt-bindings: mfd: syscon: add aspeed,ast2600-i3c-global compatible
>    ARM: dts: aspeed-g6: Add nodes for i3c controllers
> 
>   .../devicetree/bindings/mfd/syscon.yaml       |   2 +
>   arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       | 543 ++++++++++--------
>   2 files changed, 318 insertions(+), 227 deletions(-)
> 
> 
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f

Hi all,

Gentle ping for this series:
https://lore.kernel.org/all/cover.1777058942.git.dawid.glazik@linux.intel.com/#t

I received Reviewed-by from Krzysztof Kozlowski (thank you).
Could I please get feedback/ack from maintainers on the remaining parts,
especially ASPEED DTS?

If preferred, I can respin/rebase the series.

Thanks,
Dawid Glazik

