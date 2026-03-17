Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38743F33806
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xm/J7oFI4Is9lh3Q17rNyouhEzrZrXuc3J6Mr73lBJQ=; b=EPrkV7Ni3FIqh0HPzaO3YDSeir
	dQCUvEtHUfRZqr550sOON3S8r1jZRjB1alYmMV6CkgxhQ2rdyXCmlXOi/eR1Xy74YBYy0I1CGr/15
	I9obdaGGP9i1r+DyEJeD8DSU7O/RG43xni38XqjmAtmSyukWiwaJlkYJqIHqyKUYgNJrzCWNt6VIu
	z4HqNpUid7xkZXxJr7OY5syyonyb0q+6Yxvy0YFjxdodor1cDnrnQh09GbKbe5zdWQorYEl3Zrr6A
	GcYCsT3K0Hc9d0Hrl9N6G/Rrrw0oDMcsVMxW2e7iuw9UE+nOGjYAQGkU6uMHTEHdEB9RWuUWnavX7
	2Vc08qdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OdK-00000005YDT-0EGs;
	Tue, 17 Mar 2026 07:14:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2OdI-00000005YDJ-3C1D;
	Tue, 17 Mar 2026 07:14:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FB7460133;
	Tue, 17 Mar 2026 07:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADD3C4CEF7;
	Tue, 17 Mar 2026 07:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773731667;
	bh=Pvk3xfr1bGDEtNBqTLEOwnOlPDnyXKamBydkTYb/y7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SmuIVT7W0vq1cJ2Uzr8Pc4tehccTVuOHNweFrbDGMyzuf7T334ExTWL+CWpYS8/fN
	 t+OQiQCpRnYF796uW6rRZB88wCZ2vrAh6eFXdq5sZHgvAntBsNcX6NJvk4QCsyEtE9
	 77+yFmpkFrjkLAZ+EMbcIUPLfmwFaip9a7nN/5NXOx107nNCMeWtYcOd92YMk16b8d
	 GXIr2LtqpjdNsDMB8HtQI5pRWcPFxNccbxiyn5pXthEEkeOgvxSK+MFsOtW7dCP6f+
	 ztG9e3Ot1UkqPVJa8wU/lGUp87Aga6KvFUA1v854F5SeYWiw6gr7+U2LlK9s8T6qKc
	 ZeBrQ572WBS0A==
Message-ID: <949b509d-c712-43e7-85a0-60f4c5e24a09@kernel.org>
Date: Tue, 17 Mar 2026 08:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
 "afaerber@suse.com" <afaerber@suse.com>,
 =?UTF-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
 <20260313081100.596224-2-eleanor.lin@realtek.com>
 <20260314-orange-foxhound-of-felicity-997667@quoll>
 <77e88b72f99c4a709f6fbae57162b090@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <77e88b72f99c4a709f6fbae57162b090@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 17/03/2026 02:57, Yu-Chun Lin [林祐君] wrote:
>> On Fri, Mar 13, 2026 at 04:10:51PM +0800, Yu-Chun Lin wrote:
>>> +#endif /* __DT_BINDINGS_RTK_CLOCK_RTD1625_H */
>>> diff --git a/include/dt-bindings/reset/realtek,rtd1625.h
>>> b/include/dt-bindings/reset/realtek,rtd1625.h
>>> new file mode 100644
>>> index 000000000000..e69b5ee14cc6
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/realtek,rtd1625.h
>>> @@ -0,0 +1,195 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +/*
>>> + * Copyright (C) 2025 Realtek Semiconductor Corp.
>>> + */
>>> +#ifndef __DT_BINDINGS_RTK_RESET_RTD1625_H #define
>>> +__DT_BINDINGS_RTK_RESET_RTD1625_H
>>> +
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET1     0
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET2     1
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET3     2
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET4     3
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET7     4
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET9     5
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET_BIST 6
>>> +#define RTD1625_RSTN_REG_ID_DUMMY0          7
>>> +#define RTD1625_RSTN_REG_ID_DUMMY1          8
>>> +#define RTD1625_RSTN_REG_ID_DUMMY4          9
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET11    10
>>> +#define RTD1625_RSTN_REG_ID_SOFT_RESET12    11
>>> +
>>> +#define _REG_ID(n) ((RTD1625_RSTN_REG_ID_ ## n) << 5)
>>> +
>>
>> Not a binding.
>>
>>> +#define RTD1625_CRT_RSTN_MISC      (_REG_ID(SOFT_RESET1) | 0)
>>> +#define RTD1625_CRT_RSTN_DIP       (_REG_ID(SOFT_RESET1) | 2)
>>> +#define RTD1625_CRT_RSTN_GSPI      (_REG_ID(SOFT_RESET1) | 4)
>>
>> None of these are really bindings. Register offsets is hardware data, not a
>> binding.
>>
>> Drop all of this above and further - actually nothing in this header look like a
>> binding, since you called these "REG".
>>
>> Best regards,
>> Krzysztof
> 
> The defines in this header are NOT register offsets. They encode "Bank ID+ Bit
> Position" for use in Device Tree.

Bit position as in register bit position? That's still not a binding.


> 
> Agreed, The naming with "REG_ID" is misleading. I will improve naming all reset
> IDs in v5.

No, all are to be dropped or renamed to standard IDs (incremented by one
from 0 or 1).

Best regards,
Krzysztof

