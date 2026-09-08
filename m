Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688EDC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV9GB3fXIyB5NrQ6rEv5WVb9ldeTAtPVcPbM4zRhXmA=; b=gopcechldITkr8A8znUVVZ2Hwl
	dAUwCPakpKLCZ7EGb1t0EcD5v8t4rS0NF4L2EKoOtudqVPeHROFnMq8wJiHtP9pNoI7I4Gzk2JeSR
	woZkP5NvKB7Af5SYbgDRHy/di5CSIqpYlEO0LNDmRgw5Ayzan2CrcLGeWt84cZyaCgKnjTSeFydTI
	ZzJWTk28Ze70kkVQ6q1Wcr2wQ4NR4j3bearMd6/FKpFESoWnfq+ppVD4E1TXog7xI7+LFAnoAt+dk
	qO+Z2X9Z1teqlL+wIrRcIST7uvzaOBdnjROOWMAHv8N4xbxFFUuj4JjkuYBIoMxpszFII2HjVcIvb
	EapFjC9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yfU-00000009fVM-2wUK;
	Tue, 08 Sep 2026 16:27:32 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yfS-00000009fUP-16uB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:27:31 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hfTqg3g9szMl1L;
	Tue, 08 Sep 2026 18:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV9GB3fXIyB5NrQ6rEv5WVb9ldeTAtPVcPbM4zRhXmA=;
	b=Sz9qeAytNGxWf0MkkrZ3MlYFlhTH3hjIkpZ/dSTBIMenAV3iHIkQqCAcHrzYDtxHMaBf0W
	MaeiA0xX70zK4blWKH7v1f+9tl6+2alZZ5t6scyNsQNbR1cVeVtDyp4757IiHA8ClYLeXt
	h0LiOWiSnEiHjhmz6bIHzx/0Oohmiao9pN5aQCktddE+KPepKCqMs0WT0LsXunjvtFpI8B
	VUN/CBLu4k4N43V+LbHXtHtwFML/IceP5B28uyLDmgYhc1NU/qHPfgURqPuML+87pdPnXy
	ExXrqmReeV/0QFSgnjifDTRram/b4WQ8AfNQO077/HKG8UI839j323CVVAl4ag==
Message-ID: <b1a64102-9c86-4cbc-aa07-11ad051b0dc2@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788884845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zV9GB3fXIyB5NrQ6rEv5WVb9ldeTAtPVcPbM4zRhXmA=;
	b=on45IdyiOihjZ3noklR6uoYpKdewRt4+AY7Cec1AyyjixAiL9ucsaZEYWXG1v9pkX2KJRo
	CUW1BZOkFFZMW93AbpxqScxiscr8XypgEbToTHVggabqiR9OThOsfS8xavLrGyhp949ZW1
	vwxtSs2xLiQe0jE+blHSgIbrg11+qnZowqr2bRxABYfg3cnZv9mIfB/Z3HSTSHehRu6A8x
	ILGjthCIL8Hz+hjjY6pl7kplwwZ3pWTVr883riWaQrqgL7f/lzU6LBtWwPeeV2cqhSTJvZ
	A5AXdOpl2IQykafHFl1+eu3rQ6VMrNcA2fSOLz70jXJw1AXe2MHYTCaqfZrIoQ==
Date: Tue, 8 Sep 2026 18:27:23 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 95a871c755375494b81
X-MBO-RS-META: gsb99t9ej18ugjwbxn3iuk755yh9d7m3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_092730_455682_3ED7E65C 
X-CRM114-Status: GOOD (  15.82  )
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

> As I am not PCIe DT expert, I am comparing this to the corresponding
> patch for R-Car V4H, which I have already queued as commit
> 7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
> update PCIe nodes") in renesas-devel, but which probably needs some
> updates.

I sent a fix for that one:

[PATCH] arm64: dts: renesas: r8a779g0: Add MSI cells to GICv3 ITS

>> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
>> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
>>                          resets = <&cpg 624>, <&cpg 1121>;
>>                          reset-names = "pwr", "core";
>>                          max-link-speed = <4>;
>> +                       msi-parent = <&its 0>;
> 
> This has an extra cell "0", which is probably correct, given
> "#msi-cells = <1>" below.
> 
>> +                       msi-map = <0x0 &its 0x0 0x10000>;
> 
> This is not present on R-Car V4H (which is probably wrong).
> 
> Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
> documents msi-map for endpoint node, so should it be added to the
> pcie-ep node, too?
I do not think we should be adding it until we can test ITS with EP ?
This patch adds the ITS only to the RC side, where I can test it.

