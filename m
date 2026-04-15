Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3F8F42131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 18:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsW85w2UgN7W0CGdTdAcPBBf5104xaQ7TM/wOyf4dRw=; b=cKSHr1xaktuYtmXeYGcKMiV4YE
	+8vg3gKh/VUP9EgPPjPAMX9jYPxXStF7EpJY8Z6RR1l3i1/Y8lMwoKQLtKLvkeL6sIhbrBAzXYWHc
	aYV4BqdGT587UN7A2L1TJIlKAvn06bdZ2sFp1vpMxzK0D2REVR0aJybPSkkm5kkp9TfJjmQCvNej3
	W8gFE79bDkxfhcKLDDNuaEfAqnN/H7rxfuaIZlH5fB3rT8Ksl9t6O2u/1aNSccJQjbfO9ONDxmmL2
	X8mw1FdBGlVXzYvdff9l+GTIsPdz3gmkr02g3F9f7MCxqtOgFWUSXXnHByIROu1PJzT14wYSEDvZI
	wDaZJQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4sL-00000001VD7-0yng;
	Wed, 15 Apr 2026 18:22:09 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD4sE-00000001VCN-3NwU;
	Wed, 15 Apr 2026 18:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776277322; x=1807813322;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=H7jvNxMoyDOskGYfx3Wf2OxswmTnEl9blys24JcUhHc=;
  b=Go+3oe0L1FroatmWKlCJ4Yw5x7/YGN+sGlFCwlnucm0foR/GBQnnMaeH
   Uf6xW3DrG3LwAdftGmuR5sN0od3g0xdanUgKGLbIa8rLYJBzb6lXndndc
   oUFI4WXBvgw7VJLZdpu26leRw9lwGwUWKtZEZDa35i+tzKDnJf9MRenwg
   gNkl2+MtxjpIpZMnQm+e/bXz4kUR03G0eRHVufmIwSA0MJyQCN9Ed86wD
   Z3LdbzOXnbGTODq0CNWmkE1VNjvVwnMMjdtsEuvdCp+CnGu27DAdZxzqw
   0+CLrJ9oESpz2yuJcAVnM3UsbUL2HnZBR6xTrlVipZMQfVHrclDCEkoH8
   A==;
X-CSE-ConnectionGUID: 0BxwL9vaQBWc0F1Yb289GA==
X-CSE-MsgGUID: d1JUJxFbSES9oAOsTixGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77141903"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77141903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:22:00 -0700
X-CSE-ConnectionGUID: scLcZlr2RIyw2mcbKX1FTQ==
X-CSE-MsgGUID: Xa+s81DcRsK9kV8uVfWbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234524620"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.94.250.17]) ([10.94.250.17])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 11:21:57 -0700
Message-ID: <cb0d16bf-988d-403e-8a8e-c85bf2a208d0@linux.intel.com>
Date: Wed, 15 Apr 2026 20:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
 Maciej Lawniczak <maciej.lawniczak@intel.com>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
 <20260409-beneficial-sociable-tamarin-dbcaeb@quoll>
 <d74e7aa8-1110-469a-ac7e-3829c2458852@kernel.org>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d74e7aa8-1110-469a-ac7e-3829c2458852@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_112202_884439_AFBDB3A6 
X-CRM114-Status: GOOD (  12.49  )
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

On 4/9/2026 9:30 AM, Krzysztof Kozlowski wrote:
> On 09/04/2026 09:28, Krzysztof Kozlowski wrote:
>> On Wed, Apr 08, 2026 at 10:34:35PM +0200, Dawid Glazik wrote:
>>> Introduce the device-tree bindings for I3C global registers found on
>>> AST2600 SoCs.
>>>
>>> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
>>> ---
>>> I wasn't sure if I should add newline at the end of the
>>> file or not so I took
>>> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
>>> as an example.
>>
>> Answer is: you cannot have patch warnings.
>>
>> Documentation/devicetree/bindings/i3c does not have patch warning, does
>> it?
> 
> And if you tested this code with standard tools, you would see that...
> 
> Best regards,
> Krzysztof

Thank you for the review and feedback. This is my first contribution to 
Linux kernel so I'm still learning the process and toolchain. I 
apologize for the rookie mistakes. I will address all the issues you've 
pointed out and resubmit the series.

Best regards,
Dawid

