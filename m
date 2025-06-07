Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A570C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4+qbg4VKKcEc0U3nC8xRMAhLd7TNg+KH4tpuBORnbA=; b=MTULeAai4aVb/qCZWnOVNGIhLs
	Ydeigqy134Us1P9SvVp+Cd4scM9/PsKTbUSQHcqUbjYqUgd2pN3JL7xBtXh5+EOhxfwhYEoyhcel4
	efRlxSe3EwL5BaTOoHejXekpXrxOx9nPpEv27cKot4JZu4XGLpbIbK9Ajwr7xfrIcSjNVwe8yTt1n
	tgcFzGBzJu0K9KVzZD69aTk1CNXFC9224ucxzPPGJHg4Xbe5UiDCn4HYfs1NrxK/zM4MaZ4+kCu5h
	qaGY+zt6CcnhE/ZycPjGzPAAa6PhNfF+654uGlOkthk0jTl57spaIdDcykmu4uKcCY+i5cYmo/944
	q2dNGRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzdW-0000000217c-3Tx0;
	Sat, 07 Jun 2025 19:55:26 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzWX-000000020e8-2766
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 19:48:14 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bF7yd193xz9swm;
	Sat,  7 Jun 2025 21:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4+qbg4VKKcEc0U3nC8xRMAhLd7TNg+KH4tpuBORnbA=;
	b=i2ZLDNBY1FSdzQ7WiIVlTi80r8Kand1Bsafh7lhSzIHZGhRGfKrB6nJRRsgt+ksHpDS7hu
	Q6uHJD/DGV0wFKAByH2iTHYFGhHZJPPA0EZB9K/cEVQFRbCWBFCHLFOb5tB/qJYkBhZXdk
	hhHTk76ZFB7zb2JawNrsHBoVI7oPGe3MVCvIdi8dRmfJCSKVOEK5cYOnt3GfgJy/+R03UX
	enrkB7uOcrn002ilwboYukEGncNag0DvP/dI3ELXRr1DsP3Y8uH6dHtIN8h/6FcqMsB5mt
	6xGpeqYN6qm17rMAlUYeAWq+B0NP3kfDoilFT/sMZFMsWFjS6s/7NngzSZSZ6w==
Message-ID: <e4d82284-d6e3-49d0-856e-e347d9d0de55@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749325687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4+qbg4VKKcEc0U3nC8xRMAhLd7TNg+KH4tpuBORnbA=;
	b=FtQDDBJbyUx0DnsjfGj2R/gJQ0dkSH0uBzfzH+8LZ2MvlReSEiXB7UtFq5d+8nIBgGgx+x
	oKD2VpFvk1ty3eNwtJ6OsUNg7GoalmXglRr8MvmNaAPBm1LqYguRH/G1RwjLbzFgz/d0vC
	9i2g92fqqxgcYOxyrErHPCTvFBCF2JhdxBJnwM/y/9jywPNwzvW5kGn53BU/rH7xC4/fhc
	jv7XclbHudvrC9pvV+OCGg4xND+QEceR9o3potBdaTmmhLhmnh/YEEPElmKh5UeTmlL4iv
	WvYFArsoCMhDF5qmO2XViQ3/DgtGQLp6EPUbjlJvoK8y+V8z2eLmtRRGmNAVsw==
Date: Sat, 7 Jun 2025 21:48:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUFHKHKfymqa6jwfNnxZTAuH3kbj5WL+-zN=TR6XGd0eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: cjoza8k9ukqsd8hthc6b9ic7ttf1k4tp
X-MBO-RS-ID: dff85be7c5192f8ee3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_124813_692744_03C5E4F4 
X-CRM114-Status: GOOD (  13.02  )
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

On 6/4/25 10:40 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> Thanks for your patch!
> 
> On Sat, 31 May 2025 at 00:55, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Add the ability to enable optional slot clock into the pwrctrl driver.
>> This is used to enable slot clock in split-clock topologies, where the
>> PCIe host/controller supply and PCIe slot supply are not provided by
>> the same clock. The PCIe host/controller clock should be described in
>> the controller node as the controller clock, while the slot clock should
>> be described in controller bridge/slot subnode.
>>
>> Example DT snippet:
>> &pcicontroller {
>>      clocks = <&clk_dif 0>;             /* PCIe controller clock */
>>
>>      pci@0,0 {
>>          #address-cells = <3>;
>>          #size-cells = <2>;
>>          reg = <0x0 0x0 0x0 0x0 0x0>;
>>          compatible = "pciclass,0604";
>>          device_type = "pci";
>>          clocks = <&clk_dif 1>;         /* PCIe slot clock */
> 
> I assume this should be documented in
> dtschema/schemas/pci/pci-bus-common.yaml, too?
Patch posted:

https://lore.kernel.org/all/20250607194353.79124-1-marek.vasut+renesas@mailbox.org/

The rest is fixed in V3, thanks.

