Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C064CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 00:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO3h51HYtv45xRJLIzc56DgmssLAn+8K3ewRnk2t304=; b=b48BydpFy2J1GeEKAFBzMz0pCP
	YfRxpYjlcZtircdxrqwnNdVBhpOzIXF7O+WKXYx4jiFQB+p5reGVo/pg+rq5M+iF9D9ilv7KJUPCU
	t7zZRUM50Ug8cAqMhpdRlXfhoLrLFAOETKqAHv3Rq7lt5elOsAAmeH61dEVwuR2CwiPd5C+whlaPY
	8ZkXqsa8uYiKeo7CjWXcUbO86hO6EojTu0h9/0wh35XV8vUhJeMhZMrHWoFlBm4vJSOuCWH0bszkz
	zaiFPyzf9Um+EkTu2R4m20CsQ7DNhy9zbph1EAfqZ8WDYlmTyNzavOneRqXteDsqOhAtgaeVbQ0aV
	roxaCTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbEp-0000000F6lS-0aUj;
	Tue, 12 May 2026 00:44:43 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbEl-0000000F6kL-2wON;
	Tue, 12 May 2026 00:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=gO3h51HYtv45xRJLIzc56DgmssLAn+8K3ewRnk2t304=;
	b=EvZQJOfLau2GLCePkzSv5c0l+dA27qxpzkxxL5lydx66r3WLqhxpI3fKMj1KiS
	ZRdD1T3DnPc55HvlgsmcvMs0Dh+SPbQrrf66mVJOEmMs+JbGFu1jqbAGCaYUL9m3
	6zTeWutdfZPmgzL3ffeXvEBEjWbdwcmOTqCyqMOupook0=
Received: from [192.168.50.71] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBXb4PPdwJq8dJuAw--.7483S2;
	Tue, 12 May 2026 08:44:00 +0800 (CST)
Message-ID: <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
Date: Tue, 12 May 2026 08:43:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260511070139.GA1096586@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBXb4PPdwJq8dJuAw--.7483S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4REfOzUUUUU
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBAt0GoCd9AlOQAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_174440_125596_0B89D1A8 
X-CRM114-Status: UNSURE (   7.94  )
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



On 5/11/26 15:02, Krzysztof Wilczyński wrote:
> Hello,
> 
>> -	/*
>> -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
>> -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
>> -	 * after Link training completes before sending a Configuration Request.
>> -	 */
>> -	if (pci->max_link_speed > 2)
>> -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>> +	pci_host_common_link_train_delay(pci->max_link_speed);
> 
> This comment could move to the helper you added.

Hi Krzysztof,

Will add.

Best regards,
Hans


> 
> Thank you!
> 
> 	Krzysztof


