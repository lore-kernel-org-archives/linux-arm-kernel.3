Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA895606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=see4XrHk;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=letUj2Ob
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LtgqnPwkSNepb5rhVYGZGg+M7ky5lb2Mgj+7aMYIu38=; b=see4XrHkYjdCi4
	SwPqbZRg26ELMUktLUgLXYxsZRY7BR5Dm4w7LAYtkCnPzkYzP7zmyIok4/AQZ2Ynx0qdqBLzHkyCw
	eddLqELWtPS/GwW12lXgyEjax86AdeR38kPiAjM7fLIROJ/Unpgh+8/KKcnoJFmmblgkIYa1G5Jjr
	IqbT26GPlcifq2h8JxzCugjSaLcKY659s1kgV7qgGCa45lPiJhKZv4bk9arfAuCUEM2OgZN+KgP/L
	4swH1mfaG28iZnfoVhrOny8R3BeUqgL/EUwUoOEs9SaxYtr1UZ2yPypQUCxUyleyDAX+BKJLnnYfU
	j9V3zgS7ldAXo5SCfHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBSY-0000000Fznm-1bU2;
	Fri, 23 Oct 2026 09:21:10 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBSV-0000000Fzms-2rYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792747268; x=1824283268;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HvQu/rXlxvjhOw72+0RA9ZUcddXB/44XYkRs0LAsZco=;
  b=letUj2ObfTCYD8nreCHNTHNYijQonfNK39GvO41+uEYg/oR6elvrzNhL
   ytHS94iKruquht3zwe3GQnbC+O4V7R+3e0P/zBmvkf0/efgiMWM3rUcse
   +yUPwOivR68zeqtFZzWDN6gKIoEzIRw7rxv+X5wc0XFBwmr1+Qvt3cBtC
   RZDs7e3sQo+v2pS4ebd1kk+uwwTLqtVH5OaNDGkaVZJ/7HxAg2uNggWsD
   LHuNcIKK25P7XAVLbwOCknIWw4yRQfJPBHgBGCAcIkSb8ap8QC/Wl6fSb
   DD9BqXMpd1R+KFUHV2aRm91NgeA8fH+Fb6tG2cZmiGe9/LzxkVMe/hJtU
   g==;
X-CSE-ConnectionGUID: FF4hXG2aSxm0faVqmOuOpA==
X-CSE-MsgGUID: FliiS+mSTrqc5uyZqaU75Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1400727"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1400727"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:21:07 -0700
X-CSE-ConnectionGUID: JilZZk58SwmSD3MCGwSnXQ==
X-CSE-MsgGUID: PLKmsBB+RuW6zcBP54Mbsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3707489"
Received: from unknown (HELO [10.102.88.154]) ([10.102.88.154])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 02:21:05 -0700
Message-ID: <9561c180-ff8d-489d-9ad1-8d9a7afb592c@linux.intel.com>
Date: Fri, 23 Oct 2026 11:20:45 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC
 platforms
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
 <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fb048449033e125df93c2925d6dccafbd4114685.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_022107_736583_3B5A86C3 
X-CRM114-Status: GOOD (  17.22  )
X-Spam-Score: -4.5 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

On 10/23/2026 6:17 AM, Andrew Jeffery wrote:
> Hi Dawid,
> 
> On Wed, 2026-10-21 at 22:26 +0200, Dawid Glazik wrote:
>> This series adds initial upstream support for the Intel AVCRP and JNCRP
>> BMC platforms based on the ASPEED AST2600.
>>
>> The first patch adds the board compatibles to the ASPEED binding. The
>> remaining two patches add the board DTS files and register them in the
>> ASPEED DTB build list.
>>
>> Dawid Glazik (3):
>>    dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
>>    ARM: dts: aspeed: add Intel AVCRP BMC
>>    ARM: dts: aspeed: add Intel JNCRP BMC
>>
>>   .../bindings/arm/aspeed/aspeed.yaml           |   2 +
>>   arch/arm/boot/dts/aspeed/Makefile             |   2 +
>>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 322 ++++++++++++++++++
>>   .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 276 +++++++++++++++
>>   4 files changed, 602 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts
>>
>>
>> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
> 
> Can you please discuss why you based this series on v7.1-rc5? v7.3 has
> been released, v7.1-rc5 is a long time ago.
> 
> In the future please base changes for the AST2600 on the latest -rc1,
> or the aspeed/arm/dt branch of bmc/linux.git on git.kernel.org.
> 

That's my mistake. I'll rebase onto aspeed/arm/dt of bmc/linux.git and 
send v4. For future AST2600 changes I'll use that branch as the base.
>> prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
> 
> Can you please rebase this patch to send it to Lee on its own. The
> AST2600-based platforms currently generate a warning without it. I had
> hoped Lee would apply it in the same cycle.

Sure, I will reach out to him.

Regards,
Dawid

