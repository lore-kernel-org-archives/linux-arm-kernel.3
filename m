Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12765D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVqXy9TRHB2TybwEThNpp7djI9w4ePSHOoRYc3TF81s=; b=BkgG8p+llI5F39kGOI+3/pPqNq
	DWYz9EY9JHV6CsC52J3WZxsfvfpyAhjpDSAhPQpIdFe0MyuA1PVzV4X/EVSSIyjDHVT77sJHKXLVW
	5QiP4t9yRJMNBMqs1S/Nhs+yzHnbCXUUqonT9BpeIorj0HLtiT2b/3DfHEX9Vx1PcL1r7axvaXp8h
	DuvaVqm+qDvQZDQtYIr0B9+bvya/ruV4/ZcLPZnUi7jqBck1Z3ZxTU3KFgnGV1RBQRWuWD3+q5f/7
	wzV1rJgInkHn+VKrzCrr6me5dsUgXHPCNSdtaXY+cwbsW4g2rEO/ckFXkpLHoIOmUNMekzg2knKVp
	D3q/qVkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4UE-00000003KPk-3AP5;
	Mon, 15 Dec 2025 09:03:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV4UC-00000003KOk-2GTk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 09:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1765789400; x=1797325400;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DYuEDXxxQwHvC4lI/FenVDoXRgqfrlpjK+/ONxLKFbQ=;
  b=YgdOR4qS4/KGrB7shS6ugetw9RhG8XxwE8YfNeRfBZxSYokRZzQOkhaM
   fYF6NTOa8ljzLLb0kgr8jXNSJ5GNwx0Z/nwLb7bh8kcd41F3ZaH5MQIM4
   avYhzJReZDcKCbVmMugqvgeMxlXQ6gC1zTacY9QT3hG3tbJQypUfGNddh
   o1QEOgHv0Xeez8dD7+UVbCxZcS1VYltsD6RVus2cCJg21NNTuJklunIyW
   8yMuGLH6Q/3Pc8clxWWIQ939SaPa8KyVVu/KxRm2K9QGl7Cuv1k4pWc+l
   MhlxdVAD8zO88kmPlZ1A4gzSleVuczw/9n/LaO60taEtty3SF9k6poCqb
   Q==;
X-CSE-ConnectionGUID: YyHp0N6PScmqn7V/vLHJ2Q==
X-CSE-MsgGUID: IVipBb0SRZWUaB0w29GKSQ==
X-IronPort-AV: E=Sophos;i="6.21,150,1763449200"; 
   d="scan'208";a="49860825"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Dec 2025 02:03:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Dec 2025 02:02:58 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 15 Dec 2025 02:02:56 -0700
Message-ID: <0ec01064-2755-401a-b2c8-76ad6ce686af@microchip.com>
Date: Mon, 15 Dec 2025 10:02:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20251212203226.458694-8-robh@kernel.org>
 <aTytWyyZiYFnyauo@shikoro> <20251213010934353f1efe@mail.local>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251213010934353f1efe@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_010320_850023_A0304E1A 
X-CRM114-Status: GOOD (  12.66  )
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

On 13/12/2025 at 02:09, Alexandre Belloni wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 13/12/2025 09:03:39+0900, Wolfram Sang wrote:
>> On Fri, Dec 12, 2025 at 02:32:14PM -0600, Rob Herring (Arm) wrote:
>>> This .dtsi file is not included anywhere in the tree and can't be
>>> tested.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>
>> Nowadays, this should be a dtso which did not exist back then. Is it
>> okay to convert it? Yes, I can do this.
>>
> 
> I don't think this will be missed by anyone. Unless you actually have
> one of the boards, I would simply drop this.

+1

Regards,
   Nicolas

