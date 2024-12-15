Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83439E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 01:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHzhRUgfPbLZl8WnOeVgPDOrTI/1jaYKRR+O62/g2hs=; b=M36ydzhVviz0thefkQmdZGRYE0
	tleFBfrkOSqT+4eGeIYIw7Dy04tOjuM3QBPGJfVOknASKG2vL47LxhZR6Fvz8TsnQUXsr27REeBkq
	wAj9c30vbCurCTh7M3pS2FjblBRi7JYuhmLTxYQ9+1Tc3VmjjG0JrrGgnHyQYQmnv0UOX5QE3jh6L
	+SrSNcZa4fsCdhWuGYw9nGVMsItRIkkNVnSkYoZdtRz88/k0hFLgRYQYQfFQPfGciVrV6kxbvxI9k
	DIWrjDhc8/8Um6K06rMYrMgqBeUrIY1jPDCjlGz3Qmx3zJ5AEz+OLggJx3IEc+x1zFqMq9Br8dCJt
	bO1D1LZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMdhz-00000007Dw8-3qTl;
	Sun, 15 Dec 2024 01:46:11 +0000
Received: from [54.254.200.92] (helo=smtpbgsg1.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMdgp-00000007Dpk-48or;
	Sun, 15 Dec 2024 01:45:05 +0000
X-QQ-mid: bizesmtpip4t1734227058t6vbjsi
X-QQ-Originating-IP: zPcfSi9qkyqfIgt55XHkoey8oDBUbe7YixRuGvw4LeU=
Received: from [IPV6:240f:10b:7440:1:95e0:ea9a ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 15 Dec 2024 09:44:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16386420016045931350
Message-ID: <93E0AA29EA05399F+f0e8d224-c30d-4190-9649-413c00e8f2fa@radxa.com>
Date: Sun, 15 Dec 2024 10:44:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: rockchip: Add USB-C support to ROCK 5B
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20241210163615.120594-1-sebastian.reichel@collabora.com>
 <FFD6E87BED20DB1B+38b8064e-9945-4cd8-a30e-7800a8c6f37b@radxa.com>
 <3D830E407DCD15A2+de00ea1d-96d5-4766-9dc5-616fc76f404b@radxa.com>
 <iloxbrj7ktqto5yphr7i3tioq3cbecqwu4ovxmezovux3nw7t3@j2siyintvy7j>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <iloxbrj7ktqto5yphr7i3tioq3cbecqwu4ovxmezovux3nw7t3@j2siyintvy7j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NH+zXwSPp+6sJ61pZ9SF4Si9iMMzaL0h7ncSntkoIIuRpexfrCvDLnqo
	JwDhUr9yXtv04+FWj8/+xT+Ca0bvee+qQILbYdHSVfzRjWr3c3Id4xJXSSBKYGAW3wqtDLM
	IM6BZXvtzoqKnKdGWa7PWFIKbdf1EPwuUWVMEyuoswNsvU7MQ7LZk440cEyiQ8z5YdyVMgO
	IC4w6q9eUgEqztvJ8MjVosksoHSRJjTijJmXIJ3UjKrCLq5IQX9HGOrKR+S+8GGCwPGVWa+
	bCRmdmAMwtef9XKqTi4/4HxjC1PWcsKwBZAosFQnjo2rKPnsID1Oqg/4mfl1RdbQ1hJHrH1
	fJq2A/Z7PWMMVaTuV6LVajeGPcft8lzmWRtfR/ojF5tSVq4wN6gvsHDmeAYfjKeoeSfLNWm
	sVve4ybVFDhQG9FIxMF82Xg28MTDOPl74nftRmJQqRzevp3hQuQ8tcY0ZBJB9xQKMUFlKXC
	UQXelT81CFw8JQXLbo7tbqo3yoJd0dudYXzzTCrJtBep41GoWpic+5ZvSHVq7v6RMai61K0
	CDL0EtIfm6nl+0FFvoQ+QAQuNOFcQky7BRflAjrzFHlmdATCT2mVponUDiaDWIkAvRQsEll
	T4y7dIPlx6u3zH7cmjIdrHz7NfPlUH0mVa4ZDxdl91wWG7IU8OApOoL7W7CBlQltNMOCcPc
	F52wQeT30OWpsLHNAEousrN0xx2RwOgdGjEv2YWkxOOKkyjKfUCRwnx5oRIu1Te6ym7HJu7
	79D2C09+W3d3g9KSAXSyRYzwXpXxV1RE7IS+BlWpgfLeNiWuuoWgJ6n3sFQBkYb6N84F5W/
	kigP4D3yN8MZlY/6nEIwb3qR9PLrVzD26i8CjypJf7ujPah8DEfr3oSchwkxiDbOsR+tfDO
	asDb9F26UdIdzelb88JgSqVob/weMflPEtV5bx4sNxs=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_174500_441470_8F986ABC 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Sebastian,

On 12/13/24 04:20, Sebastian Reichel wrote:
> Hi Naoki,
> 
> On Wed, Dec 11, 2024 at 09:40:13AM +0900, FUKAUMI Naoki wrote:
>> I got random reboot during booting kernel/userland...
> 
> That is probably related to USB-C PD communication resulting in
> another hard reset :( Can you try to get some tcpm_log() data
> from debugfs while the board is powered from the GPIO header or
> PoE?

Unfortunately I don't have such a tool...

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Greetings,
> 
> -- Sebastian



