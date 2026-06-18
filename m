Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B48ACD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 22:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsG+kwh/RE2Th17kyeIVSQQjjEmBmAST5wWlz7L+k/A=; b=2uBREEYnTyHaaUkjOgCONTOMsM
	Gt4Anj4RoGA7QwXFlrlhupWnk2L1bCwrc6NSLwMCF/fHaqDVOaISqKItz0nYxdApAVFPEi0q7n4Vo
	64ZqEdX1wg4m4tmQ+QTnrKyIorwT5wK9P8IKSTXeH59HxKRKTr6jDJC7AyUCcOkSm+/DqOqFk1MOL
	2yGZnqIc4/ShDPELZ7Ttz0TelpOHB+h41h1C5l2aMpSPneyGWCCswwcg09Kss/MfG12hAZKs+a6ei
	SHxCktQWDBhGZ4RmljYtlGeODPh9Ftky8O9Iamy4EO3oGIot1KiZU60NGA808UYLfb45Sn6+lWnC5
	U8roDzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKre-00000001pTz-1Br7;
	Thu, 18 Jun 2026 22:05:34 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waKrY-00000001pQU-421z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 22:05:33 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ghFCW2Z5Bz9v9m;
	Fri, 19 Jun 2026 00:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsG+kwh/RE2Th17kyeIVSQQjjEmBmAST5wWlz7L+k/A=;
	b=Vr7/kDwQQVyyn7Q9L3WMvbAOf0DmSjZsRwNWCVqbAQ3K0mvmVR5JS+ubzjuiSOY0fLOK4Z
	9WzXQa4PQq/TcS5Cgr9WSLEW8fsC2f1O459t50DuJI/I5rXphumG2oHZqifo7/xCSxsG/4
	Vu01PmHLcwFD8XBORfut00GHNKW7L7PBK3TGrZIXu5Wcw81fah1hwL8PMS2KICSg8rvjiA
	Tn5smT+NBBaWlH2WP0VwTBO3LUDEmltgLki7OypGLYr5HkK/kJNkm7apAmSHk0D/ay7I9V
	9C/UsgPEY0f0lXVnS7h9xtdd2NdZ2Hh2ZkNSZUMlPjGWkzBet6tc/mTMKK6a1A==
Message-ID: <6ac0dd7d-e6f2-4af8-8a8c-0c04b80fe84c@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781820325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HsG+kwh/RE2Th17kyeIVSQQjjEmBmAST5wWlz7L+k/A=;
	b=XKITqWdxP93mTM7BWv5LdSPVNU80VmN3Eo0nPVObPZnqcYoefywgvnU0qGrD930f190Kvk
	bPGTQ6G0ROgP0jyLS57mN2Zga90ceidoNxWV8tfikrnOtVT3vqPGUaag2AEgrEIzWZuI+L
	JYowfbuAOmVfK04HzsvDxAIVZ0NDBYbeWfHuWPJvSRdFgLyRh20BvpK+wbPINeOCVNDP44
	/+n7REpcVwlhV7N4Es2gxRZQ5y4mLAkyRtupwfvQOd2Vj8AISY4JfAGlL7FYe0UlsOxtpe
	+RO3z0NlsWn0Oj7QQylYMxTV2Oj3af46V9WNJeF2AFDQVH4V/XIwaq+6RSNtgw==
Date: Thu, 18 Jun 2026 23:53:16 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marc Zyngier <maz@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <8633yltylq.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8633yltylq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ucoytqqaddo4u58bqotznotj7opphcfn
X-MBO-RS-ID: 4481829806dbe33cd5c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_150529_149002_EF4D6D8E 
X-CRM114-Status: UNSURE (   6.18  )
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

On 6/17/26 9:28 AM, Marc Zyngier wrote:

[...]

>> +/* INTC address */
>> +#define AXIINTCADDR		0x0a00
>> +/* GITS GIC ITS translation register */
>> +#define AXIINTCADDR_VAL		0xf1050000
> 
> Wouldn't it be preferable to source the address from the device tree,
> rather than hardcoding this?
It would, I will do so in V2.

