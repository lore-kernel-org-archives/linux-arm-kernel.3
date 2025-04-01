Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87142C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLorxfawL86gg2F0j4j9NdXyKB8vOPzbGPbfhg6XtTk=; b=fHS+EugBayGrzCynPUXbAZ2GUS
	KrbgpOd2eMVG2sx/8TxCYAdQf7ZCi/QGF8ctMkg8StoFstFITQ3/XHEG3OllAcWDXbAj4AdsAx4D7
	/M2tW8ZSP5+ZpNka7nunNWO8g+HzmOP4uvJEe6iuQVnRF9uaPr1+KHN2ykcefdlEdfPbNd9jPqh0Z
	Zv6BTUIDSZmAQC0IOAbgZdjpQ8TY7EOUvFHRbtBaW40qeg/o7FPE9hG+gVHAcNTPU+WtBmMNYa/i4
	lxZxX71Gm1s+AyXztGAvBbVTnrmfqKvaHyO2lrxLdTjsYr3vhcmupquv1fg/sxIKoFi9kmIH54I/J
	FXYmUJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZS5-00000002jYt-38UU;
	Tue, 01 Apr 2025 11:06:41 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZH9-00000002gn1-1yqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:55:24 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZRlJh4CLCz9vLr;
	Tue,  1 Apr 2025 12:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1743504916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLorxfawL86gg2F0j4j9NdXyKB8vOPzbGPbfhg6XtTk=;
	b=i3vlB+BUBdIW+HJlb1QX1OsRPtMkKNXmYaJ6lS2LjLNfIrZY+7e2fD4WJ6hZmB/Mx8/MWO
	I0QtIOYjGwP3bqeJXf4+L8VWfchRaO3/3tnoBcuUNfMh9eBypBoDARlzuRRr0NMwq48PaT
	2LYD3CDEkSIhMNDpWDLDqKk3ZpEQuo3xeSzRU3EiGMuEGo7UssKrX1AXON1+4VZPrBBYM6
	coylh8qZU1NX9MZF3c3I9xThLc4Cvsef62nMzfzr/t1CsShKyIRSfCtkJMgyevdcDSf36M
	/VssBue1vxqPzqz25JsMhoZgIuylCsGUZ4v0fe6ynR3TeNgfvGDWO+pYdRFQSA==
Message-ID: <43a1986e-3ccd-4fd5-9dcf-9ad945a99293@mailbox.org>
Date: Tue, 1 Apr 2025 12:55:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a779g3: Add Renesas R-Car V4H
 Sparrow Hawk board support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84sk?=
 =?UTF-8?Q?i?= <kw@linux.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250330195715.332106-1-marek.vasut+renesas@mailbox.org>
 <20250330195715.332106-5-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUx31WHW+fUP0Qbfs-Si2+cLmxC=YRUKWvSudn7CBZ4Fg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUx31WHW+fUP0Qbfs-Si2+cLmxC=YRUKWvSudn7CBZ4Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 0780a5cab02defaccda
X-MBO-RS-META: xj3qjesq94bd8gfmzt53ziqwbmtebsmm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_035523_742968_574F21BF 
X-CRM114-Status: UNSURE (   8.47  )
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

On 4/1/25 11:49 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

>> +               spi0 = &rpc;
> 
> Do you need the spi0 alias?

Yes, it is used by U-Boot to enumerate SPI controllers.

The rest is fixed in V2, thanks !

-- 
Best regards,
Marek Vasut

