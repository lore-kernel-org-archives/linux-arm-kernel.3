Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE44E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YShds3XshDrXLTW91HKo34C7oufgi9usHEL3GZP+0z0=; b=kDI4u8qRzwH+u1DUYWcd3SBXFb
	T/3By2hRXXGYrMPsSLetgduwAI3PFE791yC9wMIgyvtz7pi93zEOa0VuOpI8Ehhl3t+2UFEGQepi+
	Qbwy2P9L9libJzgimoUmUBQKY5K3DmB64GEcxQXmlv5VBwAN+k73f8hdDPuwEuDT36jRRoc3FlZ1+
	fVOhQeT+f0pD5NfcGtLU8EC3n+Klz6sM1GVk5+xDhP33ETnJmkfA9oEE6Cwu5eT8Jes2yZQUX0KZG
	B9ielbPP86kXRbgM9ZI4crxFK2s8/4m2LuUhfn401K3mMGVaxNssmVpvoN1dj0FUHSFEoXUJixwFt
	ssrFeQ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwTE-0000000Cr56-02eL;
	Thu, 09 Jan 2025 17:37:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvLJ-0000000CftY-1jKh
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Jan 2025 16:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YShds3XshDrXLTW91HKo34C7oufgi9usHEL3GZP+0z0=; b=XZH/0TD3sOEKl71KvXhuLU+pVV
	kTA1y41PCUgYKcBFnwohdw+9XNNh/P4aBsUe96TDBzcF++V4rf84EIR6RrMFBsTmI7CuVoVJZb9EG
	Al0pIQnwgZp7R999//iVVVPfX3hy5TavaL7eL3S+GZ/Wr4KPBR2YxTwe9CKiZKoFazx0ZcO3Ua7tl
	zw5lZwoTP8p4bfm737uO4RKbYNX2Lsc8+CE40KoozaWDf/JzEJM9rIse/20wFKyWeT9TOdGGDhk6K
	QSJQ28/GjAvwfTGPYgymXv/EZi7kGqTwHvKzdUlfVTA26ZGoW5BoHGBEqClndml7Eur/ebRhYfiHw
	PiSYUIwQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvLG-00000009bB5-10rx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40ED05C4D92;
	Thu,  9 Jan 2025 16:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A882EC4CED2;
	Thu,  9 Jan 2025 16:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736439901;
	bh=/OVcWt94rvJ4EpwA9guww2JY+Yyr6y9ZWHqQnXozrpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tdYbG4RCCYequm0qZqgN3UBswMZmz6e07WSsVdXo+ZQQeGwY5c/9bbOs7d2zW3HsJ
	 fDgRrTIg+vRpic0tWFfhN8SXhHQCY+4JbiTnqwlWO1IRMUCy99OvHipnYSWucr7yHb
	 26MFq56Z0vcPTiwv2R0ijLXbf03M9r1sSrvALDmbYrnUj9tXybiT2Smr7x+usn3eQL
	 MzGaTR/72/7XPW/gDfqXplNVpWXgR53OGuu2o0xlKuWZMV1NRD7nV5HYrsDu/EHIjB
	 0yyLKGHT0ip6qot1T24zTwtpHO2BlTPYpOzJc/7DWFtvzQzmke+xfh57Zt0AizfrOa
	 FXe7oreYXQvGQ==
Message-ID: <592b4e04-9ff4-4ca0-a55f-73c6878f3fc7@kernel.org>
Date: Thu, 9 Jan 2025 18:24:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-am62p5*/k3-j722s: Add bootph-all
 property to necessary nodes to enable Ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Tero Kristo <kristo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nishanth Menon <nm@ti.com>
Cc: srk@ti.com, s-vadapalli@ti.com, danishanwar@ti.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250106123122.3531845-1-c-vankar@ti.com>
 <20250106123122.3531845-3-c-vankar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250106123122.3531845-3-c-vankar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_162506_631972_371D483A 
X-CRM114-Status: UNSURE (   5.74  )
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



On 06/01/2025 14:31, Chintan Vankar wrote:
> Ethernet boot requires CPSW nodes to be present starting from R5 SPL
> stage. Add bootph-all property to necessary nodes for CPSW to enable those
> nodes during SPL stage along with later boot stages for AM62p-SK and
> J722s.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


