Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC9BCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rCsIp/OdcFAFpEnxeZBBDFOM8O5rqaH3hw2dBPi5nk=; b=d0a2A/0oelAduqDFtc1PlNcn5Y
	6xKVLFNUI6XNne2cUFj4jYPYAwUpQzpGH+6weh4W4OtML7tmib5g5Y8BuSEnr7060LFEcc/i5LPX2
	0oKnwJHQOdf2fIZqD3EEYNtLt2RGgsuEikhgEE4bX+b7z22KxLN8TnfPre5qf/fEaoOTIvJEon/Vp
	Wic6p7IXvfHTUjwy8Hy6Nr83xUapIiXoy0lhV0QwcP6ILLFQTS07yLjsrzIn2eemrKU0v1Kftpm9O
	jVmxV6FyiObSIrR/xBFFhCcxNdTAG25gSnsf7F0LkpfIbvuopgCieQ4RCtX+hAFjMUmW/fOkC6/Z/
	SXUd7Vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5bW-00000008O7n-3LLn;
	Thu, 21 May 2026 15:46:34 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5bU-00000008O6s-2fjm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:46:34 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1766B7A00A3;
	Thu, 21 May 2026 11:46:29 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 21 May 2026 11:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779378388;
	 x=1779464788; bh=+rCsIp/OdcFAFpEnxeZBBDFOM8O5rqaH3hw2dBPi5nk=; b=
	H0wg6oZHPdZGf2SxBDLnP2gWr7Yl9qsGDnXabO6/BLcoscRzkS9N2XISQUZXma1C
	x1iSq0KrA35NvxddXligukrvIQH3WwsBWiPCayEG/f43TblcCuFuqdWiqesEsyQk
	/r3FEsxitjl9MB6axc5T9YwQZhXI0wvCVlyxj1HNsbacltdhlalnapVVblKouZkP
	aqN6eIE+75r8AwhgI/7gSJqXuRrua3S62XgwjoG3S/10utxe6RK763WxpmadXvwe
	DdQIQzB22jZ9+KcMsdrkKtRgwZwG0k84SgyjTzb32u5navk1WYyB4+3xFv9aPZOt
	XfDFZJTkwgawKVJm1fr+8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779378388; x=
	1779464788; bh=+rCsIp/OdcFAFpEnxeZBBDFOM8O5rqaH3hw2dBPi5nk=; b=b
	G9jxNdC4FjYzt5xqOLIjnbUMyAlPixJf69W7bxKHbLUNsg1tqgT0lcK2i9JrAVET
	MVOS+aFrR9kK1Up5zdGAOXuj8hzJSbdvyw0S+NbUpK8yNwZo1vaoD2Nh41Z2z4B5
	ywTcK4DmyecoBE6aOsxNWp7pYPonHp714gL52niiauDbsIV81fKrJQJp0zRHjweH
	OYxaJc2Gr95pdcb9huzbtN2NS22esIUF+UgV99ebyTRPVOwvtVvGlJPSuxWZoe8c
	hEv0vuCHTKv1N6iulUoXM9Ly2/20Icq/Px6du/RoheM6tNK3AdtYRwZxDM41IzdW
	a44ZTgx5npuV2Uk09nVKA==
X-ME-Sender: <xms:0ygPau4zBxDVojdOTZRPZsSSQx5Yg3n-N3Ja-KfZ_M7XnWPooPEzKQ>
    <xme:0ygPaivEr2oUz8KjOID-olfKqUzXZvqwxP60dWDfRgAXb4juhrG4W6J9xu-6OIufb
    uJkjCEdznYKHnlA_sjlUtQOjQkR5Pjw_pUK_nzxpa2OwRgB_ZKq2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeejledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghigidqkhgvrhhnvghlqdhuphhsthhrvggrmhestghigihtvggthh
    drtghomhdprhgtphhtthhopehpvghtvghrrdgthhgvnhestghigihtvggthhdrtghomhdp
    rhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpth
    htohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopeihshhksehkiigrlhhl
    ohgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhho
    iihlohifshhkihesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:0ygPaiPDf7h1JBBV_Yij1-LGeEslEMs--dCB15l-T1wvnk2VXFF8JA>
    <xmx:0ygPat1cGR284X28TnifqVKVSGtRt3R5cE-1yaWFrcBoRX40l7CZvQ>
    <xmx:0ygPapDNg3zTYwXujKsf0iBdXEli1XksD9Zl6ycrlx1OeDkEtfPBgg>
    <xmx:0ygPaiIWDlE2FNlGcn4pDWZKq-L6NPvnfNktY0jIm7UWl7rSRiFHkQ>
    <xmx:1CgPaminRwPB63AmPLU0xnbZWHE0jdiehO9zFY456Uz2VxmAHPnIq4ke>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F621182007A; Thu, 21 May 2026 11:46:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASZRNT9gNXmc
Date: Thu, 21 May 2026 17:46:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Peter Chen" <peter.chen@cixtech.com>
Cc: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com,
 "Yunseong Kim" <ysk@kzalloc.com>
Message-Id: <3cb3ff33-3d4f-454e-b743-27b48e87cb79@app.fastmail.com>
In-Reply-To: <4ea63bf6-d9ec-483d-a9c4-9715ec5547bc@kernel.org>
References: <20260327114628.3800886-1-peter.chen@cixtech.com>
 <4ea63bf6-d9ec-483d-a9c4-9715ec5547bc@kernel.org>
Subject: Re: [PATCH v3 1/1] arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and
 Cadence GPIO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_084632_861730_E26769F8 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, May 21, 2026, at 17:23, Krzysztof Kozlowski wrote:
> On 27/03/2026 12:46, Peter Chen wrote:
>> 
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index b67d5b1fc45b..f9be52484008 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -241,6 +241,7 @@ CONFIG_PCIE_XILINX_DMA_PL=y
>>  CONFIG_PCIE_XILINX_NWL=y
>>  CONFIG_PCIE_XILINX_CPM=y
>>  CONFIG_PCI_J721E_HOST=m
>> +CONFIG_PCI_SKY1_HOST=m
>
> This is not correctly placed and caused issues later - conflicts with my
> cleanup patch.
>
> Please fix it up before you send the patch to soc@.

The problem was my merge, and I've fixed it up now, thanks
for pointing it out.

I don't think there was anything that Peter could have done
differently here, as the merge conflicts were to be
expected.

      Arnd

