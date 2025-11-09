Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632FBCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 04:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRipUIZWvbpTnRmM/WOsKFIiObgjS1jMAXjz1CT78SY=; b=JYvR/IGAr+Sga63JnIqMkjIldf
	D9df8Upfne8dUcsYEWvND+ucsohiPjc6qwOxxNWxkdeugjUIXOsNH1k43OjYIpxQ523NXXmGOWZjt
	LPJcBqf1/qVePsmulTbL60Ek6k2bpMq5hSed+VNYEmhEX4Isntu41NERpDgzdkqaADf6y9ZRTT1uk
	aSVnIfUhSWagz9waT61TEQbXGTD11KEihfh8u/nL4XrNa0L7cjkUu1qYEIvwoxwkHzkosAcKtAB/9
	7fi1UI2UgtBl0WfRnHfA2aTCwFHG7zih7VctGbQlZIWyzjqtcbVYNjXI4nCPiUKWT2Eks/9yZ4Hig
	ofb6mZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHxHn-00000003jaI-0uXX;
	Sun, 09 Nov 2025 04:44:19 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHxHk-00000003jYk-0q2z;
	Sun, 09 Nov 2025 04:44:18 +0000
X-QQ-mid: zesmtpip2t1762663347t2fca86ea
X-QQ-Originating-IP: V9Kbroh4xSX4Zqjajg/LaEFIkR0Xw+xFYpVOld+vU/I=
Received: from [IPV6:240f:10b:7440:1:d0bf:3b2d ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 09 Nov 2025 12:42:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16878913424154187079
Message-ID: <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
Date: Sun, 9 Nov 2025 13:42:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
To: Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Anand Moon <linux.amoon@gmail.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dragan Simic <dsimic@manjaro.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen> <aQ9FWEuW47L8YOxC@ryzen>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <aQ9FWEuW47L8YOxC@ryzen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MSyoPQEuxKCuPKqyXReYv57WIdrHjR8LoU8Jv10RTy8kE78xLPaccvxg
	kMGA2uZ6WrAkje2ZwlehBx//K6arETHuPgbdyD45ROZ5IfF1BVLKA+gnl74b9pggUWk1/K+
	TXLhPV78A07P3B5713J+nmY0I1VEfYsRnX/t8BLXAOHwU8STylFxH0d3HkaAKWpleHgVLIe
	jmB4NrT+iyovrsvK/cYvBqvi7mvsxFCydrzi6bTbZlBKhz++lBfa9KzUhvL7agCTX8GOApW
	Gj2tf0167pLaNjJG+JBPm+ctQkn9GEkOFI+QTlOzJH/c8rCe2lF7AN/l4sY/bDXt2mXZ3su
	tQMOYE2bkJwfZAc/kaIEWpH0ab1DZ4b9bXOF99hCOJAqt58PC6UpbQWflYc9e2Yv3JfqnOZ
	vy2iCQxZ0KIZqj2jHcGXBXj/LTbOYl2Xp4DjF1ale6D5y/hLxcP+s9yydtz4zU/rXUhaP2W
	tOSraGPzYwPEHq8CjYogDkax467XpxTTju4EKHw5qtiSupVXPMdFpPDdMwnZZLmhbHFhULX
	wPawfPdyPo5v1wvqt2UFsAkQcHXDPXi4iiKYjmsPDZhfxdT66HWd8BgA9JWMMydq+GILm9s
	+enevanAQUy2rv+EEWGyQJR3VQS/2VyB6XjTSgxsQTZzL0AhJclkHYsrIQmnCBgJJ4HakUJ
	Idd7D64uQkXHAY9MFNUhEEmo4ojhHIjRBzkBDcu6o1v/v3BaUD2bRM1Ba1h3JigdJxEwr8Q
	9E1w+6TEpHwcZaYzl1UC7488LvXY/0kV1RdAbfYkvEm8r3NqOyyX7y+fFMUZTk+uS5p0gZ9
	S+0uAMad1RBCSkTIzm/heV1NDQFvGrakFG5vVC1IM7QaFx/EUXXpoeQSmDE0petoey8tmjk
	JOlGuUUqgYs5l6joqlEsJHxI/GQ+9a3yklMNqv/6v3/hZPBe5cZsw434IZHkIyNwMTdA+72
	cRFM7Q0ofuIXaI1HKHFJQU976mIVqG6M7wUzbFCy3QXM1oHQQyNsOtG+7
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_204416_638654_DFFB1497 
X-CRM114-Status: UNSURE (   5.49  )
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

Hi Niklas,

On 11/8/25 22:27, Niklas Cassel wrote:
(snip)> (And btw. please test with the latest 6.18-rc, as, from 
experience, the
> ASPM problems in earlier RCs can result in some weird problems that are
> not immediately deduced to be caused by the ASPM enablement.)

Here is dmesg from v6.18-rc4:
  https://gist.github.com/RadxaNaoki/40e1d049bff4f1d2d4773a5ba0ed9dff

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Kind regards,
> Niklas
> 


