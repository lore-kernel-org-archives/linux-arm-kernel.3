Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3pZc0vhobhb4iV2Lz3CbJ8dngsPKvp4OKQiVk9RJ0k=; b=jmQIk83sYVlwyqUNT/uTHWfRRX
	HkhmkCz1HruoI93mOEnCp3U1iFgJU0ajK0Js9yX2L3TnK6pHOjeg92BJ8UE0dSSD5pyiWeMCbFBxW
	K3Bt7VRaN2HDgv56ktYoPKT++hkq+p4Jv0brnNBJUuEHR1hD5aJSusphqlps0qM4b58h9mTJtAOZD
	BiOKrGKQXou3g6fXmCUhPXDV5jcVpPrIdF248jUty9TfQQBtydgslRoiNLEjZr+LZYKaPmI0chEsH
	CNuU1jT6DO7Az5OKez3CIwipg5dc4j55aasx+6gl0a2eqUi4j6ICeXzjsgsazFYr0y54I61PSgNni
	zVAH+EXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydJ-00000009eis-2zUz;
	Tue, 08 Sep 2026 16:25:17 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ydH-00000009ehB-26E0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:25:16 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hfTn23VKXzKmsk;
	Tue, 08 Sep 2026 18:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A3pZc0vhobhb4iV2Lz3CbJ8dngsPKvp4OKQiVk9RJ0k=;
	b=CN4aZrQW/b33dj7JfMnjTjLaqthRsK1RcdKl6J0KVRzS84vYAbkqNfn1GWihYgm6EDqEdN
	wCftBIr+A/olOjAWFXMRvc95wF8V+Y57LLMVxjAK2A5kTg5rt4fXvFQbQyj3Ac2si5HNc1
	bUBRyCag+GEJMjzXBiUPfbQyp35Rit2lmauipVz4LAtmpE4EJ9XnO0OJd5qzKGGIdEnCu6
	a0UCj/MmLrtKW3t3CjtcujUjlsr5EuZFIjEyTaWtnsuAqp4l5hr32Hqi4r6IEg1IEipB8F
	kzo7/KfcuZEqnllifsTvz9n0NUVMiDsITAYgjsc/h8CjVkWkUbsMkD6u1x4FNA==
Message-ID: <820f02c1-f7d3-4a98-aa1e-6456587dc6f5@mailbox.org>
Date: Tue, 8 Sep 2026 18:25:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1577b8dba529201d395
X-MBO-RS-META: a5156gzqfptqb7b8r9rkcsyoxcxm586z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092515_689119_C389558B 
X-CRM114-Status: GOOD (  11.79  )
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

On 9/8/26 10:46 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 9 Aug 2026 at 22:04, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
>> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
>> and add msi-map into PCIe controller node.
> 
> I missed before that "msi-map" is not actually added?

I sent a fix:

[PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

[...]

>> +                       };
>>                  };
>>
>>                  gpu: gpu@fd000000 {
> 
> I have already queued this in renesas-devel as commit 7fe73a3a3f2c3718
> ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes"),
> but I can still amend it.
Thank you !

