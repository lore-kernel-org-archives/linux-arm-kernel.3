Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC0EC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY0i14sLfFp5IyMkmvL8iHgR5m2wjm7udce02oi4QPY=; b=Sth6UxfCIYc+fa8/AcFHeVNva6
	2qr+ux9TyHmidwa+k7MauMemXoVnq6IhMcpIeVNpmJh8mX4xMSQomWNKiizFhsKlrc7tjRxMthIcq
	pkDPiNbLpdOGtWge+dVnt94kyF1CMBTwBlJOTsrksjSUnWlj4AUJT8hXOMF6ldmgYlO8KMhYGgEaA
	RoAMX/fcY/xeeVJ+xFsxhiH8I6e0hMt2dEklMbsoy1xumfMRReaRW8XFlRmzY8jEmR+Gj83jreC6X
	4tlls4QJwPwV7AtUv4iR2Gc9GNEysiHb4Jw14MoAHJ+Qywg1rOEzh4qL9tWNovbiPnJ3g464U5rlV
	ScqMYm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazxv-0000000CoWB-0IJS;
	Thu, 23 Jan 2025 16:21:59 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazwc-0000000CoMp-19rh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:20:39 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Yf5lG1Vf1z9sTr;
	Thu, 23 Jan 2025 17:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737649226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fY0i14sLfFp5IyMkmvL8iHgR5m2wjm7udce02oi4QPY=;
	b=vNGhBJgqDqhawuyaYJU77UH/UQKLzXCLTmcmpNV0e/zBCI+45AeCybdsWwPsPSKwu8OO8T
	Z+QxgVzJS5/Tnbe/Oo2KH49UtudPMgjrDLc7940UZhlRLkcpQf2KfHHjK7A9OCQubMOLSb
	zCwOsOONXE1BzSNJS769pmGihZTwbrsObk0+xezDzDOF1EgZJ3u9aEzeAsEafCI9WMpECX
	5viWDfN+SJCwAjnRdNaOWmRiUeWt7CibFKjCoXM2G7bmjMTxemfncFiDpxYJheOvYn1ti2
	hWi5whE8qd1m0rEMv6Mi4kzDLOQfDJ01aAuyaEY5aDgUOtMm5LQpbP5a34ow6Q==
Message-ID: <61d3d9c1-cb43-4b29-81e2-1c6f189191d0@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737649224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fY0i14sLfFp5IyMkmvL8iHgR5m2wjm7udce02oi4QPY=;
	b=GQ4qz3ITqeb2eOGJu6wBvp00xnlUhh1HgECUZpb+fijkHY6W1b+NMZ+89uDSETC8cLMq/Y
	ihggxl+ePG+JMOI/SUSXl95DfuvaYNmU/gNus8r4ORBqEPo/l1qpqtXfWWBdn1CaEqRWgy
	NoVnV3IETU0KMhRLihJBL6AXUJbf3ExgPr+BHCJz5rejDPDd5iepe4V1ImdgwLGo0NsDgn
	mMHWc0HdkGWfzPgILsSw0xoVWQmTcYstjIr7MqOHxXKABcFIj8qSuIYOZA2yoGDucsi5Id
	Rr9TQ08EVifIfnGRVcvFO4vNx7aVKutjo+KTjVS2l0lZ+I0/4N+xRY6LM/A0pA==
Date: Thu, 23 Jan 2025 17:20:22 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch
 ports
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wk9fj8ipxkp8a75zibptxawmrueq8ejz
X-MBO-RS-ID: e5c6bbcb233f01532af
X-Rspamd-Queue-Id: 4Yf5lG1Vf1z9sTr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_082038_459431_9A1E30C8 
X-CRM114-Status: GOOD (  15.08  )
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

On 1/23/25 4:25 PM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sat, Jan 18, 2025 at 12:14 PM Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Introduce labels for each rswitch port in the form 'rswitchportN'.
>> Those can be used to access rswitch port nodes directly, which is
>> going to be useful in reducing DT indentation slightly as well as
>> in DT /aliases node to reference the rswitch ports as ethernetN
>> interfaces. No functional change.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.15.
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
>> @@ -974,15 +974,15 @@ ethernet-ports {
>>                                  #address-cells = <1>;
>>                                  #size-cells = <0>;
>>
>> -                               port@0 {
>> +                               rswitchport0: port@0 {
>>                                          reg = <0>;
>>                                          phys = <&eth_serdes 0>;
>>                                  };
>> -                               port@1 {
>> +                               rswitchport1: port@1 {
>>                                          reg = <1>;
>>                                          phys = <&eth_serdes 1>;
>>                                  };
>> -                               port@2 {
>> +                               rswitchport2: port@2 {
>>                                          reg = <2>;
>>                                          phys = <&eth_serdes 2>;
>>                                  };
> 
> Would you mind if I would change all rswitchportN to rswitch_portN
> while applying, for consistency with other Renesas DTS files?
Go ahead, but also keep the commit messages in sync .

I can send a V2 too ?

