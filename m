Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6776DC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWLL8SXxaDrHsmjoDkrhtKmQby8WHNCD8s1a74YU7+8=; b=LJdGdok3EvnVrcKDHjQQctlxRe
	oDxHk+IoiD63Y7WoMmbfiG51XHk2YqpAP1u+rg/j24urWOLUHR3rYnyaWz4CrUa/g2ihrW8K2gfb7
	FpRX4jYuUBYvQZ9tmtd4j/9/Rw/F2KFe1S2yzWUh150StmD3e6IQmeHoct81tfr/apRhRA8ciqBau
	is/xeAu/Lv5/lz1kkYn20IZF17tjdgEANNJQtIWpkpROq7MjdqtEva8l+5x4WOvWIT9AGa2u6wN6G
	xUqS2zo/4NN6JlgxTKWjLF5lQSGNsKlTQt+9TwDA3BzUnT207H7oyJykPVP+SULUsTqhx0k8pu5ea
	Gb5p6Mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEa0x-0000000AedR-0GPd;
	Mon, 12 May 2025 20:44:43 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZyt-0000000AeO5-2eoU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 20:42:36 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZxBPJ0fRnz9t0N;
	Mon, 12 May 2025 22:42:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747082548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWLL8SXxaDrHsmjoDkrhtKmQby8WHNCD8s1a74YU7+8=;
	b=RFQZ02rBHjUQCIZLYQEaMZn38oPSVM1/LuHrmeQlJffCxoISGZ/KZihlMGeuvbo5RQgfzj
	bqZPnC8AjlZxZ99NAk9cDcX1e9ajfPzBCDg/mWT5JEriDylCQmtRDmJuVppLFPCGIFkB4O
	cO8mOV4eQrWx5l1GMFbPrvZplUS3cykWjoqI+OwnHemmGepBoy6hugM15Oh+krT3woDj3N
	1A5o3aQ727yR2ZZpB95qeqeg3IaroRYFkwNXsWpowWYn+1+Lh0pDWGGmS2n87BQocflIKe
	DcdE3NFmxRiEYwAmDExAH7FPht2ybOWPudu8w5tXaZuIrfMUWYgeWTMVLI6VhA==
Message-ID: <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1747082545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wWLL8SXxaDrHsmjoDkrhtKmQby8WHNCD8s1a74YU7+8=;
	b=jwQwBf28noG1EfxvsMWTvb8VBv6jfgaoj3Z2EzGnVRAZe4uPzWVo1ot8ZAzoxLgPV3QfsO
	xI1oymiEb6QlZwcZGx295e+uM6GlsVvUyxRlcF11nQGo3ALXUyLS7DlLBYL7BOlpct8BCm
	z+t6wcUpHy/m8qeOv6PhtZTzLrmR1eYrlQxp+2JRKh4i2XIGM9WOkcnT39qeDbalGSXovL
	3ZnMMiic0RrOMxKTPe2NI0TUGQOsQc/W152jwmGseOZX71eAgzEQme6/QpU9RiuWWg03h1
	wN97+CQGpg2ri3oWCIG+oiLjSrNRSBZV3mJtdrJ9y1bEljAUhX/v8UmKcNk79A==
Date: Mon, 12 May 2025 22:42:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org>
 <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 39ed119621876b7bcad
X-MBO-RS-META: 18mqeswom1weurmm9iatqr45af155u75
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_134235_853109_FF894F73 
X-CRM114-Status: GOOD (  13.06  )
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

On 5/9/25 9:37 PM, Manivannan Sadhasivam wrote:
> On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
>> Document 'aux' clock which are used to supply the PCIe bus. This
>> is useful in case of a hardware setup, where the PCIe controller
>> input clock and the PCIe bus clock are supplied from the same
>> clock synthesiser, but from different differential clock outputs:
> 
> How different is this clock from the 'reference clock'? I'm not sure what you
> mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the reference clock
> and the binding already has 'ref' clock for that purpose. So I don't understand
> how this new clock is connected to the endpoint device.

See the ASCII art below , CLK_DIF0 is 'ref' clock that feeds the 
controller side, CLK_DIF1 is the bus (or 'aux') clock which feeds the 
bus (or endpoint) side. Both clock come from the same clock synthesizer, 
but from two separate clock outputs of the synthesizer.

>>   ____________                    _____________
>> | R-Car PCIe |                  | PCIe device |
>> |            |                  |             |
>> |    PCIe RX<|==================|>PCIe TX     |
>> |    PCIe TX<|==================|>PCIe RX     |
>> |            |                  |             |
>> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
>> '------------'      ||  ||      '-------------'
>>                      ||  ||
>>   ____________       ||  ||
>> |  9FGV0441  |      ||  ||
>> |            |      ||  ||
>> |   CLK DIF0<|======''  ||
>> |   CLK DIF1<|==========''
>> |   CLK DIF2<|
>> |   CLK DIF3<|
>> '------------'

